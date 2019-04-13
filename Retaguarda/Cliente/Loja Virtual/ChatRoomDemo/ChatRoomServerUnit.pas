//
// ChatRoom Server demo
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//

unit ChatRoomServerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Generics.Collections, StdCtrls, DSServer, DbxDataSnap, DBXCommon, DB, SqlExpr, Menus, DSHTTPLayer,
  DSCommonServer, IndyPeerImpl, IPPeerClient, Data.DbxHTTPLayer;

type
  /// <summary>
  ///    Thread for broadcasting a message to all users, notifying them that
  ///    a user has logged in or out.
  /// </summary>
  TUserNotifyThread = class(TThread)
  protected
    FServer: TDSServer;
    FUserName: String;
    FWasAdded: Boolean;
  public
    constructor Create(Server: TDSServer; UserName: String; WasAdded: Boolean); Virtual;
    procedure Execute; override;
  end;

  /// <summary>
  ///   Boots the user with the given name.
  /// </summary>
  TBootUserThread = class(TThread)
  protected
    FServer: TDSServer;
    FUserName: String;
  public
    constructor Create(Server: TDSServer; UserName: String); Virtual;
    procedure Execute; override;
  end;

  /// <summary> A no-arg procedure which will tell the UI to update its user list. </summary>
  TUIHookCallback = procedure of object;

  /// <summary> Represents a single logged in user of the chat room. The ID of his session is
  ///    held here as logging in and out of the chat room is done by active sessions with the server.
  /// </summary>
  TChatRoomUser = class
  private
    FName: String;
    FSessionId: String;
  public
    property Name: String read FName write FName;
    property SessionId: String read FSessionId write FSessionId;
  end;

  /// <summary> A singleton class for managing a list of logged in users.
  /// </summary>
  /// <remarks> The user authenticate function of the server container unit chooses which logging in
  ///   users are allowed and which are denied. If a login is allowed than a session is created and
  ///   when that happens a new user record will be created.
  /// </remarks>
  TChatRoomUsers = class
  private
    FUsers: TList<TChatRoomUser>;
    FUIHook: TUIHookCallback;

    constructor Create; virtual;
    procedure NotifyUI;
    procedure NotifyUserChange(UserName: String; WasAdded: Boolean);
  public
    destructor Destroy; override;

    /// <summary> Returns the single instance of this class. If none exists yet, it will be created.
    /// </summary>
    class function Instance: TChatRoomUsers;
    /// <summary> Returns true if a user with the given name (ignore case) is in the user list.
    /// </summary>
    function UserExists(UserName: String): Boolean;
    /// <summary> Removes the given user, if the name was found
    /// </summary>
    procedure RemoveUser(UserName: String);
    /// <summary> Adds the user to the list. If the user is found,
    ///    replaces the previous session ID with the one specified here.
    /// </summary>
    procedure AddUser(UserName: String; SessionId: String);
    /// <summary> Returns a list of the user names
    /// </summary>
    function GetUserNames: TStringList;
    /// <summary> Set a no-args procedure to be notified when the user list changes
    /// </summary>
    property UIHook: TUIHookCallback read FUIHook write FUIHook;
  end;

  TChatRoomForm = class(TForm)
    UsersLabel: TLabel;
    UserListBox: TListBox;
    AdminMessageLabel: TLabel;
    AdminMessageField: TEdit;
    AdminMessageButton: TButton;
    OpenBrowserButton: TButton;
    ProxyButton: TButton;
    ProxyConnection: TSQLConnection;
    PopupMenu1: TPopupMenu;
    BootSelectedUser1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure AdminMessageButtonClick(Sender: TObject);
    procedure OpenBrowserButtonClick(Sender: TObject);
    procedure ProxyButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BootSelectedUser1Click(Sender: TObject);
  public
    /// <summary> Updates the user list shown to the user to reflect the current state of TChatRoomUsers
    /// </summary>
    procedure UpdateUserList;
  end;

