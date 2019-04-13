unit NotificationService;

interface

uses
  Classes,
  Generics.Collections,
  SysUtils;

type
  TNotificationService = class
  private
    FSubscribers: TDictionary<TNotifyEvent, TGUID>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SendMessage(Sender: TObject; MessageID: TGUID);
    procedure Subscribe(Event: TNotifyEvent; MessageID: TGUID);
    procedure UnSubscribe(Event: TNotifyEvent);
  end;

function GetNotificationService: TNotificationService;

implementation

var
  Instance: TNotificationService;

function GetNotificationService: TNotificationService;
begin
  if Instance = nil then
    Instance := TNotificationService.Create;
  Result := Instance;
end;

constructor TNotificationService.Create;
begin
  FSubscribers := TDictionary<TNotifyEvent, TGUID>.Create;
end;

destructor TNotificationService.Destroy;
begin
  FSubscribers.Free;
  inherited;
end;

procedure TNotificationService.SendMessage(Sender: TObject; MessageID: TGUID);
var
  Pair: TPair<TNotifyEvent, TGUID>;
begin
  for Pair in FSubscribers do
  begin
    if IsEqualGUID(Pair.Value,MessageID) then
      Pair.Key(Sender);
  end;
end;

procedure TNotificationService.Subscribe(Event: TNotifyEvent; MessageID: TGUID);
begin
  FSubscribers.AddOrSetValue(Event, MessageID);
end;

procedure TNotificationService.UnSubscribe(Event: TNotifyEvent);
begin
  FSubscribers.Remove(Event);
end;

initialization

finalization

Instance.Free;

end.
