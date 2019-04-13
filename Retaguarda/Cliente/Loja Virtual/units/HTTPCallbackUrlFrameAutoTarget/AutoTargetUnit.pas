unit AutoTargetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame;

type
  TAutoTargetForm = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniFormCreate(Sender: TObject);
  private
   procedure ReplaceTags;
    { Private declarations }
  public
    { Public declarations }
  end;

function AutoTargetForm: TAutoTargetForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function AutoTargetForm: TAutoTargetForm;
begin
  Result := TAutoTargetForm(UniMainModule.GetFormInstance(TAutoTargetForm));
end;

procedure TAutoTargetForm.ReplaceTags;
var
  S, Sc : string;
begin
  S:=UniURLFrame1.HTML.Text;

  Sc:=UniSession.CallbackUrlEx('mycallback', Self, ['RES', 'OK']);
  S:=StringReplace(S, '{URL_CALLBACK}', Sc, []);

  Sc:=UniSession.CallbackUrlEx('mycallback', Self, ['RES', 'CANCEL']);
  S:=StringReplace(S, '{CANCEL_URL}', Sc, []);

  UniURLFrame1.HTML.Text:=S;
end;

procedure TAutoTargetForm.UniFormAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
  if EventName = 'mycallback' then
  begin
    UniMainModule.FirstName := Params.Values['firstname'];
    UniMainModule.LastName := Params.Values['lastname'];
    if Params.Values['RES']='OK' then
      ModalResult:=mrOK
    else if Params.Values['RES']='CANCEL' then
      ModalResult:=mrCancel
  end;
end;

procedure TAutoTargetForm.UniFormCreate(Sender: TObject);
begin
   ReplaceTags;
end;

end.
