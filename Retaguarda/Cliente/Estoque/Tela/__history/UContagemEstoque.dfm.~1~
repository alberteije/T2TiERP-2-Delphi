inherited FContagemEstoque: TFContagemEstoque
  Tag = 1
  Left = 309
  Top = 216
  Caption = 'Contagem Estoque'
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
          TabOrder = 0
          object GridItens: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 896
            Height = 257
            Align = alClient
            DataSource = DSContagemEstoqueDetalhe
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
                ReadOnly = True
                Title.Caption = 'Id Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRODUTO.NOME'
                ReadOnly = True
                Title.Caption = 'Nome Produto'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE_CONTADA'
                Title.Caption = 'Quantidade Contada'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE_SISTEMA'
                ReadOnly = True
                Title.Caption = 'Quantidade Sistema'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACURACIDADE'
                ReadOnly = True
                Title.Caption = 'Acuracidade (%)'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIVERGENCIA'
                ReadOnly = True
                Title.Caption = 'Diverg'#234'ncia (%)'
                Visible = True
              end>
          end
        end
        object EditDataContagem: TLabeledDateEdit
          Left = 20
          Top = 66
          Width = 121
          Height = 21
          TabOrder = 1
          DateEditLabel.Width = 79
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Contagem:'
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
        object CheckBoxAtualizaEstoque: TCheckBox
          Left = 161
          Top = 68
          Width = 144
          Height = 17
          Caption = 'Atualizar Estoque'
          TabOrder = 3
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
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 704
    Top = 24
  end
  object CDSContagemEstoqueDetalhe: TClientDataSet
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
        Name = 'ID_ESTOQUE_CONTAGEM_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QUANTIDADE_CONTADA'
        DataType = ftFloat
      end
      item
        Name = 'QUANTIDADE_SISTEMA'
        DataType = ftFloat
      end
      item
        Name = 'ACURACIDADE'
        DataType = ftFloat
      end
      item
        Name = 'DIVERGENCIA'
        DataType = ftFloat
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSContagemEstoqueDetalheAfterEdit
    AfterPost = CDSContagemEstoqueDetalheAfterPost
    Left = 836
    Top = 311
    Data = {
      FA0000009619E0BD010000001800000009000000000003000000FA0002494404
      000100000000000A49445F50524F4455544F04000100000000001D49445F4553
      544F5155455F434F4E544147454D5F4341424543414C484F0400010000000000
      0C50524F4455544F2E4E4F4D4501004900000001000557494454480200020064
      00125155414E5449444144455F434F4E54414441080004000000000012515541
      4E5449444144455F53495354454D4108000400000000000B4143555241434944
      41444508000400000000000B444956455247454E434941080004000000000008
      504552534953544501004900000001000557494454480200020001000000}
    object CDSContagemEstoqueDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSContagemEstoqueDetalheID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSContagemEstoqueDetalheQUANTIDADE_CONTADA: TFloatField
      FieldName = 'QUANTIDADE_CONTADA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSContagemEstoqueDetalheQUANTIDADE_SISTEMA: TFloatField
      FieldName = 'QUANTIDADE_SISTEMA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSContagemEstoqueDetalheACURACIDADE: TFloatField
      FieldName = 'ACURACIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSContagemEstoqueDetalheDIVERGENCIA: TFloatField
      FieldName = 'DIVERGENCIA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSContagemEstoqueDetalhePRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
    object CDSContagemEstoqueDetalhePERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSContagemEstoqueDetalheID_ESTOQUE_CONTAGEM_CABECALHO: TIntegerField
      FieldName = 'ID_ESTOQUE_CONTAGEM_CABECALHO'
    end
  end
  object DSContagemEstoqueDetalhe: TDataSource
    DataSet = CDSContagemEstoqueDetalhe
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
    Top = 80
    StyleName = 'Ribbon - Silver'
    object ActionSelecionarItens: TAction
      Category = 'ContagemEstoque'
      Caption = 'Selecionar Itens'
      ImageIndex = 36
      OnExecute = ActionSelecionarItensExecute
    end
    object ActionRealizarCalculos: TAction
      Category = 'ContagemEstoque'
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
        Name = 'QUANTIDADE_ESTOQUE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 644
    Top = 311
    Data = {
      590000009619E0BD010000001800000003000000000003000000590002494404
      00010000000000044E4F4D450100490000000100055749445448020002006400
      125155414E5449444144455F4553544F51554508000400000000000000}
    object CDSProdutoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CDSProdutoQUANTIDADE_ESTOQUE: TFloatField
      FieldName = 'QUANTIDADE_ESTOQUE'
    end
  end
  object DSProduto: TDataSource
    DataSet = CDSProduto
    Left = 644
    Top = 367
  end
end
