unit MonitoredKeyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMemo, uniGUIBaseClasses, uniLabel;

type
  TUniForm2 = class(TUniForm)
    UniLabel1: TUniLabel;
    UniMemo1: TUniMemo;
    UniLabel2: TUniLabel;
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniForm2: TUniForm2;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniForm2: TUniForm2;
begin
  Result := TUniForm2(UniMainModule.GetFormInstance(TUniForm2));
end;

procedure TUniForm2.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1..VK_F12 :
      UniMemo1.Lines.Add('F'+IntToStr(Key-VK_F1+1));

    88 : // 'x'
      if ssAlt in Shift then
        Close;
  end;
end;

end.
