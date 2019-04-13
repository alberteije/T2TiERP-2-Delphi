inherited FOperadoraPlanoSaude: TFOperadoraPlanoSaude
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Operadora Plano Sa'#250'de'
  ClientWidth = 990
  ExplicitWidth = 1006
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 990
    ActivePage = PaginaEdits
    ExplicitWidth = 990
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 982
      inherited PanelGrid: TPanel
        Width = 982
        ExplicitWidth = 982
        inherited Grid: TJvDBUltimGrid
          Width = 982
        end
        inherited PanelFiltroRapido: TPanel
          Width = 982
          ExplicitWidth = 982
          inherited BotaoConsultar: TSpeedButton
            Left = 850
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 681
            ExplicitWidth = 681
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 982
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 982
        ExplicitWidth = 982
        object BevelEdits: TBevel
          Left = 11
          Top = 11
          Width = 958
          Height = 62
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditRegistroAns: TLabeledEdit
          Left = 18
          Top = 38
          Width = 159
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Registro ANS:'
          MaxLength = 20
          TabOrder = 0
        end
        object EditNome: TLabeledEdit
          Left = 183
          Top = 38
          Width = 506
          Height = 21
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          MaxLength = 100
          TabOrder = 1
        end
        object EditClassificacaoContabilConta: TLabeledEdit
          Left = 695
          Top = 38
          Width = 259
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 177
          EditLabel.Height = 13
          EditLabel.Caption = 'Classifica'#231#227'o da Conta Cont'#225'bil [F1]:'
          MaxLength = 30
          TabOrder = 2
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 990
    ExplicitWidth = 990
    inherited BotaoSair: TSpeedButton
      Left = 886
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 786
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 676
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 776
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 576
      ExplicitLeft = 639
    end
  end
end
