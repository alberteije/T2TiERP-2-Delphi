unit NavigationUnit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniEdit, uniGUIBaseClasses, uniPanel;

type
  TUniNavigationUnit3Form = class(TUniForm)
    UniPanel1: TUniPanel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniEdit4: TUniEdit;
    UniEdit14: TUniEdit;
    UniEdit15: TUniEdit;
    UniEdit16: TUniEdit;
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

function UniNavigationUnit3Form: TUniNavigationUnit3Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniNavigationUnit3Form: TUniNavigationUnit3Form;
begin
  Result := TUniNavigationUnit3Form(UniMainModule.GetFormInstance(TUniNavigationUnit3Form));
end;

procedure TUniNavigationUnit3Form.UniFormCreate(Sender: TObject);
begin
   UniEdit1.SetFocus;
end;

end.
