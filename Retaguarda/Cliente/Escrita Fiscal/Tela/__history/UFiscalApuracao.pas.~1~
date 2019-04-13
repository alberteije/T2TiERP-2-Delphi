{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Apuração para o módulo Escrita Fiscal

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
unit UFiscalApuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, rpgraphicex, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, Mask, JvExMask, JvToolEdit, LabeledCtrls,
  ComCtrls, JvBaseEdits, Biblioteca;

type
  TFFiscalApuracao = class(TForm)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionProcessaPeriodo: TAction;
    PageControlItens: TPageControl;
    tsDados: TTabSheet;
    PanelDados: TPanel;
    ActionSair: TAction;
    EditCompetencia: TLabeledMaskEdit;
    Bevel2: TBevel;
    GridDetalhe: TJvDBUltimGrid;
    DSApuracao: TDataSource;
    CDSApuracao: TClientDataSet;
    CDSApuracaoID: TIntegerField;
    CDSApuracaoID_EMPRESA: TIntegerField;
    CDSApuracaoCOMPETENCIA: TStringField;
    CDSApuracaoVALOR_TOTAL_DEBITO: TFMTBCDField;
    CDSApuracaoVALOR_AJUSTE_DEBITO: TFMTBCDField;
    CDSApuracaoVALOR_TOTAL_AJUSTE_DEBITO: TFMTBCDField;
    CDSApuracaoVALOR_ESTORNO_CREDITO: TFMTBCDField;
    CDSApuracaoVALOR_TOTAL_CREDITO: TFMTBCDField;
    CDSApuracaoVALOR_AJUSTE_CREDITO: TFMTBCDField;
    CDSApuracaoVALOR_TOTAL_AJUSTE_CREDITO: TFMTBCDField;
    CDSApuracaoVALOR_ESTORNO_DEBITO: TFMTBCDField;
    CDSApuracaoVALOR_SALDO_CREDOR_ANTERIOR: TFMTBCDField;
    CDSApuracaoVALOR_SALDO_APURADO: TFMTBCDField;
    CDSApuracaoVALOR_TOTAL_DEDUCAO: TFMTBCDField;
    CDSApuracaoVALOR_ICMS_RECOLHER: TFMTBCDField;
    CDSApuracaoVALOR_SALDO_CREDOR_TRANSP: TFMTBCDField;
    CDSApuracaoVALOR_DEBITO_ESPECIAL: TFMTBCDField;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionProcessaPeriodoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiscalApuracao: TFFiscalApuracao;

implementation

uses
  UDataModule, FiscalApuracaoIcmsVO, FiscalApuracaoIcmsController;
{$R *.dfm}

procedure TFFiscalApuracao.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFFiscalApuracao.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFFiscalApuracao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFFiscalApuracao.FormShow(Sender: TObject);
begin
  EditCompetencia.Text := FormatDateTime('MM/YYYY', Now);
  EditCompetencia.SetFocus;
end;

procedure TFFiscalApuracao.ActionProcessaPeriodoExecute(Sender: TObject);
begin
  TFiscalApuracaoIcmsController.SetDataSet(CDSApuracao);
  TFiscalApuracaoIcmsController.Consulta(EditCompetencia.Text, 0);
end;

end.
