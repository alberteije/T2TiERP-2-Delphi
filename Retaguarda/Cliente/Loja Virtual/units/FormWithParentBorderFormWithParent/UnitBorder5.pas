unit UnitBorder5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel;

type
  TUnitBorder5Form = class(TUniForm)
    UniLabel2: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnitBorder5Form: TUnitBorder5Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UnitBorder5Form: TUnitBorder5Form;
begin
  Result := TUnitBorder5Form(UniMainModule.GetFormInstance(TUnitBorder5Form));
end;

end.
