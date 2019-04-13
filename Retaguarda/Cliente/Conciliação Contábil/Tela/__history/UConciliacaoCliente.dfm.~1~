inherited FConciliacaoCliente: TFConciliacaoCliente
  Left = 318
  Top = 136
  Caption = 'Concilia'#231#227'o Clientes'
  ClientHeight = 566
  ExplicitLeft = 318
  ExplicitTop = 136
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
      ExplicitWidth = 984
      ExplicitHeight = 507
      inherited PanelEdits: TPanel
        Height = 507
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
          Top = 250
          Width = 947
          Height = 214
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Lan'#231'amentos Conciliados:'
          TabOrder = 4
          object JvDBUltimGrid2: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 943
            Height = 197
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
                FieldName = 'DATA_RECEBIMENTO'
                Title.Caption = 'Data Recebimento'
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
                FieldName = 'HISTORICO_RECEBIMENTO'
                Title.Caption = 'Hist'#243'rico Recebimento'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_RECEBIMENTO'
                Title.Caption = 'Valor Recebimento'
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
          Top = 480
          Width = 976
          Height = 23
          ActionManager = ActionManager1
          Align = alBottom
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
          ExplicitTop = 477
          ExplicitHeight = 26
        end
        object EditIdCliente: TLabeledCalcEdit
          Left = 19
          Top = 33
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 37
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Cliente:'
        end
        object EditCliente: TLabeledEdit
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
          Top = 63
          Width = 947
          Height = 181
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 6
          object JvNetscapeSplitter1: TJvNetscapeSplitter
            Left = 475
            Top = 0
            Height = 181
            Align = alLeft
            Maximized = False
            Minimized = False
            ButtonCursor = crDefault
            ExplicitLeft = 480
            ExplicitTop = 64
            ExplicitHeight = 100
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 475
            Height = 181
            Align = alLeft
            Caption = 'Contas Recebidas:'
            TabOrder = 0
            object GridDetalhe: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 471
              Height = 164
              Align = alClient
              DataSource = DSParcelaRecebimento
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
                  FieldName = 'DATA_RECEBIMENTO'
                  Title.Caption = 'Data Recebimento'
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
                  FieldName = 'VALOR_RECEBIDO'
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
            Height = 181
            Align = alClient
            Caption = 'Lan'#231'amentos Cont'#225'beis:'
            TabOrder = 1
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 458
              Height = 164
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
  object CDSParcelaRecebimento: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_TIPO_RECEBIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_PARCELA_RECEBER'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTA_CAIXA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_RECEBIMENTO'
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
        Name = 'VALOR_RECEBIDO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_CLIENTE'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 272
    Data = {
      120200009619E0BD02000000180000000E000000000003000000120202494404
      000100000000001749445F46494E5F5449504F5F5245434542494D454E544F04
      000100000000001649445F46494E5F50415243454C415F524543454245520400
      0100000000000E49445F434F4E54415F43414958410400010000000000104441
      54415F5245434542494D454E544F040006000000000009544158415F4A55524F
      0B0012000000020008444543494D414C53020002000600055749445448020002
      0012000A544158415F4D554C54410B0012000000020008444543494D414C5302
      00020006000557494454480200020012000D544158415F444553434F4E544F0B
      0012000000020008444543494D414C5302000200060005574944544802000200
      12000A56414C4F525F4A55524F0B0012000000020008444543494D414C530200
      020006000557494454480200020012000B56414C4F525F4D554C54410B001200
      0000020008444543494D414C530200020006000557494454480200020012000E
      56414C4F525F444553434F4E544F0B0012000000020008444543494D414C5302
      00020006000557494454480200020012000E56414C4F525F524543454249444F
      0B0012000000020008444543494D414C53020002000600055749445448020002
      00120009484953544F5249434F01004900000001000557494454480200020032
      000A49445F434C49454E544504000100000000000000}
    object CDSParcelaRecebimentoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSParcelaRecebimentoID_FIN_TIPO_RECEBIMENTO: TIntegerField
      FieldName = 'ID_FIN_TIPO_RECEBIMENTO'
    end
    object CDSParcelaRecebimentoID_FIN_PARCELA_RECEBER: TIntegerField
      FieldName = 'ID_FIN_PARCELA_RECEBER'
    end
    object CDSParcelaRecebimentoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSParcelaRecebimentoDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
    end
    object CDSParcelaRecebimentoTAXA_JURO: TFMTBCDField
      FieldName = 'TAXA_JURO'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoTAXA_MULTA: TFMTBCDField
      FieldName = 'TAXA_MULTA'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoTAXA_DESCONTO: TFMTBCDField
      FieldName = 'TAXA_DESCONTO'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoVALOR_JURO: TFMTBCDField
      FieldName = 'VALOR_JURO'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoVALOR_RECEBIDO: TFMTBCDField
      FieldName = 'VALOR_RECEBIDO'
      Precision = 18
      Size = 6
    end
    object CDSParcelaRecebimentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CDSParcelaRecebimentoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
  end
  object DSParcelaRecebimento: TDataSource
    DataSet = CDSParcelaRecebimento
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
        Name = 'DATA_RECEBIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_BALANCETE'
        DataType = ftDate
      end
      item
        Name = 'HISTORICO_RECEBIMENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR_RECEBIMENTO'
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
      370100009619E0BD020000001800000008000000000003000000370110444154
      415F5245434542494D454E544F04000600000000000E444154415F42414C414E
      43455445040006000000000015484953544F5249434F5F5245434542494D454E
      544F01004900000001000557494454480200020032001156414C4F525F524543
      4542494D454E544F0B0012000000020008444543494D414C5302000200060005
      57494454480200020012000D434C415353494649434143414F01004900000001
      00055749445448020002001E000F484953544F5249434F5F434F4E5441010049
      000000010005574944544802000200FA00045449504F01004900000001000557
      494454480200020001000B56414C4F525F434F4E54410B001200000002000844
      4543494D414C530200020006000557494454480200020012000000}
    object CDSLancamentoConciliadoDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
    end
    object CDSLancamentoConciliadoDATA_BALANCETE: TDateField
      FieldName = 'DATA_BALANCETE'
    end
    object CDSLancamentoConciliadoHISTORICO_RECEBIMENTO: TStringField
      FieldName = 'HISTORICO_RECEBIMENTO'
      Size = 50
    end
    object CDSLancamentoConciliadoVALOR_RECEBIMENTO: TFMTBCDField
      FieldName = 'VALOR_RECEBIMENTO'
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
