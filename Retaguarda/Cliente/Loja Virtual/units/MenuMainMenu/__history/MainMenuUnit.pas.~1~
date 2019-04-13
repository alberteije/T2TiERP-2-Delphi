unit MainMenuUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniImageList, Menus,
  uniMainMenu, uniPanel, uniGUIFrame, FrameMenu;

type
  TMainMenuForm = class(TUniForm)
    UniPanel1: TUniPanel;
    UniFormMainMenu: TUniMainMenu;
    FormMainMenu1: TUniMenuItem;
    Item11: TUniMenuItem;
    Item21: TUniMenuItem;
    SubItem11: TUniMenuItem;
    SubItem21: TUniMenuItem;
    UniPanelMenu: TUniMainMenu;
    MenuForPanel1: TUniMenuItem;
    Items1: TUniMenuItem;
    A1: TUniMenuItem;
    B1: TUniMenuItem;
    C1: TUniMenuItem;
    SubItem31: TUniMenuItem;
    UniMenuFrame1: TUniMenuFrame;
    UniNativeImageList1: TUniNativeImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainMenuForm: TMainMenuForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function MainMenuForm: TMainMenuForm;
begin
  Result := TMainMenuForm(UniMainModule.GetFormInstance(TMainMenuForm));
end;

end.
