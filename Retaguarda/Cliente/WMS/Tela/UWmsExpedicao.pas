{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Expedição do WMS

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
unit UWmsExpedicao;

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
  TFWmsExpedicao = class(TFTelaCadastro)
    GroupBoxWmsRecebimentoDetalhe: TGroupBox;
    BevelEdits: TBevel;
    ActionToolBar1: TActionToolBar;
    ActionManager: TActionManager;
    ActionIncluirItem: TAction;
    ActionExcluirItem: TAction;
    ActionExpedir: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GridWmsOrdemSeparacaoDetalhe: TJvDBUltimGrid;
    GridExpedicao: TJvDBUltimGrid;
    CDSWmsExpedicao: TClientDataSet;
    DSWmsExpedicao: TDataSource;
    EditDataSolicitacao: TLabeledDateEdit;
    EditDataLimite: TLabeledDateEdit;
    ComboOrigem: TLabeledComboBox;
    CDSWmsOrdemSeparacaoDetalhe: TClientDataSet;
    DSWmsOrdemSeparacaoDetalhe: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ActionIncluirItemExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure ActionExpedirExecute(Sender: TObject);
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
  FWmsExpedicao: TFWmsExpedicao;

implementation

uses WmsOrdemSeparacaoCabController, WmsOrdemSeparacaoCabVO,
  WmsOrdemSeparacaoDetVO, ULookup, WmsCaixaVO, WmsCaixaController,
  WmsAgendamentoVO, WmsAgendamentoController, WmsExpedicaoVO, WmsExpedicaoController,
  ProdutoVO, ProdutoController, WmsOrdemSeparacaoDetController,
  WmsArmazenamentoVO, WmsArmazenamentoController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFWmsExpedicao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TWmsOrdemSeparacaoCabVO;
  ObjetoController := TWmsOrdemSeparacaoCabController.Create;

  inherited;

  // Configura a Grid dos itens
  ConfiguraCDSFromVO(CDSWmsOrdemSeparacaoDetalhe, TWmsOrdemSeparacaoDetVO);
  ConfiguraGridFromVO(GridWmsOrdemSeparacaoDetalhe, TWmsOrdemSeparacaoDetVO);

  ConfiguraCDSFromVO(CDSWmsExpedicao, TWmsExpedicaoVO);
  ConfiguraGridFromVO(GridExpedicao, TWmsExpedicaoVO);
end;

procedure TFWmsExpedicao.LimparCampos;
begin
  inherited;
  CDSWmsOrdemSeparacaoDetalhe.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFWmsExpedicao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataSolicitacao.SetFocus;
  end;
end;

function TFWmsExpedicao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDataSolicitacao.SetFocus;
  end;
end;

function TFWmsExpedicao.DoExcluir: Boolean;
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

function TFWmsExpedicao.DoSalvar: Boolean;
var
  WmsOrdemSeparacaoDet: TWmsOrdemSeparacaoDetVO;
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
procedure TFWmsExpedicao.GridParaEdits;
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
{$ENDREGION}

{$REGION 'Actions'}
procedure TFWmsExpedicao.ActionExpedirExecute(Sender: TObject);
begin
  /// EXERCICIO
  ///  Será o momento certo de realizar o "desarmazenamento"?
  ///
  ///  E o estoque? Deve-se dar baixa no estoque nesse momento?
  ///  Imagine um mercado como o "Atacadão" ou "Açaí Atacadista"
  ///  Os itens saem do armazem e vão para a loja, que se encontra no mesmo
  ///  prédio ou até mesmo em outro prédio.

  try
    PopulaCamposTransientesLookup(TWmsArmazenamentoVO, TWmsArmazenamentoController);
    if CDSTransiente.RecordCount > 0 then
    begin
      PageControl1.ActivePageIndex := 1;
      CDSWmsExpedicao.Append;
      CDSWmsExpedicao.FieldByName('ID_WMS_ARMAZENAMENTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
      CDSWmsExpedicao.FieldByName('ID_WMS_ORDEM_SEPARACAO_DET').AsInteger := CDSWmsOrdemSeparacaoDetalhe.FieldByName('ID').AsInteger;
      CDSWmsExpedicao.FieldByName('DATA_SAIDA').AsDateTime := Now;
      CDSWmsExpedicao.FieldByName('QUANTIDADE').AsInteger := CDSWmsOrdemSeparacaoDetalhe.FieldByName('QUANTIDADE').AsInteger;
    end;
  finally
    CDSTransiente.Close;
  end;

end;

procedure TFWmsExpedicao.ActionExcluirItemExecute(Sender: TObject);
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

procedure TFWmsExpedicao.ActionIncluirItemExecute(Sender: TObject);
begin
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
