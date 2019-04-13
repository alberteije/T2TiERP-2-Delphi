
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit ChatRoomServerContainer;

interface

uses
  SysUtils, Classes, 
  DSTCPServerTransport,
  DSHTTPCommon, DSHTTP,
  DSServer, DSCommonServer, DBXCommon, DSProxyJavaScript, DSClientMetadata, DSAuth,
  DSSession, IndyPeerImpl, IPPeerServer;

type
  TServerContainerForm = class(TDataModule)
    ChatRoomServer: TDSServer;
    ChatRoomTransport: TDSTCPServerTransport;
    ChatRoomHTTPService: TDSHTTPService;
    ChatRoomAuthenticationManager: TDSAuthenticationManager;
    ChatRoomServerClass: TDSServerClass;
    ChatRoomFileDispatcher: TDSHTTPServiceFileDispatcher;

    /// <summary>
    ///   OnGetClass event for the server class component. Used to map the server methods class to the component.
    /// </summary>
    procedure ChatRoomServerClassGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    /// <summary>
    ///   The OnUserAuthenticate event for the authentication manager component.
    ///   Used to allow or deny initial connection from a client.
    /// </summary>
    procedure ChatRoomAuthenticationManagerUserAuthenticate(Sender: TObject; const Protocol, Context, User,
      Password: string; var valid: Boolean; const UserRoles: TStrings);
    /// <summary>
    ///   The OnUserAuthorize event for the authentication manager component.
    ///   Used to allow or deny specific server method invocation, based on the method or class TRoleAuth.
    /// </summary>
    procedure ChatRoomAuthenticationManagerUserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function IsAlphaNumeric(const Value: String; CantStartWithNumber: Boolean = False): Boolean;
  public
  end;

const
  SUPER_USER_NAME = 'admin';
  SUPER_USER_PASSWORD = 'faster34567890';
  MAX_NAME_LENGTH = 20;

var
  ServerContainerForm: TServerContainerForm;

implementation

uses Windows, ChatRoomServerMethodsUnit, ChatRoomServerUnit;

{$R *.dfm}

procedure TServerContainerForm.ChatRoomAuthenticationManagerUserAuthenticate(Sender: TObject;
  const Protocol, Context, User, Password: string;
  var valid: Boolean; const UserRoles: TStrings);
var
  IsSuperUser: Boolean;
  Session: TDSSession;
begin
  IsSuperUser := (User = SUPER_USER_Name) and (Password = SUPER_USER_PASSWORD);

  //allow a user with no credentials to connect, but don't assign them any roles.
  //this will drastically limit what they are capable of doing on the server.
  if User = EmptyStr then
  begin
    valid := true;
    Exit;
  end;

  Valid := False;
  //Note that we don't care about passwords here. Users don't need a password, they just need
  //to specify a name that isn't already in use.
  if IsSuperUser or
     ((Trim(User) <> EmptyStr) and
     (Trim(User) <> SUPER_USER_NAME) and
     IsAlphaNumeric(User) and
     (Length(User) <= MAX_NAME_LENGTH) and
     not TChatRoomUsers.Instance.UserExists(User)) then
  begin
    //NOTE: We don't add user role entries for 'ChannelBroadcast' or 'ChannelNotify' here because
    //we want to force the clients to use this project's server methods for sending messages.

    //Add a role for logged in users which allows invocation of server methods in the
    //ChatRoomServerMethods unit
    UserRoles.Add('LoggedInUser');

    if IsSuperUser then
      UserRoles.Add('SuperUser');

    Session := TDSSessionManager.GetThreadSession;

    //Invalid user session, so exit
    if Session = nil then
    begin
      valid := False;
      Exit;
    end;

    //Add the user to the list of users
    TChatRoomUsers.Instance.AddUser(User, Session.SessionName);

    valid := true;
  end;
end;

procedure TServerContainerForm.ChatRoomAuthenticationManagerUserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  if (EventObject.AuthorizedRoles = nil) and (EventObject.DeniedRoles = nil) then
  begin
    valid := True;
    Exit;
  end;

  //The UserName passed in here is always goign to be populated from the Session,
  //not from the individual request's user, which prevents hacking in that way and means
  //we don't need to verify the current session's ID matches the session ID corresponding
  //to the user name passed in here. (We can just trust it will.)

  //super user can do whatever he/she wants
  if (EventObject.UserName = SUPER_USER_Name) then
  begin
    valid := true;
    Exit;
  end;

  //don't allow a user who isn't logged in to do anything
  if (EventObject.UserName = EmptyStr) then
  begin
    valid := false;
    Exit;
  end;

  if (EventObject.AuthorizedRoles = nil) or (EventObject.AuthorizedRoles.IndexOf('LoggedInUser') < 0) then
  begin
    valid := false;
    Exit;
  end;

  valid := TChatRoomUsers.Instance.UserExists(EventObject.UserName);
end;

procedure TServerContainerForm.ChatRoomServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TChatRoomServerMethods;
end;

procedure TServerContainerForm.DataModuleDestroy(Sender: TObject);
begin
  ChatRoomServer.Stop;
end;

function TServerContainerForm.IsAlphaNumeric(const Value: String; CantStartWithNumber: Boolean): Boolean;
var
  I: Integer;
  Len: Integer;
  c: Char;
begin
  Result := True;
  Len := Length(Value);
  for I := 1 to Len do
  begin
    c := Value[I];

    //can't start with number
    if CantStartWithNumber and (I = 1) and CharInSet(c, ['0'..'9']) then
      Exit(False);

    if not CharInSet(c, ['0'..'9', 'A'..'Z', 'a'..'z', '_']) then
      Exit(False);
  end;
end;

end.

