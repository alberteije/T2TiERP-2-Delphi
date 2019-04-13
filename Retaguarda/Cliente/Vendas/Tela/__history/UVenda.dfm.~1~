inherited FVenda: TFVenda
  Left = 347
  Top = 75
  Caption = 'Vendas'
  ClientHeight = 616
  ExplicitLeft = 347
  ExplicitTop = 75
  ExplicitWidth = 1000
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 585
    ActivePage = PaginaEdits
    ExplicitWidth = 933
    ExplicitHeight = 518
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 925
      ExplicitHeight = 490
      inherited PanelGrid: TPanel
        Height = 557
        ExplicitWidth = 925
        ExplicitHeight = 490
        inherited Grid: TJvDBUltimGrid
          Height = 505
        end
        inherited PanelFiltroRapido: TPanel
          Top = 505
          ExplicitTop = 438
          ExplicitWidth = 925
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 624
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 925
      ExplicitHeight = 490
      inherited PanelEdits: TPanel
        Height = 557
        ExplicitWidth = 925
        ExplicitHeight = 490
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 319
          Width = 964
          Height = 226
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens da Venda [F1]'
          TabOrder = 0
          object GridParcelas: TJvDBUltimGrid
            Left = 2
            Top = 41
            Width = 960
            Height = 183
            Align = alClient
            DataSource = DSVendaDetalhe
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = GridParcelasKeyDown
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
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE '
                Title.Caption = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                ReadOnly = True
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_SUBTOTAL'
                ReadOnly = True
                Title.Caption = 'Valor Subtotal'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA_DESCONTO'
                Title.Caption = 'Taxa de Desconto'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_DESCONTO'
                ReadOnly = True
                Title.Caption = 'Valor do Desconto'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                ReadOnly = True
                Title.Caption = 'Valor Total'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA_COMISSAO'
                Title.Caption = 'Taxa Comiss'#227'o'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_COMISSAO'
                ReadOnly = True
                Title.Caption = 'Valor Comiss'#227'o'
                Width = 100
                Visible = True
              end>
          end
          object ActionToolBar1: TActionToolBar
            Left = 2
            Top = 15
            Width = 960
            Height = 26
            ActionManager = ActionManager1
            BiDiMode = bdRightToLeft
            Caption = 'ActionToolBar1'
            ColorMap.HighlightColor = 15660791
            ColorMap.BtnSelectedColor = clBtnFace
            ColorMap.UnusedColor = 15660791
            Orientation = boRightToLeft
            ParentBiDiMode = False
            Spacing = 0
          end
        end
        object ScrollBox1: TScrollBox
          Left = 6
          Top = 8
          Width = 979
          Height = 305
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            975
            301)
          object BevelEdits: TBevel
            Left = 7
            Top = 8
            Width = 959
            Height = 288
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object EditLocalEntrega: TLabeledEdit
            Left = 17
            Top = 119
            Width = 420
            Height = 21
            EditLabel.Width = 69
            EditLabel.Height = 13
            EditLabel.Caption = 'Local Entrega:'
            MaxLength = 100
            TabOrder = 13
          end
          object MemoObservacao: TLabeledMemo
            Left = 16
            Top = 249
            Width = 940
            Height = 40
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 29
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
          object EditValorSubtotal: TLabeledCalcEdit
            Left = 17
            Top = 207
            Width = 118
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 23
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 71
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Subtotal:'
          end
          object EditValorFrete: TLabeledCalcEdit
            Left = 645
            Top = 162
            Width = 118
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 21
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 57
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Frete:'
          end
          object EditValorComissao: TLabeledCalcEdit
            Left = 265
            Top = 207
            Width = 118
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 25
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Comiss'#227'o:'
          end
          object EditTaxaComissao: TLabeledCalcEdit
            Left = 141
            Top = 207
            Width = 118
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 24
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Comiss'#227'o:'
          end
          object EditVendedor: TLabeledEdit
            Left = 751
            Top = 35
            Width = 205
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 6
          end
          object EditCliente: TLabeledEdit
            Left = 751
            Top = 78
            Width = 205
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 12
          end
          object EditCondicoesPagamento: TLabeledEdit
            Left = 76
            Top = 78
            Width = 261
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 8
          end
          object EditTransportadora: TLabeledEdit
            Left = 404
            Top = 78
            Width = 280
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 10
          end
          object ComboBoxTipoVenda: TLabeledComboBox
            Left = 16
            Top = 35
            Width = 105
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'Do Or'#231'amento'
            OnChange = ComboBoxTipoVendaChange
            OnClick = ComboBoxTipoVendaChange
            Items.Strings = (
              'Do Or'#231'amento'
              'Venda Direta')
            ComboBoxLabel.Width = 57
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo Venda:'
          end
          object ComboBoxTipoFrete: TLabeledComboBox
            Left = 17
            Top = 162
            Width = 62
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 15
            Text = 'CIF'
            Items.Strings = (
              'CIF'
              'FOB')
            ComboBoxLabel.Width = 30
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Frete:'
          end
          object EditDataVenda: TLabeledDateEdit
            Left = 229
            Top = 162
            Width = 121
            Height = 21
            TabOrder = 17
            DateEditLabel.Width = 60
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Venda:'
          end
          object EditDataSaida: TLabeledDateEdit
            Left = 356
            Top = 162
            Width = 121
            Height = 21
            TabOrder = 18
            DateEditLabel.Width = 56
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Sa'#237'da:'
          end
          object EditValorDesconto: TLabeledCalcEdit
            Left = 513
            Top = 207
            Width = 118
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 27
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Desconto:'
          end
          object EditTaxaDesconto: TLabeledCalcEdit
            Left = 389
            Top = 207
            Width = 118
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 26
            DecimalPlacesAlwaysShown = False
            OnExit = EditTaxaDescontoExit
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Desconto:'
          end
          object EditValorTotal: TLabeledCalcEdit
            Left = 637
            Top = 207
            Width = 118
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 28
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 55
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Total:'
          end
          object EditIdVendedor: TLabeledCalcEdit
            Left = 690
            Top = 35
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 5
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdVendedorExit
            OnKeyDown = EditIdVendedorKeyDown
            OnKeyPress = EditIdVendedorKeyPress
            CalcEditLabel.Width = 73
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Vendedor [F1]:'
          end
          object EditIdCliente: TLabeledCalcEdit
            Left = 690
            Top = 78
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 11
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdClienteExit
            OnKeyDown = EditIdClienteKeyDown
            OnKeyPress = EditIdClienteKeyPress
            CalcEditLabel.Width = 60
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Cliente [F1]:'
          end
          object EditIdCondicoesPagamento: TLabeledCalcEdit
            Left = 15
            Top = 78
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ParentShowHint = False
            ShowButton = False
            ShowHint = False
            TabOrder = 7
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdCondicoesPagamentoExit
            OnKeyDown = EditIdCondicoesPagamentoKeyDown
            OnKeyPress = EditIdCondicoesPagamentoKeyPress
            CalcEditLabel.Width = 148
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Condi'#231#245'es de Pagamento [F1]:'
          end
          object EditIdTransportadora: TLabeledCalcEdit
            Left = 343
            Top = 78
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 9
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdTransportadoraExit
            OnKeyDown = EditIdTransportadoraKeyDown
            OnKeyPress = EditIdTransportadoraKeyPress
            CalcEditLabel.Width = 102
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Transportadora [F1]:'
          end
          object EditIdTipoNotaFiscal: TLabeledCalcEdit
            Left = 423
            Top = 35
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 3
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdTipoNotaFiscalExit
            OnKeyDown = EditIdTipoNotaFiscalKeyDown
            OnKeyPress = EditIdTipoNotaFiscalKeyPress
            CalcEditLabel.Width = 102
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Tipo Nota Fiscal [F1]:'
          end
          object EditTipoNotaFiscal: TLabeledEdit
            Left = 484
            Top = 35
            Width = 200
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 4
          end
          object EditIdOrcamentoVendaCabecalho: TLabeledCalcEdit
            Left = 127
            Top = 35
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdOrcamentoVendaCabecalhoExit
            OnKeyDown = EditIdOrcamentoVendaCabecalhoKeyDown
            OnKeyPress = EditIdOrcamentoVendaCabecalhoKeyPress
            CalcEditLabel.Width = 80
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Or'#231'amento [F1]:'
          end
          object EditOrcamentoVendaCabecalho: TLabeledEdit
            Left = 188
            Top = 35
            Width = 229
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 2
          end
          object EditHoraSaida: TLabeledMaskEdit
            Left = 483
            Top = 162
            Width = 63
            Height = 21
            EditLabel.Width = 56
            EditLabel.Height = 13
            EditLabel.Caption = 'Hora Sa'#237'da:'
            MaxLength = 8
            TabOrder = 19
            Text = '  :::::::::: : :'
            Required = False
            EditMask = '##:##:##;1;_'
            MaskState = [msMasked]
          end
          object EditNumeroFatura: TLabeledCalcEdit
            Left = 554
            Top = 162
            Width = 85
            Height = 21
            ShowButton = False
            TabOrder = 20
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'N'#250'mero Fatura:'
          end
          object EditLocalCobranca: TLabeledEdit
            Left = 443
            Top = 119
            Width = 513
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 77
            EditLabel.Height = 13
            EditLabel.Caption = 'Local Cobran'#231'a:'
            MaxLength = 100
            TabOrder = 14
          end
          object ComboBoxFormaPagamento: TLabeledComboBox
            Left = 85
            Top = 162
            Width = 138
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 16
            Text = '0-Pagamento '#224' Vista '
            Items.Strings = (
              '0-Pagamento '#224' Vista '
              '1-Pagamento a Prazo'
              '2-Outros')
            ComboBoxLabel.Width = 106
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Forma de Pagamento:'
          end
          object EditValorSeguro: TLabeledCalcEdit
            Left = 769
            Top = 162
            Width = 118
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 22
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 65
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Seguro:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    ExplicitWidth = 933
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
  object CDSVendaDetalhe: TClientDataSet
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
        Name = 'ID_VENDA_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'QUANTIDADE '
        DataType = ftFloat
      end
      item
        Name = 'VALOR_UNITARIO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_SUBTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'TAXA_DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftFloat
      end
      item
        Name = 'TAXA_COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'PRODUTO.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSVendaDetalheAfterEdit
    BeforePost = CDSVendaDetalheBeforePost
    Left = 524
    Top = 495
    Data = {
      410100009619E0BD01000000180000000D000000000003000000410102494404
      000100000000000A49445F50524F4455544F04000100000000001249445F5645
      4E44415F4341424543414C484F04000100000000000B5155414E544944414445
      2008000400000000000E56414C4F525F554E49544152494F0800040000000000
      0E56414C4F525F535542544F54414C08000400000000000D544158415F444553
      434F4E544F08000400000000000E56414C4F525F444553434F4E544F08000400
      000000000B56414C4F525F544F54414C08000400000000000D544158415F434F
      4D495353414F08000400000000000E56414C4F525F434F4D495353414F080004
      00000000000C50524F4455544F2E4E4F4D450100490000000100055749445448
      0200020064000850455253495354450100490000000100055749445448020002
      0001000000}
    object CDSVendaDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSVendaDetalheID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSVendaDetalheID_VENDA_CABECALHO: TIntegerField
      FieldName = 'ID_VENDA_CABECALHO'
    end
    object CDSVendaDetalheQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE '
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheVALOR_SUBTOTAL: TFloatField
      FieldName = 'VALOR_SUBTOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheTAXA_DESCONTO: TFloatField
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheTAXA_COMISSAO: TFloatField
      FieldName = 'TAXA_COMISSAO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalheVALOR_COMISSAO: TFloatField
      FieldName = 'VALOR_COMISSAO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSVendaDetalhePRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
    object CDSVendaDetalhePERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSVendaDetalhe: TDataSource
    DataSet = CDSVendaDetalhe
    Left = 524
    Top = 447
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionAtualizarTotais
            Caption = '&Atualizar Totais'
            ImageIndex = 29
          end>
      end
      item
        Items = <
          item
            Action = ActionAtualizarTotais
            Caption = '&Atualizar Totais'
            ImageIndex = 29
          end
          item
            Action = ActionExcluirItem
            Caption = '&Remover Item da Venda'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarProduto
            Caption = 'A&dicionar Produto'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end>
    Images = FDataModule.ImagensCadastros
    Left = 374
    Top = 411
    StyleName = 'Platform Default'
    object ActionAtualizarTotais: TAction
      Caption = 'Atualizar Totais'
      ImageIndex = 29
      OnExecute = ActionAtualizarTotaisExecute
    end
    object ActionAdicionarProduto: TAction
      Caption = 'Adicionar Produto'
      ImageIndex = 31
      OnExecute = ActionAdicionarProdutoExecute
    end
    object ActionExcluirItem: TAction
      Caption = 'Remover Item da Venda'
      ImageIndex = 10
      OnExecute = ActionExcluirItemExecute
    end
  end
  object CDSOrcamentoPedidoVendaDet: TClientDataSet
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
        Name = 'ID_VENDA_ORCAMENTO_CABECALHO'
        DataType = ftInteger
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
        Name = 'VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'PRODUTO.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 808
    Top = 496
    Data = {
      1D0200009619E0BD02000000180000000D0000000000030000001D0202494404
      000100000000000A49445F50524F4455544F04000100000000001C49445F5645
      4E44415F4F5243414D454E544F5F4341424543414C484F04000100000000000A
      5155414E5449444144450A0012000000020008444543494D414C530200020006
      00055749445448020002000F000E56414C4F525F554E49544152494F0A001200
      0000020008444543494D414C53020002000600055749445448020002000F000E
      56414C4F525F535542544F54414C0A0012000000020008444543494D414C5302
      0002000600055749445448020002000F000D544158415F444553434F4E544F0A
      0012000000020008444543494D414C5302000200060005574944544802000200
      0F000E56414C4F525F444553434F4E544F0A0012000000020008444543494D41
      4C53020002000600055749445448020002000F000B56414C4F525F544F54414C
      0A0012000000020008444543494D414C53020002000600055749445448020002
      000F000956414C4F525F4950490A0012000000020008444543494D414C530200
      02000600055749445448020002000F000D56414C4F525F49434D535F53540A00
      12000000020008444543494D414C53020002000600055749445448020002000F
      000C50524F4455544F2E4E4F4D45010049000000010005574944544802000200
      6400085045525349535445010049000000010005574944544802000200010000
      00}
    object CDSOrcamentoPedidoVendaDetID: TIntegerField
      FieldName = 'ID'
    end
    object CDSOrcamentoPedidoVendaDetID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSOrcamentoPedidoVendaDetID_VENDA_ORCAMENTO_CABECALHO: TIntegerField
      FieldName = 'ID_VENDA_ORCAMENTO_CABECALHO'
    end
    object CDSOrcamentoPedidoVendaDetQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetVALOR_SUBTOTAL: TFMTBCDField
      FieldName = 'VALOR_SUBTOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetTAXA_DESCONTO: TFMTBCDField
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoPedidoVendaDetPRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
    object CDSOrcamentoPedidoVendaDetPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSOrcamentoPedidoVendaDet: TDataSource
    DataSet = CDSOrcamentoPedidoVendaDet
    Left = 652
    Top = 496
  end
end
