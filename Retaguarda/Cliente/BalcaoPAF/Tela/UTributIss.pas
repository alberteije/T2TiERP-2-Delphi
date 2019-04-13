{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Tributação - ISS

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
@version 1.0
******************************************************************************* }
unit UTributIss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Mask, JvExMask, JvToolEdit,
  JvCombobox, LabeledCtrls, DBCtrls, LabeledDBCtrls, DB, DBClient, StrUtils,
  Math, JSonVO, Generics.Collections, Atributos, Constantes, CheckLst,
  JvExCheckLst, JvCheckListBox, JvBaseEdits, OleCtnrs, WideStrings, FMTBcd,
  Provider, SqlExpr, ActnList, ToolWin, ActnMan, ActnCtrls, ShellApi,
  PlatformDefaultStyleActnCtrls, Controller;

type
  [TFormDescription(TConstantes.MODULO_ADMINISTRATIVO, 'Tributação - ISS')]

  TFTributIss = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    BevelEdits: TBevel;
    PageControlDadosTributIss: TPageControl;
    EditIdOperacaoFiscal: TLabeledCalcEdit;
    EditOperacaoFiscal: TLabeledEdit;
    tsIss: TTabSheet;
    PanelIss: TPanel;
    EditPorcentoBaseCalculoIss: TLabeledCalcEdit;
    ComboboxModalidadeBcIss: TLabeledComboBox;
    EditAliquotaPorcentoIss: TLabeledCalcEdit;
    EditAliquotaUnidadeIss: TLabeledCalcEdit;
    EditValorPrecoMaximoIss: TLabeledCalcEdit;
    EditValorPautaFiscalIss: TLabeledCalcEdit;
    EditItemListaServico: TLabeledCalcEdit;
    ComboboxCodigoTributacao: TLabeledComboBox;
    procedure FormCreate(Sender: TObject);
    procedure EditIdOperacaoFiscalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FTributIss: TFTributIss;
  FormEditor: TForm;

implementation

uses UDataModule, ULookup, TributIssVO, TributIssController, TributOperacaoFiscalVO,
  TributOperacaoFiscalController;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFTributIss.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTributIssVO;
  ObjetoController := TTributIssController.Create;

  inherited;
end;

procedure TFTributIss.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;
  PageControlDadosTributIss.ActivePageIndex := 0;

  if StatusTela = stNavegandoEdits then
  begin
    PanelIss.Enabled := False;
  end
  else
  begin
    PanelIss.Enabled := True;
  end;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFTributIss.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

function TFTributIss.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

function TFTributIss.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('TributIssController.TTributIssController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('TributIssController.TTributIssController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFTributIss.DoSalvar: Boolean;
begin
  if EditIdOperacaoFiscal.AsInteger <= 0 then
  begin
    Application.MessageBox('Operação Fiscal não pode ficar em branco.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditIdOperacaoFiscal.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TTributIssVO.Create;

      TTributIssVO(ObjetoVO).IdTributOperacaoFiscal := EditIdOperacaoFiscal.AsInteger;
      TTributIssVO(ObjetoVO).TributOperacaoFiscalDescricao := EditOperacaoFiscal.Text;
      TTributIssVO(ObjetoVO).ModalidadeBaseCalculo := Copy(ComboboxModalidadeBcIss.Text, 1, 1);
      TTributIssVO(ObjetoVO).PorcentoBaseCalculo := EditPorcentoBaseCalculoIss.Value;
      TTributIssVO(ObjetoVO).AliquotaPorcento := EditAliquotaPorcentoIss.Value;
      TTributIssVO(ObjetoVO).AliquotaUnidade := EditAliquotaUnidadeIss.Value;
      TTributIssVO(ObjetoVO).ValorPrecoMaximo := EditValorPrecoMaximoIss.Value;
      TTributIssVO(ObjetoVO).ValorPautaFiscal := EditValorPautaFiscalIss.Value;
      TTributIssVO(ObjetoVO).ItemListaServico := EditItemListaServico.AsInteger;
      TTributIssVO(ObjetoVO).CodigoTributacao := Copy(ComboboxCodigoTributacao.Text, 1, 1);

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('TributIssController.TTributIssController', 'Insere', [TTributIssVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TTributIssVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('TributIssController.TTributIssController', 'Altera', [TTributIssVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFTributIss.EditIdOperacaoFiscalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFTributIss.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TTributIssVO(TController.BuscarObjeto('TributIssController.TTributIssController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdOperacaoFiscal.AsInteger := TTributIssVO(ObjetoVO).IdTributOperacaoFiscal;
    EditOperacaoFiscal.Text := TTributIssVO(ObjetoVO).TributOperacaoFiscalVO.Descricao;
    ComboboxModalidadeBcIss.ItemIndex := AnsiIndexStr(TTributIssVO(ObjetoVO).ModalidadeBaseCalculo, ['0', '9']);
    EditPorcentoBaseCalculoIss.Value := TTributIssVO(ObjetoVO).PorcentoBaseCalculo;
    EditAliquotaPorcentoIss.Value := TTributIssVO(ObjetoVO).AliquotaPorcento;
    EditAliquotaUnidadeIss.Value := TTributIssVO(ObjetoVO).AliquotaUnidade;
    EditValorPrecoMaximoIss.Value := TTributIssVO(ObjetoVO).ValorPrecoMaximo;
    EditValorPautaFiscalIss.Value := TTributIssVO(ObjetoVO).ValorPautaFiscal;
    EditItemListaServico.AsInteger := TTributIssVO(ObjetoVO).ItemListaServico;
    ComboboxCodigoTributacao.ItemIndex := AnsiIndexStr(TTributIssVO(ObjetoVO).CodigoTributacao, ['N', 'R', 'S', 'I']);

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
