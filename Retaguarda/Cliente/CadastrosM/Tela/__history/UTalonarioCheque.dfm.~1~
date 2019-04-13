inherited FTalonarioCheque: TFTalonarioCheque
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Talon'#225'rio Cheque'
  ClientWidth = 988
  ExplicitLeft = 318
  ExplicitTop = 203
  ExplicitWidth = 996
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      ExplicitHeight = 395
      inherited PanelGrid: TPanel
        Width = 980
        ExplicitWidth = 980
        inherited Grid: TJvDBUltimGrid
          Width = 980
        end
        inherited PanelFiltroRapido: TPanel
          Width = 980
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 679
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 980
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 980
        ExplicitWidth = 980
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 957
          Height = 111
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditContaCaixa: TLabeledEdit
          Left = 79
          Top = 32
          Width = 879
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 1
        end
        object EditTalao: TLabeledEdit
          Left = 18
          Top = 80
          Width = 199
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Tal'#227'o:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 2
        end
        object EditIdContaCaixa: TLabeledCalcEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContaCaixaExit
          OnKeyDown = EditIdContaCaixaKeyDown
          OnKeyPress = EditIdContaCaixaKeyPress
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Caixa [F1]:'
        end
        object EditNumero: TLabeledCalcEdit
          Left = 223
          Top = 80
          Width = 106
          Height = 21
          ShowButton = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContaCaixaExit
          OnKeyDown = EditIdContaCaixaKeyDown
          CalcEditLabel.Width = 41
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'N'#250'mero:'
        end
        object ComboboxStatusTalao: TLabeledComboBox
          Left = 335
          Top = 80
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = 'N - Normal'
          Items.Strings = (
            'N - Normal'
            'C - Cancelado'
            'E - Extraviado'
            'U - Utilizado')
          ComboBoxLabel.Width = 35
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Status:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 988
    ExplicitWidth = 988
    inherited BotaoSair: TSpeedButton
      Left = 884
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 784
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 674
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 774
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 574
      ExplicitLeft = 639
    end
  end
end
