unit SessaoUsuario;

interface

uses
  Classes, DSHTTP, Biblioteca, Forms, Windows, IniFiles, SysUtils,
  Generics.Collections, DataSnap.DSHTTPClient, Tipos, ACBrDevice, DBClient,

  EcfOperadorVO, EcfConfiguracaoVO, EcfMovimentoVO, EcfTipoPagamentoVO,
  EcfImpressoraVO, R01VO, EcfVendaCabecalhoVO;

type
  TSessaoUsuario = class
  private
    FHttp: TDSHTTP;
    FUrl: String;
    FIdSessao: String;
    FCamadas: Integer;
    FPathIntegracao: String;
    FStatusCaixa: TStatusCaixa;
    FMenuAberto: TSimNao;
    FServidor: String;
    FPorta: Integer;

    FUsuario: TEcfOperadorVO;
    FConfiguracao: TEcfConfiguracaoVO;
    FMovimento: TEcfMovimentoVO;
    FR01: TR01VO;
    FVendaAtual: TEcfVendaCabecalhoVO;

    FECFsAutorizados: TStringList;

    FListaTipoPagamento: TObjectList<TEcfTipoPagamentoVO>;
    FListaImpressora: TObjectList<TEcfImpressoraVO>;

    class var FInstance: TSessaoUsuario;
  public
    constructor Create;
    destructor Destroy; override;

    class function Instance: TSessaoUsuario;
    function AutenticaUsuario(pLogin, pSenha: String): Boolean;
    function Autenticado: Boolean;
    procedure PopulaObjetosPrincipais;
    procedure LiberaVendaAtual;

    property HTTP: TDSHTTP read FHttp;
    property URL: String read FUrl;
    property IdSessao: String read FIdSessao;
    property Camadas: Integer read FCamadas write FCamadas;
    property PathIntegracao: String read FPathIntegracao write FPathIntegracao;
    property StatusCaixa: TStatusCaixa read FStatusCaixa write FStatusCaixa;
    property MenuAberto: TSimNao read FMenuAberto write FMenuAberto;
    property Servidor: String read FServidor;
    property Porta: Integer read FPorta;

    property Usuario: TEcfOperadorVO read FUsuario;
    property Configuracao: TEcfConfiguracaoVO read FConfiguracao write FConfiguracao;
    property Movimento: TEcfMovimentoVO read FMovimento write FMovimento;
    property R01: TR01VO read FR01 write FR01;
    property VendaAtual: TEcfVendaCabecalhoVO read FVendaAtual write FVendaAtual;

    property ECFsAutorizados: TStringList read FECFsAutorizados write FECFsAutorizados;

    property ListaTipoPagamento: TObjectList<TEcfTipoPagamentoVO> read FListaTipoPagamento write FListaTipoPagamento;
    property ListaImpressora: TObjectList<TEcfImpressoraVO> read FListaImpressora write FListaImpressora;

  const
    Estados: array [TACBrECFEstado] of string = ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda', 'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X', 'Nao Fiscal');
  end;

implementation

uses
  Controller, EcfTipoPagamentoController, EcfImpressoraController;

constructor TSessaoUsuario.Create;
var
  ArquivoIni: TIniFile;
  I: Integer;
begin
  inherited Create;

  FHttp := TDSHTTP.Create;

  // Conexão
  ArquivoIni := TIniFile.Create(CaminhoApp + 'Conexao.ini');
  try
    with ArquivoIni do
    begin
      if not SectionExists('ServidorApp') then
      begin
        WriteString('ServidorApp', 'Servidor', 'localhost');
        WriteInteger('ServidorApp', 'Porta', 8080);
      end;

      FServidor := ReadString('ServidorApp', 'Servidor', 'localhost');
      FPorta := ReadInteger('ServidorApp', 'Porta', 8080);
      Camadas := ReadInteger('ServidorApp', 'Camadas', 3);
      PathIntegracao := ReadString('INTEGRACAO', 'REMOTEAPP', '');
    end;
  finally
    ArquivoIni.Free;
  end;

  // Arquivo Auxiliar
  ArquivoIni := TIniFile.Create(CaminhoApp + 'ArquivoAuxiliar.ini');
  try
    FECFsAutorizados := TStringList.Create;
    ArquivoIni.ReadSectionValues('SERIES', ECFsAutorizados);
  finally
    ArquivoIni.Free;
  end;

  FUrl := 'http://' + Servidor + ':' + IntToStr(Porta) + '/datasnap/restT2Ti/TController/ObjetoJson/';
end;

destructor TSessaoUsuario.Destroy;
begin
  FHttp.Free;

  FreeAndNil(FUsuario);
  FreeAndNil(FMovimento);
  FreeAndNil(FConfiguracao);
  FreeAndNil(FR01);
  FreeAndNil(FVendaAtual);

  FreeAndNil(FECFsAutorizados);

  FreeAndNil(FListaImpressora);
  FreeAndNil(FListaTipoPagamento);
  inherited;
end;

procedure TSessaoUsuario.LiberaVendaAtual;
begin
  FreeAndNil(FVendaAtual);
end;

procedure TSessaoUsuario.PopulaObjetosPrincipais;
var
  Filtro: String;
  I: Integer;
begin
  Filtro := 'STATUS_MOVIMENTO=' + QuotedStr('A') + ' or STATUS_MOVIMENTO=' + QuotedStr('T');
  FMovimento := TEcfMovimentoVO(TController.BuscarObjeto('EcfMovimentoController.TEcfMovimentoController', 'ConsultaObjeto', [Filtro], 'GET'));
  FConfiguracao := TEcfConfiguracaoVO(TController.BuscarObjeto('EcfConfiguracaoController.TEcfConfiguracaoController', 'ConsultaObjeto', ['ID=1'], 'GET'));
  FR01 := TR01VO(TController.BuscarObjeto('R01Controller.TR01Controller', 'ConsultaObjeto', ['ID=1'], 'GET'));
  FListaTipoPagamento := TObjectList<TEcfTipoPagamentoVO>(TController.BuscarLista('EcfTipoPagamentoController.TEcfTipoPagamentoController', 'ConsultaLista', ['ID>0'], 'GET'));
  FListaImpressora := TObjectList<TEcfImpressoraVO>(TController.BuscarLista('EcfImpressoraController.TEcfImpressoraController', 'ConsultaLista', ['ID>0'], 'GET'));
end;

class function TSessaoUsuario.Instance: TSessaoUsuario;
begin
  if not Assigned(FInstance) then
    FInstance := TSessaoUsuario.Create;

  Result := FInstance;
end;

function TSessaoUsuario.Autenticado: Boolean;
begin
  Result := Assigned(FUsuario);
end;

function TSessaoUsuario.AutenticaUsuario(pLogin, pSenha: String): Boolean;
var
  SenhaCript: String;
begin
  FIdSessao := CriaGuidStr;
  FIdSessao := MD5String(FIdSessao);
  try
    // Senha é criptografada com a senha digitada + login
    SenhaCript := MD5String(pLogin + pSenha);

    FHttp.SetBasicAuthentication(pLogin + '|' + FIdSessao, SenhaCript);

    FUsuario := TEcfOperadorVO(TController.BuscarObjeto('EcfFuncionarioController.TEcfFuncionarioController', 'Usuario', [pLogin, pSenha], 'GET'));

    if Assigned(FUsuario) then
      FUsuario.Senha := pSenha;

    Result := Assigned(FUsuario);
  except
    Application.MessageBox('Erro ao autenticar usuário.', 'Erro de Login', MB_OK + MB_ICONERROR);
    raise;
  end;
end;

end.
