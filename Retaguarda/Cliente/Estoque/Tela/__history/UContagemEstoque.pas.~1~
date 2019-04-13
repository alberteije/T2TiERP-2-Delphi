{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Para Contagem e Conferência de Material em Estoque

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
  t2ti.com@gmail.com

  @author Albert Eije (alberteije@gmail.com)
  @version 1.0
  ******************************************************************************* }
unit UContagemEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, DB, DBClient, Generics.Collections,
  ActnList, RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, Biblioteca;

type
  [TFormDescription(TConstantes.MODULO_ESTOQUE, 'Contagem de Estoque')]

  TFContagemEstoque = class(TFTelaCadastro)
    BevelEdits: TBevel;
    CDSContagemEstoqueDetalhe: TClientDataSet;
    DSContagemEstoqueDetalhe: TDataSource;
    GroupBoxParcelas: TGroupBox;
    GridItens: TJvDBUltimGrid;
    EditDataContagem: TLabeledDateEdit;
    CDSContagemEstoqueDetalheID: TIntegerField;
    CDSContagemEstoqueDetalheID_PRODUTO: TIntegerField;
    CDSContagemEstoqueDetalheQUANTIDADE_CONTADA: TFloatField;
    CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA: TFloatField;
    CDSContagemEstoqueDetalheACURACIDADE: TFloatField;
    CDSContagemEstoqueDetalheDIVERGENCIA: TFloatField;
    ActionManager: TActionManager;
    ActionSelecionarItens: TAction;
    ActionRealizarCalculos: TAction;
    ActionToolBarEdits: TActionToolBar;
    CDSContagemEstoqueDetalhePRODUTONOME: TStringField;
    CDSProduto: TClientDataSet;
    DSProduto: TDataSource;
    CDSProdutoID: TIntegerField;
    CDSProdutoNOME: TStringField;
    CDSProdutoQUANTIDADE_ESTOQUE: TFloatField;
    CDSContagemEstoqueDetalhePERSISTE: TStringField;
    CDSContagemEstoqueDetalheID_ESTOQUE_CONTAGEM_CABECALHO: TIntegerField;
    CheckBoxAtualizaEstoque: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionSelecionarItensExecute(Sender: TObject);
    procedure ActionRealizarCalculosExecute(Sender: TObject);
    procedure CDSContagemEstoqueDetalheAfterPost(DataSet: TDataSet);
    procedure CDSContagemEstoqueDetalheAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FContagemEstoque: TFContagemEstoque;

implementation

uses EstoqueContagemCabecalhoController, EstoqueContagemCabecalhoVO,
  EstoqueContagemDetalheVO, UDataModule, ProdutoVO, ProdutoController,
  ProdutoSubGrupoVO, ProdutoSubGrupoController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFContagemEstoque.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TEstoqueContagemCabecalhoVO;
  ObjetoController := TEstoqueContagemCabecalhoController.Create;

  inherited;
end;

procedure TFContagemEstoque.LimparCampos;
begin
  inherited;
  // Itens
  CDSContagemEstoqueDetalhe.EmptyDataSet;
  CheckBoxAtualizaEstoque.Checked := False;
end;

procedure TFContagemEstoque.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFContagemEstoque.ControlaPopupMenu;
begin
  inherited;

  menuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContagemEstoque.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    CheckBoxAtualizaEstoque.Enabled := False;
    EditDataContagem.SetFocus;
  end;
end;

