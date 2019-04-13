{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Sped Contábil

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
  @version 1.0
  ******************************************************************************* }
unit USpedContabil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, rpgraphicex, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, Mask, JvExMask, JvToolEdit, LabeledCtrls,
  ComCtrls, JvBaseEdits, Biblioteca;

type
  TFSpedContabil = class(TForm)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionGerarSpedContabil: TAction;
    PageControlItens: TPageControl;
    tsDados: TTabSheet;
    PanelDados: TPanel;
    ActionSair: TAction;
    PanelMestre: TPanel;
    ComboBoxFormaEscrituracao: TLabeledComboBox;
    EditPeriodoInicial: TLabeledDateEdit;
    EditPeriodoFinal: TLabeledDateEdit;
    ComboBoxVersaoLeiauteSped: TLabeledComboBox;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionGerarSpedContabilExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSpedContabil: TFSpedContabil;

implementation

uses
  UDataModule, SpedContabilController;
{$R *.dfm}

procedure TFSpedContabil.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSpedContabil.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSpedContabil.FormShow(Sender: TObject);
begin
  EditPeriodoInicial.Clear;
  EditPeriodoFinal.Clear;
  ComboBoxFormaEscrituracao.SetFocus;
  EditPeriodoInicial.Date := Now;
  EditPeriodoFinal.Date := Now;
end;

procedure TFSpedContabil.ActionGerarSpedContabilExecute(Sender: TObject);
begin
  TSpedContabilController.Consulta(
    DataParaTexto(EditPeriodoInicial.Date) + '|' +            // 0 - Periodo Inicial
    DataParaTexto(EditPeriodoFinal.Date) + '|' +              // 1 - Periodo Final
    IntToStr(ComboBoxFormaEscrituracao.ItemIndex) + '|' +     // 2 - Forma de Escrituração
    IntToStr(ComboBoxVersaoLeiauteSped.ItemIndex)             // 3 - Layout da Versão
    , 0
  );
end;

procedure TFSpedContabil.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ActionSair.Execute;
end;

end.
