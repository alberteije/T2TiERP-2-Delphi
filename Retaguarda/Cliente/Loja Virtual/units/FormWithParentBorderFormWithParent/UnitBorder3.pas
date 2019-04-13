unit UnitBorder3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel;

type
  TUnitBorder3Form = class(TUniForm)
    UniLabel1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnitBorder3Form: TUnitBorder3Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UnitBorder3Form: TUnitBorder3Form;
begin
  Result := TUnitBorder3Form(UniMainModule.GetFormInstance(TUnitBorder3Form));
end;

end.
