inherited FFormacaoPreco: TFFormacaoPreco
  Tag = 1
  Left = 309
  Top = 216
  Caption = 'Forma'#231#227'o de Pre'#231'os'
  ClientWidth = 930
  ExplicitLeft = 309
  ExplicitTop = 216
  ExplicitWidth = 938
  ExplicitHeight = 500
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
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 922
        ExplicitWidth = 922
        object BevelEdits: TBevel
          Left = 10
          Top = 43
          Width = 900
          Height = 105
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 153
          Width = 900
          Height = 242
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens'
          TabOrder = 0
          object GridItens: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 896
            Height = 225
            Align = alClient
            DataSource = DSFormacaoPreco
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
            Columns = <
              item
                Expanded = False
                FieldName = 'NOME'
                ReadOnly = True
                Title.Caption = 'Nome'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_COMPRA'
                ReadOnly = True
                Title.Caption = 'Valor Compra'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENCARGOS_SOBRE_VENDA'
                Title.Caption = 'Encargos sobre a Venda %'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARKUP'
                Title.Caption = 'Markup %'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_VENDA'
                ReadOnly = True
                Title.Caption = 'Valor Venda'
                Width = 100
                Visible = True
              end>
          end
        end
        object ActionToolBarEdits: TActionToolBar
          AlignWithMargins = True
          Left = 7
          Top = 7
          Width = 908
          Height = 24
          ActionManager = ActionManager
          BiDiMode = bdRightToLeft
          Caption = 'ActionToolBarEdits'
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
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
        object EditIdSubgrupoProduto: TLabeledCalcEdit
          Left = 16
          Top = 64
          Width = 61
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 69
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Agrupamento:'
        end
        object EditGrupoProduto: TLabeledEdit
          Left = 77
          Top = 64
          Width = 363
          Height = 21
          TabStop = False
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object EditSubGrupoProduto: TLabeledEdit
          Left = 440
          Top = 64
          Width = 464
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
        object EditEncargos: TLabeledCalcEdit
          Left = 16
          Top = 116
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 48
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Encargos:'
        end
        object EditMarkup: TLabeledCalcEdit
          Left = 143
          Top = 116
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 39
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Markup:'
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
  inherited PopupMenuExportar: TPopupMenu
    Left = 296
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 380
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 496
  end
  object CDSFormacaoPreco: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VALOR_COMPRA'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_VENDA'
        DataType = ftFloat
      end
      item
        Name = 'MARKUP'
        DataType = ftFloat
      end
      item
        Name = 'ENCARGOS_SOBRE_VENDA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 836
    Top = 311
    Data = {
      930000009619E0BD010000001800000006000000000003000000930002494404
      00010000000000044E4F4D450100490000000100055749445448020002006400
      0C56414C4F525F434F4D50524108000400000000000B56414C4F525F56454E44
      410800040000000000064D41524B5550080004000000000014454E434152474F
      535F534F4252455F56454E444108000400000000000000}
    object CDSFormacaoPrecoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSFormacaoPrecoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CDSFormacaoPrecoVALOR_COMPRA: TFloatField
      FieldName = 'VALOR_COMPRA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFormacaoPrecoVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFormacaoPrecoMARKUP: TFloatField
      FieldName = 'MARKUP'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFormacaoPrecoENCARGOS_SOBRE_VENDA: TFloatField
      FieldName = 'ENCARGOS_SOBRE_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object DSFormacaoPreco: TDataSource
    DataSet = CDSFormacaoPreco
    Left = 836
    Top = 367
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
      end
      item
        Items = <
          item
            Action = ActionRealizarCalculos
            Caption = '&Realizar C'#225'lculos'
            ImageIndex = 31
          end>
      end
      item
        Items = <
          item
            Action = ActionRealizarCalculos
            Caption = '&Realizar C'#225'lculos'
            ImageIndex = 29
          end>
        ActionBar = ActionToolBarEdits
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 851
    Top = 88
    StyleName = 'Ribbon - Silver'
    object ActionRealizarCalculos: TAction
      Category = 'FormacaoPreco'
      Caption = 'Realizar C'#225'lculos'
      ImageIndex = 29
      OnExecute = ActionRealizarCalculosExecute
    end
  end
end
