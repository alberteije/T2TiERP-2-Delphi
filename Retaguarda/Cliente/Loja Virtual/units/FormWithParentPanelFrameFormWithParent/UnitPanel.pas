unit UnitPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniPanelForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPanelForm: TUniPanelForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPanelForm: TUniPanelForm;
begin
  Result := TUniPanelForm(UniMainModule.GetFormInstance(TUniPanelForm));
end;

end.
