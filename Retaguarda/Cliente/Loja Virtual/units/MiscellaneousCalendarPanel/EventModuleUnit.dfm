object EventEditForm: TEventEditForm
  Left = 0
  Top = 0
  ClientHeight = 372
  ClientWidth = 716
  Caption = 'EventEditForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 716
    Height = 329
    Hint = ''
    Caption = 'Event Properties'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    ExplicitTop = 8
    object UniComboBox1: TUniComboBox
      Left = 24
      Top = 48
      Width = 145
      Hint = ''
      Text = 'UniComboBox1'
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 24
      Top = 29
      Width = 56
      Height = 13
      Hint = ''
      Caption = 'Calendar Id'
      TabOrder = 2
    end
    object UniEdit1: TUniEdit
      Left = 24
      Top = 104
      Width = 201
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 24
      Top = 85
      Width = 20
      Height = 13
      Hint = ''
      Caption = 'Title'
      TabOrder = 4
    end
    object UniDateTimePicker1: TUniDateTimePicker
      Left = 304
      Top = 48
      Width = 220
      Height = 21
      Hint = ''
      DateTime = 40700.044536666670000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDateTime
      FirstDayOfWeek = dowLocaleDefault
      TabOrder = 5
      Color = clWhite
    end
    object UniDateTimePicker2: TUniDateTimePicker
      Left = 304
      Top = 104
      Width = 220
      Height = 21
      Hint = ''
      DateTime = 40700.044588391210000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDateTime
      FirstDayOfWeek = dowLocaleDefault
      TabOrder = 6
      Color = clWhite
    end
    object UniLabel3: TUniLabel
      Left = 304
      Top = 29
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'Start'
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 304
      Top = 85
      Width = 18
      Height = 13
      Hint = ''
      Caption = 'End'
      TabOrder = 8
    end
    object UniCheckBox1: TUniCheckBox
      Left = 24
      Top = 226
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'All Day'
      TabOrder = 9
    end
    object UniEdit2: TUniEdit
      Left = 24
      Top = 168
      Width = 201
      Hint = ''
      Text = 'UniEdit2'
      TabOrder = 10
    end
    object UniLabel5: TUniLabel
      Left = 24
      Top = 149
      Width = 45
      Height = 13
      Hint = ''
      Caption = 'Reminder'
      TabOrder = 11
    end
    object UniCheckBox2: TUniCheckBox
      Left = 614
      Top = 294
      Width = 79
      Height = 17
      Hint = ''
      Caption = 'Delete'
      TabOrder = 12
    end
  end
  object UniButton1: TUniButton
    Left = 576
    Top = 335
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    Default = True
  end
  object UniButton2: TUniButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 1
  end
end
