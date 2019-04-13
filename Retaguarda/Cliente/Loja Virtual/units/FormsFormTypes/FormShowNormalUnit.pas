unit FormShowNormalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Menus, uniMainMenu;

type
  TFormShowNormal = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormShowNormal: TFormShowNormal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormShowNormal: TFormShowNormal;
begin
  Result := TFormShowNormal(UniMainModule.GetFormInstance(TFormShowNormal));
end;



end.
