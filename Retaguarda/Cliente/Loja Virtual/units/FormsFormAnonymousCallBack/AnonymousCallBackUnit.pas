unit AnonymousCallBackUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton;

type
  TUniAnonymousCallBackForm = class(TUniForm)
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniAnonymousCallBackForm: TUniAnonymousCallBackForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniAnonymousCallBackForm: TUniAnonymousCallBackForm;
begin
  Result := TUniAnonymousCallBackForm(UniMainModule.GetFormInstance(TUniAnonymousCallBackForm));
end;

procedure TUniAnonymousCallBackForm.UniButton1Click(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TUniAnonymousCallBackForm.UniButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
