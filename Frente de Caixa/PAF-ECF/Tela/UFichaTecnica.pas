{ *******************************************************************************
Title: T2TiPDV
Description: Janela para cadastros de produtos produzidos pelo estabelecimento.

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
unit UFichaTecnica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, ExtCtrls, pngimage, JvComponentBase, JvEnterTab, StdCtrls,
  JvExStdCtrls, JvButton, JvCtrls, JvExButtons, JvBitBtn, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, Mask, JvExMask, JvToolEdit, JvBaseEdits,
  FMTBcd, DB, DBClient, Provider, SqlExpr, JvDBUltimGrid, Biblioteca, Controller;

type
  TFFichaTecnica = class(TFBase)
    botaoCancela: TJvImgBtn;
    JvEnterAsTab1: TJvEnterAsTab;
    Image1: TImage;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    EditLocaliza: TEdit;
    DSProduto: TDataSource;
    DSFichaTecnica: TDataSource;
    GridPrincipal: TJvDBUltimGrid;
    CDSProduto: TClientDataSet;
    GridFichaTecnica: TJvDBUltimGrid;
    CDSFichaTecnica: TClientDataSet;
    procedure FormActivate(Sender: TObject);
    procedure EditLocalizaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DSProdutoDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LocalizaPrincipal;
    procedure MostraDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFichaTecnica: TFFichaTecnica;

implementation

uses
  ProdutoController, FichaTecnicaController,
  EcfProdutoVO, FichaTecnicaVO;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFFichaTecnica.FormActivate(Sender: TObject);
var
  Filtro: String;
begin
  Color := StringToColor(Sessao.Configuracao.CorJanelasInternas);

  // Configura a Grid da Ficha Técnica
  ConfiguraCDSFromVO(CDSFichaTecnica, TFichaTecnicaVO);
  ConfiguraGridFromVO(GridFichaTecnica, TFichaTecnicaVO);
  CDSFichaTecnica.Open;

  // Configura a Grid do Produto
  ConfiguraCDSFromVO(CDSProduto, TEcfProdutoVO);
  ConfiguraGridFromVO(GridPrincipal, TEcfProdutoVO);
  CDSProduto.Open;

  // Consulta os prdutos de produção própria
  Filtro := 'IPPT = ' + QuotedStr('P');
  TProdutoController.SetDataSet(CDSProduto);
  TController.ExecutarMetodo('ProdutoController.TProdutoController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');

  EditLocaliza.SetFocus;
end;

procedure TFFichaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;
{$EndREGION 'Infra'}

{$REGION 'Pesquisa'}
procedure TFFichaTecnica.SpeedButton1Click(Sender: TObject);
begin
  LocalizaPrincipal;
end;

procedure TFFichaTecnica.EditLocalizaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    LocalizaPrincipal;
end;

procedure TFFichaTecnica.DSProdutoDataChange(Sender: TObject; Field: TField);
begin
  MostraDados;
end;

procedure TFFichaTecnica.MostraDados;
var
  Filtro: String;
begin
  if not(CDSProduto.IsEmpty) then
  begin
    Filtro := 'ID_PRODUTO = ' + CDSProduto.FieldByName('ID').AsString;
    TFichaTecnicaController.SetDataSet(CDSFichaTecnica);
    TController.ExecutarMetodo('FichaTecnicaController.TFichaTecnicaController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');
  end;
end;

procedure TFFichaTecnica.LocalizaPrincipal;
var
  ProcurePor, Filtro: String;
begin
  ProcurePor := '%' + EditLocaliza.Text + '%';
  Filtro := 'IPPT = ' + QuotedStr('P');
  Filtro := Filtro + ' AND NOME LIKE '+ QuotedStr(ProcurePor);

  TProdutoController.SetDataSet(CDSProduto);
  TController.ExecutarMetodo('ProdutoController.TProdutoController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');
end;
{$EndREGION 'Pesquisa'}


end.
