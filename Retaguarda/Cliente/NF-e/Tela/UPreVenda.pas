{ *******************************************************************************
Title: T2Ti ERP
Description: Janela da Pre Venda

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
t2ti.com@gmail.com

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UPreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, DB, DBClient, Generics.Collections,
  WideStrings, DBXMySql, FMTBcd, Provider, SqlExpr, StrUtils, System.Actions,
  Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Biblioteca, Controller, COMObj;

type
  [TFormDescription(TConstantes.MODULO_BALCAO, 'PreVenda')]

  TFPreVenda = class(TFTelaCadastro)
    GroupBoxPreVendaDetalhe: TGroupBox;
    GridDetalhe: TJvDBUltimGrid;
    CDSDetalhe: TClientDataSet;
    DSDetalhe: TDataSource;
    BevelEdits: TBevel;
    EditIdCliente: TLabeledCalcEdit;
    EditNomeCliente: TLabeledEdit;
    EditCpfCnpjCliente: TLabeledEdit;
    EditValorDesconto: TLabeledCalcEdit;
    EditValorSubTotal: TLabeledCalcEdit;
    EditValorTotal: TLabeledCalcEdit;
    EditTaxadesconto: TLabeledCalcEdit;
    ActionToolBar1: TActionToolBar;
    ActionManager: TActionManager;
    ActionIncluirItem: TAction;
    ActionExcluirItem: TAction;
    ActionAtualizarTotais: TAction;
    procedure FormCreate(Sender: TObject);
    procedure GridDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdClienteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionIncluirItemExecute(Sender: TObject);
    procedure ControlaPersistencia(pDataSet: TDataSet);
    procedure GridDetalheDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure ActionAtualizarTotaisExecute(Sender: TObject);
    procedure CDSDetalheBeforePost(DataSet: TDataSet);
    procedure BotaoImprimirClick(Sender: TObject);
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
  FPreVenda: TFPreVenda;
  SeqItem: Integer;

implementation

uses PreVendaController, PreVendaCabecalhoVO, PreVendaDetalheVO, ULookup, ColaboradorVO,
  ColaboradorController, ProdutoVO, ProdutoController, ViewPessoaClienteVO,
  ViewPessoaClienteController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFPreVenda.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPreVendaCabecalhoVO;
  ObjetoController := TPreVendaController.Create;

  inherited;

  // Configura a Grid dos itens
  ConfiguraCDSFromVO(CDSDetalhe, TPreVendaDetalheVO);
  ConfiguraGridFromVO(GridDetalhe, TPreVendaDetalheVO);
end;

procedure TFPreVenda.LimparCampos;
begin
  inherited;
  SeqItem := 0;
  CDSDetalhe.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFPreVenda.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdCliente.SetFocus;
  end;
end;

function TFPreVenda.DoEditar: Boolean;
begin
  if CDSGrid.FieldByName('SITUACAO').AsString <> 'P' then
  begin
    Application.MessageBox('A Pre Venda selecionada não pode ser alterada.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit(False);
  end;

  Result := inherited DoEditar;

  if Result then
  begin
    SeqItem := CDSDetalhe.RecordCount;
    EditIdCliente.SetFocus;
  end;
end;

function TFPreVenda.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('PreVendaController.TPreVendaController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('PreVendaController.TPreVendaController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFPreVenda.DoSalvar: Boolean;
var
  PreVendaDetalhe: TPreVendaDetalheVO;
begin
  if EditNomeCliente.Text = '' then
  begin
    Application.MessageBox('Informe o nome do cliente.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditNomeCliente.SetFocus;
    Exit(False);
  end;
  if EditCpfCnpjCliente.Text = '' then
  begin
    Application.MessageBox('Informe o CPF/CNPJ do cliente.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditCpfCnpjCliente.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TPreVendaCabecalhoVO.Create;

      ActionAtualizarTotais.Execute;

      TPreVendaCabecalhoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      if EditIdCliente.Value <> 0 then
        TPreVendaCabecalhoVO(ObjetoVO).IdPessoa := EditIdCliente.AsInteger;
      TPreVendaCabecalhoVO(ObjetoVO).NomeDestinatario := EditNomeCliente.Text;
      TPreVendaCabecalhoVO(ObjetoVO).CpfCnpjDestinatario := EditCpfCnpjCliente.Text;
      TPreVendaCabecalhoVO(ObjetoVO).Situacao := 'P';
      TPreVendaCabecalhoVO(ObjetoVO).TaxaDesconto := EditTaxaDesconto.Value;
      TPreVendaCabecalhoVO(ObjetoVO).Desconto := EditValorDesconto.Value;
      TPreVendaCabecalhoVO(ObjetoVO).SubTotal := EditValorSubTotal.Value;
      TPreVendaCabecalhoVO(ObjetoVO).Valor := EditValorTotal.Value;

      // Detalhes
      TController.PreencherObjectListFromCDS<TPreVendaDetalheVO>(TPreVendaCabecalhoVO(ObjetoVO).ListaPreVendaDetalheVO, CDSDetalhe);

      if StatusTela = stInserindo then
      begin
        TPreVendaCabecalhoVO(ObjetoVO).DataEmissao := Date;
        TPreVendaCabecalhoVO(ObjetoVO).HoraEmissao := FormatDateTime('hh:mm:ss', Now);
        TController.ExecutarMetodo('PreVendaController.TPreVendaController', 'Insere', [TPreVendaCabecalhoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TPreVendaCabecalhoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('PreVendaController.TPreVendaController', 'Altera', [TPreVendaCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFPreVenda.EditIdClienteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F1 then
  begin
    if EditIdCliente.Value <> 0 then
      Filtro := 'ID = ' + EditIdCliente.Text
    else
      Filtro := 'ID=0';

    try
      EditIdCliente.Clear;
      EditNomeCliente.Clear;
      EditCpfCnpjCliente.Clear;
      if not PopulaCamposTransientes(Filtro, TViewPessoaClienteVO, TViewPessoaClienteController) then
        PopulaCamposTransientesLookup(TViewPessoaClienteVO, TViewPessoaClienteController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdCliente.Text := CDSTransiente.FieldByName('ID').AsString;
        EditCpfCnpjCliente.Text := CDSTransiente.FieldByName('CPF_CNPJ').AsString;
        EditNomeCliente.Text := CDSTransiente.FieldByName('NOME').AsString;
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
{$ENDREGION}

{$REGION 'Actions'}
procedure TFPreVenda.ActionIncluirItemExecute(Sender: TObject);
begin
  try
    PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
    if CDSTransiente.RecordCount > 0 then
    begin
        inc(SeqItem);
        CDSDetalhe.Append;
        CDSDetalhe.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
        CDSDetalhe.FieldByName('ID_PRE_VENDA_CABECALHO').AsInteger := 0;
        CDSDetalhe.FieldByName('ITEM').AsInteger := SeqItem;
        CDSDetalhe.FieldByName('QUANTIDADE').AsExtended := 1;
        CDSDetalhe.FieldByName('VALOR_UNITARIO').AsExtended := CDSTransiente.FieldByName('VALOR_VENDA').AsExtended;
        CDSDetalhe.FieldByName('VALOR_TOTAL').AsExtended := CDSDetalhe.FieldByName('VALOR_UNITARIO').AsExtended * CDSDetalhe.FieldByName('QUANTIDADE').AsExtended;
        CDSDetalhe.FieldByName('CANCELADO').AsString := 'N';
        CDSDetalhe.FieldByName('PERSISTE').AsString := 'S';
        CDSDetalhe.FieldByName('GTIN_PRODUTO').AsString := CDSTransiente.FieldByName('GTIN').AsString;
        CDSDetalhe.FieldByName('NOME_PRODUTO').AsString := CDSTransiente.FieldByName('NOME').AsString;
        CDSDetalhe.FieldByName('UNIDADE_PRODUTO').AsString := CDSTransiente.FieldByName('UNIDADE_PRODUTO.SIGLA').AsString;
        CDSDetalhe.Post;
    end;
  finally
    CDSTransiente.Close;
  end;
end;

procedure TFPreVenda.ActionAtualizarTotaisExecute(Sender: TObject);
var
  TotalProdutos: Double;
begin
  TotalProdutos := 0;

  CDSDetalhe.DisableControls;
  CDSDetalhe.First;
  while not CDSDetalhe.Eof do
  begin
    TotalProdutos := TotalProdutos + CDSDetalhe.FieldByName('VALOR_TOTAL').AsExtended;
    CDSDetalhe.Next;
  end;
  CDSDetalhe.First;
  CDSDetalhe.EnableControls;
  //
  EditValorSubTotal.Value := TotalProdutos;
  if EditTaxadesconto.Value > 0 then
  begin
    EditValorDesconto.Value := EditValorSubTotal.Value * (EditTaxadesconto.Value / 100);
  end;
  EditValorTotal.Value := EditValorSubTotal.Value - EditValorDesconto.Value;
end;

procedure TFPreVenda.ActionExcluirItemExecute(Sender: TObject);
begin
  CDSDetalhe.Edit;
  CDSDetalhe.FieldByName('CANCELADO').AsString := 'S';
  CDSDetalhe.Post;
end;
{$EndREGION 'Actions'}

{$REGION 'Controle de Grid'}
procedure TFPreVenda.GridDetalheDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if CDSDetalhe.FieldByName('CANCELADO').AsString = 'S' then
    GridDetalhe.Canvas.Brush.Color := $00C6C6FF;
  GridDetalhe.DefaultDrawDataCell(Rect, GridDetalhe.columns[datacol].field, State);
end;

procedure TFPreVenda.GridDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    ActionIncluirItem.Execute;
  end;
end;

procedure TFPreVenda.CDSDetalheBeforePost(DataSet: TDataSet);
var
  TotalItem: Double;
begin
  TotalItem := CDSDetalhe.FieldByName('QUANTIDADE').AsExtended * CDSDetalhe.FieldByName('VALOR_UNITARIO').AsExtended;
  TotalItem := ArredondaTruncaValor('A', TotalItem, 2);
  CDSDetalhe.FieldByName('VALOR_TOTAL').AsExtended := TotalItem;
  //
  if CDSDetalhe.FieldByName('ITEM').AsString = '' then
    CDSDetalhe.Cancel;
end;

procedure TFPreVenda.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TPreVendaCabecalhoVO(TController.BuscarObjeto('PreVendaController.TPreVendaController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdCliente.AsInteger := TPreVendaCabecalhoVO(ObjetoVO).IdPessoa;
    EditNomeCliente.Text := TPreVendaCabecalhoVO(ObjetoVO).NomeDestinatario;
    EditCpfCnpjCliente.Text := TPreVendaCabecalhoVO(ObjetoVO).CpfCnpjDestinatario;
    EditTaxaDesconto.Value := TPreVendaCabecalhoVO(ObjetoVO).TaxaDesconto;
    EditValorDesconto.Value := TPreVendaCabecalhoVO(ObjetoVO).Desconto;
    EditValorSubTotal.Value := TPreVendaCabecalhoVO(ObjetoVO).SubTotal;
    EditValorTotal.Value := TPreVendaCabecalhoVO(ObjetoVO).Valor;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TPreVendaDetalheVO>(TPreVendaCabecalhoVO(ObjetoVO).ListaPreVendaDetalheVO, True, True, CDSDetalhe);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TPreVendaCabecalhoVO(ObjetoVO).ListaPreVendaDetalheVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFPreVenda.ControlaPersistencia(pDataSet: TDataSet);
begin
  pDataSet.FieldByName('PERSISTE').AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Impressão'}
procedure TFPreVenda.BotaoImprimirClick(Sender: TObject);
begin
  Application.MessageBox('Não é permitida a impressão da Pre Venda.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;
{$EndREGION 'Impressão'}


end.
