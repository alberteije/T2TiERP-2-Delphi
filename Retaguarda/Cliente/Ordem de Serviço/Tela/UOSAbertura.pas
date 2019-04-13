{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Abertura OS

The MIT License

Copyright: Copyright (C) 2016 T2Ti.COM

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

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }

unit UOSAbertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Mask, JvExMask, JvToolEdit,
  JvCombobox, LabeledCtrls, DBCtrls, LabeledDBCtrls, DB, DBClient, StrUtils,
  Math, JSonVO, Generics.Collections, Atributos, Constantes, CheckLst,
  JvExCheckLst, JvCheckListBox, JvBaseEdits, OleCtnrs, WideStrings, FMTBcd,
  Provider, SqlExpr, DBXMySql, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
  ToolWin, ActnCtrls, ShellApi, Biblioteca, System.Actions, Controller;

type

  TFOSAbertura = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    PageControlDadosOSAbertura: TPageControl;
    tsDadosComplementares: TTabSheet;
    tsProdutoServico: TTabSheet;
    PanelDocumentacao: TPanel;
    GridProdutoServico: TJvDBUltimGrid;
    tsEquipamento: TTabSheet;
    PanelDepreciacao: TPanel;
    GridEquipamentos: TJvDBUltimGrid;
    EditIdStatusOS: TLabeledCalcEdit;
    EditStatusNome: TLabeledEdit;
    PanelDadosComplementares: TPanel;
    EditDataInicio: TLabeledDateEdit;
    EditDataPrevisao: TLabeledDateEdit;
    EditDataFim: TLabeledDateEdit;
    MemoObservacaoCliente: TLabeledMemo;
    CDSOSProdutoServico: TClientDataSet;
    DSOSProdutoServico: TDataSource;
    CDSOSEvolucao: TClientDataSet;
    DSOSEvolucao: TDataSource;
    tsEvolucao: TTabSheet;
    PanelMovimentacao: TPanel;
    GridEvolucao: TJvDBUltimGrid;
    CDSOSAberturaEquipamento: TClientDataSet;
    DSOSAberturaEquipamento: TDataSource;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaboradorNome: TLabeledEdit;
    EditIdCliente: TLabeledCalcEdit;
    EditClienteNome: TLabeledEdit;
    EditNumero: TLabeledEdit;
    EditNomeContato: TLabeledEdit;
    ActionToolBarDepreciacao: TActionToolBar;
    ActionManagerBem: TActionManager;
    ActionToolBar1: TActionToolBar;
    BevelEdits: TBevel;
    EditHoraInicio: TLabeledMaskEdit;
    EditHoraPrevisao: TLabeledMaskEdit;
    EditHoraFim: TLabeledMaskEdit;
    EditFoneContato: TLabeledMaskEdit;
    MemoObservacaoAbertura: TLabeledMemo;
    procedure ControlaPersistencia(pDataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure GridProdutoServicoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEquipamentosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEvolucaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdStatusOSKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdClienteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    IdTipoOSAbertura: Integer;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FOSAbertura: TFOSAbertura;

implementation

uses OSAberturaVO, OSAberturaController, OsProdutoServicoVO,
  OsEquipamentoVO, OsEvolucaoVO, ULookup, UDataModule,
  ViewPessoaColaboradorVO, ViewPessoaColaboradorController,
  ViewPessoaClienteVO, ViewPessoaClienteController, OsStatusVO,
  OsStatusController, ProdutoVO, ProdutoController, OsEquipamentoController,
  OsAberturaEquipamentoVO;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFOSAbertura.FormCreate(Sender: TObject);
var
  Form: TForm;
begin
  ClasseObjetoGridVO := TOSAberturaVO;
  ObjetoController := TOSAberturaController.Create;

  inherited;

  // Configura a Grid dos Produtos
  ConfiguraCDSFromVO(CDSOSProdutoServico, TOsProdutoServicoVO);
  ConfiguraGridFromVO(GridProdutoServico, TOsProdutoServicoVO);

  // Configura a Grid dos Equipamentos
  ConfiguraCDSFromVO(CDSOSAberturaEquipamento, TOsAberturaEquipamentoVO);
  ConfiguraGridFromVO(GridEquipamentos, TOsAberturaEquipamentoVO);

  // Configura a Grid das Evoluções
  ConfiguraCDSFromVO(CDSOSEvolucao, TOsEvolucaoVO);
  ConfiguraGridFromVO(GridEvolucao, TOsEvolucaoVO);
end;

procedure TFOSAbertura.LimparCampos;
var
  i: Integer;
begin
  inherited;

  CDSOSProdutoServico.EmptyDataSet;
  CDSOSAberturaEquipamento.EmptyDataSet;
  CDSOSEvolucao.EmptyDataSet;

  ConfigurarLayoutTela;
end;

procedure TFOSAbertura.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;
  PageControlDadosOSAbertura.ActivePageIndex := 0;

  if StatusTela = stNavegandoEdits then
  begin
    PanelDadosComplementares.Enabled := False;
    GridProdutoServico.ReadOnly := True;
    GridEquipamentos.ReadOnly := True;
    GridEvolucao.ReadOnly := True;
  end
  else
  begin
    PanelDadosComplementares.Enabled := True;
    GridProdutoServico.ReadOnly := False;
    GridEquipamentos.ReadOnly := False;
    GridEvolucao.ReadOnly := False;
  end;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFOSAbertura.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdStatusOS.SetFocus;
  end;
end;

function TFOSAbertura.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdStatusOS.SetFocus;
  end;
end;

function TFOSAbertura.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('OsAberturaController.TOsAberturaController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      Result := TController.RetornoBoolean;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TController.ExecutarMetodo('OsAberturaController.TOsAberturaController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFOSAbertura.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TOSAberturaVO.Create;

      /// EXERCICIO: Preencha os dados dos campos transientes

      TOSAberturaVO(ObjetoVO).IdOsStatus := EditIdStatusOS.AsInteger;
      TOSAberturaVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TOSAberturaVO(ObjetoVO).IdCliente := EditIdCliente.AsInteger;
      TOSAberturaVO(ObjetoVO).Numero := EditNumero.Text;
      TOSAberturaVO(ObjetoVO).DataInicio := EditDataInicio.Date;
      TOSAberturaVO(ObjetoVO).HoraInicio := EditHoraInicio.Text;
      TOSAberturaVO(ObjetoVO).DataPrevisao := EditDataPrevisao.Date;
      TOSAberturaVO(ObjetoVO).HoraPrevisao := EditHoraPrevisao.Text;
      TOSAberturaVO(ObjetoVO).DataFim := EditDataFim.Date;
      TOSAberturaVO(ObjetoVO).HoraFim := EditHoraFim.Text;
      TOSAberturaVO(ObjetoVO).NomeContato := EditNomeContato.Text;
      TOSAberturaVO(ObjetoVO).FoneContato := EditFoneContato.Text;
      TOSAberturaVO(ObjetoVO).ObservacaoCliente := MemoObservacaoCliente.Text;
      TOSAberturaVO(ObjetoVO).ObservacaoAbertura := MemoObservacaoAbertura.Text;

      // Produtos
      TController.PreencherObjectListFromCDS<TOsProdutoServicoVO>(TOSAberturaVO(ObjetoVO).ListaOsProdutoServicoVO, CDSOSProdutoServico);

      // Equipamentos
      TController.PreencherObjectListFromCDS<TOsAberturaEquipamentoVO>(TOSAberturaVO(ObjetoVO).ListaOsEquipamentoVO, CDSOSAberturaEquipamento);

      // Evoluções
      TController.PreencherObjectListFromCDS<TOsEvolucaoVO>(TOSAberturaVO(ObjetoVO).ListaOsEvolucaoVO, CDSOSEvolucao);


      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('OsAberturaController.TOsAberturaController', 'Insere', [TOSAberturaVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TOSAberturaVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('OsAberturaController.TOsAberturaController', 'Altera', [TOSAberturaVO(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFOSAbertura.EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdColaborador.Value <> 0 then
      Filtro := 'ID = ' + EditIdColaborador.Text
    else
      Filtro := 'ID=0';

    try
      EditIdColaborador.Clear;
      EditColaboradorNome.Clear;
      if not PopulaCamposTransientes(Filtro, TViewPessoaColaboradorVO, TViewPessoaColaboradorController) then
        PopulaCamposTransientesLookup(TViewPessoaColaboradorVO, TViewPessoaColaboradorController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdColaborador.Text := CDSTransiente.FieldByName('ID').AsString;
        EditColaboradorNome.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdCliente.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFOSAbertura.EditIdClienteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdCliente.Value <> 0 then
      Filtro := 'ID = ' + EditIdCliente.Text
    else
      Filtro := 'ID=0';

    try
      EditIdCliente.Clear;
      EditClienteNome.Clear;
      if not PopulaCamposTransientes(Filtro, TViewPessoaClienteVO, TViewPessoaClienteController) then
        PopulaCamposTransientesLookup(TViewPessoaClienteVO, TViewPessoaClienteController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdCliente.Text := CDSTransiente.FieldByName('ID').AsString;
        EditClienteNome.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditNumero.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFOSAbertura.EditIdStatusOSKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdStatusOS.Value <> 0 then
      Filtro := 'ID = ' + EditIdStatusOS.Text
    else
      Filtro := 'ID=0';

    try
      EditIdStatusOS.Clear;
      EditStatusNome.Clear;
      if not PopulaCamposTransientes(Filtro, TOsStatusVO, TOsStatusController) then
        PopulaCamposTransientesLookup(TOsStatusVO, TOsStatusController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdStatusOS.Text := CDSTransiente.FieldByName('ID').AsString;
        EditStatusNome.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdColaborador.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFOSAbertura.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TOSAberturaVO(TController.BuscarObjeto('OsAberturaController.TOsAberturaController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin

    EditIdStatusOS.AsInteger := TOSAberturaVO(ObjetoVO).IdOsStatus;
    EditIdColaborador.AsInteger := TOSAberturaVO(ObjetoVO).IdColaborador;
    EditIdCliente.AsInteger := TOSAberturaVO(ObjetoVO).IdCliente;
    EditNumero.Text := TOSAberturaVO(ObjetoVO).Numero;
    EditDataInicio.Date := TOSAberturaVO(ObjetoVO).DataInicio;
    EditHoraInicio.Text := TOSAberturaVO(ObjetoVO).HoraInicio;
    EditDataPrevisao.Date := TOSAberturaVO(ObjetoVO).DataPrevisao;
    EditHoraPrevisao.Text := TOSAberturaVO(ObjetoVO).HoraPrevisao;
    EditDataFim.Date := TOSAberturaVO(ObjetoVO).DataFim;
    EditHoraFim.Text := TOSAberturaVO(ObjetoVO).HoraFim;
    EditNomeContato.Text := TOSAberturaVO(ObjetoVO).NomeContato;
    EditFoneContato.Text := TOSAberturaVO(ObjetoVO).FoneContato;
    MemoObservacaoCliente.Text := TOSAberturaVO(ObjetoVO).ObservacaoCliente;
    MemoObservacaoAbertura.Text := TOSAberturaVO(ObjetoVO).ObservacaoAbertura;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TOsProdutoServicoVO>(TOSAberturaVO(ObjetoVO).ListaOsProdutoServicoVO, True, True, CDSOSProdutoServico);
    TController.TratarRetorno<TOsAberturaEquipamentoVO>(TOSAberturaVO(ObjetoVO).ListaOsEquipamentoVO, True, True, CDSOSAberturaEquipamento);
    TController.TratarRetorno<TOsEvolucaoVO>(TOSAberturaVO(ObjetoVO).ListaOsEvolucaoVO, True, True, CDSOSEvolucao);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TOSAberturaVO(ObjetoVO).ListaOsProdutoServicoVO.Clear;
    TOSAberturaVO(ObjetoVO).ListaOsEquipamentoVO.Clear;
    TOSAberturaVO(ObjetoVO).ListaOsEvolucaoVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFOSAbertura.GridProdutoServicoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    try
      PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        CDSOSProdutoServico.Append;
        CDSOSProdutoServico.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
        CDSOSProdutoServico.FieldByName('VALOR_UNITARIO').AsFloat := CDSTransiente.FieldByName('VALOR_VENDA').AsFloat;
        CDSOSProdutoServico.Post;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
  //
  If Key = VK_RETURN then
    GridProdutoServico.SelectedIndex := GridProdutoServico.SelectedIndex + 1;
end;

procedure TFOSAbertura.GridEquipamentosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  /// EXERCICIO
  ///  Insira na grid a opção para o usuário selecionar entre (0=NENHUM | 1=GARANTIA | 2=SEGURO | 3=CONTRATO)
  ///  para o campo Tipo Cobertura

  if Key = VK_F1 then
  begin
    try
      PopulaCamposTransientesLookup(TOsEquipamentoVO, TOsEquipamentoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        CDSOSAberturaEquipamento.Append;
        CDSOSAberturaEquipamento.FieldByName('ID_OS_EQUIPAMENTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
        CDSOSAberturaEquipamento.Post;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
  //
  If Key = VK_RETURN then
    GridEquipamentos.SelectedIndex := GridEquipamentos.SelectedIndex + 1;
end;

procedure TFOSAbertura.GridEvolucaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = VK_RETURN then
    GridEvolucao.SelectedIndex := GridEvolucao.SelectedIndex + 1;
end;

procedure TFOSAbertura.ControlaPersistencia(pDataSet: TDataSet);
begin
  pDataSet.FieldByName('PERSISTE').AsString := 'S';
end;
{$ENDREGION}

/// EXERCICIO
///  Onde armazenar o agendamento das visitas técnicas? É preciso uma nova tabela?
///  Faça a integração com a agenda corporativa do técnico no momento da abertura da OS

/// EXERCICIO
///  A partir da OS criada, gere um orçamento de venda no módulo Vendas

/// EXERCICIO
///  O SB menciona a integração com o Financeiro e NF-e/NFS-e.
///  A única integração necessária aqui é com o módulo Vendas, pois de lá
///  já deve existir a integração com o financeiro e NF-e/NFS-e

/// EXERCICIO
///  Crie uma janela para mesclagem de OS's ou crie uma opção nesta janela
///  para realizar tal tarefa

end.
