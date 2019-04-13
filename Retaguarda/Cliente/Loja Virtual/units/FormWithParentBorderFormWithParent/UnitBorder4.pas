unit UnitBorder4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel;

type
  TUnitBorder4Form = class(TUniForm)
    UniLabel1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnitBorder4Form: TUnitBorder4Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UnitBorder4Form: TUnitBorder4Form;
begin
  Result := TUnitBorder4Form(UniMainModule.GetFormInstance(TUnitBorder4Form));
end;

end.