const
  CHAT_ROOM_ID = 'ChatRoom';

var
  ChatRoomForm: TChatRoomForm;
  ChatRoomUsers: TChatRoomUsers;
  ChatRoomUsersDestroyed: Boolean;

implementation

uses ChatRoomServerContainer, DBXJSON, DSSession, ShellApi, StrUtils, DSProxyJavaScript, DBXPlatform;

{$R *.dfm}

{ TChatRoomUsers }

constructor TChatRoomUsers.Create;
begin
  ChatRoomUsersDestroyed := False;
  FUsers := TList<TChatRoomUser>.Create();
end;

destructor TChatRoomUsers.Destroy;
var
  User: TChatRoomUser;
begin
  ChatRoomUsersDestroyed := True;
  if FUsers <> nil then
  begin
    for User in FUsers do
      User.Free;  
  end;
  FreeAndNil(FUsers);
  inherited;
end;

class function TChatRoomUsers.Instance: TChatRoomUsers;
begin
  //If the instance has been freed, return nil
  if ChatRoomUsersDestroyed then
    Exit(nil);

  if (ChatRoomUsers = nil) then
    ChatRoomUsers := TChatRoomUsers.Create;

  Result := ChatRoomUsers;
end;

procedure TChatRoomUsers.NotifyUI;
begin
  if Assigned(FUIHook) then
    TThread.Queue(nil, procedure begin FUIHook; end);
end;

procedure TChatRoomUsers.NotifyUserChange(UserName: String; WasAdded: Boolean);
begin
  //start a thread to broadcast user event message to all users
  TUserNotifyThread.Create(ServerContainerForm.ChatRoomServer, UserName, WasAdded);
end;

function TChatRoomUsers.GetUserNames: TStringList;
var
  User: TChatRoomUser;
begin
  Result := TStringList.Create;

  if ChatRoomUsersDestroyed then
    Exit;

  System.TMonitor.Enter(FUsers);
  try
    for User in FUsers do
    begin
      Result.Add(User.Name);
    end;
  finally
    System.TMonitor.Exit(FUsers);
  end;
end;

procedure TChatRoomUsers.AddUser(UserName, SessionId: String);
var
  User: TChatRoomUser;
begin
  if (UserName = EmptyStr) or ChatRoomUsersDestroyed then
    Exit;

  System.TMonitor.Enter(FUsers);
  try
    for User in FUsers do
    begin
      //if you found a user with the specified name, update his session ID and exit
      if CompareText(User.Name, UserName) = 0 then
      begin
        User.SessionId := SessionId;
        Exit;
      end;
    end;

    //if no user with the name was found, add a new one
    User := TChatRoomUser.Create;
    User.Name := UserName;
    User.SessionId := SessionId;

    FUsers.Add(User);

    NotifyUserChange(UserName, True);
  finally
    System.TMonitor.Exit(FUsers);
    NotifyUI;
  end;
end;

procedure TChatRoomUsers.RemoveUser(UserName: String);
var
  I: Integer;
  User: TChatRoomUser;
begin
  if (UserName = EmptyStr) or ChatRoomUsersDestroyed then
    Exit;

  System.TMonitor.Enter(FUsers);
  try
    for I := 0 to FUsers.Count - 1 do
    begin
      User := FUsers.Items[I];
      //remove user if the name matches and exit
      if CompareText(User.Name, UserName) = 0 then
      begin
        FUsers.Remove(User);
        FreeAndNil(User);
        NotifyUserChange(UserName, False);
        Exit;
      end;
    end;
  finally
    System.TMonitor.Exit(FUsers);
    NotifyUI;
  end;
end;

function TChatRoomUsers.UserExists(UserName: String): Boolean;
var
  I: Integer;
  User: TChatRoomUser;
