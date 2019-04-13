inherited FFinLancamentoPagar: TFFinLancamentoPagar
  Left = 318
  Top = 144
  Caption = 'Lan'#231'amentos a Pagar'
  ClientHeight = 510
  ClientWidth = 988
  ExplicitWidth = 1004
  ExplicitHeight = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    Height = 479
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 479
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      ExplicitHeight = 451
      inherited PanelGrid: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        inherited Grid: TJvDBUltimGrid
          Width = 980
          Height = 399
        end
        inherited PanelFiltroRapido: TPanel
          Top = 399
          Width = 980
          ExplicitTop = 399
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 679
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 980
      ExplicitHeight = 451
      inherited PanelEdits: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        object PanelParcelas: TPanel
          Left = 4
          Top = 4
          Width = 972
          Height = 443
          Align = alClient
          TabOrder = 1
          DesignSize = (
            972
            443)
          object PageControlItensLancamento: TPageControl
            Left = 6
            Top = 225
            Width = 954
            Height = 207
            ActivePage = tsItens
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tsItens: TTabSheet
              Caption = 'Parcelas'
              object PanelItensLancamento: TPanel
                Left = 0
                Top = 0
                Width = 946
                Height = 179
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridParcelas: TJvDBUltimGrid
                  Left = 0
                  Top = 32
                  Width = 946
                  Height = 147
                  Align = alClient
                  DataSource = DSParcelaPagar
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
                      FieldName = 'NUMERO_PARCELA'
                      ReadOnly = True
                      Title.Caption = 'N'#250'mero'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA_EMISSAO'
                      Title.Caption = 'Data Emiss'#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA_VENCIMENTO'
                      Title.Caption = 'Data Vencimento'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCONTO_ATE'
                      Title.Caption = 'Desconto At'#233
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SOFRE_RETENCAO'
                      Title.Caption = 'Sofre Reten'#231#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR'
                      Title.Caption = 'Valor'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_JURO'
                      Title.Caption = 'Taxa Juros'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_JURO'
                      Title.Caption = 'Valor Juros'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_MULTA'
                      Title.Caption = 'Taxa Multa'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_MULTA'
                      Title.Caption = 'Valor Multa'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_DESCONTO'
                      Title.Caption = 'Taxa Desconto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_DESCONTO'
                      Title.Caption = 'Valor Desconto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CONTA_CAIXA.NOME'
                      ReadOnly = True
                      Title.Caption = 'Conta Caixa'
                      Width = 200
                      Visible = True
                    end>
                end
                object ActionToolBarEdits: TActionToolBar
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 940
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
            end
            object tsNaturezaFinanceira: TTabSheet
              Caption = 'Naturezas Financeiras Vinculadas'
              ImageIndex = 1
              object PanelNaturezaFinanceira: TPanel
                Left = 0
                Top = 0
                Width = 946
                Height = 179
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object JvDBUltimGrid1: TJvDBUltimGrid
                  Left = 0
                  Top = 0
                  Width = 946
                  Height = 179
                  Align = alClient
                  DataSource = DSLancamentoNaturezaFinanceira
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = JvDBUltimGrid1KeyDown
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
                      FieldName = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
                      ReadOnly = True
                      Title.Caption = 'Natureza Financeira - Classifica'#231#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NATUREZA_FINANCEIRA.DESCRICAO'
                      ReadOnly = True
                      Title.Caption = 'Natureza Financeira - Descri'#231#227'o'
                      Width = 300
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA_INCLUSAO'
                      ReadOnly = True
                      Title.Caption = 'Data Inclus'#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR'
                      Title.Caption = 'Valor'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PERCENTUAL'
                      Title.Caption = 'Percentual'
                      Visible = True
                    end>
                end
              end
            end
          end
          object PanelContaCaixa: TPanel
            Left = 6
            Top = 164
            Width = 954
            Height = 55
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvLowered
            TabOrder = 1
            DesignSize = (
              954
              55)
            object EditIdContaCaixa: TLabeledCalcEdit
              Left = 9
              Top = 24
              Width = 61
              Height = 21
              DisplayFormat = '#'
              ShowButton = False
              TabOrder = 0
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdContaCaixaKeyUp
              CalcEditLabel.Width = 356
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 
                'Conta/Caixa Prevista para Pagamento das Parcelas (Fluxo de Caixa' +
                ') [F1]:'
            end
            object EditContaCaixa: TLabeledEdit
              Left = 70
              Top = 24
              Width = 873
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
          end
        end
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 149
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            149)
          object EditIdFornecedor: TLabeledCalcEdit
            Left = 9
            Top = 24
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
          object EditFornecedor: TLabeledEdit
            Left = 70
            Top = 24
            Width = 873
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
          object EditIdDocumentoOrigem: TLabeledCalcEdit
            Left = 9
            Top = 73
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdDocumentoOrigemKeyUp
            CalcEditLabel.Width = 118
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Documento Origem [F1]:'
          end
          object EditDocumentoOrigem: TLabeledEdit
            Left = 70
            Top = 73
            Width = 424
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
          object ComboBoxPagamentoCompartilhado: TLabeledComboBox
            Left = 805
            Top = 73
            Width = 138
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemIndex = 0
            TabOrder = 5
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 131
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Pagamento Compartilhado?'
          end
          object EditImagemDocumento: TLabeledEdit
            Left = 720
            Top = 119
            Width = 223
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 114
            EditLabel.Height = 13
            EditLabel.Caption = 'Imagem do Documento:'
            ReadOnly = True
            TabOrder = 12
          end
          object EditPrimeiroVencimento: TLabeledDateEdit
            Left = 593
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 11
            DateEditLabel.Width = 100
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Primeiro Vencimento:'
          end
          object EditQuantidadeParcelas: TLabeledCalcEdit
            Left = 390
            Top = 119
            Width = 91
            Height = 21
            ShowButton = False
            TabOrder = 9
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 78
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Qt. de Parcelas:'
          end
          object EditValorAPagar: TLabeledCalcEdit
            Left = 263
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 8
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 68
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor a Pagar:'
          end
          object EditValorTotal: TLabeledCalcEdit
            Left = 136
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 7
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 55
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Total:'
          end
          object EditDataLancamento: TLabeledDateEdit
            Left = 9
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 6
            DateEditLabel.Width = 88
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Lan'#231'amento:'
          end
          object EditNumeroDocumento: TLabeledEdit
            Left = 500
            Top = 73
            Width = 299
            Height = 21
            Anchors = [akTop, akRight]
            EditLabel.Width = 113
            EditLabel.Height = 13
            EditLabel.Caption = 'N'#250'mero do Documento:'
            TabOrder = 4
          end
          object EditIntervalorEntreParcelas: TLabeledCalcEdit
            Left = 487
            Top = 119
            Width = 100
            Height = 21
            ShowButton = False
            TabOrder = 10
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 91
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Intervalo Parcelas:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 988
    ExplicitWidth = 988
    inherited BotaoSair: TSpeedButton
      Left = 884
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 784
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 674
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 774
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 574
      ExplicitLeft = 639
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
            Action = ActionGerarParcelas
            Caption = '&Gerar Parcelas'
            ImageIndex = 29
          end>
      end
      item
        Items = <
          item
            Action = ActionGerarParcelas
            Caption = '&Gerar Parcelas'
            ImageIndex = 29
          end>
      end
      item
        Items = <
          item
            Action = ActionAcionarGed
            Caption = '&Acionar GED'
            ImageIndex = 26
          end
          item
            Action = ActionGerarParcelas
            Caption = '&Gerar Parcelas'
            ImageIndex = 29
          end
          item
            Action = ActionGerarPagamentoFixo
            Caption = 'G&erar Pagamento Fixo'
            ImageIndex = 30
          end>
        ActionBar = ActionToolBarEdits
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 792
    Top = 376
    StyleName = 'Ribbon - Silver'
    object ActionGerarParcelas: TAction
      Category = 'ContasAPagar'
      Caption = 'Gerar Parcelas'
      ImageIndex = 29
      OnExecute = ActionGerarParcelasExecute
    end
    object ActionAcionarGed: TAction
      Category = 'ContasAPagar'
      Caption = 'Acionar GED'
      ImageIndex = 26
      OnExecute = ActionAcionarGedExecute
    end
    object ActionGerarPagamentoFixo: TAction
      Category = 'ContasAPagar'
      Caption = 'Gerar Pagamento Fixo'
      ImageIndex = 30
      OnExecute = ActionGerarPagamentoFixoExecute
    end
  end
  object DSParcelaPagar: TDataSource
    DataSet = CDSParcelaPagar
    Left = 64
    Top = 360
  end
  object CDSParcelaPagar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTA_CAIXA'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_LANCAMENTO_PAGAR'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_STATUS_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'DATA_VENCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DESCONTO_ATE'
        DataType = ftDate
      end
      item
        Name = 'SOFRE_RETENCAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_JURO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_MULTA'
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
        Name = 'VALOR_JURO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_MULTA'
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
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTA_CAIXA.NOME'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSParcelaPagarAfterEdit
    AfterPost = CDSParcelaPagarAfterPost
    BeforeDelete = CDSParcelaPagarBeforeDelete
    Left = 64
    Top = 408
    Data = {
      7C0200009619E0BD0200000018000000120000000000030000007C0202494404
      000100000000000E49445F434F4E54415F434149584104000100000000001749
      445F46494E5F4C414E43414D454E544F5F504147415204000100000000001549
      445F46494E5F5354415455535F50415243454C4104000100000000000E4E554D
      45524F5F50415243454C4104000100000000000C444154415F454D495353414F
      04000600000000000F444154415F56454E43494D454E544F0400060000000000
      0C444553434F4E544F5F41544504000600000000000E534F4652455F52455445
      4E43414F01004900000001000557494454480200020001000556414C4F520A00
      12000000020008444543494D414C53020002000600055749445448020002000F
      0009544158415F4A55524F0A0012000000020008444543494D414C5302000200
      0600055749445448020002000F000A544158415F4D554C54410A001200000002
      0008444543494D414C53020002000600055749445448020002000F000D544158
      415F444553434F4E544F0A0012000000020008444543494D414C530200020006
      00055749445448020002000F000A56414C4F525F4A55524F0A00120000000200
      08444543494D414C53020002000600055749445448020002000F000B56414C4F
      525F4D554C54410A0012000000020008444543494D414C530200020006000557
      49445448020002000F000E56414C4F525F444553434F4E544F0A001200000002
      0008444543494D414C53020002000600055749445448020002000F0008504552
      5349535445010049000000010005574944544802000200010010434F4E54415F
      43414958412E4E4F4D4501004900000001000557494454480200020064000000}
    object CDSParcelaPagarID: TIntegerField
      FieldName = 'ID'
    end
    object CDSParcelaPagarID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSParcelaPagarID_FIN_LANCAMENTO_PAGAR: TIntegerField
      FieldName = 'ID_FIN_LANCAMENTO_PAGAR'
    end
    object CDSParcelaPagarID_FIN_STATUS_PARCELA: TIntegerField
      FieldName = 'ID_FIN_STATUS_PARCELA'
    end
    object CDSParcelaPagarNUMERO_PARCELA: TIntegerField
      FieldName = 'NUMERO_PARCELA'
    end
    object CDSParcelaPagarDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      EditMask = '##/##/####'
    end
    object CDSParcelaPagarDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object CDSParcelaPagarDESCONTO_ATE: TDateField
      FieldName = 'DESCONTO_ATE'
    end
    object CDSParcelaPagarSOFRE_RETENCAO: TStringField
      FieldName = 'SOFRE_RETENCAO'
      Size = 1
    end
    object CDSParcelaPagarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarTAXA_JURO: TFMTBCDField
      FieldName = 'TAXA_JURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarTAXA_MULTA: TFMTBCDField
      FieldName = 'TAXA_MULTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarTAXA_DESCONTO: TFMTBCDField
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarVALOR_JURO: TFMTBCDField
      FieldName = 'VALOR_JURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaPagarPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSParcelaPagarCONTA_CAIXANOME: TStringField
      FieldName = 'CONTA_CAIXA.NOME'
      Size = 100
    end
  end
  object CDSLancamentoNaturezaFinanceira: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_LANCAMENTO_PAGAR'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_LANCAMENTO_DET'
        DataType = ftInteger
      end
      item
        Name = 'ID_NATUREZA_FINANCEIRA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_INCLUSAO'
        DataType = ftDate
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NATUREZA_FINANCEIRA.DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSLancamentoNaturezaFinanceiraAfterEdit
    BeforePost = CDSLancamentoNaturezaFinanceiraBeforePost
    AfterPost = CDSLancamentoNaturezaFinanceiraAfterPost
    Left = 224
    Top = 408
    Data = {
      A70100009619E0BD02000000180000000A000000000003000000A70102494404
      000100000000001749445F46494E5F4C414E43414D454E544F5F504147415204
      000100000000001A49445F434F4E544142494C5F4C414E43414D454E544F5F44
      455404000100000000001649445F4E41545552455A415F46494E414E43454952
      4104000100000000000D444154415F494E434C5553414F040006000000000005
      56414C4F520A0012000000020008444543494D414C5302000200060005574944
      5448020002000F001F4E41545552455A415F46494E414E43454952412E434C41
      53534946494341430100490000000200055749445448020002001E0009464945
      4C444E414D45220009804E41545552455A415F46494E414E43454952412E434C
      415353494649434143414F001D4E41545552455A415F46494E414E4345495241
      2E44455343524943414F01004900000001000557494454480200020064000850
      4552534953544501004900000001000557494454480200020001000A50455243
      454E5455414C0A0012000000020008444543494D414C53020002000600055749
      445448020002000F000000}
    object CDSLancamentoNaturezaFinanceiraID: TIntegerField
      FieldName = 'ID'
    end
    object CDSLancamentoNaturezaFinanceiraID_FIN_LANCAMENTO_PAGAR: TIntegerField
      FieldName = 'ID_FIN_LANCAMENTO_PAGAR'
    end
    object CDSLancamentoNaturezaFinanceiraID_CONTABIL_LANCAMENTO_DET: TIntegerField
      FieldName = 'ID_CONTABIL_LANCAMENTO_DET'
    end
    object CDSLancamentoNaturezaFinanceiraID_NATUREZA_FINANCEIRA: TIntegerField
      FieldName = 'ID_NATUREZA_FINANCEIRA'
    end
    object CDSLancamentoNaturezaFinanceiraDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
    end
    object CDSLancamentoNaturezaFinanceiraVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSLancamentoNaturezaFinanceiraNATUREZA_FINANCEIRACLASSIFICACAO: TStringField
      FieldName = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
      Size = 30
    end
    object CDSLancamentoNaturezaFinanceiraNATUREZA_FINANCEIRADESCRICAO: TStringField
      FieldName = 'NATUREZA_FINANCEIRA.DESCRICAO'
      Size = 100
    end
    object CDSLancamentoNaturezaFinanceiraPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSLancamentoNaturezaFinanceiraPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
  end
  object DSLancamentoNaturezaFinanceira: TDataSource
    DataSet = CDSLancamentoNaturezaFinanceira
    Left = 224
    Top = 360
  end
end
