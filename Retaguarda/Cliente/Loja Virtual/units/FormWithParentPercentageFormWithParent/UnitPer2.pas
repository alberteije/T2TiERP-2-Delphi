unit UnitPer2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniPerForm2 = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPerForm2: TUniPerForm2;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPerForm2: TUniPerForm2;
begin
  Result := TUniPerForm2(UniMainModule.GetFormInstance(TUniPerForm2));
end;

end.