begin
  if (UserName = EmptyStr) or ChatRoomUsersDestroyed then
    Exit(False);

  System.TMonitor.Enter(FUsers);
  try
    for I := 0 to FUsers.Count - 1 do
    begin
      User := FUsers.Items[I];
      if CompareText(User.Name, UserName) = 0 then
        Exit(True);
    end;
    Exit(False);
  finally
    System.TMonitor.Exit(FUsers);
  end;
end;

{ TChatRoomForm }

procedure TChatRoomForm.AdminMessageButtonClick(Sender: TObject);
var
  Msg: String;
  JSONMsg: TJSONObject;
begin
  Msg := Trim(AdminMessageField.Text);

  //no message to send, so just exit
  if Msg = EmptyStr then
    Exit;

  //wrap the message in a JSON object
  JSONMsg := TJSONObject.Create;
  JSONMsg.AddPair(TJSONPair.Create('notificationType', 'message'));
  JSONMsg.AddPair(TJSONPair.Create('from', SUPER_USER_NAME));
  JSONMsg.AddPair(TJSONPair.Create('message', Msg));

  //Send the typed message to all logged in users
  //NOTE: the call to broadcast should really be done in its own thread to avoid locking the UI
  if ServerContainerForm.ChatRoomServer.BroadcastMessage(CHAT_ROOM_ID, JSONMsg) then
    AdminMessageField.Text := EmptyStr
  else
    ShowMessage('Failed to broadcast message. Sorry!');
end;

procedure TChatRoomForm.BootSelectedUser1Click(Sender: TObject);
var
  I: Integer;
  UserName: String;
begin
  UserName := EmptyStr;

  for I := 0 to UserListBox.Count - 1 do
    if UserListBox.Selected[I] then
    begin
      UserName := UserListBox.Items[I];
      break;
    end;

  if UserName <> EmptyStr then
  begin
    TBootUserThread.Create(ServerContainerForm.ChatRoomServer, UserName);
  end;
end;

procedure TChatRoomForm.FormCreate(Sender: TObject);
begin
  //Add a procedure to call for updating the UI when the user list changes
  TChatRoomUsers.Instance.FUIHook := UpdateUserList;

  //NOTE: Users are added in the authentication manager OnUserAuthenticate function for this example,
  //so we only need to listen to SessionClose events
  TDSSessionManager.Instance.AddSessionEvent(
    procedure(Sender: TObject;
              const EventType: TDSSessionEventType;
              const Session: TDSSession)
    begin
      case EventType of
        SessionClose:
          TChatRoomUsers.Instance.RemoveUser(Session.UserName);
      end;
    end);
end;

procedure TChatRoomForm.FormDestroy(Sender: TObject);
begin
  TChatRoomUsers.Instance.UIHook := nil;
  TChatRoomUsers.Instance.Free;
end;

procedure TChatRoomForm.OpenBrowserButtonClick(Sender: TObject);
var
  LURL: string;
