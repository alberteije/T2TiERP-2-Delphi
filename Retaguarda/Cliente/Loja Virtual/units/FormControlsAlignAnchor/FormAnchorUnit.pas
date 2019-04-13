unit FormAnchorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton;

type
  TFormAnchor = class(TUniForm)
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    UniButton5: TUniButton;
    UniButton6: TUniButton;
    UniButton7: TUniButton;
    UniButton8: TUniButton;
    UniButton9: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormAnchor: TFormAnchor;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormAnchor: TFormAnchor;
begin
  Result := TFormAnchor(UniMainModule.GetFormInstance(TFormAnchor));
end;

end.
