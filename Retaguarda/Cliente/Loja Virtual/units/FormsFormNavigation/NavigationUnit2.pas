unit NavigationUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniSpinEdit, uniDateTimePicker, uniEdit,
  uniGUIBaseClasses, uniPanel;

type
  TUniNavigationUnit2Form = class(TUniForm)
    UniPanel1: TUniPanel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniEdit4: TUniEdit;
    UniDateTimePicker1: TUniDateTimePicker;
    UniDateTimePicker2: TUniDateTimePicker;
    UniSpinEdit1: TUniSpinEdit;
    UniPanel2: TUniPanel;
    UniEdit5: TUniEdit;
    UniEdit6: TUniEdit;
    UniEdit7: TUniEdit;
    UniEdit8: TUniEdit;
    UniEdit9: TUniEdit;
    UniPanel3: TUniPanel;
    UniEdit10: TUniEdit;
    UniEdit11: TUniEdit;
    UniEdit12: TUniEdit;
    UniEdit13: TUniEdit;
    UniLabel1: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniNavigationUnit2Form: TUniNavigationUnit2Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniNavigationUnit2Form: TUniNavigationUnit2Form;
begin
  Result := TUniNavigationUnit2Form(UniMainModule.GetFormInstance(TUniNavigationUnit2Form));
end;

procedure TUniNavigationUnit2Form.UniFormCreate(Sender: TObject);
begin
   UniEdit1.SetFocus;
end;

end.