function TFContagemEstoque.DoEditar: Boolean;
begin
  if CDSGrid.FieldByName('ESTOQUE_ATUALIZADO').AsString = 'S' then
  begin
    Application.MessageBox('Esse registro não pode ser alterado. O estoque dessa contagem já foi atualizado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit(False);
  end;

  Result := inherited DoEditar;

  if Result then
  begin
    EditDataContagem.SetFocus;
  end;
end;

function TFContagemEstoque.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TEstoqueContagemCabecalhoController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TEstoqueContagemCabecalhoController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFContagemEstoque.DoSalvar: Boolean;
var
  ContagemEstoqueDetalhe: TEstoqueContagemDetalheVO;
begin
  DecimalSeparator := '.';
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      ObjetoVO := TEstoqueContagemCabecalhoVO.Create;

      TEstoqueContagemCabecalhoVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TEstoqueContagemCabecalhoVO(ObjetoVO).DataContagem := EditDataContagem.Date;
      if CheckBoxAtualizaEstoque.Checked then
        TEstoqueContagemCabecalhoVO(ObjetoVO).EstoqueAtualizado := 'S'
      else
        TEstoqueContagemCabecalhoVO(ObjetoVO).EstoqueAtualizado := 'N';

      if StatusTela = stEditando then
        TEstoqueContagemCabecalhoVO(ObjetoVO).Id := IdRegistroSelecionado;

      // Itens
      CDSContagemEstoqueDetalhe.DisableControls;
      CDSContagemEstoqueDetalhe.First;
      while not CDSContagemEstoqueDetalhe.Eof do
      begin
        if (CDSContagemEstoqueDetalhePERSISTE.AsString = 'S') or (CDSContagemEstoqueDetalheID.AsInteger = 0) or (CheckBoxAtualizaEstoque.Checked) then
        begin
          ContagemEstoqueDetalhe := TEstoqueContagemDetalheVO.Create;
          ContagemEstoqueDetalhe.Id := CDSContagemEstoqueDetalheID.AsInteger;
          ContagemEstoqueDetalhe.IdEstoqueContagemCabecalho := TEstoqueContagemCabecalhoVO(ObjetoVO).Id;
          ContagemEstoqueDetalhe.IdProduto := CDSContagemEstoqueDetalheID_PRODUTO.AsInteger;
          ContagemEstoqueDetalhe.ProdutoNome := CDSContagemEstoqueDetalhePRODUTONOME.AsString;
          ContagemEstoqueDetalhe.QuantidadeContada := CDSContagemEstoqueDetalheQUANTIDADE_CONTADA.AsFloat;
          ContagemEstoqueDetalhe.QuantidadeSistema := CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat;
          ContagemEstoqueDetalhe.Acuracidade := CDSContagemEstoqueDetalheACURACIDADE.AsFloat;
          ContagemEstoqueDetalhe.Divergencia := CDSContagemEstoqueDetalheDIVERGENCIA.AsFloat;

          TEstoqueContagemCabecalhoVO(ObjetoVO).ListaEstoqueContagemDetalheVO.Add(ContagemEstoqueDetalhe);
        end;

        CDSContagemEstoqueDetalhe.Next;
      end;
      CDSContagemEstoqueDetalhe.EnableControls;

      if StatusTela = stInserindo then
        Result := TEstoqueContagemCabecalhoController(ObjetoController).Insere(TEstoqueContagemCabecalhoVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TEstoqueContagemCabecalhoVO(ObjetoVO).ToJSONString <> TEstoqueContagemCabecalhoVO(ObjetoOldVO).ToJSONString then
        begin
          TEstoqueContagemCabecalhoVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TEstoqueContagemCabecalhoController(ObjetoController).Altera(TEstoqueContagemCabecalhoVO(ObjetoVO), TEstoqueContagemCabecalhoVO(ObjetoOldVO));
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;

      DecimalSeparator := ',';
      Result := True;
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFContagemEstoque.GridParaEdits;
var
  ContagemEstoqueDetalheEnumerator: TEnumerator<TEstoqueContagemDetalheVO>;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TEstoqueContagemCabecalhoVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TEstoqueContagemCabecalhoVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDataContagem.Date := TEstoqueContagemCabecalhoVO(ObjetoVO).DataContagem;

    // Itens
    ContagemEstoqueDetalheEnumerator := TEstoqueContagemCabecalhoVO(ObjetoVO).ListaEstoqueContagemDetalheVO.GetEnumerator;
    try
      with ContagemEstoqueDetalheEnumerator do
      begin
        while MoveNext do
        begin
          CDSContagemEstoqueDetalhe.Append;

          CDSContagemEstoqueDetalheID.AsInteger := Current.Id;
          CDSContagemEstoqueDetalheID_PRODUTO.AsInteger := Current.IdProduto;
          CDSContagemEstoqueDetalhePRODUTONOME.AsString := Current.ProdutoVO.Nome;
          CDSContagemEstoqueDetalheID_ESTOQUE_CONTAGEM_CABECALHO.AsInteger := Current.IdEstoqueContagemCabecalho;
          CDSContagemEstoqueDetalheQUANTIDADE_CONTADA.AsFloat := Current.QuantidadeContada;
          CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat := Current.QuantidadeSistema;
          CDSContagemEstoqueDetalheACURACIDADE.AsFloat := Current.Acuracidade;
          CDSContagemEstoqueDetalheDIVERGENCIA.AsFloat := Current.Divergencia;

          CDSContagemEstoqueDetalhe.Post;
        end;
      end;
    finally
      ContagemEstoqueDetalheEnumerator.Free;
    end;
    TEstoqueContagemCabecalhoVO(ObjetoVO).ListaEstoqueContagemDetalheVO := Nil;
    if Assigned(TEstoqueContagemCabecalhoVO(ObjetoOldVO)) then
      TEstoqueContagemCabecalhoVO(ObjetoOldVO).ListaEstoqueContagemDetalheVO := Nil;
  end;
end;

procedure TFContagemEstoque.CDSContagemEstoqueDetalheAfterEdit(DataSet: TDataSet);
begin
  CDSContagemEstoqueDetalhePERSISTE.AsString := 'S';
end;

procedure TFContagemEstoque.CDSContagemEstoqueDetalheAfterPost(DataSet: TDataSet);
begin
  if CDSContagemEstoqueDetalheID_PRODUTO.AsInteger = 0 then
    CDSContagemEstoqueDetalhe.Delete;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFContagemEstoque.ActionSelecionarItensExecute(Sender: TObject);
var
  Filtro: String;
begin
  if (StatusTela = stEditando) or (StatusTela = stInserindo) then
  begin
    //Filtra os produtos por SubGrupo
    PopulaCamposTransientesLookup(TProdutoSubGrupoVO, TProdutoSubGrupoController);

    if CDSTransiente.RecordCount > 0 then
    begin
      Filtro := 'ID_SUB_GRUPO = ' + CDSTransiente.FieldByName('ID').AsString;

      TProdutoController.SetDataSet(CDSProduto);
      TProdutoController.Consulta(Filtro, 0);

      CDSProduto.First;
      while not CDSProduto.Eof do
      begin
        CDSContagemEstoqueDetalhe.Append;

        CDSContagemEstoqueDetalheID_PRODUTO.AsInteger := CDSProduto.FieldByName('ID').AsInteger;
        CDSContagemEstoqueDetalhePRODUTONOME.AsString := CDSProduto.FieldByName('NOME').AsString;
        CDSContagemEstoqueDetalheID_ESTOQUE_CONTAGEM_CABECALHO.AsInteger := 0;
        CDSContagemEstoqueDetalheQUANTIDADE_CONTADA.AsFloat := 0;
        CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat := CDSProduto.FieldByName('QUANTIDADE_ESTOQUE').AsFloat;
        CDSContagemEstoqueDetalheACURACIDADE.AsFloat := 0;
        CDSContagemEstoqueDetalheDIVERGENCIA.AsFloat := 0;

        CDSContagemEstoqueDetalhe.Post;
        CDSProduto.Next;
      end;
    end;
  end;
end;

procedure TFContagemEstoque.ActionRealizarCalculosExecute(Sender: TObject);
begin
  if (StatusTela = stEditando) or (StatusTela = stInserindo) then
  begin
    CDSContagemEstoqueDetalhe.DisableControls;
    CDSContagemEstoqueDetalhe.First;
    while not CDSContagemEstoqueDetalhe.Eof do
    begin
      CDSContagemEstoqueDetalhe.Edit;
      //acuracidade dos registros = (registros sistema / registros contados) X 100 }
      if CDSContagemEstoqueDetalheQUANTIDADE_CONTADA.AsFloat > 0 then
        CDSContagemEstoqueDetalheACURACIDADE.AsFloat := CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat / CDSContagemEstoqueDetalheQUANTIDADE_CONTADA.AsFloat * 100
      else
        CDSContagemEstoqueDetalheACURACIDADE.AsFloat := 0;

      //divergencia dos registros = ((registros contados - registros sistema) / registros sistema) X 100 }
      if CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat <> 0 then
        CDSContagemEstoqueDetalheDIVERGENCIA.AsFloat := (CDSContagemEstoqueDetalheQUANTIDADE_CONTADA.AsFloat - CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat) / CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA.AsFloat * 100
      else
        CDSContagemEstoqueDetalheDIVERGENCIA.AsFloat := 0;

      CDSContagemEstoqueDetalhe.Post;
      CDSContagemEstoqueDetalhe.Next;
    end;
    CDSContagemEstoqueDetalhe.First;
    CDSContagemEstoqueDetalhe.EnableControls;
  end;
end;
{$ENDREGION}

end.
