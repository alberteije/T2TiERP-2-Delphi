inherited FFinPagamentoFixo: TFFinPagamentoFixo
  Left = 318
  Top = 144
  Caption = 'Pagamento Fixo'
  ClientHeight = 510
  ClientWidth = 988
  ExplicitWidth = 1004
  ExplicitHeight = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    Height = 479
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 479
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      ExplicitHeight = 451
      inherited PanelGrid: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        inherited Grid: TJvDBUltimGrid
          Width = 980
          Height = 399
        end
        inherited PanelFiltroRapido: TPanel
          Top = 399
          Width = 980
          ExplicitTop = 399
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
      ExplicitHeight = 451
      inherited PanelEdits: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        object PanelParcelas: TPanel
          Left = 4
          Top = 4
          Width = 972
          Height = 443
          Align = alClient
          TabOrder = 1
        end
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 149
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            149)
          object EditIdFornecedor: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdFornecedorKeyUp
            CalcEditLabel.Width = 82
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Fornecedor [F1]:'
          end
          object EditFornecedor: TLabeledEdit
            Left = 70
            Top = 24
            Width = 873
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
          object EditIdDocumentoOrigem: TLabeledCalcEdit
            Left = 9
            Top = 73
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdDocumentoOrigemKeyUp
            CalcEditLabel.Width = 118
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Documento Origem [F1]:'
          end
          object EditDocumentoOrigem: TLabeledEdit
            Left = 70
            Top = 73
            Width = 424
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
          object ComboBoxPagamentoCompartilhado: TLabeledComboBox
            Left = 805
            Top = 73
            Width = 138
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemIndex = 0
            TabOrder = 5
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 131
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Pagamento Compartilhado?'
          end
          object EditPrimeiroVencimento: TLabeledDateEdit
            Left = 593
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 11
            DateEditLabel.Width = 100
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Primeiro Vencimento:'
          end
          object EditQuantidadeParcelas: TLabeledCalcEdit
            Left = 390
            Top = 119
            Width = 91
            Height = 21
            ShowButton = False
            TabOrder = 9
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 78
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Qt. de Parcelas:'
          end
          object EditValorAPagar: TLabeledCalcEdit
            Left = 263
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 8
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 68
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor a Pagar:'
          end
          object EditValorTotal: TLabeledCalcEdit
            Left = 136
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 7
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 55
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Total:'
          end
          object EditDataLancamento: TLabeledDateEdit
            Left = 9
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 6
            DateEditLabel.Width = 88
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Lan'#231'amento:'
          end
          object EditNumeroDocumento: TLabeledEdit
            Left = 500
            Top = 73
            Width = 299
            Height = 21
            Anchors = [akTop, akRight]
            EditLabel.Width = 113
            EditLabel.Height = 13
            EditLabel.Caption = 'N'#250'mero do Documento:'
            TabOrder = 4
          end
          object EditIntervalorEntreParcelas: TLabeledCalcEdit
            Left = 487
            Top = 119
            Width = 100
            Height = 21
            ShowButton = False
            TabOrder = 10
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 91
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Intervalo Parcelas:'
          end
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
