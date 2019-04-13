object FormAlign: TFormAlign
  Left = 0
  Top = 0
  ClientHeight = 339
  ClientWidth = 635
  Caption = 'Form Align'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 128
    Hint = ''
    Caption = 'UniPanel1'
    Color = clHotLight
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 128
    Width = 225
    Height = 211
    Hint = ''
    Caption = 'UniPanel2'
    Color = clRed
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
  end
  object UniPanel3: TUniPanel
    Left = 225
    Top = 128
    Width = 215
    Height = 211
    Hint = ''
    Caption = 'UniPanel3'
    Color = clLime
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object UniPanel4: TUniPanel
    Left = 440
    Top = 128
    Width = 195
    Height = 211
    Hint = ''
    Caption = 'UniPanel4'
    Color = clYellow
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 3
  end
end
