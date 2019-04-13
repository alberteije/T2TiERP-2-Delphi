inherited FFiscalFechamento: TFFiscalFechamento
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Fiscal Fechamento'
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
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 953
        ExplicitWidth = 953
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 935
          Height = 54
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditDataInicio: TLabeledDateEdit
          Left = 20
          Top = 34
          Width = 121
          Height = 21
          TabOrder = 0
          DateEditLabel.Width = 55
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data In'#237'cio:'
        end
        object EditDataFim: TLabeledDateEdit
          Left = 147
          Top = 34
          Width = 121
          Height = 21
          TabOrder = 1
          DateEditLabel.Width = 46
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Fim:'
        end
        object ComboBoxCriterioLancamento: TLabeledComboBox
          Left = 274
          Top = 34
          Width = 660
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 2
          Text = 'L - Livre'
          Items.Strings = (
            'L - Livre'
            'A - Avisar'
            
              'N - N'#227'o permitir (para lan'#231'amentos efetuados fora do per'#237'odo inf' +
              'ormado)')
          ComboBoxLabel.Width = 100
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Crit'#233'rio Lan'#231'amento:'
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
