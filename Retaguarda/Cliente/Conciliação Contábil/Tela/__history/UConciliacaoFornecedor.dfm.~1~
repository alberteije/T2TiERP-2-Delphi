inherited FConciliacaoFornecedor: TFConciliacaoFornecedor
  Left = 318
  Top = 136
  Caption = 'Concilia'#231#227'o Fornecedores'
  ClientHeight = 566
  ExplicitLeft = 318
  ExplicitTop = 136
  ExplicitWidth = 1000
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 535
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 535
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      inherited PanelGrid: TPanel
        Height = 507
        ExplicitWidth = 980
        ExplicitHeight = 507
        inherited Grid: TJvDBUltimGrid
          Height = 455
        end
        inherited PanelFiltroRapido: TPanel
          Top = 455
          ExplicitTop = 455
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 980
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Height = 507
        ExplicitWidth = 980
        ExplicitHeight = 507
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 964
          Height = 461
          Anchors = [akLeft, akTop, akRight, akBottom]
          Constraints.MinWidth = 753
        end
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 413
          Top = 33
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 33
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta:'
        end
        object EditContabilConta: TLabeledEdit
          Left = 474
          Top = 33
          Width = 240
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
        object GroupBox4: TGroupBox
          Left = 19
          Top = 258
          Width = 947
          Height = 206
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Lan'#231'amentos Conciliados:'
          TabOrder = 4
          object JvDBUltimGrid2: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 943
            Height = 189
            Align = alClient
            DataSource = DSLancamentoConciliado
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
                FieldName = 'DATA_PAGAMENTO'
                Title.Caption = 'Data Pagamento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_BALANCETE'
                Title.Caption = 'Data Balancete'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO_PAGAMENTO'
                Title.Caption = 'Hist'#243'rico Pagamento'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_PAGAMENTO'
                Title.Caption = 'Valor Pagamento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLASSIFICACAO'
                Title.Caption = 'Classifica'#231#227'o'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO_CONTA'
                Title.Caption = 'Hist'#243'rico Conta'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Caption = 'Tipo (C|D)'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_CONTA'
                Title.Caption = 'Valor Conta'
                Visible = True
              end>
          end
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 477
          Width = 976
          Height = 26
          ActionManager = ActionManager1
          Align = alBottom
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
        end
        object EditIdFornecedor: TLabeledCalcEdit
          Left = 19
          Top = 33
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 59
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Fornecedor:'
        end
        object EditFornecedor: TLabeledEdit
          Left = 80
          Top = 33
          Width = 327
          Height = 21
          TabStop = False
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 1
        end
        object PanelLancamentos: TPanel
          Left = 19
          Top = 67
          Width = 947
          Height = 185
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 6
          object JvNetscapeSplitter1: TJvNetscapeSplitter
            Left = 475
            Top = 0
            Height = 185
            Align = alLeft
            Maximized = False
            Minimized = False
            ButtonCursor = crDefault
            ExplicitLeft = 480
            ExplicitTop = 96
            ExplicitHeight = 100
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 475
            Height = 185
            Align = alLeft
            Caption = 'Contas Pagas:'
            TabOrder = 0
            ExplicitTop = 8
            ExplicitHeight = 170
            object GridDetalhe: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 471
              Height = 168
              Align = alClient
              DataSource = DSParcelaPagamento
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
                  FieldName = 'DATA_PAGAMENTO'
                  Title.Caption = 'Data Pagamento'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_JURO'
                  Title.Caption = 'Juros'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_MULTA'
                  Title.Caption = 'Multa'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_DESCONTO'
                  Title.Caption = 'Desconto'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_PAGO'
                  Title.Caption = 'Recebido'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HISTORICO'
                  Title.Caption = 'Hist'#243'rico'
                  Visible = True
                end>
            end
          end
          object GroupBox3: TGroupBox
            Left = 485
            Top = 0
            Width = 462
            Height = 185
            Align = alClient
            Caption = 'Lan'#231'amentos Cont'#225'beis:'
            TabOrder = 1
            ExplicitLeft = 482
            ExplicitTop = 1
            ExplicitWidth = 466
            ExplicitHeight = 170
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 458
              Height = 168
              Align = alClient
              DataSource = DSContabilLancamento
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
                  FieldName = 'ID_CONTABIL_CONTA'
                  Title.Caption = 'Id Conta'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTABIL_CONTA.CLASSIFICACAO'
                  Title.Caption = 'Classifica'#231#227'o'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HISTORICO'
                  Title.Caption = 'Hist'#243'rico'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Title.Caption = 'Tipo (C|D)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Caption = 'Valor'
                  Visible = True
                end>
            end
          end
        end
        object EditPeriodoInicial: TLabeledDateEdit
          Left = 720
          Top = 33
          Width = 120
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 7
          DateEditLabel.Width = 70
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Per'#237'odo Inicial:'
        end
        object EditPeriodoFinal: TLabeledDateEdit
          Left = 846
          Top = 33
          Width = 120
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 8
          DateEditLabel.Width = 65
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Per'#237'odo Final:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    ExplicitWidth = 988
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
  object CDSParcelaPagamento: TClientDataSet
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
        Name = 'ID_TIPO_PAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'ID_CHEQUE_EMITIDO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_PAGAMENTO'
        DataType = ftDate
      end
      item
        Name = 'TAXA_JURO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'TAXA_MULTA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'TAXA_DESCONTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_JURO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_MULTA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_PAGO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 272
    Data = {
      010200009619E0BD02000000180000000E000000000003000000010202494404
      000100000000000E49445F434F4E54415F434149584104000100000000001149
      445F5449504F5F504147414D454E544F04000100000000001149445F43484551
      55455F454D495449444F04000100000000000A49445F50415243454C41040001
      00000000000E444154415F504147414D454E544F040006000000000009544158
      415F4A55524F0B0012000000020008444543494D414C53020002000600055749
      4454480200020012000A544158415F4D554C54410B0012000000020008444543
      494D414C530200020006000557494454480200020012000D544158415F444553
      434F4E544F0B0012000000020008444543494D414C5302000200060005574944
      54480200020012000A56414C4F525F4A55524F0B001200000002000844454349
      4D414C530200020006000557494454480200020012000B56414C4F525F4D554C
      54410B0012000000020008444543494D414C5302000200060005574944544802
      00020012000E56414C4F525F444553434F4E544F0B0012000000020008444543
      494D414C530200020006000557494454480200020012000A56414C4F525F5041
      474F0B0012000000020008444543494D414C5302000200060005574944544802
      000200120009484953544F5249434F0100490000000100055749445448020002
      0032000000}
    object CDSParcelaPagamentoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSParcelaPagamentoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSParcelaPagamentoID_TIPO_PAGAMENTO: TIntegerField
      FieldName = 'ID_TIPO_PAGAMENTO'
    end
    object CDSParcelaPagamentoID_CHEQUE_EMITIDO: TIntegerField
      FieldName = 'ID_CHEQUE_EMITIDO'
    end
    object CDSParcelaPagamentoID_PARCELA: TIntegerField
      FieldName = 'ID_PARCELA'
    end
    object CDSParcelaPagamentoDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object CDSParcelaPagamentoTAXA_JURO: TFMTBCDField
      FieldName = 'TAXA_JURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoTAXA_MULTA: TFMTBCDField
      FieldName = 'TAXA_MULTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoTAXA_DESCONTO: TFMTBCDField
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoVALOR_JURO: TFMTBCDField
      FieldName = 'VALOR_JURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParcelaPagamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
  end
  object DSParcelaPagamento: TDataSource
    DataSet = CDSParcelaPagamento
    Left = 72
    Top = 224
  end
  object CDSContabilLancamento: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_HISTORICO'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_LANCAMENTO_CAB'
        DataType = ftInteger
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'CONTABIL_CONTA.CLASSIFICACAO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 272
    Data = {
      110100009619E0BD020000001800000008000000000003000000110102494404
      000100000000001149445F434F4E544142494C5F434F4E544104000100000000
      001549445F434F4E544142494C5F484953544F5249434F04000100000000001A
      49445F434F4E544142494C5F4C414E43414D454E544F5F434142040001000000
      000009484953544F5249434F010049000000010005574944544802000200FA00
      045449504F01004900000001000557494454480200020001000556414C4F520B
      0012000000020008444543494D414C5302000200060005574944544802000200
      12001C434F4E544142494C5F434F4E54412E434C415353494649434143414F01
      00490000000100055749445448020002001E000000}
    object CDSContabilLancamentoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSContabilLancamentoID_CONTABIL_CONTA: TIntegerField
      FieldName = 'ID_CONTABIL_CONTA'
    end
    object CDSContabilLancamentoID_CONTABIL_HISTORICO: TIntegerField
      FieldName = 'ID_CONTABIL_HISTORICO'
    end
    object CDSContabilLancamentoID_CONTABIL_LANCAMENTO_CAB: TIntegerField
      FieldName = 'ID_CONTABIL_LANCAMENTO_CAB'
    end
    object CDSContabilLancamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 250
    end
    object CDSContabilLancamentoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CDSContabilLancamentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSContabilLancamentoCONTABIL_CONTACLASSIFICACAO: TStringField
      FieldName = 'CONTABIL_CONTA.CLASSIFICACAO'
      Size = 30
    end
  end
  object DSContabilLancamento: TDataSource
    DataSet = CDSContabilLancamento
    Left = 560
    Top = 224
  end
  object CDSLancamentoConciliado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATA_PAGAMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_BALANCETE'
        DataType = ftDate
      end
      item
        Name = 'HISTORICO_PAGAMENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR_PAGAMENTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'CLASSIFICACAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'HISTORICO_CONTA'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR_CONTA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 456
    Data = {
      310100009619E0BD02000000180000000800000000000300000031010E444154
      415F504147414D454E544F04000600000000000E444154415F42414C414E4345
      5445040006000000000013484953544F5249434F5F504147414D454E544F0100
      4900000001000557494454480200020032000F56414C4F525F504147414D454E
      544F0B0012000000020008444543494D414C5302000200060005574944544802
      00020012000D434C415353494649434143414F01004900000001000557494454
      48020002001E000F484953544F5249434F5F434F4E5441010049000000010005
      574944544802000200FA00045449504F01004900000001000557494454480200
      020001000B56414C4F525F434F4E54410B0012000000020008444543494D414C
      530200020006000557494454480200020012000000}
    object CDSLancamentoConciliadoDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object CDSLancamentoConciliadoDATA_BALANCETE: TDateField
      FieldName = 'DATA_BALANCETE'
    end
    object CDSLancamentoConciliadoHISTORICO_PAGAMENTO: TStringField
      FieldName = 'HISTORICO_PAGAMENTO'
      Size = 50
    end
    object CDSLancamentoConciliadoVALOR_PAGAMENTO: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSLancamentoConciliadoCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Size = 30
    end
    object CDSLancamentoConciliadoHISTORICO_CONTA: TStringField
      FieldName = 'HISTORICO_CONTA'
      Size = 250
    end
    object CDSLancamentoConciliadoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CDSLancamentoConciliadoVALOR_CONTA: TFMTBCDField
      FieldName = 'VALOR_CONTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
  object DSLancamentoConciliado: TDataSource
    DataSet = CDSLancamentoConciliado
    Left = 80
    Top = 408
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionConciliacao
            Caption = '&Concilia'#231#227'o'
            ImageIndex = 32
          end
          item
            Action = ActionListarLancamentos
            Caption = '&Listar Lan'#231'amentos'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 815
    Top = 430
    StyleName = 'Platform Default'
    object ActionListarLancamentos: TAction
      Caption = 'Listar Lan'#231'amentos'
      ImageIndex = 31
      OnExecute = ActionListarLancamentosExecute
    end
    object ActionConciliacao: TAction
      Caption = 'Concilia'#231#227'o'
      ImageIndex = 32
      OnExecute = ActionConciliacaoExecute
    end
  end
end
