inherited FCompraMapaComparativo: TFCompraMapaComparativo
  Tag = 1
  Left = 334
  Top = 147
  Caption = 'Mapa Comparativo'
  ClientHeight = 534
  ExplicitWidth = 1008
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 503
    ActivePage = PaginaEdits
    ExplicitHeight = 503
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 475
      inherited PanelGrid: TPanel
        Height = 475
        ExplicitHeight = 475
        inherited Grid: TJvDBUltimGrid
          Height = 423
        end
        inherited PanelFiltroRapido: TPanel
          Top = 423
          ExplicitTop = 423
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 683
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 475
      inherited PanelEdits: TPanel
        Height = 475
        ExplicitHeight = 475
        object BevelEdits: TBevel
          Left = 11
          Top = 12
          Width = 963
          Height = 51
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
          ExplicitWidth = 863
        end
        object EditDescricao: TLabeledEdit
          Left = 150
          Top = 33
          Width = 815
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          TabOrder = 1
        end
        object EditDataCotacao: TLabeledDateEdit
          Left = 23
          Top = 33
          Width = 121
          Height = 21
          ShowNullDate = False
          TabOrder = 0
          DateEditLabel.Width = 70
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Cota'#231#227'o:'
        end
        object GroupBoxItensCotacao: TGroupBox
          Left = 11
          Top = 240
          Width = 963
          Height = 217
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Selecionar itens para gerar pedidos:'
          TabOrder = 3
          object GridCompraMapaComparativo: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 959
            Height = 200
            Align = alClient
            DataSource = DSCompraMapaComparativo
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
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORNECEDOR_NOME'
                Title.Caption = 'Fornecedor'
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_COMPRA_FORNECEDOR_COTACAO'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_PRODUTO'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Id Produto'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRODUTO_NOME'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Nome Produto'
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'QUANTIDADE'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Quantidade'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE_PEDIDA'
                Title.Caption = 'Quantidade Pedida'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                ReadOnly = True
                Title.Caption = 'Valor Unit'#225'rio'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VALOR_SUBTOTAL'
                ReadOnly = True
                Title.Caption = 'Valor Subtotal'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TAXA_DESCONTO'
                ReadOnly = True
                Title.Caption = 'Taxa Desconto'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VALOR_DESCONTO'
                ReadOnly = True
                Title.Caption = 'Valor Desconto'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                ReadOnly = True
                Title.Caption = 'Valor Total'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_COMPRA_COTACAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_COMPRA_COTACAO_DETALHE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_FORNECEDOR'
                ReadOnly = True
                Visible = False
              end>
          end
        end
        object GroupBoxFornecedores: TGroupBox
          Left = 11
          Top = 67
          Width = 963
          Height = 166
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Fornecedores:'
          TabOrder = 2
          object GridCompraFornecedorCotacao: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 959
            Height = 149
            Align = alClient
            DataSource = DSCompraFornecedorCotacao
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
                FieldName = 'ID'
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_COMPRA_COTACAO'
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_FORNECEDOR'
                Title.Alignment = taCenter
                Width = 77
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORNECEDOR.NOME'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Fornecedor'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRAZO_ENTREGA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONDICOES_PAGAMENTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_SUBTOTAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA_DESCONTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_DESCONTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 678
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 778
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 578
      ExplicitLeft = 639
    end
  end
  object DSCompraFornecedorCotacao: TDataSource
    DataSet = CDSCompraFornecedorCotacao
    Left = 736
    Top = 200
  end
  object DSCompraMapaComparativo: TDataSource
    DataSet = CDSCompraMapaComparativo
    Left = 760
    Top = 424
  end
  object CDSCompraFornecedorCotacao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FORNECEDOR'
        DataType = ftInteger
      end
      item
        Name = 'FORNECEDOR.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID_COMPRA_COTACAO'
        DataType = ftInteger
      end
      item
        Name = 'PRAZO_ENTREGA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CONDICOES_PAGAMENTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALOR_SUBTOTAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 736
    Top = 152
    Data = {
      9E0100009619E0BD02000000180000000B0000000000030000009E0102494404
      000100000000000D49445F464F524E454345444F5204000100000000000F464F
      524E454345444F522E4E4F4D4501004900000001000557494454480200020064
      001149445F434F4D5052415F434F544143414F04000100000000000D5052415A
      4F5F454E54524547410100490000000100055749445448020002001E0013434F
      4E4449434F45535F504147414D454E544F010049000000010005574944544802
      0002001E000E56414C4F525F535542544F54414C0A0012000000020008444543
      494D414C53020002000600055749445448020002000F000D544158415F444553
      434F4E544F0A0012000000020008444543494D414C5302000200060005574944
      5448020002000F000E56414C4F525F444553434F4E544F0A0012000000020008
      444543494D414C53020002000600055749445448020002000F0005544F54414C
      0A0012000000020008444543494D414C53020002000600055749445448020002
      000F000850455253495354450100490000000100055749445448020002000100
      0000}
    object CDSCompraFornecedorCotacaoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSCompraFornecedorCotacaoID_FORNECEDOR: TIntegerField
      DisplayLabel = 'Id Fornecedor'
      FieldName = 'ID_FORNECEDOR'
    end
    object CDSCompraFornecedorCotacaoID_COMPRA_COTACAO: TIntegerField
      DisplayLabel = 'Id Cota'#231#227'o'
      FieldName = 'ID_COMPRA_COTACAO'
    end
    object CDSCompraFornecedorCotacaoPRAZO_ENTREGA: TStringField
      DisplayLabel = 'Prazo de Entrega'
      FieldName = 'PRAZO_ENTREGA'
      Size = 30
    end
    object CDSCompraFornecedorCotacaoCONDICOES_PAGAMENTO: TStringField
      DisplayLabel = 'Condi'#231#245'es de Pagamento'
      FieldName = 'CONDICOES_PAGAMENTO'
      Size = 30
    end
    object CDSCompraFornecedorCotacaoVALOR_SUBTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Subtotal'
      FieldName = 'VALOR_SUBTOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraFornecedorCotacaoTAXA_DESCONTO: TFMTBCDField
      DisplayLabel = 'Taxa Desconto'
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraFornecedorCotacaoVALOR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraFornecedorCotacaoTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraFornecedorCotacaoPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSCompraFornecedorCotacaoFORNECEDORNOME: TStringField
      FieldName = 'FORNECEDOR.NOME'
      Size = 100
    end
  end
  object CDSCompraMapaComparativo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_COMPRA_COTACAO'
        DataType = ftInteger
      end
      item
        Name = 'ID_COMPRA_FORNECEDOR_COTACAO'
        DataType = ftInteger
      end
      item
        Name = 'ID_COMPRA_COTACAO_DETALHE'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO_NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FORNECEDOR_NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'QUANTIDADE_PEDIDA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_SUBTOTAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_FORNECEDOR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = CDSCompraMapaComparativoAfterPost
    Left = 760
    Top = 368
    Data = {
      5F0200009619E0BD02000000180000000F0000000000030000005F021149445F
      434F4D5052415F434F544143414F04000100000000001C49445F434F4D505241
      5F464F524E454345444F525F434F544143414F04000100000000001949445F43
      4F4D5052415F434F544143414F5F444554414C484504000100000000000A4944
      5F50524F4455544F04000100000000000C50524F4455544F5F4E4F4D45010049
      00000001000557494454480200020064000F464F524E454345444F525F4E4F4D
      4501004900000001000557494454480200020064000A5155414E544944414445
      0A0012000000020008444543494D414C53020002000600055749445448020002
      000F00115155414E5449444144455F5045444944410A00120000000200084445
      43494D414C53020002000600055749445448020002000F000E56414C4F525F55
      4E49544152494F0A0012000000020008444543494D414C530200020006000557
      49445448020002000F000E56414C4F525F535542544F54414C0A001200000002
      0008444543494D414C53020002000600055749445448020002000F000D544158
      415F444553434F4E544F0A0012000000020008444543494D414C530200020006
      00055749445448020002000F000E56414C4F525F444553434F4E544F0A001200
      0000020008444543494D414C53020002000600055749445448020002000F000B
      56414C4F525F544F54414C0A0012000000020008444543494D414C5302000200
      0600055749445448020002000F00085045525349535445010049000000010005
      57494454480200020001000D49445F464F524E454345444F5204000100000000
      000000}
    object CDSCompraMapaComparativoID_COMPRA_COTACAO: TIntegerField
      FieldName = 'ID_COMPRA_COTACAO'
    end
    object CDSCompraMapaComparativoID_COMPRA_FORNECEDOR_COTACAO: TIntegerField
      FieldName = 'ID_COMPRA_FORNECEDOR_COTACAO'
    end
    object CDSCompraMapaComparativoID_COMPRA_COTACAO_DETALHE: TIntegerField
      FieldName = 'ID_COMPRA_COTACAO_DETALHE'
    end
    object CDSCompraMapaComparativoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSCompraMapaComparativoPRODUTO_NOME: TStringField
      FieldName = 'PRODUTO_NOME'
      Size = 100
    end
    object CDSCompraMapaComparativoFORNECEDOR_NOME: TStringField
      FieldName = 'FORNECEDOR_NOME'
      Size = 100
    end
    object CDSCompraMapaComparativoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoQUANTIDADE_PEDIDA: TFMTBCDField
      FieldName = 'QUANTIDADE_PEDIDA'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoVALOR_SUBTOTAL: TFMTBCDField
      FieldName = 'VALOR_SUBTOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoTAXA_DESCONTO: TFMTBCDField
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraMapaComparativoPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSCompraMapaComparativoID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end
      item
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 871
    Top = 186
    StyleName = 'Platform Default'
  end
end
