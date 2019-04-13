object UniForm4: TUniForm4
  Left = 0
  Top = 0
  ClientHeight = 300
  ClientWidth = 635
  Caption = 'UniForm4'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  DesignSize = (
    635
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 243
    Top = 115
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Start'
    Anchors = []
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 281
    Width = 635
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = True
    Font.Color = clBtnText
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clBtnFace
  end
end
