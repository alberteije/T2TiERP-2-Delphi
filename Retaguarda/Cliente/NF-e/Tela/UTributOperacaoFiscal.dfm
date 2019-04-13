inherited FTributOperacaoFiscal: TFTributOperacaoFiscal
  Tag = 1
  Left = 322
  Top = 236
  Caption = 'Opera'#231#227'o Fiscal'
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
            ExplicitWidth = 583
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
          Height = 246
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditDescricao: TLabeledEdit
          Left = 16
          Top = 76
          Width = 848
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          MaxLength = 100
          TabOrder = 2
        end
        object EditCfop: TLabeledCalcEdit
          Left = 16
          Top = 34
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditCfopKeyUp
          CalcEditLabel.Width = 54
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'CFOP [F1]:'
        end
        object EditDescricaoNf: TLabeledEdit
          Left = 16
          Top = 119
          Width = 848
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 240
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o na Nota Fiscal (Natureza da Opera'#231#227'o):'
          MaxLength = 100
          TabOrder = 3
        end
        object MemoObservacao: TLabeledMemo
          Left = 16
          Top = 160
          Width = 848
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          MemoLabel.Width = 62
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Observa'#231#227'o:'
        end
        object EditCfopDescricao: TLabeledEdit
          Left = 77
          Top = 34
          Width = 787
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          ReadOnly = True
          TabOrder = 1
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
