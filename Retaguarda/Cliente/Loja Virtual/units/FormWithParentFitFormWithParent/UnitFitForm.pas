unit UnitFitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniFitForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniFitForm: TUniFitForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniFitForm: TUniFitForm;
begin
  Result := TUniFitForm(UniMainModule.GetFormInstance(TUniFitForm));
end;

end.
