inherited FTributIss: TFTributIss
  Left = 318
  Top = 139
  Caption = 'Tributa'#231#227'o'
  ClientHeight = 525
  ExplicitWidth = 1008
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 494
    ActivePage = PaginaEdits
    ExplicitHeight = 494
    inherited PaginaGrid: TTabSheet
      ExplicitHeight = 466
      inherited PanelGrid: TPanel
        Height = 466
        ExplicitHeight = 466
        inherited Grid: TJvDBUltimGrid
          Height = 414
        end
        inherited PanelFiltroRapido: TPanel
          Top = 414
          ExplicitTop = 414
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 683
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 984
      ExplicitHeight = 466
      inherited PanelEdits: TPanel
        Height = 466
        ExplicitHeight = 466
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 976
          Height = 458
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            976
            458)
          object BevelEdits: TBevel
            Left = 7
            Top = 11
            Width = 959
            Height = 54
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object PageControlDadosTributIss: TPageControl
            Left = 7
            Top = 77
            Width = 959
            Height = 375
            ActivePage = tsIss
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            object tsIss: TTabSheet
              Caption = 'ISS'
              ImageIndex = 4
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object PanelIss: TPanel
                Left = 0
                Top = 0
                Width = 951
                Height = 347
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object EditPorcentoBaseCalculoIss: TLabeledCalcEdit
                  Left = 188
                  Top = 26
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 1
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 110
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Porcento Base C'#225'lculo:'
                end
                object ComboboxModalidadeBcIss: TLabeledComboBox
                  Left = 5
                  Top = 26
                  Width = 177
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '0-Valor Opera'#231#227'o'
                  Items.Strings = (
                    '0-Valor Opera'#231#227'o'
                    '9-Outros')
                  ComboBoxLabel.Width = 151
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Modalidade da Base de C'#225'lculo:'
                end
                object EditAliquotaPorcentoIss: TLabeledCalcEdit
                  Left = 315
                  Top = 26
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 2
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 89
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Al'#237'quota Porcento:'
                end
                object EditAliquotaUnidadeIss: TLabeledCalcEdit
                  Left = 442
                  Top = 26
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 3
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 85
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Al'#237'quota Unidade:'
                end
                object EditValorPrecoMaximoIss: TLabeledCalcEdit
                  Left = 569
                  Top = 26
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 4
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 97
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Pre'#231'o M'#225'ximo:'
                end
                object EditValorPautaFiscalIss: TLabeledCalcEdit
                  Left = 696
                  Top = 26
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 5
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 88
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Pauta Fiscal:'
                end
                object EditItemListaServico: TLabeledCalcEdit
                  Left = 823
                  Top = 26
                  Width = 121
                  Height = 21
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  ShowButton = False
                  TabOrder = 6
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 89
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Item Lista Servi'#231'o:'
                end
                object ComboboxCodigoTributacao: TLabeledComboBox
                  Left = 5
                  Top = 82
                  Width = 177
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 7
                  Text = 'N '#8211' NORMAL'
                  Items.Strings = (
                    'N '#8211' NORMAL'
                    'R '#8211' RETIDA'
                    'S '#8211'SUBSTITUTA'
                    'I '#8211' ISENTA')
                  ComboBoxLabel.Width = 106
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'C'#243'digo da Tributa'#231#227'o:'
                end
              end
            end
          end
          object EditIdOperacaoFiscal: TLabeledCalcEdit
            Left = 16
            Top = 33
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdOperacaoFiscalKeyUp
            CalcEditLabel.Width = 103
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Opera'#231#227'o Fiscal [F1]:'
          end
          object EditOperacaoFiscal: TLabeledEdit
            Left = 77
            Top = 33
            Width = 878
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
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 678
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 778
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 578
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Top = 23
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 720
    Top = 24
  end
end
