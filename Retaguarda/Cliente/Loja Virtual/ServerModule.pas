unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  MimeTable.AddMimeType('xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', False);

  // correct place to initialize global FormatSettings parameters
  PFmtSettings.DateSeparator := '/';
  PFmtSettings.CurrencyFormat := 0;
  PFmtSettings.CurrencyString := '$';
  PFmtSettings.ShortDateFormat := 'dd/mm/yyyy';
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
