object UniFormControlsEditTypes: TUniFormControlsEditTypes
  Left = 0
  Top = 0
  Width = 519
  Height = 332
  TabOrder = 0
  ParentRTL = False
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 332
    Hint = ''
    ParentColor = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 779
    ExplicitHeight = 499
    object UniEdit1: TUniEdit
      Left = 16
      Top = 36
      Width = 489
      Hint = ''
      Text = ''
      TabOrder = 0
    end
    object UniLabel4: TUniLabel
      Left = 16
      Top = 17
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Nome:'
      TabOrder = 4
    end
    object UniMemo1: TUniMemo
      Left = 16
      Top = 178
      Width = 489
      Height = 111
      Hint = ''
      TabOrder = 3
    end
    object UniButton1: TUniButton
      Left = 384
      Top = 295
      Width = 121
      Height = 25
      Hint = ''
      Caption = 'Enviar Mensagem'
      TabOrder = 5
      OnClick = UniButton1Click
    end
    object UniEdit2: TUniEdit
      Left = 16
      Top = 84
      Width = 489
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 16
      Top = 65
      Width = 32
      Height = 13
      Hint = ''
      Caption = 'E-Mail:'
      TabOrder = 7
    end
    object UniLabel2: TUniLabel
      Left = 16
      Top = 112
      Width = 43
      Height = 13
      Hint = ''
      Caption = 'Assunto:'
      TabOrder = 8
    end
    object UniComboBox3: TUniComboBox
      Left = 16
      Top = 131
      Width = 489
      Hint = ''
      Text = ''
      Items.Strings = (
        'D'#250'vidas'
        'Elogio'
        'Sugest'#245'es'
        'Cr'#237'ticas')
      ItemIndex = 0
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 159
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'Mensagem:'
      TabOrder = 9
    end
  end
end
