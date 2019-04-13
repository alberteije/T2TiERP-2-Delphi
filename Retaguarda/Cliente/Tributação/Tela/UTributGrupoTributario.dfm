inherited FTributGrupoTributario: TFTributGrupoTributario
  Tag = 1
  Left = 322
  Top = 236
  Caption = 'Grupo Tribut'#225'rio'
  ClientHeight = 374
  ClientWidth = 892
  ExplicitWidth = 908
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 892
    Height = 343
    ActivePage = PaginaEdits
    ExplicitWidth = 892
    ExplicitHeight = 343
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 884
      ExplicitHeight = 315
      inherited PanelGrid: TPanel
        Width = 884
        Height = 315
        ExplicitWidth = 884
        ExplicitHeight = 315
        inherited Grid: TJvDBUltimGrid
          Width = 884
          Height = 263
        end
        inherited PanelFiltroRapido: TPanel
          Top = 263
          Width = 884
          ExplicitTop = 263
          ExplicitWidth = 884
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 884
      ExplicitHeight = 315
      inherited PanelEdits: TPanel
        Width = 884
        Height = 315
        ExplicitWidth = 884
        ExplicitHeight = 315
        object BevelEdits: TBevel
          Left = 9
          Top = 13
          Width = 863
          Height = 165
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditDescricao: TLabeledEdit
          Left = 16
          Top = 37
          Width = 665
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          MaxLength = 100
          TabOrder = 0
        end
        object MemoObservacao: TLabeledMemo
          Left = 16
          Top = 80
          Width = 848
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          MemoLabel.Width = 62
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Observa'#231#227'o:'
        end
        object ComboboxOrigemMercadoria: TLabeledComboBox
          Left = 687
          Top = 37
          Width = 177
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 1
          Text = '0 = Nacional'
          Items.Strings = (
            '0 = Nacional'
            '1 = Estrangeira - Importa'#231#227'o direta'
            '2 = Estrangeira - Adquirida no mercado interno')
          ComboBoxLabel.Width = 94
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Origem Mercadoria:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 892
    ExplicitWidth = 892
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
