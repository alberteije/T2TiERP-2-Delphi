{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Tributação

The MIT License

Copyright: Copyright (C) 2014 T2Ti.COM

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
unit UTributacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Mask, JvExMask, JvToolEdit,
  JvCombobox, LabeledCtrls, DBCtrls, LabeledDBCtrls, DB, DBClient, StrUtils,
  Math, JSonVO, Generics.Collections, Atributos, Constantes, CheckLst,
  JvExCheckLst, JvCheckListBox, JvBaseEdits, OleCtnrs, WideStrings, FMTBcd,
  Provider, SqlExpr, ActnList, ToolWin, ActnMan, ActnCtrls, ShellApi,
  PlatformDefaultStyleActnCtrls, System.Actions, Controller;

type
  [TFormDescription(TConstantes.MODULO_ADMINISTRATIVO, 'Tributação')]

  TFTributacao = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    BevelEdits: TBevel;
    PageControlDadosTributacao: TPageControl;
    tsPis: TTabSheet;
    tsIcms: TTabSheet;
    PanelIcms: TPanel;
    GridIcms: TJvDBUltimGrid;
    tsCofins: TTabSheet;
    PanelCofins: TPanel;
    EditIdOperacaoFiscal: TLabeledCalcEdit;
    EditOperacaoFiscal: TLabeledEdit;
    EditIdGrupoTributario: TLabeledCalcEdit;
    EditGrupoTributario: TLabeledEdit;
    PanelPis: TPanel;
    EditPorcentoBaseCalculoPis: TLabeledCalcEdit;
    CDSIcms: TClientDataSet;
    DSIcms: TDataSource;
    tsIpi: TTabSheet;
    PanelIpi: TPanel;
    ActionManager1: TActionManager;
    ActionUf: TAction;
    CDSIcmsUF_DESTINO: TStringField;
    CDSIcmsCFOP: TIntegerField;
    CDSIcmsCSOSN_B: TStringField;
    CDSIcmsCST_B: TStringField;
    CDSIcmsPERSISTE: TStringField;
    ActionToolBar3: TActionToolBar;
    EditCodigoCstPis: TLabeledCalcEdit;
    EditCstPis: TLabeledEdit;
    EditCodigoApuracaoEfdPis: TLabeledCalcEdit;
    EditDescricaoCodigoApuracaoEfdPis: TLabeledEdit;
    ComboboxModalidadeBcPis: TLabeledComboBox;
    EditAliquotaPorcentoPis: TLabeledCalcEdit;
    EditAliquotaUnidadePis: TLabeledCalcEdit;
    EditValorPrecoMaximoPis: TLabeledCalcEdit;
    EditValorPautaFiscalPis: TLabeledCalcEdit;
    EditPorcentoBaseCalculoCofins: TLabeledCalcEdit;
    EditCodigoCstCofins: TLabeledCalcEdit;
    EditCstCofins: TLabeledEdit;
    EditCodigoApuracaoEfdCofins: TLabeledCalcEdit;
    EditDescricaoCodigoApuracaoEfdCofins: TLabeledEdit;
    ComboboxModalidadeBcCofins: TLabeledComboBox;
    EditAliquotaPorcentoCofins: TLabeledCalcEdit;
    EditAliquotaUnidadeCofins: TLabeledCalcEdit;
    EditValorPrecoMaximoCofins: TLabeledCalcEdit;
    EditValorPautaFiscalCofins: TLabeledCalcEdit;
    EditPorcentoBaseCalculoIpi: TLabeledCalcEdit;
    EditCodigoCstIpi: TLabeledCalcEdit;
    EditCstIpi: TLabeledEdit;
    EditIdTipoReceitaDipi: TLabeledCalcEdit;
    EditTipoReceitaDipi: TLabeledEdit;
    ComboboxModalidadeBcIpi: TLabeledComboBox;
    EditAliquotaPorcentoIpi: TLabeledCalcEdit;
    EditAliquotaUnidadeIpi: TLabeledCalcEdit;
    EditValorPrecoMaximoIpi: TLabeledCalcEdit;
    EditValorPautaFiscalIpi: TLabeledCalcEdit;
    CDSIcmsID: TIntegerField;
    ActionExcluirItem: TAction;
    CDSIcmsID_TRIBUT_CONFIGURA_OF_GT: TIntegerField;
    CDSIcmsMODALIDADE_BC: TStringField;
    CDSIcmsMODALIDADE_BC_ST: TStringField;
    CDSIcmsALIQUOTA: TFloatField;
    CDSIcmsVALOR_PAUTA: TFloatField;
    CDSIcmsVALOR_PRECO_MAXIMO: TFloatField;
    CDSIcmsMVA: TFloatField;
    CDSIcmsPORCENTO_BC: TFloatField;
    CDSIcmsALIQUOTA_INTERNA_ST: TFloatField;
    CDSIcmsALIQUOTA_INTERESTADUAL_ST: TFloatField;
    CDSIcmsPORCENTO_BC_ST: TFloatField;
    CDSIcmsALIQUOTA_ICMS_ST: TFloatField;
    CDSIcmsVALOR_PAUTA_ST: TFloatField;
    CDSIcmsVALOR_PRECO_MAXIMO_ST: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure GridIcmsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CDSIcmsAfterEdit(DataSet: TDataSet);
    procedure ActionUfExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure EditIdOperacaoFiscalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdGrupoTributarioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodigoCstPisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodigoApuracaoEfdPisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodigoCstCofinsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodigoApuracaoEfdCofinsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodigoCstIpiKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdTipoReceitaDipiKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
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
  FTributacao: TFTributacao;
  FormEditor: TForm;

implementation

uses UDataModule, ULookup, TributConfiguraOfGtVO, TributConfiguraOfGtController,
  TributGrupoTributarioVO, TributOperacaoFiscalVO, TributPisCodApuracaoVO,
  TributCofinsCodApuracaoVO, TributIpiDipiVO, TributIcmsUfVO, TributOperacaoFiscalController,
  TributGrupoTributarioController, UfVO, UfController, CfopVO, CfopController,
  CsosnBVO, CsosnBController, CstIcmsBVO, CstIcmsBController, CstPisVO, CstPisController,
  CstCofinsVO, EfdTabela435VO, EfdTabela435Controller, CstCofinsController,
  CstIpiVO, CstIpiController, TipoReceitaDipiVO, TipoReceitaDipiController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFTributacao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTributConfiguraOfGtVO;
  ObjetoController := TTributConfiguraOfGtController.Create;

  inherited;
end;

procedure TFTributacao.LimparCampos;
begin
  inherited;
  CDSIcms.EmptyDataSet;
end;

procedure TFTributacao.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;
  PageControlDadosTributacao.ActivePageIndex := 0;

  if StatusTela = stNavegandoEdits then
  begin
    GridIcms.ReadOnly := True;
    PanelPis.Enabled := False;
    PanelCofins.Enabled := False;
    PanelIpi.Enabled := False;
  end
  else
  begin
    GridIcms.ReadOnly := False;
    PanelPis.Enabled := True;
    PanelCofins.Enabled := True;
    PanelIpi.Enabled := True;
  end;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFTributacao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

function TFTributacao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

function TFTributacao.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('TributConfiguraOfGtController.TTributConfiguraOfGtController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('TributConfiguraOfGtController.TTributConfiguraOfGtController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFTributacao.DoSalvar: Boolean;
var
  TributIcmsUf: TTributIcmsUfVO;
begin
  if (EditIdOperacaoFiscal.AsInteger <= 0) or (EditIdGrupoTributario.AsInteger <= 0) then
  begin
    Application.MessageBox('Operação Fiscal ou Grupo Tributário não podem ficar em branco.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditIdOperacaoFiscal.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TTributConfiguraOfGtVO.Create;

      { Cabeçalho - Configura }
      TTributConfiguraOfGtVO(ObjetoVO).IdTributOperacaoFiscal := EditIdOperacaoFiscal.AsInteger;
      TTributConfiguraOfGtVO(ObjetoVO).TributOperacaoFiscalDescricao := EditOperacaoFiscal.Text;
      TTributConfiguraOfGtVO(ObjetoVO).IdTributGrupoTributario := EditIdGrupoTributario.AsInteger;
      TTributConfiguraOfGtVO(ObjetoVO).TributGrupoTributarioDescricao := EditGrupoTributario.Text;

      { Pis }
      if (EditCodigoCstPis.AsInteger > 0) and (EditCodigoApuracaoEfdPis.AsInteger > 0) then
      begin
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.CstPis := StringOfChar('0', 2 - Length(EditCodigoCstPis.Text)) + EditCodigoCstPis.Text;
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.EfdTabela435 := StringOfChar('0', 2 - Length(EditCodigoApuracaoEfdPis.Text)) + EditCodigoApuracaoEfdPis.Text;
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.ModalidadeBaseCalculo := IntToStr(ComboboxModalidadeBcPis.ItemIndex);
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.PorcentoBaseCalculo := EditPorcentoBaseCalculoPis.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.AliquotaPorcento := EditAliquotaPorcentoPis.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.AliquotaUnidade := EditAliquotaUnidadePis.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.ValorPrecoMaximo := EditValorPrecoMaximoPis.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.ValorPautaFiscal := EditValorPautaFiscalPis.Value;
      end;

      { Cofins }
      if (EditCodigoCstCofins.AsInteger > 0) and (EditCodigoApuracaoEfdCofins.AsInteger > 0) then
      begin
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.CstCofins := StringOfChar('0', 2 - Length(EditCodigoCstCofins.Text)) + EditCodigoCstCofins.Text;
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.EfdTabela435 := StringOfChar('0', 2 - Length(EditCodigoApuracaoEfdCofins.Text)) + EditCodigoApuracaoEfdCofins.Text;
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.ModalidadeBaseCalculo := IntToStr(ComboboxModalidadeBcCofins.ItemIndex);
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.PorcentoBaseCalculo := EditPorcentoBaseCalculoCofins.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.AliquotaPorcento := EditAliquotaPorcentoCofins.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.AliquotaUnidade := EditAliquotaUnidadeCofins.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.ValorPrecoMaximo := EditValorPrecoMaximoCofins.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.ValorPautaFiscal := EditValorPautaFiscalCofins.Value;
      end;

      { Ipi }
      if Trim(EditCstIpi.Text) <> '' then
      begin
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.CstIpi := StringOfChar('0', 2 - Length(EditCodigoCstIpi.Text)) + EditCodigoCstIpi.Text;
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.IdTipoReceitaDipi := EditIdTipoReceitaDipi.AsInteger;
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.ModalidadeBaseCalculo := IntToStr(ComboboxModalidadeBcIpi.ItemIndex);
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.PorcentoBaseCalculo := EditPorcentoBaseCalculoIpi.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.AliquotaPorcento := EditAliquotaPorcentoIpi.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.AliquotaUnidade := EditAliquotaUnidadeIpi.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.ValorPrecoMaximo := EditValorPrecoMaximoIpi.Value;
        TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.ValorPautaFiscal := EditValorPautaFiscalIpi.Value;
      end;

      { ICMS por UF }
      TController.PreencherObjectListFromCDS<TTributIcmsUfVO>(TTributConfiguraOfGtVO(ObjetoVO).ListaTributIcmsUfVO, CDSIcms);

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('TributConfiguraOfGtController.TTributConfiguraOfGtController', 'Insere', [TTributConfiguraOfGtVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TTributConfiguraOfGtVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('TributConfiguraOfGtController.TTributConfiguraOfGtController', 'Altera', [TTributConfiguraOfGtVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Controle de Grid'}
procedure TFTributacao.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TTributConfiguraOfGtVO(TController.BuscarObjeto('TributConfiguraOfGtController.TTributConfiguraOfGtController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin

    { Cabeçalho - Configura }
    EditIdOperacaoFiscal.AsInteger := TTributConfiguraOfGtVO(ObjetoVO).IdTributOperacaoFiscal;
    EditOperacaoFiscal.Text := TTributConfiguraOfGtVO(ObjetoVO).TributOperacaoFiscalVO.Descricao;
    EditIdGrupoTributario.AsInteger := TTributConfiguraOfGtVO(ObjetoVO).IdTributGrupoTributario;
    EditGrupoTributario.Text := TTributConfiguraOfGtVO(ObjetoVO).TributGrupoTributarioVO.Descricao;

    { Pis }
    EditCodigoCstPis.Text := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.CstPis;
    EditCstPis.Text := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.CstPisVO.Descricao;
    EditCodigoApuracaoEfdPis.Text := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.EfdTabela435;
    EditDescricaoCodigoApuracaoEfdPis.Text := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.CodigoApuracaoEfdVO.Descricao;
    ComboboxModalidadeBcPis.ItemIndex := AnsiIndexStr(TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.ModalidadeBaseCalculo, ['0', '1']);
    EditPorcentoBaseCalculoPis.Value := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.PorcentoBaseCalculo;
    EditAliquotaPorcentoPis.Value := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.AliquotaPorcento;
    EditAliquotaUnidadePis.Value := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.AliquotaUnidade;
    EditValorPrecoMaximoPis.Value := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.ValorPrecoMaximo;
    EditValorPautaFiscalPis.Value := TTributConfiguraOfGtVO(ObjetoVO).TributPisCodApuracaoVO.ValorPautaFiscal;

    { Cofins }
    EditCodigoCstCofins.Text := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.CstCofins;
    EditCstCofins.Text := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.CstCofinsVO.Descricao;
    EditCodigoApuracaoEfdCofins.Text := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.EfdTabela435;
    EditDescricaoCodigoApuracaoEfdCofins.Text := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.CodigoApuracaoEfdVO.Descricao;
    ComboboxModalidadeBcCofins.ItemIndex := AnsiIndexStr(TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.ModalidadeBaseCalculo, ['0', '1']);
    EditPorcentoBaseCalculoCofins.Value := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.PorcentoBaseCalculo;
    EditAliquotaPorcentoCofins.Value := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.AliquotaPorcento;
    EditAliquotaUnidadeCofins.Value := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.AliquotaUnidade;
    EditValorPrecoMaximoCofins.Value := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.ValorPrecoMaximo;
    EditValorPautaFiscalCofins.Value := TTributConfiguraOfGtVO(ObjetoVO).TributCofinsCodApuracaoVO.ValorPautaFiscal;

    { Ipi }
    EditCodigoCstIpi.Text := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.CstIpi;
    EditCstIpi.Text:= TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.CstIpiVO.Descricao;
    EditIdTipoReceitaDipi.AsInteger := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.IdTipoReceitaDipi;
    EditTipoReceitaDipi.Text := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.TipoReceitaDipiVO.Descricao;
    ComboboxModalidadeBcIpi.ItemIndex := AnsiIndexStr(TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.ModalidadeBaseCalculo, ['0', '1']);
    EditPorcentoBaseCalculoIpi.Value := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.PorcentoBaseCalculo;
    EditAliquotaPorcentoIpi.Value := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.AliquotaPorcento;
    EditAliquotaUnidadeIpi.Value := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.AliquotaUnidade;
    EditValorPrecoMaximoIpi.Value := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.ValorPrecoMaximo;
    EditValorPautaFiscalIpi.Value := TTributConfiguraOfGtVO(ObjetoVO).TributIpiDipiVO.ValorPautaFiscal;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TTributIcmsUfVO>(TTributConfiguraOfGtVO(ObjetoVO).ListaTributIcmsUfVO, True, True, CDSIcms);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TTributConfiguraOfGtVO(ObjetoVO).ListaTributIcmsUfVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFTributacao.GridIcmsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    if CDSIcms.IsEmpty then
    begin
      CDSIcms.Append;
      CDSIcms.Post;
    end;

    { UF }
    if GridIcms.SelectedIndex = 0 then
    begin
      try
        PopulaCamposTransientesLookup(TUfVO, TUfController);
        if CDSTransiente.RecordCount > 0 then
        begin
          CDSIcms.Edit;
          CDSIcmsUF_DESTINO.AsString := CDSTransiente.FieldByName('SIGLA').AsString;
          CDSIcms.Post;
        end;
      finally
        CDSTransiente.Close;
      end;
    end;

    { CFOP }
    if GridIcms.SelectedIndex = 1 then
    begin
      try
        PopulaCamposTransientesLookup(TCfopVO, TCfopController);
        if CDSTransiente.RecordCount > 0 then
        begin
          CDSIcms.Edit;
          CDSIcmsCFOP.AsString := CDSTransiente.FieldByName('CFOP').AsString;
          CDSIcms.Post;
        end;
      finally
        CDSTransiente.Close;
      end;
    end;

    { CSOSN }
    if GridIcms.SelectedIndex = 2 then
    begin
      try
        PopulaCamposTransientesLookup(TCsosnBVO, TCsosnBController);
        if CDSTransiente.RecordCount > 0 then
        begin
          CDSIcms.Edit;
          CDSIcmsCSOSN_B.AsString := CDSTransiente.FieldByName('CODIGO').AsString;
          CDSIcms.Post;
        end;
      finally
        CDSTransiente.Close;
      end;
    end;

    { CST }
    if GridIcms.SelectedIndex = 3 then
    begin
      try
        PopulaCamposTransientesLookup(TCstIcmsBVO, TCstIcmsBController);
        if CDSTransiente.RecordCount > 0 then
        begin
          CDSIcms.Edit;
          CDSIcmsCST_B.AsString := CDSTransiente.FieldByName('CODIGO').AsString;
          CDSIcms.Post;
        end;
      finally
        CDSTransiente.Close;
      end;
    end;

  end;
  //
  If Key = VK_RETURN then
    GridIcms.SelectedIndex := GridIcms.SelectedIndex + 1;
end;

procedure TFTributacao.CDSIcmsAfterEdit(DataSet: TDataSet);
begin
  CDSIcmsPERSISTE.AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFTributacao.ActionUfExecute(Sender: TObject);
var
  Filtro: String;
begin
  if Application.MessageBox('Deseja Importar as UFs? [os dados atuais serão excluídos]', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    CDSIcms.DisableControls;
    CDSIcms.EmptyDataSet;
    Filtro := 'ID > 0';
    PopulaCamposTransientes(Filtro, TUfVO, TUfController);
    CDSTransiente.First;
    while not CDSTransiente.eof do
    begin
      CDSIcms.Append;
      CDSIcmsUF_DESTINO.AsString := CDSTransiente.FieldByName('SIGLA').AsString;
      CDSIcms.Post;
      CDSTransiente.Next;
    end;
    CDSIcms.First;
    CDSIcms.EnableControls;
  end;
end;

procedure TFTributacao.ActionExcluirItemExecute(Sender: TObject);
begin
  if not CDSIcms.IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir o registro selecionado?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
    begin
      if StatusTela = stInserindo then
        CDSIcms.Delete
      else if StatusTela = stEditando then
      begin
        TController.ExecutarMetodo('TributConfiguraOfGtController.TTributConfiguraOfGtController', 'ExcluiDetalhe', [CDSIcms.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
        if TController.RetornoBoolean then
          CDSIcms.Delete;
      end;
    end;
  end
  else
    Application.MessageBox('Não existem dados para serem excluídos.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFTributacao.EditIdOperacaoFiscalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdOperacaoFiscal.Value <> 0 then
      Filtro := 'ID = ' + EditIdOperacaoFiscal.Text
    else
      Filtro := 'ID=0';

    try
      EditIdOperacaoFiscal.Clear;
      EditOperacaoFiscal.Clear;
      if not PopulaCamposTransientes(Filtro, TTributOperacaoFiscalVO, TTributOperacaoFiscalController) then
        PopulaCamposTransientesLookup(TTributOperacaoFiscalVO, TTributOperacaoFiscalController);

      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdOperacaoFiscal.Text := CDSTransiente.FieldByName('ID').AsString;
        EditOperacaoFiscal.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditIdOperacaoFiscal.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditIdGrupoTributarioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdGrupoTributario.Value <> 0 then
      Filtro := 'ID = ' + EditIdGrupoTributario.Text
    else
      Filtro := 'ID=0';

    try
      EditIdGrupoTributario.Clear;
      EditGrupoTributario.Clear;
      if not PopulaCamposTransientes(Filtro, TTributGrupoTributarioVO, TTributGrupoTributarioController) then
        PopulaCamposTransientesLookup(TTributGrupoTributarioVO, TTributGrupoTributarioController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdGrupoTributario.Text := CDSTransiente.FieldByName('ID').AsString;
        EditGrupoTributario.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditIdGrupoTributario.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditCodigoCstPisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditCodigoCstPis.Value <> 0 then
      Filtro := 'CODIGO = ' + QuotedStr(EditCodigoCstPis.Text)
    else
      Filtro := 'CODIGO=' + QuotedStr('00');

    try
      EditCodigoCstPis.Clear;
      EditCstPis.Clear;
      if not PopulaCamposTransientes(Filtro, TCstPisVO, TCstPisController) then
        PopulaCamposTransientesLookup(TCstPisVO, TCstPisController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditCodigoCstPis.Text := CDSTransiente.FieldByName('CODIGO').AsString;
        EditCstPis.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditCodigoCstPis.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditCodigoApuracaoEfdPisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditCodigoApuracaoEfdPis.Value <> 0 then
      Filtro := 'CODIGO = ' + QuotedStr(EditCodigoApuracaoEfdPis.Text)
    else
      Filtro := 'CODIGO=' + QuotedStr('00');

    try
      EditCodigoApuracaoEfdPis.Clear;
      EditDescricaoCodigoApuracaoEfdPis.Clear;
      if not PopulaCamposTransientes(Filtro, TEfdTabela435VO, TEfdTabela435Controller) then
        PopulaCamposTransientesLookup(TEfdTabela435VO, TEfdTabela435Controller);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditCodigoApuracaoEfdPis.Text := CDSTransiente.FieldByName('CODIGO').AsString;
        EditDescricaoCodigoApuracaoEfdPis.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditCodigoApuracaoEfdPis.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditCodigoCstCofinsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditCodigoCstCofins.Value <> 0 then
      Filtro := 'CODIGO = ' + QuotedStr(EditCodigoCstCofins.Text)
    else
      Filtro := 'CODIGO=' + QuotedStr('00');

    try
      EditCodigoCstCofins.Clear;
      EditCstCofins.Clear;
      if not PopulaCamposTransientes(Filtro, TCstCofinsVO, TCstCofinsController) then
        PopulaCamposTransientesLookup(TCstCofinsVO, TCstCofinsController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditCodigoCstCofins.Text := CDSTransiente.FieldByName('CODIGO').AsString;
        EditCstCofins.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditCodigoCstCofins.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditCodigoApuracaoEfdCofinsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditCodigoApuracaoEfdCofins.Value <> 0 then
      Filtro := 'CODIGO = ' + QuotedStr(EditCodigoApuracaoEfdCofins.Text)
    else
      Filtro := 'CODIGO=' + QuotedStr('00');

    try
      EditCodigoApuracaoEfdCofins.Clear;
      EditDescricaoCodigoApuracaoEfdCofins.Clear;
      if not PopulaCamposTransientes(Filtro, TEfdTabela435VO, TEfdTabela435Controller) then
        PopulaCamposTransientesLookup(TEfdTabela435VO, TEfdTabela435Controller);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditCodigoApuracaoEfdCofins.Text := CDSTransiente.FieldByName('CODIGO').AsString;
        EditDescricaoCodigoApuracaoEfdCofins.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditCodigoApuracaoEfdCofins.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditCodigoCstIpiKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditCodigoCstIpi.Value <> 0 then
      Filtro := 'CODIGO = ' + QuotedStr(EditCodigoCstIpi.Text)
    else
      Filtro := 'CODIGO=' + QuotedStr('00');

    try
      EditCodigoCstIpi.Clear;
      EditCstIpi.Clear;
      if not PopulaCamposTransientes(Filtro, TCstIpiVO, TCstIpiController) then
        PopulaCamposTransientesLookup(TCstIpiVO, TCstIpiController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditCodigoCstIpi.Text := CDSTransiente.FieldByName('CODIGO').AsString;
        EditCstIpi.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditCodigoCstIpi.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFTributacao.EditIdTipoReceitaDipiKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdTipoReceitaDipi.Value <> 0 then
      Filtro := 'ID = ' + EditIdTipoReceitaDipi.Text
    else
      Filtro := 'ID=0';

    try
      EditIdTipoReceitaDipi.Clear;
      EditTipoReceitaDipi.Clear;
      if not PopulaCamposTransientes(Filtro, TTipoReceitaDipiVO, TTipoReceitaDipiController) then
        PopulaCamposTransientesLookup(TTipoReceitaDipiVO, TTipoReceitaDipiController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdTipoReceitaDipi.Text := CDSTransiente.FieldByName('ID').AsString;
        EditTipoReceitaDipi.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditIdTipoReceitaDipi.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

end.
