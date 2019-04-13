inherited FOrcamentoPedidoVenda: TFOrcamentoPedidoVenda
  Left = 339
  Top = 115
  Caption = 'Or'#231'amento de Venda'
  ClientHeight = 549
  ClientWidth = 933
  ExplicitLeft = 339
  ExplicitTop = 115
  ExplicitWidth = 941
  ExplicitHeight = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 933
    Height = 518
    ActivePage = PaginaEdits
    ExplicitWidth = 933
    ExplicitHeight = 518
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 925
      ExplicitHeight = 490
      inherited PanelGrid: TPanel
        Width = 925
        Height = 490
        ExplicitWidth = 925
        ExplicitHeight = 490
        inherited Grid: TJvDBUltimGrid
          Width = 925
          Height = 438
        end
        inherited PanelFiltroRapido: TPanel
          Top = 438
          Width = 925
          ExplicitTop = 438
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
      ExplicitHeight = 490
      inherited PanelEdits: TPanel
        Width = 925
        Height = 490
        ExplicitWidth = 925
        ExplicitHeight = 490
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 300
          Width = 905
          Height = 178
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens do Or'#231'amento [F1]'
          TabOrder = 0
          object GridParcelas: TJvDBUltimGrid
            Left = 2
            Top = 41
            Width = 901
            Height = 135
            Align = alClient
            BiDiMode = bdLeftToRight
            DataSource = DSOrcamentoPedidoVendaDet
            ParentBiDiMode = False
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
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                ReadOnly = True
                Title.Caption = 'Valor Unit'#225'rio'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_SUBTOTAL'
                ReadOnly = True
                Title.Caption = 'Valor Subtotal'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA_DESCONTO'
                Title.Caption = 'Taxa de Desconto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_DESCONTO'
                ReadOnly = True
                Title.Caption = 'Valor do Desconto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                ReadOnly = True
                Title.Caption = 'Valor Total'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_IPI'
                ReadOnly = True
                Title.Caption = 'Valor IPI'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ICMS_ST'
                ReadOnly = True
                Title.Caption = 'Valor ICMS ST'
                Visible = True
              end>
          end
          object ActionToolBar1: TActionToolBar
            Left = 2
            Top = 15
            Width = 901
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
          Left = 4
          Top = 4
          Width = 920
          Height = 290
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            916
            286)
          object BevelEdits: TBevel
            Left = 10
            Top = 12
            Width = 899
            Height = 265
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object EditCodigo: TLabeledEdit
            Left = 199
            Top = 119
            Width = 138
            Height = 21
            EditLabel.Width = 37
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo:'
            MaxLength = 20
            TabOrder = 10
          end
          object MemoObservacao: TLabeledMemo
            Left = 16
            Top = 204
            Width = 884
            Height = 65
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 21
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
          object EditValorSubtotal: TLabeledCalcEdit
            Left = 17
            Top = 163
            Width = 121
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 14
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 71
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Subtotal:'
          end
          object EditValorFrete: TLabeledCalcEdit
            Left = 144
            Top = 163
            Width = 121
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 15
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 57
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Frete:'
          end
          object EditValorComissao: TLabeledCalcEdit
            Left = 398
            Top = 163
            Width = 121
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 17
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Comiss'#227'o:'
          end
          object EditTaxaComissao: TLabeledCalcEdit
            Left = 271
            Top = 163
            Width = 121
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 16
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Comiss'#227'o:'
          end
          object Panel1: TPanel
            Left = 344
            Top = 283
            Width = 185
            Height = 0
            TabOrder = 22
          end
          object EditVendedor: TLabeledEdit
            Left = 78
            Top = 35
            Width = 359
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 1
          end
          object EditCliente: TLabeledEdit
            Left = 504
            Top = 35
            Width = 396
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
          object EditCondicoesPagamento: TLabeledEdit
            Left = 78
            Top = 77
            Width = 359
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 5
          end
          object EditTransportadora: TLabeledEdit
            Left = 504
            Top = 77
            Width = 396
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 7
          end
          object ComboBoxTipoOrcamento: TLabeledComboBox
            Left = 17
            Top = 119
            Width = 108
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 8
            Text = 'Or'#231'amento'
            Items.Strings = (
              'Or'#231'amento'
              'Pedido')
            ComboBoxLabel.Width = 24
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo:'
          end
          object ComboBoxTipoFrete: TLabeledComboBox
            Left = 131
            Top = 119
            Width = 62
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 9
            Text = 'CIF'
            Items.Strings = (
              'CIF'
              'FOB')
            ComboBoxLabel.Width = 30
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Frete:'
          end
          object EditDataCadastro: TLabeledDateEdit
            Left = 343
            Top = 119
            Width = 121
            Height = 21
            TabOrder = 11
            DateEditLabel.Width = 74
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Cadastro:'
          end
          object EditDataEntrega: TLabeledDateEdit
            Left = 470
            Top = 119
            Width = 121
            Height = 21
            TabOrder = 12
            DateEditLabel.Width = 68
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Entrega:'
          end
          object EditDataValidade: TLabeledDateEdit
            Left = 597
            Top = 119
            Width = 121
            Height = 21
            TabOrder = 13
            DateEditLabel.Width = 70
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Validade:'
          end
          object EditValorDesconto: TLabeledCalcEdit
            Left = 652
            Top = 163
            Width = 121
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 19
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Desconto:'
          end
          object EditTaxaDesconto: TLabeledCalcEdit
            Left = 525
            Top = 163
            Width = 121
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 18
            DecimalPlacesAlwaysShown = False
            OnExit = EditTaxaDescontoExit
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Desconto:'
          end
          object EditValorTotal: TLabeledCalcEdit
            Left = 779
            Top = 163
            Width = 121
            Height = 21
            TabStop = False
            DisplayFormat = '#,###,##0.00'
            ReadOnly = True
            TabOrder = 20
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 55
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Total:'
          end
          object EditIdVendedor: TLabeledCalcEdit
            Left = 17
            Top = 35
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdVendedorExit
            OnKeyDown = EditIdVendedorKeyDown
            OnKeyPress = EditIdVendedorKeyPress
            CalcEditLabel.Width = 73
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Vendedor [F1]:'
          end
          object EditIdCliente: TLabeledCalcEdit
            Left = 443
            Top = 35
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdClienteExit
            OnKeyDown = EditIdClienteKeyDown
            OnKeyPress = EditIdClienteKeyPress
            CalcEditLabel.Width = 60
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Cliente [F1]:'
          end
          object EditIdCondicoesPagamento: TLabeledCalcEdit
            Left = 17
            Top = 77
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ParentShowHint = False
            ShowButton = False
            ShowHint = False
            TabOrder = 4
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdCondicoesPagamentoExit
            OnKeyDown = EditIdCondicoesPagamentoKeyDown
            OnKeyPress = EditIdCondicoesPagamentoKeyPress
            CalcEditLabel.Width = 148
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Condi'#231#245'es de Pagamento [F1]:'
          end
          object EditIdTransportadora: TLabeledCalcEdit
            Left = 443
            Top = 77
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 6
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdTransportadoraExit
            OnKeyDown = EditIdTransportadoraKeyDown
            OnKeyPress = EditIdTransportadoraKeyPress
            CalcEditLabel.Width = 102
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Transportadora [F1]:'
          end
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
  object DSOrcamentoPedidoVendaDet: TDataSource
    DataSet = CDSOrcamentoPedidoVendaDet
    Left = 628
    Top = 432
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
    AfterEdit = CDSOrcamentoPedidoVendaDetAfterEdit
    BeforePost = CDSOrcamentoPedidoVendaDetBeforePost
    Left = 784
    Top = 432
    Data = {
      BF0100009619E0BD02000000180000000B000000000003000000BF0102494404
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
      000F000C50524F4455544F2E4E4F4D4501004900000001000557494454480200
      0200640008504552534953544501004900000001000557494454480200020001
      000000}
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
    object CDSOrcamentoPedidoVendaDetPRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
    object CDSOrcamentoPedidoVendaDetPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionAtualizarTotais
            Caption = '&Atualizar Totais'
            ImageIndex = 29
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
  end
end
