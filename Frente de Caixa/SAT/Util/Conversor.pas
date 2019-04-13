unit Conversor;

interface

uses Classes, DBXJSON, SysUtils;

type
  TConversor = class
  private
    class function ExtractValueFromJSONObjectStream(pStream: TStringStream): string;
    class function ExtractValueFromJSONPairStr(pStr: string): string;
  public
    class function JSONObjectStreamToBoolean(pStream: TStringStream): Boolean;
    class function JSONObjectStreamToInteger(pStream: TStringStream): Integer;
    class function JSONPairStrToBoolean(pStr: string): Boolean;
    class function JSONArrayStreamToJSONArray(pStream: TStringStream): TJSONArray;
    class function ListJSONArrayStreamToJSONArray(pStream: TStringStream; pIdx: Integer): TJSONArray;
  end;

implementation

{ TConversor }

class function TConversor.ExtractValueFromJSONObjectStream(pStream: TStringStream): string;
var
  jObj: TJSONObject;
begin
  jObj := TJSONObject.Create;
  try
    jObj.Parse(pStream.Bytes, 0);

    Result := jObj.Get(0).JsonValue.ToString;

    //Remove Couchetes
    Result := Copy(Result,3,Length(Result)-4);
  finally
    jObj.Free;
  end;
end;

class function TConversor.ExtractValueFromJSONPairStr(pStr: string): string;
var
  I: Integer;
  Valor: string;
begin
  Valor := pStr;

  I := Pos('[',Valor);
  Delete(Valor,1,I);

  I := Pos(']',Valor);
  Result := Copy(Valor,1,I-1);
end;

class function TConversor.JSONObjectStreamToBoolean(pStream: TStringStream): Boolean;
begin
  Result := StrToBoolDef(ExtractValueFromJSONObjectStream(pStream),False);
end;

class function TConversor.JSONObjectStreamToInteger(
  pStream: TStringStream): Integer;
begin
  Result := StrToIntDef(ExtractValueFromJSONObjectStream(pStream),-1);
end;

class function TConversor.JSONPairStrToBoolean(pStr: string): Boolean;
begin
  Result := StrToBoolDef(ExtractValueFromJSONPairStr(pStr),False);
end;

class function TConversor.JSONArrayStreamToJSONArray(pStream: TStringStream): TJSONArray;
var
  jObj: TJSONObject;
  jPair: TJSONPair;
begin
  jObj := TJSONObject.Create;
  try
    jObj.Parse(pStream.Bytes, 0);
    jPair := jObj.Get(0);

    Result := (TJSONArray(jPair.JsonValue).Get(0) as TJSONArray).Clone as TJSONArray;
  finally
    jObj.Free;
  end;
end;

class function TConversor.ListJSONArrayStreamToJSONArray(pStream: TStringStream; pIdx: Integer): TJSONArray;
var
  A: TJSONArray;
begin
  A := JSONArrayStreamToJSONArray(pStream);
  try
    Result := A.Get(pIdx).Clone as TJSONArray;
  finally
    A.Free;
  end;
end;

end.
