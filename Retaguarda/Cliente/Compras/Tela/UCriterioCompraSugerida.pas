{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de critérios para compra sugerida

The MIT License

Copyright: Copyright (C) 2015 T2Ti.COM

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
unit UCriterioCompraSugerida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, ActnList,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, LabeledCtrls, ComCtrls,
  System.Actions, Vcl.Imaging.pngimage, Controller;

type
  TFCriterioCompraSugerida = class(TForm)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionGerarRequisicao: TAction;
    PageControlItens: TPageControl;
    tsDados: TTabSheet;
    PanelDados: TPanel;
    ActionSair: TAction;
    ActionGerarPedido: TAction;
    CDSProduto: TClientDataSet;
    DSProduto: TDataSource;
    CDSProdutoID: TIntegerField;
    CDSProdutoNOME: TStringField;
    CDSProdutoVALOR_VENDA: TFMTBCDField;
    ComboboxSelecao: TLabeledComboBox;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionGerarRequisicaoExecute(Sender: TObject);
    procedure ActionGerarPedidoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCriterioCompraSugerida: TFCriterioCompraSugerida;

implementation

uses
  UMenu, UDataModule, UCompraPedido, UCompraRequisicao, ProdutoController;
{$R *.dfm}

/// EXERCICIO: IMPLEMENTE OUTROS CRITERIOS DE GERAR UMA COMPRA SUGERIDA


procedure TFCriterioCompraSugerida.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCriterioCompraSugerida.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCriterioCompraSugerida.ActionGerarPedidoExecute(Sender: TObject);
begin
  // Estoque Mínimo
  if ComboboxSelecao.ItemIndex = 0 then
  begin
    TProdutoController.SetDataSet(CDSProduto);
    TController.ExecutarMetodo('ProdutoController.TProdutoController', 'Consulta', ['QUANTIDADE_ESTOQUE<ESTOQUE_MINIMO', '0', False], 'GET', 'Lista');
  end;

  if CDSProduto.RecordCount > 0 then
  begin
    FMenu.ActionCompraPedido.Execute;
    ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraPedido).BotaoInserir.Click;
    CDSProduto.First;
    while not CDSProduto.Eof do
    begin
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraPedido).CDSCompraPedidoDetalhe.Append;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraPedido).CDSCompraPedidoDetalheID_PRODUTO.AsInteger := CDSProdutoID.AsInteger;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraPedido).CDSCompraPedidoDetalheProdutoNome.AsString := CDSProdutoNOME.AsString;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraPedido).CDSCompraPedidoDetalheVALOR_UNITARIO.AsExtended := CDSProdutoVALOR_VENDA.AsExtended;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraPedido).CDSCompraPedidoDetalhe.Post;
        CDSProduto.Next;
    end;
    Close;
  end
  else
    Application.MessageBox('Não existem dados para os critérios informados.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFCriterioCompraSugerida.ActionGerarRequisicaoExecute(Sender: TObject);
begin
  // Estoque Mínimo
  if ComboboxSelecao.ItemIndex = 0 then
  begin
    TProdutoController.SetDataSet(CDSProduto);
    TController.ExecutarMetodo('ProdutoController.TProdutoController', 'Consulta', ['QUANTIDADE_ESTOQUE<ESTOQUE_MINIMO', '0', False], 'GET', 'Lista');
  end;

  if CDSProduto.RecordCount > 0 then
  begin
    FMenu.ActionCompraRequisicao.Execute;
    ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraRequisicao).BotaoInserir.Click;
    CDSProduto.First;
    while not CDSProduto.Eof do
    begin
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraRequisicao).CDSCompraRequisicaoDetalhe.Append;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraRequisicao).CDSCompraRequisicaoDetalhe.FieldByName('ID_PRODUTO').AsInteger := CDSProdutoID.AsInteger;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraRequisicao).CDSCompraRequisicaoDetalhe.FieldByName('PRODUTO.NOME').AsString := CDSProdutoNOME.AsString;
        ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFCompraRequisicao).CDSCompraRequisicaoDetalhe.Post;
        CDSProduto.Next;
    end;
    Close;
  end
  else
    Application.MessageBox('Não existem dados para os critérios informados.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
end;

end.
