object FPreview: TFPreview
  Left = 559
  Top = 246
  BorderStyle = bsSingle
  Caption = 'Preview'
  ClientHeight = 378
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit2: TRichEdit
    Left = 0
    Top = 26
    Width = 628
    Height = 352
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      '')
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object RichEdit: TRichEdit
    Left = 0
    Top = 26
    Width = 628
    Height = 352
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      '')
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 26
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Spacing = 0
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 312
    Top = 258
  end
  object SaveDialog1: TSaveDialog
    Left = 432
    Top = 201
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionConfigurarImpressora
            Caption = '&Configurar Impressora'
            ImageIndex = 26
          end
          item
            Action = ActionImprimir
            Caption = '&Imprimir'
            ImageIndex = 4
          end
          item
            Action = ActionSalvar
            Caption = 'S&alvar'
            ImageIndex = 9
            ShortCut = 123
          end
          item
            Caption = '-'
          end
          item
            Action = ActionSair
            Caption = '&Sair [F8]'
            ImageIndex = 12
            ShortCut = 119
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 288
    Top = 184
    StyleName = 'Platform Default'
    object ActionSair: TAction
      Caption = 'Sair [F8]'
      ImageIndex = 12
      ShortCut = 119
      OnExecute = ActionSairExecute
    end
    object ActionSalvar: TAction
      Caption = 'Salvar'
      ImageIndex = 9
      ShortCut = 123
      OnExecute = ActionSalvarExecute
    end
    object ActionConfigurarImpressora: TAction
      Caption = 'Configurar Impressora'
      ImageIndex = 26
      OnExecute = ActionConfigurarImpressoraExecute
    end
    object ActionImprimir: TAction
      Caption = 'Imprimir'
      ImageIndex = 4
    end
  end
end
