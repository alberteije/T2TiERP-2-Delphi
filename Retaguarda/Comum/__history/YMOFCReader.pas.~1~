//----------------------------------------------------------------------------//
//- Y O U N G A R T S   O F C   R E A D E R                                  -//
//----------------------------------------------------------------------------//
//- Info:        OFC Bank Format Reader                                      -//
//-              (Freeware with source)                                      -//
//-                                                                          -//
//- Version:     1.00        22.March 2006                                   -//
//- Author:      Eduardo Bento da Rocha (YoungArts)                          -//
//- E-Mail:      eduardo@youngarts.com.br                                    -//
//-                                                                          -//
//- Description:                                                             -//
//-                                                                          -//
//-   OFC Reader. Easy to use. Opensource.                                   -//
//-   OFC - Open Financial Connectivity - Its a royalty-free data import     -//
//-   format used to transfer bank information to financial softwares.       -//
//-   This component read a .ofc file into a type class easy to use. See     -//
//-   below a little example:                                                -//
//-                                                                          -//
//-   YMOFCReader1.OFCFile := 'c:\ExtrCC81507.ofc';                          -//
//-   YMOFCReader1.Process;                                                  -//
//-   ListBox1.Clear;                                                        -//
//-   for i := 0 to YMOFCReader1.Count-1 do                                  -//
//-   begin                                                                  -//
//-     ListBox1.Items.Add(YMOFCReader1.Get(i).Desc + ' ' +                  -//
//-                        FloatToStr(YMOFCReader1.Get(i).Value));           -//
//-   end;                                                                   -//
//-   Label1.Caption := 'Saldo Inicial: ' +                                  -//
//-                  FormatFloat('###,##0.00', YMOFCReader1.InitialBalance); -//
//-   Label2.Caption := 'Saldo Final: ' +                                    -//
//-                  FormatFloat('###,##0.00', YMOFCReader1.FinalBalance);   -//
//-                                                                          -//
//----------------------------------------------------------------------------//

unit YMOFCReader;

interface

uses classes, SysUtils, Controls;

type
  TOFCItem = class
    MovType : integer;
    MovDate : TDate;
    Value : double;
    ID : string;
    Document : string;
    Desc : string;
  end;

  TYMOFCReader = class(TComponent)
  public
    BankID : integer;
    AccountID : string;
    AccountType : string;
    InitialBalance : double;
    FinalBalance : double;
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    function Process: boolean;
    function Get(iIndex: integer): TOFCItem;
    function Count: integer;
  private
    FOFCFile : string;
    FListItems : TList;
    procedure Clear;
    procedure Delete( iIndex: integer );
    function Add: TOFCItem;
    function PrepareFloat( sString : string ) : string;
    function InfLine ( sLine : string ): string;
    function FindString ( sSubString, sString : string ): boolean;
    function ReplaceString(sString: string; sOld: string; sNew: string; bInsensitive : boolean = true): string;
  protected
  published
    property OFCFile: string read FOFCFile write FOFCFile;
  end;

procedure Register;

implementation

constructor TYMOFCReader.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListItems := TList.Create;
end;

destructor TYMOFCReader.Destroy;
begin
  FListItems.Free;
  inherited Destroy;
end;

procedure TYMOFCReader.Delete( iIndex: integer );
begin
  TOFCItem(FListItems.Items[iIndex]).Free;
  FListItems.Delete( iIndex );
end;

procedure TYMOFCReader.Clear;
var
  i: integer;
  oPointer : Pointer;
begin
  while FListItems.Count > 0 do
    Delete(0);
  FListItems.Clear;
end;

function TYMOFCReader.Count: integer;
begin
  Result := FListItems.Count;
end;

function TYMOFCReader.Get(iIndex: integer): TOFCItem;
begin
  Result := TOFCItem(FListItems.Items[iIndex]);
end;

function TYMOFCReader.Process: boolean;
var
  oFile : TStringList;
  i : integer;
  bOfc : boolean;
  oItem : TOFCItem;
  sLine : string;
  dBalance : double;