begin
  LURL := Format('http://localhost:%s/ChatRoom.html', [IntToStr(Integer(ServerContainerForm.ChatRoomHTTPService.HttpPort))]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TChatRoomForm.ProxyButtonClick(Sender: TObject);
var
  JSProxy : TDSJavaScriptProxyWriter;
  OutputFile : String;
//  ExcludedClasses: TDBXStringArray;
//  IncludedMethods: TDBXStringArray;
begin
  OutputFile := ExpandFileName(ServerContainerForm.ChatRoomFileDispatcher.RootDirectory);

  JSProxy := TDSJavaScriptProxyWriter.Create();

//  SetLength(ExcludedClasses, 1);
//  ExcludedClasses[0] := 'DSMetadata';
//
//  SetLength(IncludedMethods, 8);
//  IncludedMethods[0] := 'DSAdmin.ConsumeClientChannel';
//  IncludedMethods[1] := 'DSAdmin.CloseClientChannel';
//  IncludedMethods[2] := 'DSAdmin.RegisterClientCallbackServer';
//  IncludedMethods[3] := 'DSAdmin.UnregisterClientCallback';
//  IncludedMethods[4] := 'DSAdmin.ClearSession';
//  IncludedMethods[5] := 'TChatRoomServerMethods.GetUserList';
//  IncludedMethods[6] := 'TChatRoomServerMethods.SendMessage';
//  IncludedMethods[7] := 'TChatRoomServerMethods.SendMessageToUser';
//
//  JSProxy.ExcludeClasses := ExcludedClasses;
//  JSProxy.IncludeMethods := IncludedMethods;

  try
    if not DirectoryExists(OutputFile) then
      ForceDirectories(OutputFile);

    if ( not AnsiEndsStr('\', OutputFile) ) and
       ( not AnsiEndsStr('/', OutputFile) ) then
      OutputFile := OutputFile + SysUtils.PathDelim;

    //put the proxy file in a subdirectory of the root folder
    OutputFile := OutputFile + SysUtils.PathDelim + 'webfiles' + SysUtils.PathDelim;

    //name the proxy file
    OutputFile := OutputFile + 'JSProxy.js';

    ProxyConnection.Connected := true;
    JSProxy.UpdateJSProxyFile(ProxyConnection.DBXConnection, OutputFile);
    ProxyConnection.Close;
  finally
    JSProxy.Free;
  end;
end;

procedure TChatRoomForm.UpdateUserList;
var
  UserNames: TStringList;
  UserName: String;
begin
  UserNames := nil;

  if ChatRoomUsersDestroyed or not Assigned(Self) or not Assigned(UserListBox) then
    Exit;

  UserListBox.Items.BeginUpdate;
  try
    UserListBox.Clear;
    UserNames := TChatRoomUsers.Instance.GetUserNames;

    for UserName in UserNames do
      UserListBox.Items.Add(UserName);
  finally
    UserListBox.Items.EndUpdate;
    FreeAndNil(UserNames);
  end;
end;

{ TUserNotifyThread }

constructor TUserNotifyThread.Create(Server: TDSServer; UserName: String; WasAdded: Boolean);
begin
  inherited Create;
  FServer := Server;
  FUserName := UserName;
  FWasAdded := WasAdded;
end;

procedure TUserNotifyThread.Execute;
var
  Msg: TJSONObject;
  EventType: String;
begin
  inherited;
  FreeOnTerminate := True;

  if FWasAdded then
    EventType := 'user_login'
  else
    EventType := 'user_logout';

  //create a JSON object with a message describing the user login/logout event
  Msg := TJSONObject.Create;
  Msg.AddPair(TJSONPair.Create('notificationType', EventType));
  Msg.AddPair(TJSONPair.Create('user', FUserName));

  try
    //give time for the client's callback to be added or removed
    Sleep(1000);

    //send a message to all clients that a user either logged in, or logged out
    FServer.BroadcastMessage(CHAT_ROOM_ID, Msg);
  except
  end;
end;

{ TBootUserThread }

constructor TBootUserThread.Create(Server: TDSServer; UserName: String);
begin
  inherited Create;
  FServer := Server;
  FUserName := UserName;
end;

procedure TBootUserThread.Execute;
var
  Tunnel: TDSCallbackTunnel;
  OldSecurityToken: String;
  SecurityToken: String;
begin
  inherited;
  FreeOnTerminate := True;

  if (FServer = nil) or (FUserName = EmptyStr) then
    Exit;

  Tunnel := FServer.GetCallbackTunnel(FUserName);

  if Tunnel <> nil then
  begin
    SecurityToken := 'ThisCanBeAnything';
    OldSecurityToken := Tunnel.SecurityToken;

    //change SecurityToken on the tunnel so the server can kill the callback
    //and nobody else can do anything with it in the meantime.
    Tunnel.SecurityToken := SecurityToken;

    //unregister the callback
    FServer.UnregisterChannelCallback(CHAT_ROOM_ID, FUserName, SecurityToken);

    //remvoe the user from the user list
    TChatRoomUsers.Instance.RemoveUser(FUserName);
  end;
end;

end.

