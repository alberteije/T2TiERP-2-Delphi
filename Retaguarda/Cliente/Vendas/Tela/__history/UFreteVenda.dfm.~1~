inherited FFreteVenda: TFFreteVenda
  Tag = 1
  Left = 370
  Top = 163
  Caption = 'Frete'
  ClientHeight = 328
  ClientWidth = 892
  ExplicitLeft = 370
  ExplicitTop = 163
  ExplicitWidth = 900
  ExplicitHeight = 362
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 892
    Height = 297
    ActivePage = PaginaEdits
    ExplicitWidth = 782
    ExplicitHeight = 297
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 774
      inherited PanelGrid: TPanel
        Width = 884
        Height = 269
        ExplicitWidth = 774
        ExplicitHeight = 269
        inherited Grid: TJvDBUltimGrid
          Width = 884
          Height = 217
        end
        inherited PanelFiltroRapido: TPanel
          Top = 217
          Width = 884
          ExplicitTop = 217
          ExplicitWidth = 774
          inherited BotaoConsultar: TSpeedButton
            Left = 752
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 583
            ExplicitWidth = 473
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 774
      inherited PanelEdits: TPanel
        Width = 884
        Height = 269
        ExplicitWidth = 774
        ExplicitHeight = 269
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 863
          Height = 183
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
          ExplicitWidth = 753
        end
        object EditPlaca: TLabeledEdit
          Left = 255
          Top = 120
          Width = 74
          Height = 21
          EditLabel.Width = 29
          EditLabel.Height = 13
          EditLabel.Caption = 'Placa:'
          MaxLength = 7
          TabOrder = 6
        end
        object EditMarcaVolume: TLabeledEdit
          Left = 16
          Top = 162
          Width = 594
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 70
          EditLabel.Height = 13
          EditLabel.Caption = 'Marca Volume:'
          MaxLength = 50
          TabOrder = 11
        end
        object EditUfPlaca: TLabeledEdit
          Left = 335
          Top = 120
          Width = 49
          Height = 21
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'UF Placa:'
          MaxLength = 2
          TabOrder = 7
        end
        object EditConhecimento: TLabeledCalcEdit
          Left = 16
          Top = 120
          Width = 109
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 72
          CalcEditLabel.Height = 13
          CalcEditLabel.BiDiMode = bdLeftToRight
          CalcEditLabel.Caption = 'Conhecimento:'
          CalcEditLabel.ParentBiDiMode = False
        end
        object ComboBoxResponsavel: TLabeledComboBox
          Left = 131
          Top = 120
          Width = 118
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 5
          Text = '1-Emitente'
          Items.Strings = (
            '1-Emitente'
            '2-Destinat'#225'rio')
          ComboBoxLabel.Width = 30
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Frete:'
        end
        object EditSeloFiscal: TLabeledCalcEdit
          Left = 390
          Top = 120
          Width = 109
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 8
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 53
          CalcEditLabel.Height = 13
          CalcEditLabel.BiDiMode = bdLeftToRight
          CalcEditLabel.Caption = 'Selo Fiscal:'
          CalcEditLabel.ParentBiDiMode = False
        end
        object EditQuantidadeVolumes: TLabeledCalcEdit
          Left = 505
          Top = 120
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 102
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Quantidade Volumes:'
        end
        object EditEspecieVolume: TLabeledEdit
          Left = 632
          Top = 120
          Width = 232
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 77
          EditLabel.Height = 13
          EditLabel.Caption = 'Esp'#233'cie Volume:'
          MaxLength = 20
          TabOrder = 10
        end
        object EditPesoBruto: TLabeledCalcEdit
          Left = 616
          Top = 162
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          Anchors = [akTop, akRight]
          TabOrder = 12
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 56
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Peso Bruto:'
        end
        object EditPesoLiquido: TLabeledCalcEdit
          Left = 743
          Top = 162
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          Anchors = [akTop, akRight]
          TabOrder = 13
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 63
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Peso L'#237'quido:'
        end
        object EditIdVendaCabecalho: TLabeledCalcEdit
          Left = 16
          Top = 34
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdVendaCabecalhoExit
          OnKeyDown = EditIdVendaCabecalhoKeyDown
          OnKeyPress = EditIdVendaCabecalhoKeyPress
          CalcEditLabel.Width = 57
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Venda [F1]:'
        end
        object EditIdTransportadora: TLabeledCalcEdit
          Left = 16
          Top = 77
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdTransportadoraExit
          OnKeyDown = EditIdTransportadoraKeyDown
          OnKeyPress = EditIdTransportadoraKeyPress
          CalcEditLabel.Width = 102
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Transportadora [F1]:'
        end
        object EditTransportadora: TLabeledEdit
          Left = 77
          Top = 77
          Width = 787
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
        object EditVendaCabecalho: TLabeledCalcEdit
          Left = 77
          Top = 34
          Width = 787
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DisplayFormat = '#'
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 3
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = ' '
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 892
    ExplicitWidth = 782
    inherited BotaoSair: TSpeedButton
      Left = 788
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 688
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 588
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 478
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 488
      ExplicitLeft = 526
    end
  end
end
