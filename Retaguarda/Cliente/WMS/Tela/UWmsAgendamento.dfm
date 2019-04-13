inherited FWmsAgendamento: TFWmsAgendamento
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Agendamento'
  ClientWidth = 961
  ExplicitWidth = 977
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 961
    ActivePage = PaginaEdits
    ExplicitWidth = 961
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 953
      ExplicitHeight = 407
      inherited PanelGrid: TPanel
        Width = 953
        ExplicitWidth = 953
        inherited Grid: TJvDBUltimGrid
          Width = 953
        end
        inherited PanelFiltroRapido: TPanel
          Width = 953
          ExplicitWidth = 953
          inherited BotaoConsultar: TSpeedButton
            Left = 821
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 652
            ExplicitWidth = 652
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 953
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 953
        ExplicitWidth = 953
        object BevelEdits: TBevel
          Left = 10
          Top = 14
          Width = 935
          Height = 182
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditQuantidadeVolume: TLabeledCalcEdit
          Left = 19
          Top = 79
          Width = 104
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 97
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Quantidade Volume:'
        end
        object EditHoraOperacao: TLabeledMaskEdit
          Left = 146
          Top = 36
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 77
          EditLabel.Height = 13
          EditLabel.Caption = 'Hora Opera'#231#227'o:'
          MaxLength = 8
          TabOrder = 1
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object EditPesoTotalVolume: TLabeledCalcEdit
          Left = 129
          Top = 79
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditPesoTotalVolumeExit
          CalcEditLabel.Width = 91
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Peso Total Volume:'
        end
        object EditDataOperacao: TLabeledDateEdit
          Left = 19
          Top = 36
          Width = 121
          Height = 21
          ShowNullDate = False
          TabOrder = 3
          DateEditLabel.Width = 92
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data da Opera'#231#227'o:'
        end
        object EditLocalOperacao: TLabeledEdit
          Left = 262
          Top = 36
          Width = 675
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 78
          EditLabel.Height = 13
          EditLabel.Caption = 'Local Opera'#231#227'o:'
          TabOrder = 4
        end
        object EditQuantidadePessoa: TLabeledCalcEdit
          Left = 256
          Top = 79
          Width = 104
          Height = 21
          ShowButton = False
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 102
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Quantidade Pessoas:'
        end
        object EditQuantidadeHora: TLabeledCalcEdit
          Left = 366
          Top = 79
          Width = 104
          Height = 21
          ShowButton = False
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 91
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Quantidade Horas:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 961
    ExplicitWidth = 961
    inherited BotaoSair: TSpeedButton
      Left = 857
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 757
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 647
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 747
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 547
      ExplicitLeft = 639
    end
  end
end
