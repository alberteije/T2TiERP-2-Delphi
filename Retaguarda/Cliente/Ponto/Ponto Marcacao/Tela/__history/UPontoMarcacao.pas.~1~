{ *******************************************************************************
  Title: T2Ti ERP
  Description: Tela de Marcação de Ponto - Registros de Entradas e Saídas.

  The MIT License

  Copyright: Copyright (C) 2010 T2Ti.COM

  Permission is hereby granted, free of charge, to any person
  obtaining a copy of this software and associated documentation
  files (the "Software"), to deal in the Software without
  restriction, including without limitation the rights to use,
  copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following
  conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.

  The author may be contacted at:
  t2ti.com@gmail.com</p>

  @author Albert Eije
  @version 1.0
  ******************************************************************************* }
unit UPontoMarcacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg, rpgraphicex, JvExExtCtrls,
  JvExtComponent, JvClock, ToolWin, ActnMan, ActnCtrls, ActnList, StrUtils,
  RibbonSilverStyleActnCtrls, ImgList, Enter, XPMan, SessaoUsuario, DB, DBClient,
  PontoMarcacaoController, Biblioteca, PontoMarcacaoVO,
  PlatformDefaultStyleActnCtrls, pngimage;

type
  TFPontoMarcacao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    EditLogin: TEdit;
    EditSenha: TEdit;
    JvClock: TJvClock;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionConfirmar: TAction;
    ActionToolBarGrid: TActionToolBar;
    ImageList: TImageList;
    MREnter1: TMREnter;
    XPManifest1: TXPManifest;
    CDSPontoMarcacao: TClientDataSet;
    CDSPontoMarcacaoID: TIntegerField;
    CDSPontoMarcacaoID_COLABORADOR: TIntegerField;
    CDSPontoMarcacaoID_PONTO_RELOGIO: TIntegerField;
    CDSPontoMarcacaoID_PONTO_TIPO_MARCACAO: TIntegerField;
    CDSPontoMarcacaoDATA_MARCACAO: TDateField;
    CDSPontoMarcacaoHORA_MARCACAO: TStringField;
    CDSPontoMarcacaoTIPO_MARCACAO: TStringField;
    CDSPontoMarcacaoTIPO_REGISTRO: TStringField;
    CDSPontoMarcacaoJUSTIFICATIVA: TStringField;
    CDSPontoMarcacaoPAR_ENTRADA_SAIDA: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionConfirmarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function DoLogin: Boolean;
  public
    { Public declarations }
  end;

var
  FPontoMarcacao: TFPontoMarcacao;
  Sessao: TSessaoUsuario;

implementation

{$R *.dfm}
{ TFPontoMarcacao }

{$Region 'Infra'}
procedure TFPontoMarcacao.FormCreate(Sender: TObject);
begin
  Sessao := TSessaoUsuario.Instance;
end;

procedure TFPontoMarcacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F11 then
    ActionCancelar.Execute;
  if Key = VK_F12 then
    ActionConfirmar.Execute;
  if Key = VK_ESCAPE then
    ActionCancelar.Execute;
end;
{$EndRegion}

{$Region 'Actions'}
procedure TFPontoMarcacao.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPontoMarcacao.ActionConfirmarExecute(Sender: TObject);
var
  PontoMarcacao: TPontoMarcacaoVO;
  UltimaMarcacao, MarcacaoAtual: String;
begin
  if DoLogin then
  begin
    PontoMarcacao := TPontoMarcacaoVO.Create;
    PontoMarcacao.IdColaborador := Sessao.Usuario.IdColaborador;
    PontoMarcacao.DataMarcacao := Date;
    PontoMarcacao.HoraMarcacao := TimeToStr(Time);
    PontoMarcacao.TipoRegistro := 'O';

    TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
    TPontoMarcacaoController.Consulta('ID_COLABORADOR = ' + IntToStr(Sessao.Usuario.IdColaborador) + ' and DATA_MARCACAO = ' + QuotedStr(DataParaTexto(Now)), 0);
    CDSPontoMarcacao.Last;

    if CDSPontoMarcacao.RecordCount mod 2 = 0 then
    begin
      PontoMarcacao.TipoMarcacao := 'E';
      CDSPontoMarcacao.Filtered := False;
      CDSPontoMarcacao.Filter := 'TIPO_MARCACAO = ' + QuotedStr('E');
      CDSPontoMarcacao.Filtered := True;
      PontoMarcacao.ParEntradaSaida := 'E' + IntToStr(CDSPontoMarcacao.RecordCount + 1);
    end
    else
    begin
      PontoMarcacao.TipoMarcacao := 'S';
      CDSPontoMarcacao.Filtered := False;
      CDSPontoMarcacao.Filter := 'TIPO_MARCACAO = ' + QuotedStr('S');
      CDSPontoMarcacao.Filtered := True;
      PontoMarcacao.ParEntradaSaida := 'S' + IntToStr(CDSPontoMarcacao.RecordCount + 1);
    end;

    CDSPontoMarcacao.Filtered := False;
    CDSPontoMarcacao.Last;

    UltimaMarcacao := ifthen(PontoMarcacao.TipoMarcacao = 'S', 'Entrada', 'Saída');
    MarcacaoAtual := ifthen(PontoMarcacao.TipoMarcacao = 'E', 'Entrada', 'Saída');

    if CDSPontoMarcacao.RecordCount = 0 then
    begin
      TPontoMarcacaoController.Insere(PontoMarcacao);
      Application.MessageBox(PChar(MarcacaoAtual + ' registrada com sucesso.'), 'Aviso do Sistema', MB_OK + MB_ICONINFORMATION);
      Close;
    end
    else
    begin
      if Hora_Seg(TimeToStr(Time)) - Hora_Seg(CDSPontoMarcacaoHORA_MARCACAO.AsString) <= 3600 then
      begin
        if Application.MessageBox(PChar('Você registrou uma ' + UltimaMarcacao + ' na última hora, às ' + CDSPontoMarcacaoHORA_MARCACAO.AsString + '. Deseja registrar uma ' + MarcacaoAtual + '?'), 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
        begin
          TPontoMarcacaoController.Insere(PontoMarcacao);
          Application.MessageBox(PChar(MarcacaoAtual + ' registrada com sucesso.'), 'Aviso do Sistema', MB_OK + MB_ICONINFORMATION);
          Close;
        end
        else
        begin
          Application.MessageBox('Transação não realizada.', 'Aviso do Sistema', MB_OK + MB_ICONINFORMATION);
          Close;
        end;
      end
      else
      begin
        TPontoMarcacaoController.Insere(PontoMarcacao);
        Application.MessageBox(PChar(MarcacaoAtual + ' registrada com sucesso.'), 'Aviso do Sistema', MB_OK + MB_ICONINFORMATION);
        Close;
      end;
    end;
  end;
end;

function TFPontoMarcacao.DoLogin: Boolean;
begin
  try
    Result := Sessao.AutenticaUsuario(EditLogin.Text, EditSenha.Text);
  except
    Result := False;
  end;
end;
{$EndRegion}

end.
