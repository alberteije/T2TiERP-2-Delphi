{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Coleta de Dados - WMS

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
t2ti.com@gmail.com</p>

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UWmsColeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, UBase, Menus, MaskUtils, LabeledCtrls,
  Mask, JvExMask, JvToolEdit, Generics.Collections, StrUtils, WideStrings,
  FMTBcd, Biblioteca, ComCtrls, System.Actions, Vcl.Imaging.pngimage, Controller;

type
  TFWmsColeta = class(TFBase)
    CDSColetor: TClientDataSet;
    DSColetor: TDataSource;
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarGrid: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionImportarArquivo: TAction;
    ActionSair: TAction;
    ActionValidarDados: TAction;
    PopupMenu: TPopupMenu;
    DesconsiderarMarcao1: TMenuItem;
    RemoverRegistroIncludo1: TMenuItem;
    PageControl1: TPageControl;
    TabSheetDadosArquivo: TTabSheet;
    GridMarcacao: TJvDBUltimGrid;
    ActionProcessar: TAction;
    CDSColetorCODIGO: TStringField;
    CDSColetorQUANTIDADE: TIntegerField;
    procedure ActionImportarArquivoExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionValidarDadosExecute(Sender: TObject);
    procedure ActionProcessarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWmsColeta: TFWmsColeta;

implementation

uses
  UMenu, ULookup, UDataModule;
{$R *.dfm}


{$REGION 'Infra'}
procedure TFWmsColeta.ActionSairExecute(Sender: TObject);
begin
  FechaFormulario;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFWmsColeta.ActionImportarArquivoExecute(Sender: TObject);
var
  i: Integer;
begin
  if FDataModule.OpenDialog.Execute then
  begin
    /// EXERCICIO
    ///  Leia o arquivo TXT vindo do coletor e carregue no CDSColetor
  end;
end;

procedure TFWmsColeta.ActionValidarDadosExecute(Sender: TObject);
begin
  if CDSColetor.IsEmpty then
    Application.MessageBox('Não existem dados para validação.', 'Informação do Sistema', MB_OK + MB_IconInformation)
  else
  begin
    /// EXERCICIO
    ///  Valide os dados. Verifique se o código e a quantidade estão
    ///  dentro do padrãoe esperado pela aplicação. Caso seu sistema
    ///  tenha mais campos, proceda com as devidas validações.
  end;
end;

procedure TFWmsColeta.ActionProcessarExecute(Sender: TObject);
begin
  /// EXERCICIO
  ///  Alimente o estoque com base nos dados importados.
  if Application.MessageBox('Deseja salvar as informações no banco de dados?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
    Exit;
end;
{$ENDREGION}

  /// EXERCICIO
  ///  Verifique se o seu coletor tem a opção de conexão com a rede.
  ///  Caso exista essa possibilidade, crie uma aplicação para coletar os
  ///  dados e sincronize diretamente com o banco usando o servidor.

end.
