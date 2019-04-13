unit HTMLFrameTwoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniHTMLFrame;

type
  TUniHTMLFrameTwoForm = class(TUniForm)
    UniHTMLFrame1: TUniHTMLFrame;
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure ReplaceTags;
    { Private declarations }
  public
    { Public declarations }
  end;

function UniHTMLFrameTwoForm: TUniHTMLFrameTwoForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniHTMLFrameTwoForm: TUniHTMLFrameTwoForm;
begin
  Result := TUniHTMLFrameTwoForm(UniMainModule.GetFormInstance(TUniHTMLFrameTwoForm));
end;

procedure TUniHTMLFrameTwoForm.ReplaceTags;
var
  S, Sc : string;
begin
  S:=UniHTMLFrame1.HTML.Text;

  Sc:=UniSession.CallbackUrl('mycallback', Self, ['RES', 'OK']);
  S:=StringReplace(S, '{URL_CALLBACK}', Sc, []);

  Sc:=UniSession.CallbackUrl('mycallback', Self, ['RES', 'CANCEL']);
  S:=StringReplace(S, '{CANCEL_URL}', Sc, []);

  Sc:=UniSession.CallbackTarget;
  S:=StringReplace(S, '{CALLBACK_TARGET}', Sc, [rfReplaceAll]);

  UniHTMLFrame1.HTML.Text:=S;
end;

procedure TUniHTMLFrameTwoForm.UniFormAjaxEvent(Sender: TComponent;
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

procedure TUniHTMLFrameTwoForm.UniFormCreate(Sender: TObject);
begin
  ReplaceTags;
end;

end.
