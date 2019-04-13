inherited FPontoParametro: TFPontoParametro
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Ponto Par'#226'metros'
  ClientWidth = 961
  ExplicitLeft = 318
  ExplicitTop = 203
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
        object EditMesAno: TLabeledMaskEdit
          Left = 18
          Top = 36
          Width = 86
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#234's/Ano:'
          MaxLength = 7
          TabOrder = 0
          Text = '  ///////'
          Required = False
          EditMask = '##/####;1;_'
          MaskState = [msMasked]
        end
        object EditDiaInicialApuracao: TLabeledCalcEdit
          Left = 112
          Top = 36
          Width = 104
          Height = 21
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 98
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Dia Inicial Apura'#231#227'o:'
        end
        object EditHoraNoturnaInicio: TLabeledMaskEdit
          Left = 222
          Top = 36
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 97
          EditLabel.Height = 13
          EditLabel.Caption = 'In'#237'cio Hora Noturna:'
          MaxLength = 8
          TabOrder = 2
          Text = '  :::::::::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object EditHoraNoturnaFim: TLabeledMaskEdit
          Left = 338
          Top = 36
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 88
          EditLabel.Height = 13
          EditLabel.Caption = 'Fim Hora Noturna:'
          MaxLength = 8
          TabOrder = 3
          Text = '  :::::::::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object EditPeriodoMinimoInterjornada: TLabeledMaskEdit
          Left = 454
          Top = 36
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 100
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#237'nimo Interjornada:'
          MaxLength = 8
          TabOrder = 4
          Text = '  :::::::::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object EditPercentualHEDiurna: TLabeledCalcEdit
          Left = 686
          Top = 36
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 105
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Percentual HE Diurna:'
        end
        object EditPercentualHENoturna: TLabeledCalcEdit
          Left = 813
          Top = 36
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 113
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Percentual HE Noturna:'
        end
        object EditDuracaoHoraNoturna: TLabeledMaskEdit
          Left = 570
          Top = 36
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 112
          EditLabel.Height = 13
          EditLabel.Caption = 'Dura'#231#227'o Hora Noturna:'
          MaxLength = 8
          TabOrder = 5
          Text = '  :::::::::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object CheckBoxRepetirParametros: TCheckBox
          Left = 18
          Top = 170
          Width = 910
          Height = 17
          Caption = 
            'Gerar os mesmos par'#226'metros para todos os meses do ano informado ' +
            'em M'#234's/Ano'
          TabOrder = 10
        end
        object ComboBoxTratamentoHoraMais: TLabeledComboBox
          Left = 18
          Top = 84
          Width = 916
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 8
          Text = 'E = Hora Extra [Paga como hora extra]'
          Items.Strings = (
            'E = Hora Extra [Paga como hora extra]'
            
              'B = Banco de Horas [Horas s'#227'o armazenadas no banco de horas para' +
              ' futura compensa'#231#227'o]')
          ComboBoxLabel.Width = 348
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 
            'Tratamento dado para horas trabalhadas a mais na jornada de trab' +
            'alho:'
        end
        object ComboBoxTratamentoHoraMenos: TLabeledComboBox
          Left = 18
          Top = 133
          Width = 916
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 9
          Text = 'F = Falta [Desconta como falta]'
          Items.Strings = (
            'F = Falta [Desconta como falta]'
            
              'B = Banco de Horas [Horas s'#227'o armazenadas no banco de horas para' +
              ' futura compensa'#231#227'o]')
          ComboBoxLabel.Width = 358
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 
            'Tratamento dado para horas trabalhadas a menos na jornada de tra' +
            'balho:'
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
