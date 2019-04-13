// Home =
unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, pngimage,
  uniImage, jpeg, uniLabel;

type
  TFrameMain = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniImage1: TUniImage;
    UniLabel2: TUniLabel;
    UniImage2: TUniImage;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ServerModule;

procedure TFrameMain.UniFrameCreate(Sender: TObject);
begin
  UniLabel2.Caption := 'Library Version: '+UniServerModule.UniGUIVersion;
  UniImage1.Picture.LoadFromFile(UniServerModule.StartPath + 'images\uni.jpg');
  UniImage2.Picture.LoadFromFile(UniServerModule.StartPath + 'images\unigui.png');
end;

end.
