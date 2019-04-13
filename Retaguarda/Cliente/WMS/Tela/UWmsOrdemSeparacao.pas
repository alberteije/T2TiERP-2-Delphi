{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Ordens de Separação do WMS

The MIT License

Copyright: Copyright (C) 2017 T2Ti.COM

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
t2ti.com@gmail.com

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UWmsOrdemSeparacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, DB, DBClient, Generics.Collections,
  WideStrings, DBXMySql, FMTBcd, Provider, SqlExpr, StrUtils, System.Actions,
  Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Controller, Biblioteca;

type
  TFWmsOrdemSeparacao = class(TFTelaCadastro)
    GroupBoxWmsOrdemSeparacaoDetalhe: TGroupBox;
    GridWmsOrdemSeparacaoDetalhe: TJvDBUltimGrid;
    CDSWmsOrdemSeparacaoDetalhe: TClientDataSet;
    DSWmsOrdemSeparacaoDetalhe: TDataSource;
    BevelEdits: TBevel;
    EditDataSolicitacao: TLabeledDateEdit;
    ActionToolBar1: TActionToolBar;
    ActionManager: TActionManager;
    ActionIncluirItem: TAction;
    ActionExcluirItem: TAction;
    ActionAtualizarTotais: TAction;
    ComboOrigem: TLabeledComboBox;
    EditDataLimite: TLabeledDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure CDSWmsOrdemSeparacaoDetalheAfterEdit(DataSet: TDataSet);
    procedure GridWmsOrdemSeparacaoDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionIncluirItemExecute(Sender: TObject);
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
  end;

var
  FWmsOrdemSeparacao: TFWmsOrdemSeparacao;

implementation

uses WmsOrdemSeparacaoCabController, WmsOrdemSeparacaoCabVO,
  WmsOrdemSeparacaoDetVO, ULookup,
  WmsAgendamentoVO, WmsAgendamentoController,
  ProdutoVO, ProdutoController, WmsOrdemSeparacaoDetController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFWmsOrdemSeparacao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TWmsOrdemSeparacaoCabVO;
  ObjetoController := TWmsOrdemSeparacaoCabController.Create;

  inherited;

  // Configura a Grid dos itens
  ConfiguraCDSFromVO(CDSWmsOrdemSeparacaoDetalhe, TWmsOrdemSeparacaoDetVO);
  ConfiguraGridFromVO(GridWmsOrdemSeparacaoDetalhe, TWmsOrdemSeparacaoDetVO);
end;

procedure TFWmsOrdemSeparacao.LimparCampos;
begin
  inherited;
  CDSWmsOrdemSeparacaoDetalhe.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFWmsOrdemSeparacao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataSolicitacao.SetFocus;
  end;
end;

function TFWmsOrdemSeparacao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDataSolicitacao.SetFocus;
  end;
end;

function TFWmsOrdemSeparacao.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('WmsOrdemSeparacaoCabController.TWmsOrdemSeparacaoCabController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('WmsOrdemSeparacaoCabController.TWmsOrdemSeparacaoCabController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFWmsOrdemSeparacao.DoSalvar: Boolean;
var
  WmsOrdemSeparacaoDetalhe: TWmsOrdemSeparacaoDetVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TWmsOrdemSeparacaoCabVO.Create;

      TWmsOrdemSeparacaoCabVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TWmsOrdemSeparacaoCabVO(ObjetoVO).Origem := Copy(ComboOrigem.Text, 1, 1);
      TWmsOrdemSeparacaoCabVO(ObjetoVO).DataSolicitacao := EditDataSolicitacao.Date;
      TWmsOrdemSeparacaoCabVO(ObjetoVO).DataLimite := EditDataLimite.Date;

      // Itens
      TController.PreencherObjectListFromCDS<TWmsOrdemSeparacaoDetVO>(TWmsOrdemSeparacaoCabVO(ObjetoVO).ListaWmsOrdemSeparacaoDetVO, CDSWmsOrdemSeparacaoDetalhe);

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('WmsOrdemSeparacaoCabController.TWmsOrdemSeparacaoCabController', 'Insere', [TWmsOrdemSeparacaoCabVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TWmsOrdemSeparacaoCabVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('WmsOrdemSeparacaoCabController.TWmsOrdemSeparacaoCabController', 'Altera', [TWmsOrdemSeparacaoCabVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFWmsOrdemSeparacao.GridWmsOrdemSeparacaoDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    ActionIncluirItem.Execute;
  end;
  If Key = VK_RETURN then
    EditDataSolicitacao.SetFocus;
end;

procedure TFWmsOrdemSeparacao.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TWmsOrdemSeparacaoCabVO(TController.BuscarObjeto('WmsOrdemSeparacaoCabController.TWmsOrdemSeparacaoCabController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDataSolicitacao.Date := TWmsOrdemSeparacaoCabVO(ObjetoVO).DataSolicitacao;
    EditDataLimite.Date := TWmsOrdemSeparacaoCabVO(ObjetoVO).DataLimite;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TWmsOrdemSeparacaoDetVO>(TWmsOrdemSeparacaoCabVO(ObjetoVO).ListaWmsOrdemSeparacaoDetVO, True, True, CDSWmsOrdemSeparacaoDetalhe);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TWmsOrdemSeparacaoCabVO(ObjetoVO).ListaWmsOrdemSeparacaoDetVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFWmsOrdemSeparacao.CDSWmsOrdemSeparacaoDetalheAfterEdit(DataSet: TDataSet);
begin
  CDSWmsOrdemSeparacaoDetalhe.FieldByName('PERSISTE').AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFWmsOrdemSeparacao.ActionExcluirItemExecute(Sender: TObject);
begin
  if CDSWmsOrdemSeparacaoDetalhe.IsEmpty then
    Application.MessageBox('Não existe registro selecionado.', 'Erro', MB_OK + MB_ICONERROR)
  else
  begin
    if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if StatusTela = stInserindo then
        CDSWmsOrdemSeparacaoDetalhe.Delete
      else if StatusTela = stEditando then
      begin
        if TWmsOrdemSeparacaoDetController.Exclui(CDSWmsOrdemSeparacaoDetalhe.FieldByName('ID').AsInteger) then
          CDSWmsOrdemSeparacaoDetalhe.Delete;
      end;
    end;
  end;
end;

procedure TFWmsOrdemSeparacao.ActionIncluirItemExecute(Sender: TObject);
begin
  /// EXERCICIO
  ///  Como você vai proceder para "desarmazenar" o item?

  try
    PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSWmsOrdemSeparacaoDetalhe.Append;
      CDSWmsOrdemSeparacaoDetalhe.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
//      CDSWmsOrdemSeparacaoDetalhe.FieldByName('PRODUTO.NOME').AsString := CDSTransiente.FieldByName('NOME').AsString;
    end;
  finally
    CDSTransiente.Close;
  end;
end;
{$ENDREGION}

end.
