object UniCallBackFormUnit: TUniCallBackFormUnit
  Left = 0
  Top = 0
  ClientHeight = 219
  ClientWidth = 395
  Caption = 'CallBack Form Unit'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 160
    Top = 64
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 160
    Top = 95
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = UniButton2Click
  end
end
