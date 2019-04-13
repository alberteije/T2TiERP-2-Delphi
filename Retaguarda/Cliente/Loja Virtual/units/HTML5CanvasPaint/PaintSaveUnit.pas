unit PaintSaveUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniScreenMask, uniBitBtn,
  uniMultiItem, uniComboBox, uniLabel, uniPanel, uniButton, uniCanvas, ServerModule;

type
  TUniForm3 = class(TUniForm)
    UniButton1: TUniButton;
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniComboBox1: TUniComboBox;
    UniBitBtn1: TUniBitBtn;
    UniScreenMask1: TUniScreenMask;
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Canvas : TUniCanvas;
    { Public declarations }
  end;

function UniForm3: TUniForm3;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

var
  FCnt : Integer=0;

function UniForm3: TUniForm3;
begin
  Result := TUniForm3(UniMainModule.GetFormInstance(TUniForm3));
end;

procedure TUniForm3.UniBitBtn1Click(Sender: TObject);
var
  FName, FPath : string;
begin
  FPath:=UniServerModule.LocalCachePath;
  FName:='image'+IntToStr(FCnt);
  Inc(FCnt);
  case UniComboBox1.ItemIndex of
    0 :
      begin
        FName:=FName+'.jpg';
        Canvas.SaveToFile(FPath+FName, tiJPG);
      end;
    1 :
      begin
        FName:=FName+'.png';
        Canvas.SaveToFile(FPath+FName, tiPNG);
      end;
    2 :
      begin
        FName:=FName+'.gif';
        Canvas.SaveToFile(FPath+FName, tiGIF);
      end;
    3 :
      begin
        FName:=FName+'.bmp';
        Canvas.SaveToFile(FPath+FName, tiBMP);
      end;
    else
      Exit;
  end;
  UniSession.SendFile(FPath+FName);
//  UniLabel2.Caption:='<a href="'+UniServerModule.LocalCacheURL+FName+'" target="_blank">Click to download</a>';
end;

procedure TUniForm3.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Canvas.AutoSubmit:=False;
end;

end.
