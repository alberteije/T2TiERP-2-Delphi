unit FrameMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniImageList, 
  uniMainMenu, Menus;

type
  TUniMenuFrame = class(TUniFrame)
    UniFrameMenu: TUniMainMenu;
    MenuinFrame1: TUniMenuItem;
    Item11: TUniMenuItem;
    Item21: TUniMenuItem;
    UniNativeImageList1: TUniNativeImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



end.
