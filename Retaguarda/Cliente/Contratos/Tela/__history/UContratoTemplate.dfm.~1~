inherited FContratoTemplate: TFContratoTemplate
  Tag = 1
  Left = 309
  Top = 215
  Caption = 'Templates'
  ClientWidth = 930
  ExplicitLeft = 309
  ExplicitTop = 215
  ExplicitWidth = 938
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 930
    ActivePage = PaginaEdits
    ExplicitWidth = 930
    inherited PaginaGrid: TTabSheet
      inherited PanelGrid: TPanel
        Width = 922
        ExplicitWidth = 922
        inherited Grid: TJvDBUltimGrid
          Width = 922
        end
        inherited PanelFiltroRapido: TPanel
          Width = 922
          ExplicitWidth = 922
          inherited BotaoConsultar: TSpeedButton
            Left = 790
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 621
            ExplicitWidth = 621
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 922
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 922
        ExplicitWidth = 922
        object BevelEdits: TBevel
          Left = 9
          Top = 44
          Width = 904
          Height = 140
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditNome: TLabeledEdit
          Left = 18
          Top = 67
          Width = 884
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          MaxLength = 50
          TabOrder = 0
        end
        object MemoDescricao: TLabeledMemo
          Left = 18
          Top = 110
          Width = 884
          Height = 65
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 1
          MemoLabel.Width = 50
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Descri'#231#227'o:'
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 4
          Width = 914
          Height = 26
          ActionManager = ActionManager1
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
          ExplicitHeight = 23
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 930
    ExplicitWidth = 930
    inherited BotaoSair: TSpeedButton
      Left = 826
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 726
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 516
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 526
      ExplicitLeft = 526
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionEditarArquivo
            Caption = '&Editar Arquivo'
            ImageIndex = 17
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 756
    Top = 271
    StyleName = 'Platform Default'
    object ActionEditarArquivo: TAction
      Caption = 'Editar Arquivo'
      ImageIndex = 17
      OnExecute = ActionEditarArquivoExecute
    end
  end
end
