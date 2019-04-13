inherited FTransportadora: TFTransportadora
  Tag = 1
  Left = 309
  Top = 150
  Caption = 'Transportadora'
  ClientHeight = 543
  ClientWidth = 1115
  ExplicitLeft = 309
  ExplicitTop = 150
  ExplicitWidth = 1123
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1115
    Height = 512
    ActivePage = PaginaEdits
    ExplicitWidth = 1091
    ExplicitHeight = 480
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 1083
      ExplicitHeight = 452
      inherited PanelGrid: TPanel
        Width = 1107
        Height = 484
        ExplicitWidth = 1083
        ExplicitHeight = 452
        inherited Grid: TJvDBUltimGrid
          Width = 1107
          Height = 432
        end
        inherited PanelFiltroRapido: TPanel
          Top = 432
          Width = 1107
          ExplicitTop = 400
          ExplicitWidth = 1083
          inherited BotaoConsultar: TSpeedButton
            Left = 975
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 806
            ExplicitWidth = 782
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 1083
      ExplicitHeight = 452
      inherited PanelEdits: TPanel
        Width = 1107
        Height = 484
        ExplicitWidth = 1083
        ExplicitHeight = 452
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 1099
          Height = 476
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 1073
          ExplicitHeight = 444
          DesignSize = (
            1099
            476)
          object BevelEdits: TBevel
            Left = 6
            Top = 7
            Width = 1086
            Height = 314
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object EditIdContabilConta: TLabeledCalcEdit
            Left = 14
            Top = 78
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdContabilContaExit
            OnKeyDown = EditIdContabilContaKeyDown
            OnKeyPress = EditIdContabilContaKeyPress
            CalcEditLabel.Width = 98
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Conta Cont'#225'bil [F1]:'
          end
          object EditContabilConta: TLabeledEdit
            Left = 75
            Top = 78
            Width = 1008
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 3
          end
          object EditIdPessoa: TLabeledCalcEdit
            Left = 14
            Top = 33
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdPessoaExit
            OnKeyDown = EditIdPessoaKeyDown
            OnKeyPress = EditIdPessoaKeyPress
            CalcEditLabel.Width = 61
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Pessoa [F1]:'
          end
          object EditNomePessoa: TLabeledEdit
            Left = 75
            Top = 33
            Width = 1008
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 1
          end
          object MemoObservacao: TLabeledMemo
            Left = 14
            Top = 128
            Width = 1069
            Height = 178
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 4
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 1115
    ExplicitWidth = 1091
    inherited BotaoSair: TSpeedButton
      Left = 1011
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      Left = 911
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 801
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 901
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 701
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 496
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 636
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 752
  end
end
