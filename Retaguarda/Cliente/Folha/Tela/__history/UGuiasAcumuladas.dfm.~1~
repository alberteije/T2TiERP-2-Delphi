inherited FGuiasAcumuladas: TFGuiasAcumuladas
  Tag = 1
  Left = 318
  Top = 204
  Caption = 'Guias Acumuladas'
  ClientWidth = 961
  ExplicitLeft = 318
  ExplicitTop = 204
  ExplicitWidth = 969
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 961
    ActivePage = PaginaEdits
    ExplicitWidth = 961
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 953
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
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 953
        ExplicitWidth = 953
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 935
          Height = 278
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBox1: TGroupBox
          Left = 18
          Top = 20
          Width = 917
          Height = 109
          Anchors = [akLeft, akTop, akRight]
          Caption = 'GPS'
          TabOrder = 0
          DesignSize = (
            917
            109)
          object ComboBoxGpsTipo: TLabeledComboBox
            Left = 10
            Top = 32
            Width = 806
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 0
            Text = 
              '1 - emite GPS de apenas uma filial (servi'#231'os que representam a p' +
              'r'#243'pria empresa, um tomador de servi'#231'o ou obra por empreitada par' +
              'cial) '
            Items.Strings = (
              
                '1 - emite GPS de apenas uma filial (servi'#231'os que representam a p' +
                'r'#243'pria empresa, um tomador de servi'#231'o ou obra por empreitada par' +
                'cial) '
              
                '2 - emite GPS somente de um servi'#231'o (obra pr'#243'pria/empreitada tot' +
                'al) '
              
                '3 - emite GPS apenas de uma filial referente aos cooperados (tom' +
                'adores de servi'#231'o de cooperativa de trabalho)')
            ComboBoxLabel.Width = 24
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo:'
          end
          object EditGpsValorInss: TLabeledCalcEdit
            Left = 10
            Top = 77
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 54
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor INSS:'
          end
          object EditGpsCompetencia: TLabeledMaskEdit
            Left = 822
            Top = 33
            Width = 86
            Height = 21
            Alignment = taCenter
            Anchors = [akTop, akRight]
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Compet'#234'ncia:'
            MaxLength = 7
            TabOrder = 1
            Text = '  /////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object EditGpsValorOutrasEntidades: TLabeledCalcEdit
            Left = 137
            Top = 77
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 3
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 114
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Outras Entidades:'
          end
          object EditGpsDataPagamento: TLabeledDateEdit
            Left = 264
            Top = 77
            Width = 121
            Height = 21
            TabOrder = 4
            DateEditLabel.Width = 84
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Pagamento:'
          end
        end
        object GroupBox2: TGroupBox
          Left = 18
          Top = 135
          Width = 917
          Height = 69
          Anchors = [akLeft, akTop, akRight]
          Caption = 'IRRF'
          TabOrder = 1
          object EditIrrfCompetencia: TLabeledMaskEdit
            Left = 10
            Top = 32
            Width = 86
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Compet'#234'ncia:'
            MaxLength = 7
            TabOrder = 0
            Text = '  //////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object EditIrrfCodigoRecolhimento: TLabeledCalcEdit
            Left = 102
            Top = 32
            Width = 115
            Height = 21
            ShowButton = False
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 104
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'C'#243'digo Recolhimento:'
          end
          object EditIrrfValorAcumulado: TLabeledCalcEdit
            Left = 223
            Top = 32
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 83
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Acumulado:'
          end
          object EditIrrfDataPagamento: TLabeledDateEdit
            Left = 350
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 3
            DateEditLabel.Width = 84
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Pagamento:'
          end
        end
        object GroupBox3: TGroupBox
          Left = 18
          Top = 210
          Width = 917
          Height = 69
          Anchors = [akLeft, akTop, akRight]
          Caption = 'PIS'
          TabOrder = 2
          object EditPisCompetencia: TLabeledMaskEdit
            Left = 10
            Top = 32
            Width = 86
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Compet'#234'ncia:'
            MaxLength = 7
            TabOrder = 0
            Text = '  ///////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object EditPisValorAcumulado: TLabeledCalcEdit
            Left = 102
            Top = 32
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 83
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Acumulado:'
          end
          object EditPisDataPagamento: TLabeledDateEdit
            Left = 229
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 2
            DateEditLabel.Width = 84
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Pagamento:'
          end
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
