unit NavigationUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniSpinEdit, uniDateTimePicker, uniEdit,
  uniGUIBaseClasses, uniPanel, uniHTMLFrame;

type
  TUniNavigationUnit1Form = class(TUniForm)
    UniLabel2: TUniLabel;
    UniHTMLFrame1: TUniHTMLFrame;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

function UniNavigationUnit1Form: TUniNavigationUnit1Form;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniNavigationUnit1Form: TUniNavigationUnit1Form;
begin
  Result := TUniNavigationUnit1Form(UniMainModule.GetFormInstance(TUniNavigationUnit1Form));
end;

end.
