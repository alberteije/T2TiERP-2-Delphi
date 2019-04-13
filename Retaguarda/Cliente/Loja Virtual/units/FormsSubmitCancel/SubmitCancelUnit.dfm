object UniForm1: TUniForm1
  Left = 0
  Top = 0
  ClientHeight = 465
  ClientWidth = 663
  Caption = 'UniForm1'
  BorderStyle = bsDialog
  OldCreateOrder = False
  NavigateKeys.Enabled = True
  NavigateKeys.KeySubmit.Key = 121
  NavigateKeys.KeyCancel.Key = 27
  MonitoredKeys.Keys = <>
  ActiveControl = UniEdit1
  OnSubmit = UniFormSubmit
  OnCancel = UniFormCancel
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 568
    Top = 422
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object UniButton2: TUniButton
    Left = 8
    Top = 422
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 663
    Height = 201
    Hint = ''
    Caption = 'UniGroupBox1'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    ExplicitLeft = -10
    ExplicitWidth = 645
    object UniEdit1: TUniEdit
      Left = 16
      Top = 32
      Width = 121
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 1
    end
    object UniEdit2: TUniEdit
      Left = 16
      Top = 60
      Width = 121
      Hint = ''
      Text = 'UniEdit2'
      TabOrder = 2
    end
    object UniEdit3: TUniEdit
      Left = 16
      Top = 88
      Width = 121
      Hint = ''
      Text = 'UniEdit3'
      TabOrder = 3
    end
    object UniEdit4: TUniEdit
      Left = 16
      Top = 116
      Width = 121
      Hint = ''
      Text = 'UniEdit4'
      TabOrder = 4
    end
    object UniEdit5: TUniEdit
      Left = 16
      Top = 144
      Width = 121
      Hint = ''
      Text = 'UniEdit5'
      TabOrder = 5
    end
    object UniLabel1: TUniLabel
      Left = 232
      Top = 91
      Width = 301
      Height = 19
      Hint = ''
      Caption = 'Press F10 to Submit or ESC to Cancel'
      ParentFont = False
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 6
    end
  end
  object UniGroupBox2: TUniGroupBox
    Left = 0
    Top = 201
    Width = 663
    Height = 200
    Hint = ''
    Caption = 'UniGroupBox2'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    ExplicitTop = 216
    object UniEdit6: TUniEdit
      Left = 16
      Top = 32
      Width = 121
      Hint = ''
      Text = 'UniEdit6'
      TabOrder = 1
    end
    object UniEdit7: TUniEdit
      Left = 16
      Top = 60
      Width = 121
      Hint = ''
      Text = 'UniEdit7'
      TabOrder = 2
    end
    object UniEdit8: TUniEdit
      Left = 16
      Top = 88
      Width = 121
      Hint = ''
      Text = 'UniEdit8'
      TabOrder = 3
    end
    object UniEdit9: TUniEdit
      Left = 16
      Top = 116
      Width = 121
      Hint = ''
      Text = 'UniEdit9'
      TabOrder = 4
    end
    object UniEdit10: TUniEdit
      Left = 16
      Top = 144
      Width = 121
      Hint = ''
      Text = 'UniEdit10'
      TabOrder = 5
    end
  end
end
