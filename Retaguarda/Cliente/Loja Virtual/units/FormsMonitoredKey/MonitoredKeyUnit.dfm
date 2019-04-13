object UniForm2: TUniForm2
  Left = 0
  Top = 0
  ClientHeight = 472
  ClientWidth = 464
  Caption = 'UniForm2'
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyHandleAll = False
  MonitoredKeys.Keys = <
    item
      KeyStart = 112
      KeyEnd = 123
      HandleBrowser = False
    end
    item
      KeyStart = 88
      KeyEnd = 88
    end>
  PixelsPerInch = 96
  TextHeight = 13
  object UniLabel1: TUniLabel
    Left = 40
    Top = 24
    Width = 354
    Height = 13
    Hint = ''
    Caption = 'Function Keys (F1 .. F12), ALT and X are monitored by this Form'
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 0
  end
  object UniMemo1: TUniMemo
    Left = 40
    Top = 43
    Width = 393
    Height = 386
    Hint = ''
    ReadOnly = True
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 40
    Top = 433
    Width = 110
    Height = 13
    Hint = ''
    Caption = 'Press ALT+X to Exit'
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 2
  end
end
