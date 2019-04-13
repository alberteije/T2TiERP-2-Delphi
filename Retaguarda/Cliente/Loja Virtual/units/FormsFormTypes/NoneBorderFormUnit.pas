unit NoneBorderFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton;

type
  TNoneBorderForm = class(TUniForm)
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function NoneBorderForm: TNoneBorderForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function NoneBorderForm: TNoneBorderForm;
begin
  Result := TNoneBorderForm(UniMainModule.GetFormInstance(TNoneBorderForm));
end;

procedure TNoneBorderForm.UniButton1Click(Sender: TObject);
begin
  Close;
end;

end.
