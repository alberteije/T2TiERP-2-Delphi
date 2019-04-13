unit CallBackFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton;

type
  TUniCallBackFormUnit = class(TUniForm)
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniCallBackFormUnit: TUniCallBackFormUnit;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniCallBackFormUnit: TUniCallBackFormUnit;
begin
  Result := TUniCallBackFormUnit(UniMainModule.GetFormInstance(TUniCallBackFormUnit));
end;

procedure TUniCallBackFormUnit.UniButton1Click(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TUniCallBackFormUnit.UniButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
