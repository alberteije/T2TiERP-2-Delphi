unit UnitBorder1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel;

type
  TUnitBorder1Form = class(TUniForm)
    UniLabel1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnitBorder1Form: TUnitBorder1Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UnitBorder1Form: TUnitBorder1Form;
begin
  Result := TUnitBorder1Form(UniMainModule.GetFormInstance(TUnitBorder1Form));
end;

end.
