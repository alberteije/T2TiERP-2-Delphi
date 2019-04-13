inherited FConciliacaoBancaria: TFConciliacaoBancaria
  Left = 318
  Top = 136
  Caption = 'Concilia'#231#227'o Banc'#225'ria'
  ClientHeight = 520
  ExplicitLeft = 318
  ExplicitTop = 136
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 489
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 535
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      inherited PanelGrid: TPanel
        Height = 461
        ExplicitWidth = 980
        ExplicitHeight = 507
        inherited Grid: TJvDBUltimGrid
          Height = 409
        end
        inherited PanelFiltroRapido: TPanel
          Top = 409
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
      ExplicitHeight = 461
      inherited PanelEdits: TPanel
        Height = 461
        ExplicitHeight = 461
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 964
          Height = 415
          Anchors = [akLeft, akTop, akRight, akBottom]
          Constraints.MinWidth = 753
          ExplicitHeight = 461
        end
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 19
          Top = 33
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 33
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta:'
        end
        object EditContabilConta: TLabeledEdit
          Left = 80
          Top = 33
          Width = 634
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
        object GroupBox4: TGroupBox
          Left = 19
          Top = 240
          Width = 947
          Height = 177
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Lan'#231'amentos Conciliados:'
          TabOrder = 2
          object JvDBUltimGrid2: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 943
            Height = 160
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
                FieldName = 'MES'
                Title.Caption = 'M'#234's'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ANO'
                Title.Caption = 'Ano'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_MOVIMENTO'
                Title.Caption = 'Data Movimento'
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
                FieldName = 'HISTORICO_EXTRATO'
                Title.Caption = 'Hist'#243'rico Extrato'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_EXTRATO'
                Title.Caption = 'Valor Extrato'
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
          Top = 431
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
        object EditPeriodoInicial: TLabeledDateEdit
          Left = 720
          Top = 33
          Width = 120
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 4
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
          TabOrder = 5
          DateEditLabel.Width = 65
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Per'#237'odo Final:'
        end
        object PanelLancamentos: TPanel
          Left = 19
          Top = 64
          Width = 947
          Height = 170
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 6
          object JvNetscapeSplitter1: TJvNetscapeSplitter
            Left = 475
            Top = 0
            Height = 170
            Align = alLeft
            Maximized = False
            Minimized = False
            ButtonCursor = crDefault
            ExplicitLeft = 480
            ExplicitTop = 56
            ExplicitHeight = 100
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 475
            Height = 170
            Align = alLeft
            Caption = 'Lan'#231'amentos Extrato:'
            TabOrder = 0
            object GridDetalhe: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 471
              Height = 153
              Align = alClient
              DataSource = DSLancamentoExtrato
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
                  FieldName = 'MES'
                  Title.Caption = 'M'#234's'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANO'
                  Title.Caption = 'Ano'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOVIMENTO'
                  Title.Caption = 'Data Movimento'
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
                  FieldName = 'HISTORICO'
                  Title.Caption = 'Hist'#243'rico'
                  Width = 300
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
          object GroupBox3: TGroupBox
            Left = 485
            Top = 0
            Width = 462
            Height = 170
            Align = alClient
            Caption = 'Lan'#231'amentos Cont'#225'beis:'
            TabOrder = 1
            object JvDBUltimGrid1: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 458
              Height = 153
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
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Top = 16
  end
  object CDSLancamentoExtrato: TClientDataSet
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
        Name = 'MES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DATA_MOVIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_BALANCETE'
        DataType = ftDate
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 272
    Data = {
      E10000009619E0BD020000001800000008000000000003000000E10002494404
      000100000000000E49445F434F4E54415F43414958410400010000000000034D
      4553010049000000010005574944544802000200020003414E4F010049000000
      01000557494454480200020004000E444154415F4D4F56494D454E544F040006
      00000000000E444154415F42414C414E43455445040006000000000009484953
      544F5249434F01004900000001000557494454480200020032000556414C4F52
      0B0012000000020008444543494D414C53020002000600055749445448020002
      0012000000}
    object CDSLancamentoExtratoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSLancamentoExtratoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSLancamentoExtratoMES: TStringField
      FieldName = 'MES'
      Size = 2
    end
    object CDSLancamentoExtratoANO: TStringField
      FieldName = 'ANO'
      Size = 4
    end
    object CDSLancamentoExtratoDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
      EditMask = '##/##/####'
    end
    object CDSLancamentoExtratoDATA_BALANCETE: TDateField
      FieldName = 'DATA_BALANCETE'
      EditMask = '##/##/####'
    end
    object CDSLancamentoExtratoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CDSLancamentoExtratoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
  object DSLancamentoExtrato: TDataSource
    DataSet = CDSLancamentoExtrato
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
        Name = 'MES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DATA_MOVIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_BALANCETE'
        DataType = ftDate
      end
      item
        Name = 'HISTORICO_EXTRATO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR_EXTRATO'
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
      5D0100009619E0BD02000000180000000A0000000000030000005D01034D4553
      010049000000010005574944544802000200020003414E4F0100490000000100
      0557494454480200020004000E444154415F4D4F56494D454E544F0400060000
      0000000E444154415F42414C414E43455445040006000000000011484953544F
      5249434F5F4558545241544F0100490000000100055749445448020002003200
      0D56414C4F525F4558545241544F0B0012000000020008444543494D414C5302
      00020006000557494454480200020012000D434C415353494649434143414F01
      00490000000100055749445448020002001E000F484953544F5249434F5F434F
      4E5441010049000000010005574944544802000200FA00045449504F01004900
      000001000557494454480200020001000B56414C4F525F434F4E54410B001200
      0000020008444543494D414C5302000200060005574944544802000200120000
      00}
    object CDSLancamentoConciliadoMES: TStringField
      FieldName = 'MES'
      Size = 2
    end
    object CDSLancamentoConciliadoANO: TStringField
      FieldName = 'ANO'
      Size = 4
    end
    object CDSLancamentoConciliadoDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object CDSLancamentoConciliadoDATA_BALANCETE: TDateField
      FieldName = 'DATA_BALANCETE'
    end
    object CDSLancamentoConciliadoHISTORICO_EXTRATO: TStringField
      FieldName = 'HISTORICO_EXTRATO'
      Size = 50
    end
    object CDSLancamentoConciliadoVALOR_EXTRATO: TFMTBCDField
      FieldName = 'VALOR_EXTRATO'
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
