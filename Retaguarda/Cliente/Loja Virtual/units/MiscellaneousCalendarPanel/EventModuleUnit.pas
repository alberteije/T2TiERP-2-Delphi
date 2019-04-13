unit EventModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniCheckBox, uniDateTimePicker, uniEdit, uniLabel,
  uniMultiItem, uniComboBox, uniGroupBox, uniGUIBaseClasses, uniButton,
  UniCalendarPanel;

type
  TEventEditForm = class(TUniForm)
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniGroupBox1: TUniGroupBox;
    UniComboBox1: TUniComboBox;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel2: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniCheckBox1: TUniCheckBox;
    UniEdit2: TUniEdit;
    UniLabel5: TUniLabel;
    UniCheckBox2: TUniCheckBox;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    Event : TUniCalendarEvent;
    { Private declarations }
  public
    Calenedar: TUniCalendarPanel;
    procedure ClearEvent;
    procedure SetEvent(E: TUniCalendarEvent);
    procedure SetDate(A, B: TDateTime);
    { Public declarations }
  end;

function EventEditForm: TEventEditForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function EventEditForm: TEventEditForm;
begin
  Result := TEventEditForm(UniMainModule.GetFormInstance(TEventEditForm));
end;

procedure TEventEditForm.ClearEvent;
begin
  Event:=nil;
  UniDateTimePicker1.DateTime:=Date;
  UniDateTimePicker2.DateTime:=Date;
  UniEdit1.Text:='New Event';
  UniEdit2.Text:='';
  UniComboBox1.Text:='1';
end;

procedure TEventEditForm.SetDate(A, B: TDateTime);
begin
  UniDateTimePicker1.DateTime:=A;
  UniDateTimePicker2.DateTime:=B;
end;

procedure TEventEditForm.SetEvent(E: TUniCalendarEvent);
begin
  Event:=E;
  if Assigned(E) then
  begin
    UniDateTimePicker1.DateTime:=E.StartDate;
    UniDateTimePicker2.DateTime:=E.EndDate;
    UniEdit1.Text:=E.Title;
    UniEdit2.Text:=E.Reminder;
    UniComboBox1.Text:=IntToStr(E.CalendarId);
    UniCheckBox1.Checked:=E.IsAllDay;
  end;
end;

procedure TEventEditForm.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ModalResult=mrOK then
  begin
    if UniCheckBox2.Checked then
    begin
      Event.Free;
      Exit;
    end;

    if not Assigned(Event) then
      Event:=Calenedar.Events.Add;

    Event.StartDate:=UniDateTimePicker1.DateTime;
    Event.EndDate:=UniDateTimePicker2.DateTime;
    Event.Title:=UniEdit1.Text;
    Event.Reminder:=UniEdit2.Text;
    if UniComboBox1.Text<>'' then
      Event.CalendarId:=StrToIntDef(UniComboBox1.Text[1], 1);
    Event.IsAllDay:=UniCheckBox1.Checked;
  end;
end;

procedure TEventEditForm.UniFormShow(Sender: TObject);
var
  I : Integer;
begin
  if Assigned(Calenedar) then
  begin
    UniComboBox1.Items.Clear;

    for I := 0 to Calenedar.Calendars.Count - 1 do
      UniComboBox1.Items.Add(IntToStr(Calenedar.Calendars[I].CalendarId));
  end;
end;

end.
