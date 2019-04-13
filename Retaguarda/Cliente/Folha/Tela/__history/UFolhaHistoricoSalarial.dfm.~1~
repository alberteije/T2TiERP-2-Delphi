inherited FFolhaHistoricoSalarial: TFFolhaHistoricoSalarial
  Tag = 1
  Caption = 'Hist'#243'rico Salarial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = PaginaEdits
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        object BevelEdits: TBevel
          Left = 9
          Top = 13
          Width = 971
          Height = 142
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 18
          Top = 35
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdColaboradorExit
          OnKeyDown = EditIdColaboradorKeyDown
          OnKeyPress = EditIdColaboradorKeyPress
          CalcEditLabel.Width = 63
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Colaborador:'
        end
        object EditColaborador: TLabeledEdit
          Left = 79
          Top = 35
          Width = 890
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
        object EditCompetencia: TLabeledMaskEdit
          Left = 18
          Top = 122
          Width = 86
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = 'Compet'#234'ncia:'
          MaxLength = 7
          TabOrder = 3
          Text = '  /////'
          Required = False
          EditMask = '##/####;1;_'
          MaskState = [msMasked]
        end
        object EditSalarioAtual: TLabeledCalcEdit
          Left = 110
          Top = 122
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 64
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Sal'#225'rio Atual:'
        end
        object EditPercentualAumento: TLabeledCalcEdit
          Left = 237
          Top = 122
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          OnExit = EditPercentualAumentoExit
          CalcEditLabel.Width = 101
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Percentual Aumento:'
        end
        object EditSalarioNovo: TLabeledCalcEdit
          Left = 364
          Top = 122
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 64
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Sal'#225'rio Novo:'
        end
        object EditValidoAPartir: TLabeledMaskEdit
          Left = 491
          Top = 122
          Width = 86
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'V'#225'lido a Partir de:'
          MaxLength = 7
          TabOrder = 7
          Text = '  //////'
          Required = False
          EditMask = '##/####;1;_'
          MaskState = [msMasked]
        end
        object EditMotivo: TLabeledEdit
          Left = 18
          Top = 78
          Width = 951
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Motivo:'
          TabOrder = 2
        end
      end
    end
  end
end
