unit SingleBorderFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TSingleBorderForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SingleBorderForm: TSingleBorderForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function SingleBorderForm: TSingleBorderForm;
begin
  Result := TSingleBorderForm(UniMainModule.GetFormInstance(TSingleBorderForm));
end;

end.
