unit UnitPer5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniPerForm5 = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPerForm5: TUniPerForm5;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPerForm5: TUniPerForm5;
begin
  Result := TUniPerForm5(UniMainModule.GetFormInstance(TUniPerForm5));
end;

end.
