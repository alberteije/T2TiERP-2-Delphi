inherited FFinMovimentoCaixaBanco: TFFinMovimentoCaixaBanco
  Tag = 1
  Left = 324
  Top = 157
  Caption = 'Movimento de Caixa/Banco'
  ClientHeight = 498
  ClientWidth = 958
  ExplicitLeft = 324
  ExplicitTop = 157
  ExplicitWidth = 966
  ExplicitHeight = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 958
    Height = 467
    ExplicitWidth = 909
    ExplicitHeight = 467
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 901
      inherited PanelGrid: TPanel
        Width = 950
        Height = 439
        ExplicitWidth = 901
        ExplicitHeight = 439
        inherited Grid: TJvDBUltimGrid
          Width = 950
          Height = 352
        end
        inherited PanelFiltroRapido: TPanel
          Top = 352
          Width = 950
          Height = 87
          ExplicitTop = 352
          ExplicitWidth = 950
          ExplicitHeight = 87
          inherited BotaoConsultar: TSpeedButton
            Left = 818
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 556
            ExplicitWidth = 556
          end
          object GroupBox1: TGroupBox
            Left = 720
            Top = 8
            Width = 92
            Height = 40
            Anchors = [akTop, akRight]
            Caption = 'M'#234's/Ano:'
            TabOrder = 2
            object EditMesAno: TMaskEdit
              Left = 10
              Top = 16
              Width = 71
              Height = 21
              Alignment = taCenter
              EditMask = '##/####;1;_'
              MaxLength = 7
              TabOrder = 0
              Text = '  /    '
            end
          end
          object PanelTotaisGeral: TPanel
            Left = 1
            Top = 60
            Width = 948
            Height = 26
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 950
      ExplicitHeight = 439
      inherited PanelEdits: TPanel
        Width = 950
        Height = 439
        ExplicitWidth = 950
        ExplicitHeight = 439
        object BevelEdits: TBevel
          Left = 9
          Top = 37
          Width = 926
          Height = 392
          Anchors = [akLeft, akTop, akRight, akBottom]
          Constraints.MinWidth = 753
        end
        object PanelEditsInterno: TPanel
          Left = 18
          Top = 45
          Width = 907
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            907
            59)
          object EditIdContaCaixa: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            Color = clInfoBk
            DisplayFormat = '#'
            ReadOnly = True
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 86
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Conta Caixa [F1]:'
          end
          object EditContaCaixa: TLabeledEdit
            Left = 70
            Top = 24
            Width = 829
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
        object PanelGridInterna: TPanel
          Left = 18
          Top = 113
          Width = 907
          Height = 309
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvLowered
          TabOrder = 1
          object GridPagamentos: TJvDBUltimGrid
            Left = 1
            Top = 1
            Width = 905
            Height = 281
            Align = alClient
            DataSource = DSMovimentoCaixaBanco
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
                FieldName = 'OPERACAO'
                Title.Caption = 'Opera'#231#227'o'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_CONTA_CAIXA'
                Title.Caption = 'Id Conta Caixa'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_CONTA_CAIXA'
                Title.Caption = 'Conta Caixa'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_PESSOA'
                Title.Caption = 'Pessoa'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_LANCAMENTO'
                Title.Caption = 'Data Lan'#231'amento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_PAGO_RECEBIDO'
                Title.Caption = 'Data Pago/Recebido'
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
                FieldName = 'HISTORICO'
                Title.Caption = 'Hist'#243'rico'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO_DOCUMENTO_ORIGEM'
                Title.Caption = 'Documento Origem'
                Width = 300
                Visible = True
              end>
          end
          object PanelTotais: TPanel
            Left = 1
            Top = 282
            Width = 905
            Height = 26
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 4
          Width = 942
          Height = 23
          ActionManager = ActionManager1
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 958
    ExplicitWidth = 909
    inherited BotaoSair: TSpeedButton
      Left = 854
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 754
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 644
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 744
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoInserir: TSpeedButton
      ExplicitLeft = 337
    end
    inherited BotaoAlterar: TSpeedButton
      ExplicitLeft = 437
    end
    inherited BotaoExcluir: TSpeedButton
      ExplicitLeft = 537
    end
    inherited BotaoCancelar: TSpeedButton
      ExplicitLeft = 637
    end
    inherited BotaoSalvar: TSpeedButton
      ExplicitLeft = 737
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 544
      ExplicitLeft = 639
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 424
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 556
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 272
  end
  object DSMovimentoCaixaBanco: TDataSource
    DataSet = CDSMovimentoCaixaBanco
    Left = 304
    Top = 312
  end
  object CDSMovimentoCaixaBanco: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_CONTA_CAIXA'
        DataType = ftInteger
      end
      item
        Name = 'NOME_CONTA_CAIXA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_PESSOA'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'DATA_LANCAMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_PAGO_RECEBIDO'
        DataType = ftDate
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'DESCRICAO_DOCUMENTO_ORIGEM'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'OPERACAO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 360
    Data = {
      3C0100009619E0BD0200000018000000090000000000030000003C010E49445F
      434F4E54415F43414958410400010000000000104E4F4D455F434F4E54415F43
      4149584101004900000001000557494454480200020032000B4E4F4D455F5045
      53534F4101004900000001000557494454480200020096000F444154415F4C41
      4E43414D454E544F040006000000000012444154415F5041474F5F5245434542
      49444F040006000000000009484953544F5249434F0100490000000100055749
      44544802000200FA000556414C4F520A0012000000020008444543494D414C53
      020002000600055749445448020002000F001A44455343524943414F5F444F43
      554D454E544F5F4F524947454D010049000000010005574944544802000200FA
      00084F5045524143414F01004900000001000557494454480200020001000000}
    object CDSMovimentoCaixaBancoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSMovimentoCaixaBancoNOME_CONTA_CAIXA: TStringField
      FieldName = 'NOME_CONTA_CAIXA'
      Size = 50
    end
    object CDSMovimentoCaixaBancoNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 150
    end
    object CDSMovimentoCaixaBancoDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDSMovimentoCaixaBancoDATA_PAGO_RECEBIDO: TDateField
      FieldName = 'DATA_PAGO_RECEBIDO'
    end
    object CDSMovimentoCaixaBancoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 250
    end
    object CDSMovimentoCaixaBancoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSMovimentoCaixaBancoDESCRICAO_DOCUMENTO_ORIGEM: TStringField
      FieldName = 'DESCRICAO_DOCUMENTO_ORIGEM'
      Size = 250
    end
    object CDSMovimentoCaixaBancoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionProcessarFechamento
            Caption = '&Processar Fechamento'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 534
    Top = 330
    StyleName = 'Platform Default'
    object ActionProcessarFechamento: TAction
      Caption = 'Processar Fechamento'
      ImageIndex = 31
      OnExecute = ActionProcessarFechamentoExecute
    end
  end
  object DSChequeNaoCompensado: TDataSource
    DataSet = CDSChequeNaoCompensado
    Left = 672
    Top = 304
  end
  object CDSChequeNaoCompensado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_CONTA_CAIXA'
        DataType = ftInteger
      end
      item
        Name = 'NOME_CONTA_CAIXA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TALAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NUMERO_TALAO'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_CHEQUE'
        DataType = ftInteger
      end
      item
        Name = 'STATUS_CHEQUE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATA_STATUS'
        DataType = ftDate
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 352
    Data = {
      FA0000009619E0BD020000001800000008000000000003000000FA000E49445F
      434F4E54415F43414958410400010000000000104E4F4D455F434F4E54415F43
      4149584101004900000001000557494454480200020032000554414C414F0100
      490000000100055749445448020002000A000C4E554D45524F5F54414C414F04
      000100000000000D4E554D45524F5F43484551554504000100000000000D5354
      415455535F43484551554501004900000001000557494454480200020001000B
      444154415F53544154555304000600000000000556414C4F520A001200000002
      0008444543494D414C53020002000600055749445448020002000F000000}
    object CDSChequeNaoCompensadoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSChequeNaoCompensadoNOME_CONTA_CAIXA: TStringField
      FieldName = 'NOME_CONTA_CAIXA'
      Size = 50
    end
    object CDSChequeNaoCompensadoTALAO: TStringField
      FieldName = 'TALAO'
      Size = 10
    end
    object CDSChequeNaoCompensadoNUMERO_TALAO: TIntegerField
      FieldName = 'NUMERO_TALAO'
    end
    object CDSChequeNaoCompensadoNUMERO_CHEQUE: TIntegerField
      FieldName = 'NUMERO_CHEQUE'
    end
    object CDSChequeNaoCompensadoSTATUS_CHEQUE: TStringField
      FieldName = 'STATUS_CHEQUE'
      Size = 1
    end
    object CDSChequeNaoCompensadoDATA_STATUS: TDateField
      FieldName = 'DATA_STATUS'
    end
    object CDSChequeNaoCompensadoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 6
    end
  end
end
