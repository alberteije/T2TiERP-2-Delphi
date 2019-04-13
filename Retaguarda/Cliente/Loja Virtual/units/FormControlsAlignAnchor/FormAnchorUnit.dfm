object FormAnchor: TFormAnchor
  Left = 0
  Top = 0
  ClientHeight = 328
  ClientWidth = 621
  Caption = 'Form Anchor'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  DesignSize = (
    621
    328)
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 24
    Top = 24
    Width = 121
    Height = 25
    Hint = ''
    Caption = '[akLeft, akTop]'
    TabOrder = 0
  end
  object UniButton2: TUniButton
    Left = 289
    Top = 24
    Width = 75
    Height = 25
    Hint = ''
    Caption = '[akTop]'
    Anchors = [akTop]
    TabOrder = 1
  end
  object UniButton3: TUniButton
    Left = 482
    Top = 24
    Width = 107
    Height = 25
    Hint = ''
    Caption = '[akTop,akRight]'
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object UniButton4: TUniButton
    Left = 514
    Top = 141
    Width = 75
    Height = 25
    Hint = ''
    Caption = '[akRight]'
    Anchors = [akRight]
    TabOrder = 3
  end
  object UniButton5: TUniButton
    Left = 289
    Top = 141
    Width = 75
    Height = 25
    Hint = ''
    Caption = '[]'
    Anchors = []
    TabOrder = 4
  end
  object UniButton6: TUniButton
    Left = 24
    Top = 141
    Width = 75
    Height = 25
    Hint = ''
    Caption = '[akLeft]'
    Anchors = [akLeft]
    TabOrder = 5
  end
  object UniButton7: TUniButton
    Left = 482
    Top = 268
    Width = 107
    Height = 25
    Hint = ''
    Caption = '[akRight,akBottom]'
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object UniButton8: TUniButton
    Left = 289
    Top = 268
    Width = 75
    Height = 25
    Hint = ''
    Caption = '[akBottom]'
    Anchors = [akBottom]
    TabOrder = 7
  end
  object UniButton9: TUniButton
    Left = 24
    Top = 268
    Width = 121
    Height = 25
    Hint = ''
    Caption = '[akLeft,akBottom]'
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
end
