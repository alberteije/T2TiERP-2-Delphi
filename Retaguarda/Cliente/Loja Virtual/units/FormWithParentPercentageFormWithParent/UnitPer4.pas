unit UnitPer4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniPerForm4 = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPerForm4: TUniPerForm4;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPerForm4: TUniPerForm4;
begin
  Result := TUniPerForm4(UniMainModule.GetFormInstance(TUniPerForm4));
end;

end.
