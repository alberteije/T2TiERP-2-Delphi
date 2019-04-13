unit ComboTriggerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniEdit;

type
  TComboTrigger = class(TUniForm)
    UniEdit1: TUniEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ComboTrigger: TComboTrigger;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function ComboTrigger: TComboTrigger;
begin
  Result := TComboTrigger(UniMainModule.GetFormInstance(TComboTrigger));
end;

end.
