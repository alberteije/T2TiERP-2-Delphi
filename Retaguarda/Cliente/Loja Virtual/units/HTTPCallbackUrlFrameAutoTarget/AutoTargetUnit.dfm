object AutoTargetForm: TAutoTargetForm
  Left = 0
  Top = 0
  ClientHeight = 398
  ClientWidth = 636
  Caption = 'UrlFrame Auto Target '
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAjaxEvent = UniFormAjaxEvent
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniURLFrame1: TUniURLFrame
    Left = 0
    Top = 0
    Width = 636
    Height = 398
    Hint = ''
    HTML.Strings = (
      '<form name="input" action="{URL_CALLBACK}" method="POST">'
      '<div style="padding:10;background-color:#eee;color:#0000CC">'
      '<br/>'
      '<br/>'
      '<br/>'
      '<br/>'
      ''
      
        'First name: <input type="text" name="firstname" value ="Name"><b' +
        'r>'
      'Last name: <input type="text" name="lastname" value="Last Name">'
      ''
      '<br/>'
      '<br/>'
      ''
      '<input type="submit" value="Submit">'
      ''
      '<a href="{CANCEL_URL}">'
      '  <input type="button" value="Cancel">'
      '</a>'
      '<br/>'
      '<br/>'
      '<br/>'
      '<br/>'
      ''
      '</div >'
      '</form> ')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
end
