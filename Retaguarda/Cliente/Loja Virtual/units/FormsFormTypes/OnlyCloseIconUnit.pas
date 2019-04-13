unit OnlyCloseIconUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TOnlyCloseIconForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function OnlyCloseIconForm: TOnlyCloseIconForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function OnlyCloseIconForm: TOnlyCloseIconForm;
begin
  Result := TOnlyCloseIconForm(UniMainModule.GetFormInstance(TOnlyCloseIconForm));
end;

end.
