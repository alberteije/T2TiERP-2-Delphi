unit UProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FMX.ListView.Types, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ListView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Generics.Collections, Controller;

type
  TFProduto = class(TForm)
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    BotaoSelecionar: TSpeedButton;
    FDMemTableProduto: TFDMemTable;
    ListViewProduto: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure BotaoSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListViewProdutoItemClick(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProduto: TFProduto;

implementation

{$R *.fmx}

uses UMenu, ProdutoVO;

/// EXERCICIO
///  Exiba os dados necessários do Produto de acordo com sua necessidade.

procedure TFProduto.BotaoSelecionarClick(Sender: TObject);
begin
  Close;
end;

procedure TFProduto.FormShow(Sender: TObject);
var
  ProdutoVO : TProdutoVO;
  ListaProduto: TObjectList<TProdutoVO>;
  i: Integer;
begin
  try
    try
      ListaProduto := TObjectList<TProdutoVO>(TController.BuscarLista('ProdutoController.TProdutoController', 'ConsultaLista', ['ID>0'], 'GET'));
      ProdutoVO := TProdutoVO.Create;

      FDMemTableProduto.EmptyDataSet;

      for I := 0 to ListaProduto.Count - 1 do
      begin
        ProdutoVO := ListaProduto[I];

        FDMemTableProduto.Append;
        FDMemTableProduto.FieldByName('ID').AsInteger := ProdutoVO.Id;
        FDMemTableProduto.FieldByName('NOME').AsString := ProdutoVO.Nome;

        /// EXERCICIO
        ///  Tente formatar o valor da venda na lista

        FDMemTableProduto.FieldByName('VALOR_VENDA').AsFloat := ProdutoVO.ValorVenda;
        FDMemTableProduto.Post;
      end;

    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
  end;
end;

procedure TFProduto.ListViewProdutoItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  FMenu.CDSVendaDetalhe.Open;
  FMenu.CDSVendaDetalhe.Append;
  FMenu.CDSVendaDetalhe.FieldByName('ID_PRODUTO').AsInteger := FDMemTableProduto.FieldByName('ID').AsInteger;
  FMenu.CDSVendaDetalhe.FieldByName('VALOR_UNITARIO').AsExtended := FProduto.FDMemTableProduto.FieldByName('VALOR_VENDA').AsExtended;
  FMenu.CDSVendaDetalhe.Post;
  Close;
end;

end.
