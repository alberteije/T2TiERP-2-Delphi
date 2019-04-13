unit UPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, ComCtrls, ActnList, ShellApi,
  PlatformDefaultStyleActnCtrls, ActnMan, ToolWin, ActnCtrls;

type
  TFPreview = class(TForm)
    PrinterSetupDialog1: TPrinterSetupDialog;
    RichEdit: TRichEdit;
    SaveDialog1: TSaveDialog;
    RichEdit2: TRichEdit;
    ActionManager1: TActionManager;
    ActionSair: TAction;
    ActionSalvar: TAction;
    ActionConfigurarImpressora: TAction;
    ActionImprimir: TAction;
    ActionToolBar1: TActionToolBar;
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionConfigurarImpressoraExecute(Sender: TObject);
  private
  public
  published
  end;

var
  FPreview: TFPreview;

implementation

uses UDataModule;

var
  F: TextFile;
{$R *.DFM}

procedure TFPreview.ActionConfigurarImpressoraExecute(Sender: TObject);
begin
  PrinterSetupDialog1.execute;
end;

procedure TFPreview.ActionSairExecute(Sender: TObject);
begin
  close;
end;

procedure TFPreview.ActionSalvarExecute(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if SaveDialog1.execute then
  begin
    RichEdit.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

end.
