unit ShowSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniSyntaxEditor, uniImageList;

type
  TSourceForm = class(TUniForm)
    UniPageControl1: TUniPageControl;
    UniNativeImageList1: TUniNativeImageList;
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
    procedure AddSource(Filename: string);
  public
    { Public declarations }
    SourceName : string;
  end;

function SourceForm: TSourceForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, uniStrUtils;

function SourceForm: TSourceForm;
begin
  Result := TSourceForm(UniMainModule.GetFormInstance(TSourceForm));
end;

procedure TSourceForm.AddSource(Filename: string);
var
  Sht : TUniTabSheet;
begin
  if FileExists(Filename) then
  begin
    Sht := TUniTabSheet.Create(Self);
    Sht.PageControl := UniPageControl1;
    Sht.Caption := ExtractFileName(Filename);
    if Pos('.pas', Filename)>0 then
      Sht.ImageIndex := 0
    else if Pos('.dfm',Filename)>0  then
      Sht.ImageIndex := 1;


    with TUniSyntaxEdit.Create(Self) do
    begin
      Parent := Sht;
      Align := alClient;
      ReadOnly := True;
      {$ifdef UNICODE}
      Lines.LoadFromFile(Filename, TEncoding.UTF8);
      {$else}
      Lines.LoadFromFile(Filename);
      {$endif}
    end;
  end;
end;

procedure TSourceForm.UniFormBeforeShow(Sender: TObject);
const
  Exts : array [1..2] of string = ('pas','dfm');
var
  Path : string;
  Folder : string;
  Sr : TSearchRec;
  I : Integer;
begin
  Path := UniServerModule.StartPath + 'units\';

  AddSource(Path + SourceName+'.pas');
  AddSource(Path + SourceName+'.dfm');

  if SameText(SourceName, 'umain') then
    Folder := UniServerModule.StartPath
  else
    Folder := Path + SourceName+'\';

  if SysUtils.DirectoryExists(Folder) then
  begin
    for I := Low(Exts) to High(Exts) do
    begin
      if SysUtils.FindFirst(Folder+'*.'+Exts[I], faAnyFile, sr) = 0 then
      begin
        repeat
          if sr.Attr and faDirectory = 0 then
            AddSource(Folder + sr.Name);

        until SysUtils.FindNext(Sr)<>0;
      end;
      SysUtils.FindClose(Sr);
    end;
  end;

  SourceForm.UniPageControl1.ActivePageIndex := 0;

end;

end.
