{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Instruções da Ordem de Produção

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

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UPcpOp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UTelaCadastro, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, LabeledCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, Vcl.ComCtrls, JvToolEdit, Vcl.Mask, JvExMask,
  JvBaseEdits, System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls, Data.DB, Datasnap.DBClient, System.Generics.Collections,
  UDataModule;

type
  TFPcpOp = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    EditCustoTotalPrevisto: TLabeledCalcEdit;
    EditInicio: TLabeledDateEdit;
    EditPrevisaoEntrega: TLabeledDateEdit;
    EditTermino: TLabeledDateEdit;
    EditCustoTotalRealizado: TLabeledCalcEdit;
    EditPercentualVenda: TLabeledCalcEdit;
    EditPercentualEstoque: TLabeledCalcEdit;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    GridItens: TJvDBUltimGrid;
    DSItens: TDataSource;
    CDSItens: TClientDataSet;
    Panel2: TPanel;
    CDSItensID: TIntegerField;
    CDSItensID_PCP_OP_CABECALHO: TIntegerField;
    CDSItensID_PRODUTO: TIntegerField;
    CDSItensQUANTIDADE_PRODUZIR: TFloatField;
    CDSItensQUANTIDADE_PRODUZIDA: TFloatField;
    CDSItensQUANTIDADE_ENTREGUE: TFloatField;
    CDSItensCUSTO_PREVISTO: TFloatField;
    CDSItensCUSTO_REALIZADO: TFloatField;
    CDSItensPERSISTE: TStringField;
    CDSInstrucoes: TClientDataSet;
    DSInstrucoes: TDataSource;
    CDSInstrucoesID: TIntegerField;
    CDSInstrucoesPERSISTE: TStringField;
    CDSItensPRODUTONOME: TStringField;
    CDSInstrucoesID_PCP_OP_CABECALHO: TIntegerField;
    CDSInstrucoesID_PCP_INSTRUCAO: TIntegerField;
    CDSInstrucoesPCP_INSTRUCAOCODIGO: TStringField;
    CDSInstrucoesPCP_INSTRUCAODESCRICAO: TStringField;
    ActionManager: TActionManager;
    ActionAdicionarItem: TAction;
    ActionRemoverItem: TAction;
    ActionRemoverServico: TAction;
    ActionInstrucao: TAction;
    ActionRemoverInstrucao: TAction;
    JvDBUltimGrid2: TJvDBUltimGrid;
    ActionToolBarItens: TActionToolBar;
    ActionToolBarInstrucoes: TActionToolBar;
    CDSServicos: TClientDataSet;
    DSServicos: TDataSource;
    CDSServicosID: TIntegerField;
    CDSServicosID_PCP_OP_DETALHE: TIntegerField;
    CDSServicosINICIO_PREVISTO: TDateTimeField;
    CDSServicosHORAS_PREVISTO: TIntegerField;
    CDSServicosMINUTOS_PREVISTO: TIntegerField;
    CDSServicosSEGUNDOS_PREVISTO: TIntegerField;
    CDSServicosTERMINO_PREVISTO: TDateTimeField;
    CDSServicosINICIO_REALIZADO: TDateTimeField;
    CDSServicosHORAS_REALIZADO: TIntegerField;
    CDSServicosMINUTOS_REALIZADO: TIntegerField;
    CDSServicosSEGUNDOS_REALIZADO: TIntegerField;
    CDSServicosTERMINO_REALIZADO: TDateTimeField;
    CDSServicosCUSTOS_PREVISTO: TFloatField;
    CDSServicosCUSTO_REALIZADO: TFloatField;
    CDSServicosPERSISTE: TStringField;
    GridServicos: TJvDBUltimGrid;
    Panel3: TPanel;
    GridColaborador: TJvDBUltimGrid;
    Panel4: TPanel;
    GridEquipamentos: TJvDBUltimGrid;
    ActionToolBarColaboradores: TActionToolBar;
    ActionToolBarEquipamentos: TActionToolBar;
    ActionToolBarServicos: TActionToolBar;
    ActionAdicionarColaborador: TAction;
    ActionAdicionarEquipamento: TAction;
    ActionRemoverColaborador: TAction;
    ActionRemoverEquipamento: TAction;
    DSColaboradores: TDataSource;
    CDSColaboradores: TClientDataSet;
    CDSEquipamentos: TClientDataSet;
    DSEquipamentos: TDataSource;
    CDSColaboradoresID: TIntegerField;
    CDSColaboradoresID_PCP_SERVICO: TIntegerField;
    CDSColaboradoresID_COLABORADOR: TIntegerField;
    CDSEquipamentosID: TIntegerField;
    CDSEquipamentosID_PATRIM_BEM: TIntegerField;
    CDSEquipamentosID_PCP_SERVICO: TIntegerField;
    ActionAdicionarServico: TAction;
    procedure ActionInstrucaoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionRemoverInstrucaoExecute(Sender: TObject);
    procedure ActionAdicionarItemExecute(Sender: TObject);
    procedure ActionRemoverItemExecute(Sender: TObject);
    procedure ActionAdicionarColaboradorExecute(Sender: TObject);
    procedure ActionAdicionarEquipamentoExecute(Sender: TObject);
    procedure ActionRemoverServicoExecute(Sender: TObject);
    procedure ActionRemoverColaboradorExecute(Sender: TObject);
    procedure ActionRemoverEquipamentoExecute(Sender: TObject);
    procedure ControlaPersistencia(pDataSet: TDataSet);
    procedure ActionAdicionarServicoExecute(Sender: TObject);
  private
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure GridParaEdits; override;
    procedure LimparCampos; override;

  public

  end;

var
  FPcpOp: TFPcpOp;

implementation

{$R *.dfm}

uses
  PcpInstrucaoVO, ProdutoVO, ProdutoController, PcpInstrucaoOpVO, PcpInstrucaoController, PcpOpCabecalhoVO,
  PcpOpDetalheVO, PcpOpController, Controller, PcpServicoVO, PcpServicoColaboradorVO, PcpServicoEquipamentoVO, ColaboradorVO, ColaboradorController,
  PatrimBemVO, PatrimBemController, ViewPessoaColaboradorVO, ViewPessoaColaboradorController;

{$REGION 'Infra'}
procedure TFPcpOp.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPcpOpCabecalhoVO;
  ObjetoController := TPcpOpController.Create;

  inherited;

  CDSServicos.IndexFieldNames := 'ID_PCP_OP_DETALHE';
  CDSServicos.MasterSource := DSItens;
  CDSServicos.MasterFields := 'ID';

  CDSColaboradores.IndexFieldNames := 'ID_PCP_SERVICO';
  CDSColaboradores.MasterSource := DSServicos;
  CDSColaboradores.MasterFields := 'ID';

  CDSEquipamentos.IndexFieldNames := 'ID_PCP_SERVICO';
  CDSEquipamentos.MasterSource := DSServicos;
  CDSEquipamentos.MasterFields := 'ID';
end;

procedure TFPcpOp.LimparCampos;
begin
  inherited;
  CDSItens.EmptyDataSet;
  CDSInstrucoes.EmptyDataSet;
  CDSServicos.EmptyDataSet;
  CDSColaboradores.EmptyDataSet;
  CDSEquipamentos.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFPcpOp.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditInicio.SetFocus;
  end;
end;

function TFPcpOp.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditInicio.SetFocus;
  end;
end;

function TFPcpOp.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFPcpOp.DoSalvar: Boolean;
var
  PcpOpDetalhe: TPcpOpDetalheVO;
  PcpInstrucaoOp: TPcpInstrucaoOpVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin

    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TPcpOpCabecalhoVO.Create;

      TPcpOpCabecalhoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TPcpOpCabecalhoVO(ObjetoVO).Inicio := EditInicio.Date;
      TPcpOpCabecalhoVO(ObjetoVO).PrevisaoEntrega := EditPrevisaoEntrega.Date;
      TPcpOpCabecalhoVO(ObjetoVO).Termino := EditTermino.Date;
      TPcpOpCabecalhoVO(ObjetoVO).CustoTotalPrevisto := EditCustoTotalPrevisto.Value;
      TPcpOpCabecalhoVO(ObjetoVO).CustoTotalRealizado := EditCustoTotalRealizado.Value;
      TPcpOpCabecalhoVO(ObjetoVO).PorcentoVenda := EditPercentualVenda.Value;
      TPcpOpCabecalhoVO(ObjetoVO).PorcentoEstoque := EditPercentualEstoque.Value;

      /// EXERCICIO - TENTE IMPLEMENTAR OS DADOS DA LISTA DE DETALHES DE ACORDO COM O NOVO MODELO PROPOSTO NA INFRA

      // Detalhes
      CDSItens.DisableControls;
      CDSItens.First;
      while not CDSItens.Eof do
      begin
        if (CDSItensPERSISTE.AsString = 'S') or (CDSItensID.AsInteger = 0) then
        begin
          PcpOpDetalhe := TPcpOpDetalheVO.Create;
          PcpOpDetalhe.Id := CDSItens.FieldByName('ID').AsInteger;
          PcpOpDetalhe.IdPcpOpCabecalho := TPcpOpCabecalhoVO(ObjetoVO).Id;
          PcpOpDetalhe.IdProduto := CDSItens.FieldByName('ID_PRODUTO').AsInteger;
          PcpOpDetalhe.QuantidadeProduzir := CDSItens.FieldByName('QUANTIDADE_PRODUZIR').AsFloat;
          PcpOpDetalhe.QuantidadeProduzida := CDSItens.FieldByName('QUANTIDADE_PRODUZIDA').AsFloat;
          PcpOpDetalhe.QuantidadeEntregue := CDSItens.FieldByName('QUANTIDADE_ENTREGUE').AsFloat;
          PcpOpDetalhe.CustoPrevisto := CDSItens.FieldByName('CUSTO_PREVISTO').AsFloat;
          PcpOpDetalhe.CustoRealizado := CDSItens.FieldByName('CUSTO_REALIZADO').AsFloat;

          TPcpOpCabecalhoVO(ObjetoVO).ListaPcpOpDetalheVO.Add(PcpOpDetalhe);
        end;
        CDSItens.Next;
      end;
      CDSItens.First;
      CDSItens.EnableControls;


      // Instruções
      CDSInstrucoes.DisableControls;
      CDSInstrucoes.First;
      while not CDSInstrucoes.Eof do
      begin
        if (CDSInstrucoesPERSISTE.AsString = 'S') or (CDSInstrucoesID.AsInteger = 0) then
        begin
          PcpInstrucaoOp := TPcpInstrucaoOpVO.Create;
          PcpInstrucaoOp.Id := CDSInstrucoes.FieldByName('ID').AsInteger;
          PcpInstrucaoOp.IdPcpOpCabecalho := TPcpOpCabecalhoVO(ObjetoVO).Id;
          PcpInstrucaoOp.IdPcpInstrucao := CDSInstrucoes.FieldByName('ID_PCP_INSTRUCAO').AsInteger;

          TPcpOpCabecalhoVO(ObjetoVO).ListaPcpInstrucaoOpVO.Add(PcpInstrucaoOp);
        end;
        CDSInstrucoes.Next;
      end;
      CDSInstrucoes.First;
      CDSInstrucoes.EnableControls;


      /// EXERCICIO
      ///  Persista as demais listas. Tome a janela NF-e como exemplo.

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'Insere', [TPcpOpCabecalhoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TPcpOpCabecalhoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'Altera', [TPcpOpCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Controle de Grid e Edits'}
procedure TFPcpOp.GridParaEdits;
var
  PcpOpDetalheEnumerator: TEnumerator<TPcpOpDetalheVO>;
  PcpServicoEnumerator: TEnumerator<TPcpServicoVO>;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TPcpOpCabecalhoVO(TController.BuscarObjeto('PcpOpController.TPcpOpController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditInicio.Date := TPcpOpCabecalhoVO(ObjetoVO).Inicio;
    EditPrevisaoEntrega.Date := TPcpOpCabecalhoVO(ObjetoVO).PrevisaoEntrega;
    EditTermino.Date := TPcpOpCabecalhoVO(ObjetoVO).Termino;
    EditCustoTotalPrevisto.Value := TPcpOpCabecalhoVO(ObjetoVO).CustoTotalPrevisto;
    EditCustoTotalRealizado.Value := TPcpOpCabecalhoVO(ObjetoVO).CustoTotalRealizado;
    EditPercentualVenda.Value := TPcpOpCabecalhoVO(ObjetoVO).PorcentoVenda;
    EditPercentualEstoque.Value := TPcpOpCabecalhoVO(ObjetoVO).PorcentoEstoque;

    TController.TratarRetorno<TPcpOpDetalheVO>(TPcpOpCabecalhoVO(ObjetoVO).ListaPcpOpDetalheVO, True, True, CDSItens);
    TController.TratarRetorno<TPcpInstrucaoOpVO>(TPcpOpCabecalhoVO(ObjetoVO).ListaPcpInstrucaoOpVO, True, True, CDSInstrucoes);

    PcpOpDetalheEnumerator := TPcpOpCabecalhoVO(ObjetoVO).ListaPcpOpDetalheVO.GetEnumerator;
    try
      with PcpOpDetalheEnumerator do
      begin
        while MoveNext do
        begin
          TController.TratarRetorno<TPcpServicoVO>(Current.ListaPcpServicoVO, False, True, CDSServicos);

          PcpServicoEnumerator := TPcpOpDetalheVO(Current).ListaPcpServicoVO.GetEnumerator;
          try
            with PcpServicoEnumerator do
            begin
              while MoveNext do
              begin
                TController.TratarRetorno<TPcpServicoColaboradorVO>(Current.ListaPcpColabradorVO, False, True, CDSColaboradores);
                TController.TratarRetorno<TPcpServicoEquipamentoVO>(Current.ListaPcpServicoEquipamentoVO, False, True, CDSEquipamentos);
              end;
            end;
          finally
            FreeAndNil(PcpServicoEnumerator);
          end;
        end;
      end;
    finally
      FreeAndNil(PcpOpDetalheEnumerator);
    end;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFPcpOp.ActionAdicionarItemExecute(Sender: TObject);
begin
  try
    PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSItens.Append;
      CDSItens.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
      CDSItens.FieldByName('PRODUTO.NOME').AsString := CDSTransiente.FieldByName('NOME').AsString;
      CDSItens.FieldByName('CUSTO_PREVISTO').AsExtended := CDSTransiente.FieldByName('CUSTO_UNITARIO').AsExtended;
    end;
  finally
    CDSTransiente.Close;
  end;
end;

procedure TFPcpOp.ActionAdicionarServicoExecute(Sender: TObject);
begin
  inherited;
  /// EXERCICIO
  ///  Implemente essa action
end;

procedure TFPcpOp.ActionAdicionarColaboradorExecute(Sender: TObject);
begin
  try
    PopulaCamposTransientesLookup(TColaboradorVO, TColaboradorController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSColaboradores.Append;
      CDSColaboradores.FieldByName('ID_COLABORADOR').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
    end;
  finally
    CDSTransiente.Close;
  end;
end;

procedure TFPcpOp.ActionAdicionarEquipamentoExecute(Sender: TObject);
begin
    try
    PopulaCamposTransientesLookup(TPatrimBemVO, TPatrimBemController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSEquipamentos.Append;
      CDSEquipamentos.FieldByName('ID_PATRIM_BEM').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
    end;
  finally
    CDSTransiente.Close;
  end;
end;

procedure TFPcpOp.ActionInstrucaoExecute(Sender: TObject);
begin
  try
    PopulaCamposTransientesLookup(TPcpInstrucaoVO, TPcpInstrucaoController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSInstrucoes.Append;
      CDSInstrucoes.FieldByName('ID').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
      CDSInstrucoes.FieldByName('PCP_INSTRUCAO.CODIGO').AsInteger := CDSTransiente.FieldByName('CODIGO').AsInteger;
      CDSInstrucoes.FieldByName('PCP_INSTRUCAO.DESCRICAO').AsString := CDSTransiente.FieldByName('DESCRICAO').AsString
    end;
  finally
    CDSTransiente.Close;
  end;
end;
{$ENDREGION}

{$REGION 'Exclusões Internas'}
procedure TFPcpOp.ActionRemoverInstrucaoExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover esta instrução?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSInstrucoes.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'ExcluiIntrucao', [CDSInstrucoes.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSInstrucoes.Delete;
    end;
  end;
end;

procedure TFPcpOp.ActionRemoverItemExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover o item da Ordem de Produção?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSInstrucoes.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'ExcluiItem', [CDSItens.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSInstrucoes.Delete;
    end;
  end;
end;

procedure TFPcpOp.ActionRemoverServicoExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover o Serviço?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSInstrucoes.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'ExcluiServico', [CDSServicos.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSInstrucoes.Delete;
    end;
  end;
end;

procedure TFPcpOp.ControlaPersistencia(pDataSet: TDataSet);
begin
  pDataSet.FieldByName('PERSISTE').AsString := 'S';
end;

procedure TFPcpOp.ActionRemoverColaboradorExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover o colaborador?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSInstrucoes.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'ExcluiColaborador', [CDSColaboradores.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSInstrucoes.Delete;
    end;
  end;
end;

procedure TFPcpOp.ActionRemoverEquipamentoExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover o equipamento?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSInstrucoes.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('PcpOpController.TPcpOpController', 'ExcluiEquipamento', [CDSEquipamentos.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSInstrucoes.Delete;
    end;
  end;
end;
{$ENDREGION}

/// EXERCICIO
///  Implemente o mestre/detalhe entre os clientdatasets

/// EXERCICIO - Integração Compras
///  Verifique quais itens não estão no estoque e gere uma requisição de compra

/// EXERCICIO - Integração Estoque
///  Incremente no estoque os itens produzidos
///  Decremente do estoque os itens utilizados para produção

/// EXERCICIO - Cálculos
///  Realize os devidos cálculos dos custos previstos na produção do item

end.
