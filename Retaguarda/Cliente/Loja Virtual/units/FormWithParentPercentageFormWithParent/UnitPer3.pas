unit UnitPer3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniPerForm3 = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPerForm3: TUniPerForm3;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPerForm3: TUniPerForm3;
begin
  Result := TUniPerForm3(UniMainModule.GetFormInstance(TUniPerForm3));
end;

end.
