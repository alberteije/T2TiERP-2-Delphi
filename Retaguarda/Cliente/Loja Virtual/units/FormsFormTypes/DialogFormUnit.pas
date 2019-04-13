unit DialogFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TDialogForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DialogForm: TDialogForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function DialogForm: TDialogForm;
begin
  Result := TDialogForm(UniMainModule.GetFormInstance(TDialogForm));
end;

end.
