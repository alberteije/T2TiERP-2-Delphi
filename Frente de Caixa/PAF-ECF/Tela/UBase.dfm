object FBase: TFBase
  Left = 510
  Top = 433
  Caption = 'FBase'
  ClientHeight = 56
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TimerIntegracao: TTimer
    Enabled = False
    Interval = 8000
    OnTimer = TimerIntegracaoTimer
    Left = 145
    Top = 4
  end
end
