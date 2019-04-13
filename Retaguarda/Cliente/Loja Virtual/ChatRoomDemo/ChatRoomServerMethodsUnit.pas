
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit ChatRoomServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, DBXJSON;

type
  TChatRoomServerMethods = class(TDSServerModule)
  private
    /// <summary> Escapes the HTML special characters of the given string.
    /// </summary>
    function GetHTMLEscapedString(const Value: String): String;
  public
    /// <summary> Returns the names of all the users currently logged in.
    /// </summary>
    function GetUserList: TJSONArray;
    /// <summary> Send a message to all users of the chat room.
    /// </summary>
    function SendMessage(const Msg: String): Boolean;
    /// <summary> Send a message to the specific chat room user
    /// </summary>
    function SendMessageToUser(const Msg: String; const UserName: String): Boolean;
  end;

implementation

{$R *.dfm}

uses StrUtils, ChatRoomServerUnit, ChatRoomServerContainer, DSSession;

{ TChatRoomServerMethods2 }

function TChatRoomServerMethods.GetHTMLEscapedString(const Value: String): String;
begin
  Result := Value;

  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;

function TChatRoomServerMethods.GetUserList: TJSONArray;
var
  UserNames: TStringList;
  User: String;
begin
  Result := TJSONArray.Create;
  UserNames := TChatRoomUsers.Instance.GetUserNames;

  //not required, but this way the admin looks like he is always watching you!
  Result.Add('admin');

  for User in UserNames do
    Result.Add(User);

  FreeAndNil(UserNames);
end;

function TChatRoomServerMethods.SendMessage(const Msg: String): Boolean;
var
  MesgTrimmed: String;
  Session: TDSSession;
  JSONMsg: TJSONObject;
begin
  MesgTrimmed := Trim(Msg);

  //no message to send, so just exit
  if Msg = EmptyStr then
    Exit(false);

  //get the current session
  Session := TDSSessionManager.GetThreadSession;

  //if the session is invalid, don't send a message
  if (Session = nil) or (not TChatRoomUsers.Instance.UserExists(Session.UserName)) then
    Exit(false);

  //wrap the message in a JSON object
  JSONMsg := TJSONObject.Create;
  JSONMsg.AddPair(TJSONPair.Create('notificationType', 'message'));
  JSONMsg.AddPair(TJSONPair.Create('from', Session.UserName));
  JSONMsg.AddPair(TJSONPair.Create('message', GetHTMLEscapedString(MesgTrimmed)));

  //Send the message to all logged in users
  Result := ServerContainerForm.ChatRoomServer.BroadcastMessage(CHAT_ROOM_ID, JSONMsg);
end;

function TChatRoomServerMethods.SendMessageToUser(const Msg, UserName: String): Boolean;
var
  MesgTrimmed: String;
  Session: TDSSession;
  JSONMsg: TJSONObject;
  Resp: TJSONValue;
begin
  MesgTrimmed := Trim(Msg);

  //no message to send, so just exit
  if Msg = EmptyStr then
    Exit(false);

  //no user to send message to
  if not TChatRoomUsers.Instance.UserExists(UserName) then
    Exit(false);

  //get the current session
  Session := TDSSessionManager.GetThreadSession;

  //if the session is invalid, don't send a message
  if (Session = nil) or (not TChatRoomUsers.Instance.UserExists(Session.UserName)) then
    Exit(false);

  //don't message yourself!
  if AnsiCompareText(Session.UserName, UserName) = 0 then
    Exit(false);

  //wrap the message in a JSON object
  JSONMsg := TJSONObject.Create;
  JSONMsg.AddPair(TJSONPair.Create('notificationType', 'privatemessage'));
  JSONMsg.AddPair(TJSONPair.Create('from', Session.UserName));
  JSONMsg.AddPair(TJSONPair.Create('message', GetHTMLEscapedString(MesgTrimmed)));

  //Send the message to all logged in users
  Result := ServerContainerForm.ChatRoomServer.NotifyCallback(UserName, UserName, JSONMsg, Resp);

  //we don't care about the response message from the other client, only if it was successfully sent
  FreeAndNil(Resp);
end;

end.