begin
  Result := false;
  Clear;
  bOfc := false; 
  if not FileExists(FOFCFile) then
    exit;
  oFile := TStringList.Create;
  oFile.LoadFromFile(FOFCFile);
  dBalance := 0;
  i := 0;
  while i < oFile.Count do
  begin
    sLine := oFile.Strings[i];
    if FindString('<OFC>', sLine) then
      bOfc := true;
    if bOfc then
    begin
      // -----------------------------------------------------------------------
      // BankID
      if FindString('<BANKID>', sLine) then BankID := StrToIntDef(InfLine(sLine), 0);
      // -----------------------------------------------------------------------
      // AccountID
      if FindString('<ACCTID>', sLine) then AccountID := InfLine(sLine);
      // -----------------------------------------------------------------------
      // AccountType
      if FindString('<ACCTTYPE>', sLine) then AccountType := InfLine(sLine);
      // -----------------------------------------------------------------------
      // FinalBalance
      if FindString('<LEDGER>', sLine) then FinalBalance := StrToFloat(PrepareFloat(InfLine(sLine)));
      // -----------------------------------------------------------------------
      // Moviment
      if FindString('<STMTTRN>', sLine) then
      begin
        oItem := Add;
        while not FindString('</STMTTRN>', sLine) do
        begin
          Inc(i);
          sLine := oFile.Strings[i];
          if FindString('<TRNTYPE>',  sLine) then oItem.MovType := StrToIntDef(InfLine(sLine), 0);
          if FindString('<DTPOSTED>', sLine) then oItem.MovDate := EncodeDate(StrToIntDef(copy(InfLine(sLine),1,4), 0),
                                                                              StrToIntDef(copy(InfLine(sLine),5,2), 0),
                                                                              StrToIntDef(copy(InfLine(sLine),7,2), 0));
          if FindString('<FITID>',    sLine) then oItem.ID := InfLine(sLine);
          if FindString('<CHKNUM>',   sLine) then oItem.Document := InfLine(sLine);
          if FindString('<MEMO>',     sLine) then oItem.Desc := InfLine(sLine);
          if FindString('<TRNAMT>',   sLine) then
          begin
            oItem.Value := StrToFloat(PrepareFloat(InfLine(sLine)));
            dBalance := dBalance - oItem.Value;
          end;
        end;
      end;
      // -----------------------------------------------------------------------
    end;
    Inc(i);
  end;
  InitialBalance := FinalBalance + dBalance;
  Result := bOfc;
end;

function TYMOFCReader.PrepareFloat( sString : string ) : string;
begin
  Result := sString;
  Result := ReplaceString(Result, '.', DecimalSeparator);
  Result := ReplaceString(Result, ',', DecimalSeparator);
end;

function TYMOFCReader.ReplaceString(sString: string; sOld: string; sNew: string; bInsensitive : boolean = true): string;
var
   iPosition: integer ;
   sTempNew: string ;
begin
   iPosition := 1;
   sTempNew := '';
   while (iPosition > 0) do
   begin
      if bInsensitive then
        iPosition := AnsiPos(UpperCase(sOld),UpperCase(sString))
      else
        iPosition := AnsiPos(sOld,sString);
      if (iPosition > 0) then
      begin
         sTempNew := sTempNew + copy(sString, 1, iPosition - 1) + sNew;
         sString := copy(sString, iPosition + Length(sOld), Length(sString) );
      end;
   end;
   sTempNew := sTempNew + sString;
   Result := (sTempNew);
end;

function TYMOFCReader.InfLine ( sLine : string ): string;
var
  iTemp, jTemp : integer;
begin
  Result := '';
  sLine := Trim(sLine);
  if FindString('>', sLine) then
  begin
    sLine := Trim(sLine);
    iTemp := Pos('>', sLine);
    Result := copy(sLine, iTemp+1, Length(sLine)-iTemp+1);
    jTemp := Pos('<', Result);
    Result := copy(Result, 1,jTemp-1 );
  end;
end;

function TYMOFCReader.Add: TOFCItem;
var
  oItem : TOFCItem;
begin
  oItem := TOFCItem.Create;
  FListItems.Add(oItem);
  Result := oItem;
end;

function TYMOFCReader.FindString ( sSubString, sString : string ): boolean;
begin
  Result := Pos(UpperCase(sSubString), UpperCase(sString)) > 0;
end;

procedure Register;
begin
  RegisterComponents('YoungArts', [TYMOFCReader]);
end;

end.
