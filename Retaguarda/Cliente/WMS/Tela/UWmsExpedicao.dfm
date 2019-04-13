inherited FWmsExpedicao: TFWmsExpedicao
  Left = 342
  Top = 220
  Caption = 'Expedi'#231#227'o'
  ClientWidth = 933
  ExplicitWidth = 949
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 933
    ActivePage = PaginaEdits
    ExplicitWidth = 933
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 925
      inherited PanelGrid: TPanel
        Width = 925
        ExplicitWidth = 925
        inherited Grid: TJvDBUltimGrid
          Width = 925
        end
        inherited PanelFiltroRapido: TPanel
          Width = 925
          ExplicitWidth = 925
          inherited BotaoConsultar: TSpeedButton
            Left = 793
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 624
            ExplicitWidth = 624
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 925
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 925
        ExplicitWidth = 925
        object BevelEdits: TBevel
          Left = 10
          Top = 12
          Width = 905
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxWmsRecebimentoDetalhe: TGroupBox
          Left = 10
          Top = 71
          Width = 905
          Height = 313
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Detalhes'
          TabOrder = 0
          object ActionToolBar1: TActionToolBar
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 895
            Height = 24
            ActionManager = ActionManager
            BiDiMode = bdRightToLeft
            Caption = 'ActionToolBarEdits'
            ColorMap.MenuColor = clMenu
            ColorMap.BtnSelectedColor = clBtnFace
            ColorMap.UnusedColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Orientation = boRightToLeft
            ParentBiDiMode = False
            ParentFont = False
            Spacing = 0
          end
          object PageControl1: TPageControl
            Left = 2
            Top = 45
            Width = 901
            Height = 266
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 1
            object TabSheet1: TTabSheet
              Caption = 'Itens'
              object GridWmsOrdemSeparacaoDetalhe: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 893
                Height = 238
                Align = alClient
                DataSource = DSWmsOrdemSeparacaoDetalhe
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                TitleButtons = True
                AlternateRowColor = 15593713
                TitleArrow = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                SortWith = swFields
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Expedi'#231#227'o'
              ImageIndex = 1
              object GridExpedicao: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 893
                Height = 238
                Align = alClient
                DataSource = DSWmsExpedicao
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                TitleButtons = True
                AlternateRowColor = 15593713
                TitleArrow = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                SortWith = swFields
              end
            end
          end
        end
        object EditDataSolicitacao: TLabeledDateEdit
          Left = 18
          Top = 35
          Width = 121
          Height = 21
          ShowNullDate = False
          TabOrder = 1
          DateEditLabel.Width = 80
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Solicita'#231#227'o:'
        end
        object EditDataLimite: TLabeledDateEdit
          Left = 145
          Top = 35
          Width = 121
          Height = 21
          ShowNullDate = False
          TabOrder = 2
          DateEditLabel.Width = 57
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Limite:'
        end
        object ComboOrigem: TLabeledComboBox
          Left = 272
          Top = 35
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 3
          Text = 'M=MATRIZ'
          Items.Strings = (
            'P=PRODUCAO'
            'M=MATRIZ'
            'F=FILIAL')
          ComboBoxLabel.Width = 38
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Origem:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited BotaoSair: TSpeedButton
      Left = 829
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 729
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 629
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 519
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 529
      ExplicitLeft = 526
    end
  end
  object ActionManager: TActionManager
    ActionBars.ShowHints = False
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionExpedir
            Caption = 'E&xpedir'
            ImageIndex = 30
          end
          item
            Action = ActionExcluirItem
            Caption = '&Excluir Item'
            ImageIndex = 10
          end
          item
            Action = ActionIncluirItem
            Caption = '&Incluir Item'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 307
    Top = 120
    StyleName = 'Ribbon - Silver'
    object ActionIncluirItem: TAction
      Category = 'Opcoes'
      Caption = 'Incluir Item'
      ImageIndex = 31
      OnExecute = ActionIncluirItemExecute
    end
    object ActionExcluirItem: TAction
      Category = 'Opcoes'
      Caption = 'Excluir Item'
      ImageIndex = 10
      OnExecute = ActionExcluirItemExecute
    end
    object ActionExpedir: TAction
      Category = 'Opcoes'
      Caption = 'Expedir'
      ImageIndex = 30
      OnExecute = ActionExpedirExecute
    end
  end
  object CDSWmsExpedicao: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 272
  end
  object DSWmsExpedicao: TDataSource
    DataSet = CDSWmsExpedicao
    Left = 496
    Top = 320
  end
  object CDSWmsOrdemSeparacaoDetalhe: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 240
  end
  object DSWmsOrdemSeparacaoDetalhe: TDataSource
    DataSet = CDSWmsOrdemSeparacaoDetalhe
    Left = 312
    Top = 288
  end
end
