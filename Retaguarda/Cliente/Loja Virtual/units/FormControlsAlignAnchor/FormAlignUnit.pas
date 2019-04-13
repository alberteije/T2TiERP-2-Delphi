unit FormAlignUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel;

type
  TFormAlign = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormAlign: TFormAlign;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormAlign: TFormAlign;
begin
  Result := TFormAlign(UniMainModule.GetFormInstance(TFormAlign));
end;

end.
