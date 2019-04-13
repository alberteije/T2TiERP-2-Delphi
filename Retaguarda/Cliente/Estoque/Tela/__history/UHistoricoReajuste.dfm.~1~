inherited FHistoricoReajuste: TFHistoricoReajuste
  Tag = 1
  Left = 309
  Top = 216
  Caption = 'Reajuste de Pre'#231'os'
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
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 922
        ExplicitWidth = 922
        object BevelEdits: TBevel
          Left = 10
          Top = 43
          Width = 900
          Height = 54
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 103
          Width = 900
          Height = 274
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens'
          TabOrder = 5
          object GridItens: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 896
            Height = 257
            Align = alClient
            DataSource = DSEstoqueReajusteDetalhe
            ReadOnly = True
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
                FieldName = 'ID_PRODUTO'
                Title.Caption = 'Id Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRODUTO.NOME'
                Title.Caption = 'Nome Produto'
                Width = 500
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ORIGINAL'
                Title.Caption = 'Valor Original'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_REAJUSTE'
                Title.Caption = 'Valor Reajuste'
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
        object EditIdColaborador: TLabeledCalcEdit
          Left = 16
          Top = 66
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdColaboradorExit
          OnKeyDown = EditIdColaboradorKeyDown
          OnKeyPress = EditIdColaboradorKeyPress
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Colaborador [F1]:'
        end
        object EditColaborador: TLabeledEdit
          Left = 77
          Top = 66
          Width = 419
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
        object EditDataReajuste: TLabeledDateEdit
          Left = 780
          Top = 66
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 4
          DateEditLabel.Width = 73
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Reajuste:'
        end
        object EditPorcentagemReajuste: TLabeledCalcEdit
          Left = 653
          Top = 66
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          Anchors = [akTop, akRight]
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 28
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Taxa:'
        end
        object ComboBoxTipoReajuste: TLabeledComboBox
          Left = 502
          Top = 66
          Width = 145
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 2
          Text = 'A - Aumentar'
          Items.Strings = (
            'A - Aumentar'
            'D - Diminuir')
          ComboBoxLabel.Width = 70
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Tipo Reajuste:'
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
  object CDSEstoqueReajusteDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'ID_ESTOQUE_REAJUSTE_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VALOR_ORIGINAL'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_REAJUSTE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 836
    Top = 311
    Data = {
      AD0000009619E0BD010000001800000006000000000003000000AD0002494404
      000100000000000A49445F50524F4455544F04000100000000001D49445F4553
      544F5155455F5245414A555354455F4341424543414C484F0400010000000000
      0C50524F4455544F2E4E4F4D4501004900000001000557494454480200020064
      000E56414C4F525F4F524947494E414C08000400000000000E56414C4F525F52
      45414A5553544508000400000000000000}
    object CDSEstoqueReajusteDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSEstoqueReajusteDetalheID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSEstoqueReajusteDetalheVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSEstoqueReajusteDetalheVALOR_REAJUSTE: TFloatField
      FieldName = 'VALOR_REAJUSTE'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSEstoqueReajusteDetalhePRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
    object CDSEstoqueReajusteDetalheID_ESTOQUE_REAJUSTE_CABECALHO: TIntegerField
      FieldName = 'ID_ESTOQUE_REAJUSTE_CABECALHO'
    end
  end
  object DSEstoqueReajusteDetalhe: TDataSource
    DataSet = CDSEstoqueReajusteDetalhe
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
          end
          item
            Action = ActionSelecionarItens
            Caption = '&Selecionar Itens'
            ImageIndex = 36
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionSelecionarItens
            Caption = '&Selecionar Itens'
            ImageIndex = 36
          end>
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
          end
          item
            Action = ActionSelecionarItens
            Caption = '&Selecionar Itens'
            ImageIndex = 36
          end>
        ActionBar = ActionToolBarEdits
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 851
    Top = 88
    StyleName = 'Ribbon - Silver'
    object ActionSelecionarItens: TAction
      Category = 'HistoricoReajuste'
      Caption = 'Selecionar Itens'
      ImageIndex = 36
      OnExecute = ActionSelecionarItensExecute
    end
    object ActionRealizarCalculos: TAction
      Category = 'HistoricoReajuste'
      Caption = 'Realizar C'#225'lculos'
      ImageIndex = 29
      OnExecute = ActionRealizarCalculosExecute
    end
  end
  object CDSProduto: TClientDataSet
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
        Name = 'VALOR_VENDA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 668
    Top = 311
    Data = {
      520000009619E0BD010000001800000003000000000003000000520002494404
      00010000000000044E4F4D450100490000000100055749445448020002006400
      0B56414C4F525F56454E444108000400000000000000}
    object CDSProdutoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CDSProdutoVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
    end
  end
  object DSProduto: TDataSource
    DataSet = CDSProduto
    Left = 668
    Top = 367
  end
end
