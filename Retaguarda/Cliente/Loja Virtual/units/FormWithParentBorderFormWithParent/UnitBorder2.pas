unit UnitBorder2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel;

type
  TUnitBorder2Form = class(TUniForm)
    UniLabel2: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnitBorder2Form: TUnitBorder2Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UnitBorder2Form: TUnitBorder2Form;
begin
  Result := TUnitBorder2Form(UniMainModule.GetFormInstance(TUnitBorder2Form));
end;

end.
