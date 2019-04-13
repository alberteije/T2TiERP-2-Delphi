object FPontoRegistroIncluidoAFD: TFPontoRegistroIncluidoAFD
  Left = 325
  Top = 396
  BorderStyle = bsDialog
  Caption = 'Dados do registro inclu'#237'do'
  ClientHeight = 85
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelRegistroIncluido: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 61
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 865
    DesignSize = (
      800
      61)
    object EditDataMarcacao: TLabeledDateEdit
      Left = 10
      Top = 24
      Width = 120
      Height = 21
      TabOrder = 0
      DateEditLabel.Width = 76
      DateEditLabel.Height = 13
      DateEditLabel.Caption = 'Data Marca'#231#227'o:'
    end
    object EditHoraMarcacao: TLabeledMaskEdit
      Left = 137
      Top = 24
      Width = 92
      Height = 21
      Alignment = taCenter
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Hora Marca'#231#227'o:'
      MaxLength = 5
      TabOrder = 1
      Text = '  ::::::::'
      Required = False
      EditMask = '##:##;0;_'
      MaskState = [msMasked]
    end
    object EditJustificativa: TLabeledEdit
      Left = 386
      Top = 24
      Width = 404
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Justificativa:'
      TabOrder = 3
    end
    object ComboBoxTipoMarcacao: TLabeledComboBox
      Left = 235
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = '1'#170' Entrada'
      Items.Strings = (
        '1'#170' Entrada'
        '1'#170' Saida'
        '2'#170' Entrada'
        '2'#170' Saida'
        '3'#170' Entrada'
        '3'#170' Saida'
        '4'#170' Entrada'
        '4'#170' Saida'
        '5'#170' Entrada'
        '5'#170' Saida')
      ComboBoxLabel.Width = 73
      ComboBoxLabel.Height = 13
      ComboBoxLabel.Caption = 'Tipo Marca'#231#227'o:'
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 61
    Width = 800
    Height = 24
    ActionManager = ActionManagerLocal
    Align = alBottom
    Caption = 'ActionToolBar1'
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Orientation = boRightToLeft
    ParentFont = False
    Spacing = 0
    ExplicitLeft = -32
    ExplicitTop = 37
  end
  object ActionManagerLocal: TActionManager
    ActionBars.ShowHints = False
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionSalvar
            Caption = 'C&onfirmar [F12]'
            ImageIndex = 9
            ShortCut = 123
          end
          item
            Action = ActionCancelar
            Caption = '&Cancelar [F11]'
            ImageIndex = 10
            ShortCut = 122
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionSalvar
            Caption = '&Confirmar [F12]'
            ImageIndex = 32
            ShortCut = 123
          end
          item
            Action = ActionCancelar
            Caption = 'C&ancelar [F11]'
            ImageIndex = 10
            ShortCut = 122
          end>
      end
      item
        Items = <
          item
            Action = ActionSalvar
            Caption = 'C&onfirmar [F12]'
            ImageIndex = 32
            ShortCut = 123
          end
          item
            Action = ActionCancelar
            Caption = '&Cancelar [F11]'
            ImageIndex = 10
            ShortCut = 122
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 528
    Top = 40
    StyleName = 'Ribbon - Silver'
    object ActionCancelar: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Cancelar [F11]'
      ImageIndex = 10
      ShortCut = 122
      OnExecute = ActionCancelarExecute
    end
    object ActionSalvar: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Confirmar [F12]'
      ImageIndex = 32
      ShortCut = 123
      OnExecute = ActionSalvarExecute
    end
  end
end
