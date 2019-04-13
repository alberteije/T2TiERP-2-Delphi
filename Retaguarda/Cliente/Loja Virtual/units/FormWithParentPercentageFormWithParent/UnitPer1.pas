unit UnitPer1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniPerForm1 = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPerForm1: TUniPerForm1;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPerForm1: TUniPerForm1;
begin
  Result := TUniPerForm1(UniMainModule.GetFormInstance(TUniPerForm1));
end;

end.
