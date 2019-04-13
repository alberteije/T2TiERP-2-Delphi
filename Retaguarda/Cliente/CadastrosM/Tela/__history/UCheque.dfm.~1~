inherited FCheque: TFCheque
  Tag = 1
  Left = 354
  Top = 225
  Caption = 'Cheque'
  ClientWidth = 892
  ExplicitLeft = 354
  ExplicitTop = 225
  ExplicitWidth = 900
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 892
    ActivePage = PaginaEdits
    ExplicitWidth = 892
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 884
      inherited PanelGrid: TPanel
        Width = 884
        ExplicitWidth = 884
        inherited Grid: TJvDBUltimGrid
          Width = 884
        end
        inherited PanelFiltroRapido: TPanel
          Width = 884
          ExplicitWidth = 884
          inherited BotaoConsultar: TSpeedButton
            Left = 752
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 583
            ExplicitWidth = 583
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 884
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 884
        ExplicitWidth = 884
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 861
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditTalonarioCheque: TLabeledEdit
          Left = 79
          Top = 32
          Width = 784
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
        object EditDataStatus: TLabeledDateEdit
          Left = 303
          Top = 77
          Width = 137
          Height = 21
          TabOrder = 4
          DateEditLabel.Width = 61
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Status:'
        end
        object EditIdTalonarioCheque: TLabeledCalcEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdTalonarioChequeExit
          OnKeyDown = EditIdTalonarioChequeKeyDown
          OnKeyPress = EditIdTalonarioChequeKeyPress
          CalcEditLabel.Width = 111
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Talon'#225'rio Cheque [F1]:'
        end
        object EditNumero: TLabeledCalcEdit
          Left = 18
          Top = 77
          Width = 106
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 41
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'N'#250'mero:'
        end
        object ComboboxStatusCheque: TLabeledComboBox
          Left = 130
          Top = 77
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = 'E - Em Ser'
          Items.Strings = (
            'E - Em Ser'
            'B - Baixado'
            'U - Utilizado'
            'C - Compensado'
            'N - Cancelado')
          ComboBoxLabel.Width = 35
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Status:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 892
    ExplicitWidth = 892
    inherited BotaoSair: TSpeedButton
      Left = 788
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 688
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 578
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 678
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 478
      ExplicitLeft = 639
    end
  end
end
