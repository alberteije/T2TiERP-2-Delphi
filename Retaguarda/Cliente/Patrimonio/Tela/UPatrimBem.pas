{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Bem - Patrimônio

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

unit UPatrimBem;

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
  [TFormDescription(TConstantes.MODULO_PATRIMONIO, 'Bem')]

  TFPatrimBem = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    EditNome: TLabeledEdit;
    EditNumero: TLabeledEdit;
    BevelEdits: TBevel;
    PageControlDadosPatrimBem: TPageControl;
    tsDadosComplementares: TTabSheet;
    tsDocumentoBem: TTabSheet;
    PanelDocumentacao: TPanel;
    GridDocumentacao: TJvDBUltimGrid;
    tsDepreciacaoBem: TTabSheet;
    PanelDepreciacao: TPanel;
    GridDepreciacao: TJvDBUltimGrid;
    EditIdTipoAquisicao: TLabeledCalcEdit;
    EditTipoAquisicaoNome: TLabeledEdit;
    EditIdSetor: TLabeledCalcEdit;
    EditSetorNome: TLabeledEdit;
    PanelDadosComplementares: TPanel;
    EditDataAquisicao: TLabeledDateEdit;
    MemoDescricao: TLabeledMemo;
    EditDataAceite: TLabeledDateEdit;
    EditDataCadastro: TLabeledDateEdit;
    EditValorOriginal: TLabeledCalcEdit;
    MemoFuncao: TLabeledMemo;
    CDSPatrimDocumentoBem: TClientDataSet;
    DSPatrimDocumentoBem: TDataSource;
    CDSPatrimDepreciacaoBem: TClientDataSet;
    DSPatrimDepreciacaoBem: TDataSource;
    tsMovimentacaoBem: TTabSheet;
    PanelMovimentacao: TPanel;
    GridMovimentacao: TJvDBUltimGrid;
    CDSPatrimMovimentacaoBem: TClientDataSet;
    DSPatrimMovimentacaoBem: TDataSource;
    CDSPatrimDepreciacaoBemID: TIntegerField;
    CDSPatrimDepreciacaoBemID_PATRIM_BEM: TIntegerField;
    CDSPatrimDepreciacaoBemDATA_DEPRECIACAO: TDateField;
    CDSPatrimDepreciacaoBemDIAS: TIntegerField;
    CDSPatrimDepreciacaoBemTAXA: TFMTBCDField;
    CDSPatrimDepreciacaoBemINDICE: TFMTBCDField;
    CDSPatrimDepreciacaoBemVALOR: TFMTBCDField;
    CDSPatrimDepreciacaoBemDEPRECIACAO_ACUMULADA: TFMTBCDField;
    CDSPatrimMovimentacaoBemID: TIntegerField;
    CDSPatrimMovimentacaoBemID_PATRIM_BEM: TIntegerField;
    CDSPatrimMovimentacaoBemID_PATRIM_TIPO_MOVIMENTACAO: TIntegerField;
    CDSPatrimMovimentacaoBemDATA_MOVIMENTACAO: TDateField;
    CDSPatrimMovimentacaoBemRESPONSAVEL: TStringField;
    EditGrupoBemNome: TLabeledEdit;
    EditIdGrupoBem: TLabeledCalcEdit;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaboradorNome: TLabeledEdit;
    EditIdFornecedor: TLabeledCalcEdit;
    EditFornecedorNome: TLabeledEdit;
    EditIdEstadoConservacao: TLabeledCalcEdit;
    EditEstadoConservacaoNome: TLabeledEdit;
    EditNumeroSerie: TLabeledEdit;
    EditDataContabilizado: TLabeledDateEdit;
    EditDataVistoria: TLabeledDateEdit;
    EditDataMarcacao: TLabeledDateEdit;
    EditDataBaixa: TLabeledDateEdit;
    EditDataVencimentoGarantia: TLabeledDateEdit;
    EditNumeroNF: TLabeledEdit;
    EditChaveNFe: TLabeledEdit;
    EditValorCompra: TLabeledCalcEdit;
    EditValorAtualizado: TLabeledCalcEdit;
    GroupBoxDepreciacao: TGroupBox;
    EditValorBaixa: TLabeledCalcEdit;
    ComboDeprecia: TLabeledComboBox;
    ComboMetodoDepreciacao: TLabeledComboBox;
    ComboTipoDepreciacao: TLabeledComboBox;
    EditInicioDepreciacao: TLabeledDateEdit;
    EditUltimaDepreciacao: TLabeledDateEdit;
    EditTaxaAnualDepreciacao: TLabeledCalcEdit;
    EditTaxaMensalDepreciacao: TLabeledCalcEdit;
    EditTaxaDepreciacaoAcelerada: TLabeledCalcEdit;
    EditTaxaDepreciacaoIncentivada: TLabeledCalcEdit;
    ActionToolBarDepreciacao: TActionToolBar;
    ActionManagerBem: TActionManager;
    ActionCalcularDepreciacao: TAction;
    CDSPatrimDocumentoBemID: TIntegerField;
    CDSPatrimDocumentoBemID_PATRIM_BEM: TIntegerField;
    CDSPatrimDocumentoBemNOME: TStringField;
    CDSPatrimDocumentoBemDESCRICAO: TStringField;
    CDSPatrimDocumentoBemIMAGEM: TStringField;
    CDSPatrimDocumentoBemPERSISTE: TStringField;
    CDSPatrimDepreciacaoBemPERSISTE: TStringField;
    CDSPatrimMovimentacaoBemPATRIM_TIPO_MOVIMENTACAONOME: TStringField;
    CDSPatrimMovimentacaoBemPERSISTE: TStringField;
    ActionToolBar1: TActionToolBar;
    ActionAcionarGed: TAction;
    procedure FormCreate(Sender: TObject);
    procedure GridDocumentacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDepreciacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridMovimentacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionCalcularDepreciacaoExecute(Sender: TObject);
    procedure CDSPatrimDocumentoBemAfterEdit(DataSet: TDataSet);
    procedure CDSPatrimDepreciacaoBemAfterEdit(DataSet: TDataSet);
    procedure CDSPatrimMovimentacaoBemAfterEdit(DataSet: TDataSet);
    procedure ActionAcionarGedExecute(Sender: TObject);
    procedure EditIdSetorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdFornecedorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdGrupoBemKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdTipoAquisicaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdEstadoConservacaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    IdTipoPatrimBem: Integer;
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
  FPatrimBem: TFPatrimBem;

implementation

uses NotificationService, PatrimBemVO, PatrimBemController, PatrimDocumentoBemVO,
  PatrimDepreciacaoBemVO, PatrimMovimentacaoBemVO, ULookup, UDataModule,
  PatrimTipoAquisicaoBemVO, PatrimTipoAquisicaoBemController, ViewPessoaColaboradorVO,
  ViewPessoaColaboradorController, PatrimEstadoConservacaoVO, PatrimEstadoConservacaoController,
  ViewPessoaFornecedorVO, ViewPessoaFornecedorController, PatrimGrupoBemVO, PatrimGrupoBemController,
  SetorVO, SetorController, PatrimTipoMovimentacaoVO, PatrimTipoMovimentacaoController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFPatrimBem.FormCreate(Sender: TObject);
var
  Form: TForm;
begin
  ClasseObjetoGridVO := TPatrimBemVO;
  ObjetoController := TPatrimBemController.Create;

  inherited;
end;

procedure TFPatrimBem.LimparCampos;
var
  i: Integer;
begin
  inherited;

  CDSPatrimDocumentoBem.EmptyDataSet;
  CDSPatrimDepreciacaoBem.EmptyDataSet;
  CDSPatrimMovimentacaoBem.EmptyDataSet;

  ConfigurarLayoutTela;
end;

procedure TFPatrimBem.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;
  PageControlDadosPatrimBem.ActivePageIndex := 0;

  if StatusTela = stNavegandoEdits then
  begin
    PanelDadosComplementares.Enabled := False;
    GridDocumentacao.ReadOnly := True;
    GridDepreciacao.ReadOnly := True;
    GridMovimentacao.ReadOnly := True;
  end
  else
  begin
    PanelDadosComplementares.Enabled := True;
    GridDocumentacao.ReadOnly := False;
    GridDepreciacao.ReadOnly := False;
    GridMovimentacao.ReadOnly := False;
  end;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFPatrimBem.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdSetor.SetFocus;
  end;
end;

function TFPatrimBem.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdSetor.SetFocus;
  end;
end;

function TFPatrimBem.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('PatrimBemController.TPatrimBemController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('PatrimBemController.TPatrimBemController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFPatrimBem.DoSalvar: Boolean;
var
  DocumentoBemVO: TPatrimDocumentoBemVO;
  DepreciacaoBemVO: TPatrimDepreciacaoBemVO;
  MovimentacaoBemVO: TPatrimMovimentacaoBemVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TPatrimBemVO.Create;

      TPatrimBemVO(ObjetoVO).IdPatrimTipoAquisicaoBem := EditIdTipoAquisicao.AsInteger;
      TPatrimBemVO(ObjetoVO).PatrimTipoAquisicaoBemNome := EditTipoAquisicaoNome.Text;
      TPatrimBemVO(ObjetoVO).IdPatrimEstadoConservacao := EditIdEstadoConservacao.AsInteger;
      TPatrimBemVO(ObjetoVO).PatrimEstadoConservacaoNome := EditEstadoConservacaoNome.Text;
      TPatrimBemVO(ObjetoVO).IdPatrimGrupoBem := EditIdGrupoBem.AsInteger;
      TPatrimBemVO(ObjetoVO).PatrimGrupoBemNome := EditGrupoBemNome.Text;
      TPatrimBemVO(ObjetoVO).IdSetor := EditIdSetor.AsInteger;
      /// EXERCICIO: permita que o usuário informe o centro de resultado ou preencha de forma dinâmica
      TPatrimBemVO(ObjetoVO).IdCentroResultado := 1;
      TPatrimBemVO(ObjetoVO).SetorNome := EditSetorNome.Text;
      TPatrimBemVO(ObjetoVO).IdFornecedor := EditIdFornecedor.AsInteger;
      TPatrimBemVO(ObjetoVO).FornecedorPessoaNome := EditFornecedorNome.Text;
      TPatrimBemVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TPatrimBemVO(ObjetoVO).ColaboradorPessoaNome := EditColaboradorNome.Text;
      TPatrimBemVO(ObjetoVO).NumeroNb := EditNumero.Text;
      TPatrimBemVO(ObjetoVO).Nome := EditNome.Text;
      TPatrimBemVO(ObjetoVO).Descricao := MemoDescricao.Text;
      TPatrimBemVO(ObjetoVO).NumeroSerie := EditNumeroSerie.Text;
      TPatrimBemVO(ObjetoVO).DataAquisicao := EditDataAquisicao.Date;
      TPatrimBemVO(ObjetoVO).DataAceite := EditDataAceite.Date;
      TPatrimBemVO(ObjetoVO).DataCadastro := EditDataCadastro.Date;
      TPatrimBemVO(ObjetoVO).DataContabilizado := EditDataContabilizado.Date;
      TPatrimBemVO(ObjetoVO).DataVistoria := EditDataVistoria.Date;
      TPatrimBemVO(ObjetoVO).DataMarcacao := EditDataMarcacao.Date;
      TPatrimBemVO(ObjetoVO).DataBaixa := EditDataBaixa.Date;
      TPatrimBemVO(ObjetoVO).VencimentoGarantia := EditDataVencimentoGarantia.Date;
      TPatrimBemVO(ObjetoVO).NumeroNotaFiscal := EditNumeroNF.Text;
      TPatrimBemVO(ObjetoVO).ChaveNfe := EditChaveNFe.Text;
      TPatrimBemVO(ObjetoVO).ValorOriginal := EditValorOriginal.Value;
      TPatrimBemVO(ObjetoVO).ValorCompra := EditValorCompra.Value;
      TPatrimBemVO(ObjetoVO).ValorAtualizado := EditValorAtualizado.Value;
      TPatrimBemVO(ObjetoVO).ValorBaixa := EditValorBaixa.Value;
      TPatrimBemVO(ObjetoVO).Deprecia := Copy(ComboDeprecia.Text, 1, 1);
      TPatrimBemVO(ObjetoVO).MetodoDepreciacao := Copy(ComboMetodoDepreciacao.Text, 1, 1);
      TPatrimBemVO(ObjetoVO).InicioDepreciacao := EditInicioDepreciacao.Date;
      TPatrimBemVO(ObjetoVO).UltimaDepreciacao := EditUltimaDepreciacao.Date;
      TPatrimBemVO(ObjetoVO).TipoDepreciacao := Copy(ComboTipoDepreciacao.Text, 1, 1);
      TPatrimBemVO(ObjetoVO).TaxaAnualDepreciacao := EditTaxaAnualDepreciacao.Value;
      TPatrimBemVO(ObjetoVO).TaxaMensalDepreciacao := EditTaxaMensalDepreciacao.Value;
      TPatrimBemVO(ObjetoVO).TaxaDepreciacaoAcelerada := EditTaxaDepreciacaoAcelerada.Value;
      TPatrimBemVO(ObjetoVO).TaxaDepreciacaoIncentivada := EditTaxaDepreciacaoIncentivada.Value;
      TPatrimBemVO(ObjetoVO).Funcao := MemoFuncao.Text;

      // Documento

      /// EXERCICIO - TENTE IMPLEMENTAR OS DADOS DA LISTA DE DETALHES DE ACORDO COM O NOVO MODELO PROPOSTO NA INFRA

      CDSPatrimDocumentoBem.DisableControls;
      CDSPatrimDocumentoBem.First;
      while not CDSPatrimDocumentoBem.Eof do
      begin
        if (CDSPatrimDocumentoBemPERSISTE.AsString = 'S') or (CDSPatrimDocumentoBemID.AsInteger = 0) then
        begin
          DocumentoBemVO := TPatrimDocumentoBemVO.Create;
          DocumentoBemVO.Id := CDSPatrimDocumentoBemID.AsInteger;
          DocumentoBemVO.IdPatrimBem := TPatrimBemVO(ObjetoVO).Id;
          DocumentoBemVO.Nome := CDSPatrimDocumentoBemNOME.AsString;
          DocumentoBemVO.Descricao := CDSPatrimDocumentoBemDESCRICAO.AsString;
          DocumentoBemVO.Imagem := CDSPatrimDocumentoBemIMAGEM.AsString;
          TPatrimBemVO(ObjetoVO).ListaPatrimDocumentoBemVO.Add(DocumentoBemVO);
        end;
        CDSPatrimDocumentoBem.Next;
      end;
      CDSPatrimDocumentoBem.First;
      CDSPatrimDocumentoBem.EnableControls;

      // Depreciação
      CDSPatrimDepreciacaoBem.DisableControls;
      CDSPatrimDepreciacaoBem.First;
      while not CDSPatrimDepreciacaoBem.Eof do
      begin
        if (CDSPatrimDepreciacaoBemPERSISTE.AsString = 'S') or (CDSPatrimDepreciacaoBemID.AsInteger = 0) then
        begin
          DepreciacaoBemVO := TPatrimDepreciacaoBemVO.Create;
          DepreciacaoBemVO.Id := CDSPatrimDepreciacaoBemID.AsInteger;
          DepreciacaoBemVO.IdPatrimBem := TPatrimBemVO(ObjetoVO).Id;
          DepreciacaoBemVO.DataDepreciacao := CDSPatrimDepreciacaoBemDATA_DEPRECIACAO.AsDateTime;
          DepreciacaoBemVO.Dias := CDSPatrimDepreciacaoBemDIAS.AsInteger;
          DepreciacaoBemVO.Taxa := CDSPatrimDepreciacaoBemTAXA.AsExtended;
          DepreciacaoBemVO.Indice := CDSPatrimDepreciacaoBemINDICE.AsExtended;
          DepreciacaoBemVO.Valor := CDSPatrimDepreciacaoBemVALOR.AsExtended;
          DepreciacaoBemVO.DepreciacaoAcumulada := CDSPatrimDepreciacaoBemDEPRECIACAO_ACUMULADA.AsExtended;
          TPatrimBemVO(ObjetoVO).ListaPatrimDepreciacaoBemVO.Add(DepreciacaoBemVO);
        end;
        CDSPatrimDepreciacaoBem.Next;
      end;
      CDSPatrimDepreciacaoBem.First;
      CDSPatrimDepreciacaoBem.EnableControls;

      // Movimentação
      CDSPatrimMovimentacaoBem.DisableControls;
      CDSPatrimMovimentacaoBem.First;
      while not CDSPatrimMovimentacaoBem.Eof do
      begin
        if (CDSPatrimMovimentacaoBemPERSISTE.AsString = 'S') or (CDSPatrimMovimentacaoBemID.AsInteger = 0) then
        begin
          MovimentacaoBemVO := TPatrimMovimentacaoBemVO.Create;
          MovimentacaoBemVO.Id := CDSPatrimMovimentacaoBemID.AsInteger;
          MovimentacaoBemVO.IdPatrimBem := TPatrimBemVO(ObjetoVO).Id;
          MovimentacaoBemVO.IdPatrimTipoMovimentacao := CDSPatrimMovimentacaoBemID_PATRIM_TIPO_MOVIMENTACAO.AsInteger;
          MovimentacaoBemVO.PatrimTipoMovimentacaoNome := CDSPatrimMovimentacaoBemPATRIM_TIPO_MOVIMENTACAONOME.AsString;
          MovimentacaoBemVO.DataMovimentacao := CDSPatrimMovimentacaoBemDATA_MOVIMENTACAO.AsDateTime;
          MovimentacaoBemVO.Responsavel := CDSPatrimMovimentacaoBemRESPONSAVEL.AsString;
          TPatrimBemVO(ObjetoVO).ListaPatrimMovimentacaoBemVO.Add(MovimentacaoBemVO);
        end;
        CDSPatrimMovimentacaoBem.Next;
      end;
      CDSPatrimMovimentacaoBem.First;
      CDSPatrimMovimentacaoBem.EnableControls;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('PatrimBemController.TPatrimBemController', 'Insere', [TPatrimBemVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TPatrimBemVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('PatrimBemController.TPatrimBemController', 'Altera', [TPatrimBemVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFPatrimBem.EditIdTipoAquisicaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdTipoAquisicao.Value <> 0 then
      Filtro := 'ID = ' + EditIdTipoAquisicao.Text
    else
      Filtro := 'ID=0';

    try
      EditIdTipoAquisicao.Clear;
      EditTipoAquisicaoNome.Clear;
      if not PopulaCamposTransientes(Filtro, TPatrimTipoAquisicaoBemVO, TPatrimTipoAquisicaoBemController) then
        PopulaCamposTransientesLookup(TPatrimTipoAquisicaoBemVO, TPatrimTipoAquisicaoBemController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdTipoAquisicao.Text := CDSTransiente.FieldByName('ID').AsString;
        EditTipoAquisicaoNome.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdEstadoConservacao.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFPatrimBem.EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
        EditIdFornecedor.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFPatrimBem.EditIdEstadoConservacaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdEstadoConservacao.Value <> 0 then
      Filtro := 'ID = ' + EditIdEstadoConservacao.Text
    else
      Filtro := 'ID=0';

    try
      EditIdEstadoConservacao.Clear;
      EditEstadoConservacaoNome.Clear;
      if not PopulaCamposTransientes(Filtro, TPatrimEstadoConservacaoVO, TPatrimEstadoConservacaoController) then
        PopulaCamposTransientesLookup(TPatrimEstadoConservacaoVO, TPatrimEstadoConservacaoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdEstadoConservacao.Text := CDSTransiente.FieldByName('ID').AsString;
        EditEstadoConservacaoNome.Text := CDSTransiente.FieldByName('NOME').AsString;
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

procedure TFPatrimBem.EditIdFornecedorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdFornecedor.Value <> 0 then
      Filtro := 'ID = ' + EditIdFornecedor.Text
    else
      Filtro := 'ID=0';

    try
      EditIdFornecedor.Clear;
      EditFornecedorNome.Clear;
      if not PopulaCamposTransientes(Filtro, TViewPessoaFornecedorVO, TViewPessoaFornecedorController) then
        PopulaCamposTransientesLookup(TViewPessoaFornecedorVO, TViewPessoaFornecedorController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdFornecedor.Text := CDSTransiente.FieldByName('ID').AsString;
        EditFornecedorNome.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdGrupoBem.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFPatrimBem.EditIdGrupoBemKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdGrupoBem.Value <> 0 then
      Filtro := 'ID = ' + EditIdGrupoBem.Text
    else
      Filtro := 'ID=0';

    try
      EditIdGrupoBem.Clear;
      EditGrupoBemNome.Clear;
      if not PopulaCamposTransientes(Filtro, TPatrimGrupoBemVO, TPatrimGrupoBemController) then
        PopulaCamposTransientesLookup(TPatrimGrupoBemVO, TPatrimGrupoBemController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdGrupoBem.Text := CDSTransiente.FieldByName('ID').AsString;
        EditGrupoBemNome.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdTipoAquisicao.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFPatrimBem.EditIdSetorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdSetor.Value <> 0 then
      Filtro := 'ID = ' + EditIdSetor.Text
    else
      Filtro := 'ID=0';

    try
      EditIdSetor.Clear;
      EditSetorNome.Clear;
      if not PopulaCamposTransientes(Filtro, TSetorVO, TSetorController) then
        PopulaCamposTransientesLookup(TSetorVO, TSetorController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdSetor.Text := CDSTransiente.FieldByName('ID').AsString;
        EditSetorNome.Text := CDSTransiente.FieldByName('NOME').AsString;
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
procedure TFPatrimBem.GridParaEdits;
var
  DocumentoBemEnumerator: TEnumerator<TPatrimDocumentoBemVO>;
  DepreciacaoBemEnumerator: TEnumerator<TPatrimDepreciacaoBemVO>;
  MovimentacaoBemEnumerator: TEnumerator<TPatrimMovimentacaoBemVO>;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TPatrimBemVO(TController.BuscarObjeto('PatrimBemController.TPatrimBemController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin

    EditIdTipoAquisicao.AsInteger := TPatrimBemVO(ObjetoVO).IdPatrimTipoAquisicaoBem;
    EditIdEstadoConservacao.AsInteger := TPatrimBemVO(ObjetoVO).IdPatrimEstadoConservacao;
    EditIdGrupoBem.AsInteger := TPatrimBemVO(ObjetoVO).IdPatrimGrupoBem;
    EditIdSetor.AsInteger := TPatrimBemVO(ObjetoVO).IdSetor;
    EditIdFornecedor.AsInteger := TPatrimBemVO(ObjetoVO).IdFornecedor;
    EditIdColaborador.AsInteger := TPatrimBemVO(ObjetoVO).IdColaborador;
    EditTipoAquisicaoNome.Text := TPatrimBemVO(ObjetoVO).PatrimTipoAquisicaoBemNome;
    EditEstadoConservacaoNome.Text := TPatrimBemVO(ObjetoVO).PatrimEstadoConservacaoNome;
    EditGrupoBemNome.Text := TPatrimBemVO(ObjetoVO).PatrimGrupoBemNome;
    EditSetorNome.Text := TPatrimBemVO(ObjetoVO).SetorNome;
    EditFornecedorNome.Text := TPatrimBemVO(ObjetoVO).FornecedorPessoaNome;
    EditColaboradorNome.Text := TPatrimBemVO(ObjetoVO).ColaboradorPessoaNome;
    EditNumero.Text := TPatrimBemVO(ObjetoVO).NumeroNb;
    EditNome.Text := TPatrimBemVO(ObjetoVO).Nome;
    MemoDescricao.Text := TPatrimBemVO(ObjetoVO).Descricao;
    EditNumeroSerie.Text := TPatrimBemVO(ObjetoVO).NumeroSerie;
    EditDataAquisicao.Date := TPatrimBemVO(ObjetoVO).DataAquisicao;
    EditDataAceite.Date := TPatrimBemVO(ObjetoVO).DataAceite;
    EditDataCadastro.Date := TPatrimBemVO(ObjetoVO).DataCadastro;
    EditDataContabilizado.Date := TPatrimBemVO(ObjetoVO).DataContabilizado;
    EditDataVistoria.Date := TPatrimBemVO(ObjetoVO).DataVistoria;
    EditDataMarcacao.Date := TPatrimBemVO(ObjetoVO).DataMarcacao;
    EditDataBaixa.Date := TPatrimBemVO(ObjetoVO).DataBaixa;
    EditDataVencimentoGarantia.Date := TPatrimBemVO(ObjetoVO).VencimentoGarantia;
    EditNumeroNF.Text := TPatrimBemVO(ObjetoVO).NumeroNotaFiscal;
    EditChaveNFe.Text := TPatrimBemVO(ObjetoVO).ChaveNfe;
    EditValorOriginal.Value := TPatrimBemVO(ObjetoVO).ValorOriginal;
    EditValorCompra.Value := TPatrimBemVO(ObjetoVO).ValorCompra;
    EditValorAtualizado.Value := TPatrimBemVO(ObjetoVO).ValorAtualizado;
    EditValorBaixa.Value := TPatrimBemVO(ObjetoVO).ValorBaixa;

    case AnsiIndexStr(TPatrimBemVO(ObjetoVO).Deprecia, ['S', 'N']) of
      0:
        ComboDeprecia.ItemIndex := 0;
      1:
        ComboDeprecia.ItemIndex := 1;
    else
      ComboDeprecia.ItemIndex := -1;
    end;

    case AnsiIndexStr(TPatrimBemVO(ObjetoVO).MetodoDepreciacao, ['1', '2', '3', '4']) of
      0:
        ComboMetodoDepreciacao.ItemIndex := 0;
      1:
        ComboMetodoDepreciacao.ItemIndex := 1;
      2:
        ComboMetodoDepreciacao.ItemIndex := 2;
      3:
        ComboMetodoDepreciacao.ItemIndex := 3;
    else
      ComboMetodoDepreciacao.ItemIndex := -1;
    end;

    EditInicioDepreciacao.Date := TPatrimBemVO(ObjetoVO).InicioDepreciacao;
    EditUltimaDepreciacao.Date := TPatrimBemVO(ObjetoVO).UltimaDepreciacao;

    case AnsiIndexStr(TPatrimBemVO(ObjetoVO).TipoDepreciacao, ['N', 'A', 'I']) of
      0:
        ComboTipoDepreciacao.ItemIndex := 0;
      1:
        ComboTipoDepreciacao.ItemIndex := 1;
      2:
        ComboTipoDepreciacao.ItemIndex := 2;
    else
      ComboTipoDepreciacao.ItemIndex := -1;
    end;

    EditTaxaAnualDepreciacao.Value := TPatrimBemVO(ObjetoVO).TaxaAnualDepreciacao;
    EditTaxaMensalDepreciacao.Value := TPatrimBemVO(ObjetoVO).TaxaMensalDepreciacao;
    EditTaxaDepreciacaoAcelerada.Value := TPatrimBemVO(ObjetoVO).TaxaDepreciacaoAcelerada;
    EditTaxaDepreciacaoIncentivada.Value := TPatrimBemVO(ObjetoVO).TaxaDepreciacaoIncentivada;
    MemoFuncao.Text := TPatrimBemVO(ObjetoVO).Funcao;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TPatrimDocumentoBemVO>(TPatrimBemVO(ObjetoVO).ListaPatrimDocumentoBemVO, True, True, CDSPatrimDocumentoBem);
    TController.TratarRetorno<TPatrimDepreciacaoBemVO>(TPatrimBemVO(ObjetoVO).ListaPatrimDepreciacaoBemVO, True, True, CDSPatrimDepreciacaoBem);
    TController.TratarRetorno<TPatrimMovimentacaoBemVO>(TPatrimBemVO(ObjetoVO).ListaPatrimMovimentacaoBemVO, True, True, CDSPatrimMovimentacaoBem);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TPatrimBemVO(ObjetoVO).ListaPatrimDocumentoBemVO.Clear;
    TPatrimBemVO(ObjetoVO).ListaPatrimDepreciacaoBemVO.Clear;
    TPatrimBemVO(ObjetoVO).ListaPatrimMovimentacaoBemVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFPatrimBem.GridDocumentacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = VK_RETURN then
    GridDocumentacao.SelectedIndex := GridDocumentacao.SelectedIndex + 1;
end;

procedure TFPatrimBem.GridDepreciacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = VK_RETURN then
    GridDepreciacao.SelectedIndex := GridDepreciacao.SelectedIndex + 1;
end;

procedure TFPatrimBem.GridMovimentacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    try
      PopulaCamposTransientesLookup(TPatrimTipoMovimentacaoVO, TPatrimTipoMovimentacaoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        CDSPatrimMovimentacaoBem.Append;
        CDSPatrimMovimentacaoBemID_PATRIM_TIPO_MOVIMENTACAO.AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
        CDSPatrimMovimentacaoBemPATRIM_TIPO_MOVIMENTACAONOME.AsString := CDSTransiente.FieldByName('NOME').AsString;
        CDSPatrimMovimentacaoBemDATA_MOVIMENTACAO.AsDateTime := Now;
        CDSPatrimMovimentacaoBem.Post;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
  If Key = VK_RETURN then
    GridMovimentacao.SelectedIndex := GridMovimentacao.SelectedIndex + 1;
end;

procedure TFPatrimBem.CDSPatrimDepreciacaoBemAfterEdit(DataSet: TDataSet);
begin
  CDSPatrimDepreciacaoBemPERSISTE.AsString := 'S';
end;

procedure TFPatrimBem.CDSPatrimDocumentoBemAfterEdit(DataSet: TDataSet);
begin
  CDSPatrimDocumentoBemPERSISTE.AsString := 'S';
end;

procedure TFPatrimBem.CDSPatrimMovimentacaoBemAfterEdit(DataSet: TDataSet);
begin
  CDSPatrimMovimentacaoBemPERSISTE.AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFPatrimBem.ActionAcionarGedExecute(Sender: TObject);
var
  Parametros: String;
begin
  if not CDSPatrimDocumentoBem.IsEmpty then
  begin
    {
      Parametros
      1 - Login
      2 - Senha
      3 - Aplicação que chamou
      4 - Nome do arquivo (Aplicacao que chamou + Tela que chamou + Numero Apólice
      }

    try
      CDSPatrimDocumentoBem.Edit;
      CDSPatrimDocumentoBemIMAGEM.AsString := 'PATRIMONIO_BEM_' + EditNumero.Text + '_' + MD5String(CDSPatrimDocumentoBemNOME.AsString);
      CDSPatrimDocumentoBem.Post;

      Parametros := Sessao.Usuario.Login + ' ' +
                    Sessao.Usuario.Senha + ' ' +
                    'PATRIMONIO' + ' ' +
                    'PATRIMONIO_BEM_' + EditNumero.Text + '_' + MD5String(CDSPatrimDocumentoBemNOME.AsString);
      ShellExecute(
            Handle,
            'open',
            'T2TiERPGed.exe',
            PChar(Parametros),
            '',
            SW_SHOWNORMAL
            );
    except
      Application.MessageBox('Erro ao tentar executar o módulo.', 'Erro do Sistema', MB_OK + MB_ICONERROR);
    end;
  end
  else
  begin
    Application.MessageBox('É preciso adicionar os dados de um documento ao bem.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    GridDocumentacao.SetFocus;
    GridDocumentacao.SelectedIndex := 1;
  end;
end;

procedure TFPatrimBem.ActionCalcularDepreciacaoExecute(Sender: TObject);
begin
  CDSPatrimDepreciacaoBem.Append;
  CDSPatrimDepreciacaoBemDATA_DEPRECIACAO.AsDateTime := Date;
  CDSPatrimDepreciacaoBemDIAS.AsInteger := StrToInt(FormatDateTime('dd', Date));

  //Normal
  if ComboTipoDepreciacao.ItemIndex = 0 then
  begin
    CDSPatrimDepreciacaoBemTAXA.AsExtended := EditTaxaMensalDepreciacao.Value;
    CDSPatrimDepreciacaoBemINDICE.AsExtended := (CDSPatrimDepreciacaoBemDIAS.AsInteger / 30) * EditTaxaMensalDepreciacao.Value;
  end;

  //Acelerada
  if ComboTipoDepreciacao.ItemIndex = 1 then
  begin
    CDSPatrimDepreciacaoBemTAXA.AsExtended := EditTaxaDepreciacaoAcelerada.Value;
    CDSPatrimDepreciacaoBemINDICE.AsExtended := (CDSPatrimDepreciacaoBemDIAS.AsInteger / 30) * EditTaxaDepreciacaoAcelerada.Value;
  end;

  //Incentivada
  if ComboTipoDepreciacao.ItemIndex = 2 then
  begin
    CDSPatrimDepreciacaoBemTAXA.AsExtended := EditTaxaDepreciacaoIncentivada.Value;
    CDSPatrimDepreciacaoBemINDICE.AsExtended := (CDSPatrimDepreciacaoBemDIAS.AsInteger / 30) * EditTaxaDepreciacaoIncentivada.Value;
  end;

  CDSPatrimDepreciacaoBemVALOR.AsExtended := EditValorOriginal.Value * CDSPatrimDepreciacaoBemINDICE.AsExtended;
  CDSPatrimDepreciacaoBemDEPRECIACAO_ACUMULADA.AsExtended := EditValorOriginal.Value - CDSPatrimDepreciacaoBemVALOR.AsExtended;
  CDSPatrimDepreciacaoBem.Post;
end;
{$ENDREGION}

end.
