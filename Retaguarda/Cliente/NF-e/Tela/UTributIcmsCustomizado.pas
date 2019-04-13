{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Tributação - ICMS Customizado

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
unit UTributIcmsCustomizado;

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
  [TFormDescription(TConstantes.MODULO_ADMINISTRATIVO, 'ICMS Customizado')]

  TFTributIcmsCustomizado = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    PageControlDadosTributIcmsCustomizado: TPageControl;
    tsIcms: TTabSheet;
    PanelIcms: TPanel;
    GridIcms: TJvDBUltimGrid;
    CDSIcms: TClientDataSet;
    DSIcms: TDataSource;
    ActionManager1: TActionManager;
    ActionUf: TAction;
    CDSIcmsUF_DESTINO: TStringField;
    CDSIcmsCFOP: TIntegerField;
    CDSIcmsCSOSN_B: TStringField;
    CDSIcmsCST_B: TStringField;
    CDSIcmsPERSISTE: TStringField;
    ActionToolBar3: TActionToolBar;
    CDSIcmsID: TIntegerField;
    ActionExcluirItem: TAction;
    CDSIcmsMODALIDADE_BC: TStringField;
    CDSIcmsMODALIDADE_BC_ST: TStringField;
    EditDescricao: TLabeledEdit;
    BevelEdits: TBevel;
    CDSIcmsID_TRIBUT_ICMS_CUSTOM_CAB: TIntegerField;
    ComboboxOrigemMercadoria: TLabeledComboBox;
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
  FTributIcmsCustomizado: TFTributIcmsCustomizado;
  FormEditor: TForm;

implementation

uses
    TributIcmsCustomCabVO, TributIcmsCustomDetVO, UfVO, CfopVO, CsosnBVO, CstIcmsBVO,
    TributIcmsCustomCabController, UfController, CfopController, CsosnBController,
    CstIcmsBController;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFTributIcmsCustomizado.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTributIcmsCustomCabVO;
  ObjetoController := TTributIcmsCustomCabController.Create;

  inherited;
end;

procedure TFTributIcmsCustomizado.LimparCampos;
begin
  inherited;
  CDSIcms.EmptyDataSet;
end;

procedure TFTributIcmsCustomizado.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;
  PageControlDadosTributIcmsCustomizado.ActivePageIndex := 0;

  if StatusTela = stNavegandoEdits then
  begin
    GridIcms.ReadOnly := True;
  end
  else
  begin
    GridIcms.ReadOnly := False;
  end;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFTributIcmsCustomizado.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditDescricao.SetFocus;
  end;
end;

function TFTributIcmsCustomizado.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditDescricao.SetFocus;
  end;
end;

function TFTributIcmsCustomizado.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('TributIcmsCustomCabController.TTributIcmsCustomCabController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('TributIcmsCustomCabController.TTributIcmsCustomCabController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFTributIcmsCustomizado.DoSalvar: Boolean;
var
  TributIcmsCustomDet: TTributIcmsCustomDetVO;
begin
  if Trim(EditDescricao.Text) = '' then
  begin
    Application.MessageBox('Descrição não podem ficar em branco.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditDescricao.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TTributIcmsCustomCabVO.Create;

      { Cabeçalho }
      TTributIcmsCustomCabVO(ObjetoVO).Descricao := EditDescricao.Text;
      TTributIcmsCustomCabVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TTributIcmsCustomCabVO(ObjetoVO).OrigemMercadoria := Copy(ComboboxOrigemMercadoria.Text, 1, 1);

      { Detalhe }
      TController.PreencherObjectListFromCDS<TTributIcmsCustomDetVO>(TTributIcmsCustomCabVO(ObjetoVO).ListaTributIcmsCustomDetVO, CDSIcms);

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('TributIcmsCustomCabController.TTributIcmsCustomCabController', 'Insere', [TTributIcmsCustomCabVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TTributIcmsCustomCabVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('TributIcmsCustomCabController.TTributIcmsCustomCabController', 'Altera', [TTributIcmsCustomCabVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFTributIcmsCustomizado.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TTributIcmsCustomCabVO(TController.BuscarObjeto('TributIcmsCustomCabController.TTributIcmsCustomCabController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
 end;

  if Assigned(ObjetoVO) then
  begin
    { Cabeçalho }
    EditDescricao.Text := TTributIcmsCustomCabVO(ObjetoVO).Descricao;
    ComboboxOrigemMercadoria.ItemIndex := AnsiIndexStr(TTributIcmsCustomCabVO(ObjetoVO).OrigemMercadoria, ['0', '1', '2']);

    { Detalhe }
    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TTributIcmsCustomDetVO>(TTributIcmsCustomCabVO(ObjetoVO).ListaTributIcmsCustomDetVO, True, True, CDSIcms);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TTributIcmsCustomCabVO(ObjetoVO).ListaTributIcmsCustomDetVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFTributIcmsCustomizado.GridIcmsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFTributIcmsCustomizado.CDSIcmsAfterEdit(DataSet: TDataSet);
begin
  CDSIcmsPERSISTE.AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFTributIcmsCustomizado.ActionUfExecute(Sender: TObject);
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

procedure TFTributIcmsCustomizado.ActionExcluirItemExecute(Sender: TObject);
begin
  if not CDSIcms.IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir o registro selecionado?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
    begin
      if StatusTela = stInserindo then
        CDSIcms.Delete
      else if StatusTela = stEditando then
      begin
        TController.ExecutarMetodo('TributIcmsCustomCabController.TTributIcmsCustomCabController', 'ExcluiDetalhe', [CDSIcms.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
        if TController.RetornoBoolean then
          CDSIcms.Delete;
      end;
    end;
  end
  else
    Application.MessageBox('Não existem dados para serem excluídos.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;
{$ENDREGION}

end.
