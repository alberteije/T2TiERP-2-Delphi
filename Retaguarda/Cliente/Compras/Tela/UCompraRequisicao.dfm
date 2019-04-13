inherited FCompraRequisicao: TFCompraRequisicao
  Left = 342
  Top = 220
  Caption = 'Requisi'#231#227'o'
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
          Height = 97
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxCompraRequisicaoDetalhe: TGroupBox
          Left = 10
          Top = 119
          Width = 905
          Height = 265
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens da Requisi'#231#227'o'
          TabOrder = 5
          object GridCompraRequisicaoDetalhe: TJvDBUltimGrid
            Left = 2
            Top = 47
            Width = 901
            Height = 216
            Align = alClient
            DataSource = DSCompraRequisicaoDetalhe
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = GridCompraRequisicaoDetalheKeyDown
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
          object ActionToolBar1: TActionToolBar
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 895
            Height = 26
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
        end
        object EditIdCompraTipoRequisicao: TLabeledCalcEdit
          Left = 145
          Top = 35
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdCompraTipoRequisicaoKeyUp
          CalcEditLabel.Width = 116
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Tipo de Requisi'#231#227'o [F1]:'
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 18
          Top = 77
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ParentShowHint = False
          ShowButton = False
          ShowHint = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdColaboradorKeyUp
          CalcEditLabel.Width = 87
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Requisitante [F1]:'
        end
        object EditColaborador: TLabeledEdit
          Left = 79
          Top = 77
          Width = 827
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 4
        end
        object EditCompraTipoRequisicao: TLabeledEdit
          Left = 206
          Top = 35
          Width = 700
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 2
        end
        object EditDataRequisicao: TLabeledDateEdit
          Left = 18
          Top = 35
          Width = 121
          Height = 21
          ShowNullDate = False
          TabOrder = 0
          DateEditLabel.Width = 23
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data'
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
  object CDSCompraRequisicaoDetalhe: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSCompraRequisicaoDetalheAfterEdit
    Left = 712
    Top = 264
  end
  object DSCompraRequisicaoDetalhe: TDataSource
    DataSet = CDSCompraRequisicaoDetalhe
    Left = 720
    Top = 312
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
    object ActionAtualizarTotais: TAction
      Category = 'Opcoes'
      Caption = 'Atualizar Totais'
      ImageIndex = 30
    end
  end
end
