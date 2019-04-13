inherited FCompraPedido: TFCompraPedido
  Left = 342
  Top = 156
  Caption = 'Pedido'
  ClientHeight = 549
  ExplicitWidth = 1008
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 518
    ActivePage = PaginaEdits
    ExplicitHeight = 518
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 490
      inherited PanelGrid: TPanel
        Height = 490
        ExplicitHeight = 490
        inherited Grid: TJvDBUltimGrid
          Height = 438
        end
        inherited PanelFiltroRapido: TPanel
          Top = 438
          ExplicitTop = 438
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 790
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
      ExplicitHeight = 490
      inherited PanelEdits: TPanel
        Height = 490
        ExplicitHeight = 490
        object BevelEdits: TBevel
          Left = 11
          Top = 38
          Width = 963
          Height = 227
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxItensPedido: TGroupBox
          Left = 10
          Top = 271
          Width = 964
          Height = 207
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens do Pedido'
          TabOrder = 29
          object GridCompraPedidoDetalhe: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 960
            Height = 190
            Align = alClient
            DataSource = DSCompraPedidoDetalhe
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = GridCompraPedidoDetalheKeyDown
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
                Title.Caption = 'Id'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_COMPRA_PEDIDO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_PRODUTO'
                Title.Alignment = taCenter
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRODUTO.NOME'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Produto Nome'
                Width = 312
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CFOP'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST_CSOSN'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_SUBTOTAL'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQUOTA_ICMS'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ICMS'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BASE_CALCULO_ICMS'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQUOTA_IPI'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_IPI'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA_DESCONTO'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_DESCONTO'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end>
          end
        end
        object EditLocalEntrega: TLabeledEdit
          Left = 346
          Top = 105
          Width = 288
          Height = 21
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = 'Local Entrega:'
          MaxLength = 100
          TabOrder = 7
        end
        object EditValorSubtotal: TLabeledCalcEdit
          Left = 20
          Top = 190
          Width = 118
          Height = 21
          TabStop = False
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 15
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 71
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Subtotal:'
        end
        object EditValorFrete: TLabeledCalcEdit
          Left = 268
          Top = 235
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 24
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 57
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Frete:'
        end
        object EditValorIcmsSt: TLabeledCalcEdit
          Left = 20
          Top = 235
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 22
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 71
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor ICMS ST:'
        end
        object EditValorICMS: TLabeledCalcEdit
          Left = 640
          Top = 190
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 20
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 56
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor ICMS:'
        end
        object EditFornecedor: TLabeledEdit
          Left = 81
          Top = 62
          Width = 587
          Height = 21
          TabStop = False
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 1
        end
        object ComboBoxTipoFrete: TLabeledComboBox
          Left = 563
          Top = 146
          Width = 62
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 11
          Text = 'CIF'
          Items.Strings = (
            'CIF'
            'FOB')
          ComboBoxLabel.Width = 30
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Frete:'
        end
        object EditDataPedido: TLabeledDateEdit
          Left = 20
          Top = 105
          Width = 100
          Height = 21
          ShowNullDate = False
          TabOrder = 4
          DateEditLabel.Width = 62
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Pedido:'
        end
        object EditDataPrevistaEntrega: TLabeledDateEdit
          Left = 126
          Top = 105
          Width = 100
          Height = 21
          ShowNullDate = False
          TabOrder = 5
          DateEditLabel.Width = 86
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Previs'#227'o Entrega:'
        end
        object EditValorDesconto: TLabeledCalcEdit
          Left = 268
          Top = 190
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 17
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 76
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Desconto:'
        end
        object EditTaxaDesconto: TLabeledCalcEdit
          Left = 144
          Top = 190
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 16
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 76
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Taxa Desconto:'
        end
        object EditValorTotalPedido: TLabeledCalcEdit
          Left = 392
          Top = 190
          Width = 118
          Height = 21
          TabStop = False
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 18
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 55
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Total:'
        end
        object EditIdFornecedor: TLabeledCalcEdit
          Left = 20
          Top = 62
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdFornecedorKeyUp
          CalcEditLabel.Width = 82
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Fornecedor [F1]:'
        end
        object EditIdCompraTipoPedido: TLabeledCalcEdit
          Left = 674
          Top = 62
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdCompraTipoPedidoKeyUp
          CalcEditLabel.Width = 82
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Tipo Pedido [F1]:'
        end
        object EditCompraTipoPedido: TLabeledEdit
          Left = 735
          Top = 62
          Width = 230
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object EditQuantidadeParcelas: TLabeledCalcEdit
          Left = 631
          Top = 146
          Width = 108
          Height = 21
          Anchors = [akTop, akRight]
          ShowButton = False
          TabOrder = 12
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 103
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Quantidade Parcelas:'
        end
        object EditLocalCobranca: TLabeledEdit
          Left = 640
          Top = 105
          Width = 325
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 77
          EditLabel.Height = 13
          EditLabel.Caption = 'Local Cobran'#231'a:'
          MaxLength = 100
          TabOrder = 8
        end
        object ComboBoxFormaPagamento: TLabeledComboBox
          Left = 417
          Top = 146
          Width = 140
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 10
          Text = '0 - Pagamento '#224' Vista '
          Items.Strings = (
            '0 - Pagamento '#224' Vista '
            '1 - Pagamento a Prazo'
            '2 - Outros')
          ComboBoxLabel.Width = 106
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Forma de Pagamento:'
        end
        object EditDataPrevisaoPagamento: TLabeledDateEdit
          Left = 232
          Top = 105
          Width = 108
          Height = 21
          ShowNullDate = False
          TabOrder = 6
          DateEditLabel.Width = 102
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Previs'#227'o Pagamento:'
        end
        object EditContato: TLabeledEdit
          Left = 20
          Top = 146
          Width = 391
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Contato:'
          MaxLength = 100
          TabOrder = 9
        end
        object EditBaseCalculoIcmsSt: TLabeledCalcEdit
          Left = 764
          Top = 190
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 21
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 107
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Base C'#225'lculo ICMS ST:'
        end
        object EditValorSeguro: TLabeledCalcEdit
          Left = 392
          Top = 235
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 25
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 65
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Seguro:'
        end
        object EditValorOutrasDespesas: TLabeledCalcEdit
          Left = 516
          Top = 235
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 26
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 113
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Outras Despesas:'
        end
        object EditValorIPI: TLabeledCalcEdit
          Left = 640
          Top = 235
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 27
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 45
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor IPI:'
        end
        object EditBaseCalculoICMS: TLabeledCalcEdit
          Left = 516
          Top = 190
          Width = 118
          Height = 21
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 19
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 92
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Base C'#225'lculo ICMS:'
        end
        object EditValorTotalProdutos: TLabeledCalcEdit
          Left = 144
          Top = 235
          Width = 118
          Height = 21
          TabStop = False
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 23
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 101
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Total Produtos:'
        end
        object EditValorTotalNF: TLabeledCalcEdit
          Left = 764
          Top = 235
          Width = 118
          Height = 21
          TabStop = False
          DisplayFormat = '#,###,##0.00'
          ReadOnly = True
          TabOrder = 28
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 108
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Total Nota fiscal:'
        end
        object EditDiasPrimeiroVencimento: TLabeledCalcEdit
          Left = 745
          Top = 146
          Width = 130
          Height = 21
          Anchors = [akTop, akRight]
          ShowButton = False
          TabOrder = 13
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 123
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Dias Primeiro Vencimento:'
        end
        object EditDiasIntervalo: TLabeledCalcEdit
          Left = 881
          Top = 146
          Width = 84
          Height = 21
          Anchors = [akTop, akRight]
          ShowButton = False
          TabOrder = 14
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 71
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Dias Intervalo:'
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 4
          Width = 976
          Height = 26
          ActionManager = ActionManager1
          Caption = 'ActionToolBar1'
          Color = clMenuBar
          ColorMap.DisabledFontColor = 7171437
          ColorMap.HighlightColor = clWhite
          ColorMap.BtnSelectedFont = clBlack
          ColorMap.UnusedColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Orientation = boRightToLeft
          ParentFont = False
          Spacing = 0
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      ExplicitLeft = 526
    end
  end
  object DSCompraPedidoDetalhe: TDataSource
    DataSet = CDSCompraPedidoDetalhe
    Left = 836
    Top = 367
  end
  object CDSCompraPedidoDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_COMPRA_PEDIDO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO.NOME'
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
        Name = 'CST_CSOSN'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CFOP'
        DataType = ftInteger
      end
      item
        Name = 'BASE_CALCULO_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'ALIQUOTA_IPI'
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
    AfterEdit = CDSCompraPedidoDetalheAfterEdit
    BeforePost = CDSCompraPedidoDetalheBeforePost
    Left = 840
    Top = 424
    Data = {
      CF0200009619E0BD020000001800000012000000000003000000CF0202494404
      000100000000001049445F434F4D5052415F50454449444F0400010000000000
      0A49445F50524F4455544F04000100000000000C50524F4455544F2E4E4F4D45
      01004900000001000557494454480200020064000A5155414E5449444144450A
      0012000000020008444543494D414C5302000200060005574944544802000200
      0F000E56414C4F525F554E49544152494F0A0012000000020008444543494D41
      4C53020002000600055749445448020002000F000E56414C4F525F535542544F
      54414C0A0012000000020008444543494D414C53020002000600055749445448
      020002000F000D544158415F444553434F4E544F0A0012000000020008444543
      494D414C53020002000600055749445448020002000F000E56414C4F525F4445
      53434F4E544F0A0012000000020008444543494D414C53020002000600055749
      445448020002000F000B56414C4F525F544F54414C0A00120000000200084445
      43494D414C53020002000600055749445448020002000F00094353545F43534F
      534E01004900000001000557494454480200020003000443464F500400010000
      00000011424153455F43414C43554C4F5F49434D530A00120000000200084445
      43494D414C53020002000600055749445448020002000F000A56414C4F525F49
      434D530A0012000000020008444543494D414C53020002000600055749445448
      020002000F000956414C4F525F4950490A0012000000020008444543494D414C
      53020002000600055749445448020002000F000D414C4951554F54415F49434D
      530A0012000000020008444543494D414C530200020006000557494454480200
      02000F000C414C4951554F54415F4950490A0012000000020008444543494D41
      4C53020002000600055749445448020002000F00085045525349535445010049
      00000001000557494454480200020001000000}
    object CDSCompraPedidoDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSCompraPedidoDetalheID_COMPRA_PEDIDO: TIntegerField
      DisplayLabel = 'Id Pedido'
      FieldName = 'ID_COMPRA_PEDIDO'
    end
    object CDSCompraPedidoDetalheID_PRODUTO: TIntegerField
      DisplayLabel = 'Id Produto'
      FieldName = 'ID_PRODUTO'
    end
    object CDSCompraPedidoDetalheQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheVALOR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheVALOR_SUBTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Subtotal'
      FieldName = 'VALOR_SUBTOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheTAXA_DESCONTO: TFMTBCDField
      DisplayLabel = 'Taxa Desconto'
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheVALOR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheVALOR_TOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheCST_CSOSN: TStringField
      DisplayLabel = 'Cst / Csosn'
      DisplayWidth = 3
      FieldName = 'CST_CSOSN'
      FixedChar = True
      Size = 3
    end
    object CDSCompraPedidoDetalheCFOP: TIntegerField
      DisplayLabel = 'Cfop'
      FieldName = 'CFOP'
    end
    object CDSCompraPedidoDetalheBASE_CALCULO_ICMS: TFMTBCDField
      DisplayLabel = 'Base Calculo Icms'
      FieldName = 'BASE_CALCULO_ICMS'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheVALOR_ICMS: TFMTBCDField
      DisplayLabel = 'Valor Icms'
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheVALOR_IPI: TFMTBCDField
      DisplayLabel = 'Valor Ipi'
      FieldName = 'VALOR_IPI'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheALIQUOTA_ICMS: TFMTBCDField
      DisplayLabel = 'Al'#237'quota Icms'
      FieldName = 'ALIQUOTA_ICMS'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalheALIQUOTA_IPI: TFMTBCDField
      DisplayLabel = 'Al'#237'quota Ipi'
      FieldName = 'ALIQUOTA_IPI'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSCompraPedidoDetalhePERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSCompraPedidoDetalhePRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionAtualizarValores
            Caption = '&Atualizar Valores'
            ImageIndex = 30
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 694
    Top = 425
    StyleName = 'Platform Default'
    object ActionAtualizarValores: TAction
      Caption = 'Atualizar Valores'
      ImageIndex = 30
      OnExecute = ActionAtualizarValoresExecute
    end
  end
end
