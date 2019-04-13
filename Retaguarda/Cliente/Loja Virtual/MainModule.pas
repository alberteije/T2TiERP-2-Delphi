unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, DB, DBClient, ADODB, uniGUITypes, Main;

type
  TUniMainModule = class(TUniGUIMainModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1CustomerID: TWideStringField;
    ADOQuery1CompanyName: TWideStringField;
    ADOQuery1ContactName: TWideStringField;
    ADOQuery1ContactTitle: TWideStringField;
    ADOQuery1Address: TWideStringField;
    ADOQuery1City: TWideStringField;
    ADOQuery1Region: TWideStringField;
    ADOQuery1PostalCode: TWideStringField;
    ADOQuery1Country: TWideStringField;
    ADOQuery1Phone: TWideStringField;
    ADOQuery1Fax: TWideStringField;
    DataSource1: TDataSource;
    DataSource: TDataSource;
    ADOConnection2: TADOConnection;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    ADOQuery2: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    WideStringField12: TWideStringField;
    WideStringField13: TWideStringField;
    WideStringField14: TWideStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    WideStringField17: TWideStringField;
    WideStringField18: TWideStringField;
    WideStringField19: TWideStringField;
    WideStringField20: TWideStringField;
    WideStringField21: TWideStringField;
    WideStringField22: TWideStringField;
    ADOConnection3: TADOConnection;
    DataSource5: TDataSource;
    DataSource4: TDataSource;
    ADOConnection4: TADOConnection;
    ADOQuery6: TADOQuery;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleHandleRequest(ASession: TObject;
      var Handled: Boolean);


  private
    FCacheInited: Boolean;
    FolderPath: string;
    { Private declarations }
  public
    FirstName, LastName : string;
    Main : TMainForm;
    CommonPath : string;
    procedure InitCacheFiles;
    procedure LoadClientFromStream(ClientData: TClientDataSet; CDS: string);

    { Public declarations }
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication,  uniGUIUtils, uniStrUtils,
  Windows, IniFiles;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.LoadClientFromStream(ClientData: TClientDataSet; CDS: string);
var
  F : TFileStream;
begin
  F := TFileStream.Create(FolderPath + CDS, fmOpenRead + fmShareDenyNone);
  try
    ClientData.LoadFromStream(F);
  finally
    F.Free;
  end;
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(UniServerModule.FilesFolderPath+'DatabasePath.ini');
  try
    FolderPath :=  TranslateFullPath(UniServerModule.StartPath, Ini.ReadString('path', 'current', '..\..\CommonPath'));
  finally
    Ini.Free;
  end;
end;



procedure TUniMainModule.UniGUIMainModuleHandleRequest(ASession: TObject;
  var Handled: Boolean);
begin

end;

// Create DB Files on demand when requested. Doing this will improve session creation speed.
procedure TUniMainModule.InitCacheFiles;
const
{$ifdef CPUX64}
  DBConnStr = 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=[DBPATH];Persist Security Info=False';
{$else}
  DBConnStr = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=[DBPATH];Persist Security Info=False';
{$endif}

var
  //for ADOConnection
  S1, S2, S3, S4, SrcFile, CacheFile1, CacheFile2, CacheFile3, CacheFile4:string;
begin
  if not FCacheInited then
  begin
    FCacheInited := True;

    //for ADOQuery1-2
    ADOConnection1.Connected := False;
    // sPath :=  TranslateFullPath(UniServerModule.StartPath,'..\..\CommonData\');
     //sPath := UniServerModule.FilesFolderPath;
    SrcFile := FolderPath + 'fddemo.mdb';

    CacheFile1 := UniServerModule.LocalCachePath+'fddemoFilter1.mdb';
    CopyFile(PChar(SrcFile),PChar(CacheFile1),false);
    S1 := DBConnStr;
    S1 := StringReplace(S1, '[DBPATH]', CacheFile1, [rfReplaceAll]);
    ADOConnection1.ConnectionString := S1;
    ADOQuery1.Connection := ADOConnection1;
    ADOQuery2.Connection := ADOConnection1;

     //for ADOQuery3-4
    ADOConnection2.Connected := False;
    CacheFile2 := UniServerModule.LocalCachePath+'\fddemoFilter2.mdb';
    CopyFile(PChar(SrcFile),PChar(CacheFile2),false);
    S2 := DBConnStr;
    S2 := StringReplace(S2, '[DBPATH]', CacheFile2, [rfReplaceAll]);
    ADOConnection2.ConnectionString := S2;
    ADOQuery3.Connection := ADOConnection2;
    ADOQuery4.Connection := ADOConnection2;

     //for ADOQuery5
    ADOConnection3.Connected := False;
    CacheFile3 := UniServerModule.LocalCachePath+'\fddemoGroupSorting.mdb';
    CopyFile(PChar(SrcFile),PChar(CacheFile3),false);
    S3 := DBConnStr;
    S3 := StringReplace(S3, '[DBPATH]', CacheFile3, [rfReplaceAll]);
    ADOConnection3.ConnectionString := S3;
    ADOQuery5.Connection := ADOConnection3;

      //for ADOQuery6
    ADOConnection4.Connected := False;
    CacheFile4 := UniServerModule.LocalCachePath+'\fddemoSQL.mdb';
    CopyFile(PChar(SrcFile),PChar(CacheFile4),false);
    S4 := DBConnStr;
    S4 := StringReplace(S4, '[DBPATH]', CacheFile4, [rfReplaceAll]);
    ADOConnection4.ConnectionString := S4;
    ADOQuery6.Connection := ADOConnection4;
  end;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
