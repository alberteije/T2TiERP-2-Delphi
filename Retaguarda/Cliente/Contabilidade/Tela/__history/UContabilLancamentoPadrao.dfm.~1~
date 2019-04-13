inherited FContabilLancamentoPadrao: TFContabilLancamentoPadrao
  Left = 293
  Top = 220
  Caption = 'Lan'#231'amento Padr'#227'o'
  ClientHeight = 422
  ClientWidth = 955
  ExplicitLeft = 293
  ExplicitTop = 220
  ExplicitWidth = 963
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 955
    Height = 391
    ActivePage = PaginaEdits
    ExplicitWidth = 850
    ExplicitHeight = 497
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 842
      ExplicitHeight = 469
      inherited PanelGrid: TPanel
        Width = 947
        Height = 363
        ExplicitWidth = 842
        ExplicitHeight = 469
        inherited Grid: TJvDBUltimGrid
          Width = 947
          Height = 311
        end
        inherited PanelFiltroRapido: TPanel
          Top = 311
          Width = 947
          ExplicitTop = 417
          ExplicitWidth = 842
          inherited BotaoConsultar: TSpeedButton
            Left = 815
            ExplicitLeft = 879
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 646
            ExplicitWidth = 541
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 947
      ExplicitHeight = 363
      inherited PanelEdits: TPanel
        Width = 947
        Height = 363
        ExplicitWidth = 947
        ExplicitHeight = 363
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 926
          Height = 250
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditDescricao: TLabeledEdit
          Left = 19
          Top = 32
          Width = 905
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          TabOrder = 0
        end
        object MemoHistorico: TLabeledMemo
          Left = 19
          Top = 75
          Width = 905
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 250
          TabOrder = 1
          MemoLabel.Width = 45
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Hist'#243'rico:'
        end
        object EditContaDebito: TLabeledEdit
          Left = 80
          Top = 186
          Width = 844
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object EditIdContaDebito: TLabeledCalcEdit
          Left = 19
          Top = 186
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContaDebitoExit
          OnKeyDown = EditIdContaDebitoKeyDown
          OnKeyPress = EditIdContaDebitoKeyPress
          CalcEditLabel.Width = 90
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta D'#233'bito [F1]:'
        end
        object EditContaCredito: TLabeledEdit
          Left = 80
          Top = 229
          Width = 844
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 5
        end
        object EditIdContaCredito: TLabeledCalcEdit
          Left = 19
          Top = 229
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContaCreditoExit
          OnKeyDown = EditIdContaCreditoKeyDown
          OnKeyPress = EditIdContaCreditoKeyPress
          CalcEditLabel.Width = 94
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Cr'#233'dito [F1]:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 955
    ExplicitWidth = 850
    inherited BotaoSair: TSpeedButton
      Left = 851
      ExplicitLeft = 759
    end
    inherited BotaoExportar: TSpeedButton
      Left = 751
      ExplicitLeft = 815
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 651
      ExplicitLeft = 715
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 541
      ExplicitLeft = 605
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 551
      ExplicitLeft = 615
    end
  end
end
