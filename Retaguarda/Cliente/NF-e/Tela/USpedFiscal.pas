{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Sped Fiscal

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
t2ti.com@gmail.com</p>

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit USpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, Mask, JvExMask, JvToolEdit, LabeledCtrls,
  ComCtrls, JvBaseEdits, Biblioteca, SessaoUsuario, System.Actions, Controller,
  Vcl.Imaging.pngimage, UBase;

type
  TFSpedFiscal = class(TFBase)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionGerarSpedFiscal: TAction;
    PageControlItens: TPageControl;
    tsDados: TTabSheet;
    PanelDados: TPanel;
    ActionSair: TAction;
    PanelMestre: TPanel;
    ComboBoxVersaoLeiauteSped: TLabeledComboBox;
    ComboBoxFinalidadeArquivoSped: TLabeledComboBox;
    ComboBoxPerfilSped: TLabeledComboBox;
    EditPeriodoInicial: TLabeledDateEdit;
    EditPeriodoFinal: TLabeledDateEdit;
    CDSContador: TClientDataSet;
    DSContador: TDataSource;
    GroupBox1: TGroupBox;
    Grid: TJvDBUltimGrid;
    ComboBoxInventario: TLabeledComboBox;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionGerarSpedFiscalExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSpedFiscal: TFSpedFiscal;

implementation

uses
  UDataModule, UPreview, ContadorVO, ContadorController, SpedFiscalController;
{$R *.dfm}

procedure TFSpedFiscal.FormCreate(Sender: TObject);
begin
  ConfiguraCDSFromVO(CDSContador, TContadorVO);
  ConfiguraGridFromVO(Grid, TContadorVO);
end;

procedure TFSpedFiscal.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSpedFiscal.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSpedFiscal.FormShow(Sender: TObject);
begin
  EditPeriodoInicial.Clear;
  EditPeriodoFinal.Clear;
  ComboBoxVersaoLeiauteSped.SetFocus;
  EditPeriodoInicial.Date := Now;
  EditPeriodoFinal.Date := Now;
  //
  TContadorController.SetDataSet(CDSContador);
  TController.ExecutarMetodo('ContadorController.TContadorController', 'Consulta', ['ID>0', '0', False], 'GET', 'Lista');
end;

procedure TFSpedFiscal.ActionGerarSpedFiscalExecute(Sender: TObject);
var
  ArquivoGerado, Filtro: String;
begin
  Filtro :=
              DataParaTexto(EditPeriodoInicial.Date) + '|' +                 //0
              DataParaTexto(EditPeriodoFinal.Date) + '|' +                   //1
              IntToStr(ComboBoxVersaoLeiauteSped.ItemIndex) + '|' +          //2
              IntToStr(ComboBoxFinalidadeArquivoSped.ItemIndex) + '|' +      //3
              IntToStr(ComboBoxPerfilSped.ItemIndex) + '|' +                 //4
              IntToStr(Sessao.Empresa.Id) + '|' +                            //5
              IntToStr(ComboBoxInventario.ItemIndex) + '|' +                 //6
              CDSContador.FieldByName('ID').AsString;                        //7

  ArquivoGerado := TController.BuscarArquivo('SpedFiscalController.TSpedFiscalController', 'GerarSpedFiscal', [Filtro], 'GET');

  if ArquivoGerado <> '' then
  begin
    Application.CreateForm(TFPreview, FPreview);
    FPreview.RichEdit.Lines.LoadFromFile(ArquivoGerado);
    FPreview.ShowModal;
  end;
end;

procedure TFSpedFiscal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ActionSair.Execute;
end;

end.
