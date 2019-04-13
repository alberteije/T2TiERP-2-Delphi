inherited FFinExtratoContaBanco: TFFinExtratoContaBanco
  Tag = 1
  Left = 324
  Top = 157
  Caption = 'Extrato Conta Banco'
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
    ActivePage = PaginaEdits
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
          Height = 384
        end
        inherited PanelFiltroRapido: TPanel
          Top = 384
          Width = 950
          Height = 55
          ExplicitTop = 384
          ExplicitWidth = 950
          ExplicitHeight = 55
          inherited BotaoConsultar: TSpeedButton
            Left = 818
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 654
            ExplicitWidth = 654
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
            Width = 748
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
          object EditMesAno: TLabeledMaskEdit
            Left = 824
            Top = 24
            Width = 73
            Height = 21
            Alignment = taCenter
            Anchors = [akTop, akRight]
            EditLabel.Width = 52
            EditLabel.Height = 13
            EditLabel.Caption = 'M'#234's / Ano:'
            MaxLength = 7
            TabOrder = 2
            Text = '  ///__'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
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
            DataSource = DSExtratoConta
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
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOCUMENTO'
                Title.Caption = 'Documento'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Title.Caption = 'Valor'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CONCILIADO'
                Title.Caption = 'Conciliado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBSERVACAO'
                Title.Caption = 'Observa'#231#227'o'
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
    Left = 92
    Top = 39
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 272
  end
  object DSExtratoConta: TDataSource
    DataSet = CDSExtratoConta
    Left = 304
    Top = 312
  end
  object CDSExtratoConta: TClientDataSet
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
        Name = 'MES_ANO'
        DataType = ftString
        Size = 7
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
        Size = 250
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'CONCILIADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 360
    Data = {
      590100009619E0BD02000000180000000C000000000003000000590102494404
      000100000000000E49445F434F4E54415F43414958410400010000000000074D
      45535F414E4F0100490000000100055749445448020002000700034D45530100
      49000000010005574944544802000200020003414E4F01004900000001000557
      494454480200020004000E444154415F4D4F56494D454E544F04000600000000
      000E444154415F42414C414E43455445040006000000000009484953544F5249
      434F010049000000010005574944544802000200FA0009444F43554D454E544F
      01004900000001000557494454480200020032000556414C4F520A0012000000
      020008444543494D414C53020002000600055749445448020002000F000A434F
      4E43494C4941444F01004900000001000557494454480200020001000A4F4253
      4552564143414F010049000000010005574944544802000200FA000000}
    object CDSExtratoContaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSExtratoContaID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSExtratoContaMES_ANO: TStringField
      FieldName = 'MES_ANO'
      Size = 7
    end
    object CDSExtratoContaMES: TStringField
      FieldName = 'MES'
      Size = 2
    end
    object CDSExtratoContaANO: TStringField
      FieldName = 'ANO'
      Size = 4
    end
    object CDSExtratoContaDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object CDSExtratoContaDATA_BALANCETE: TDateField
      FieldName = 'DATA_BALANCETE'
    end
    object CDSExtratoContaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 250
    end
    object CDSExtratoContaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 50
    end
    object CDSExtratoContaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSExtratoContaCONCILIADO: TStringField
      FieldName = 'CONCILIADO'
      Size = 1
    end
    object CDSExtratoContaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionConciliarCheques
            Caption = '&Conciliar Cheques'
            ImageIndex = 29
          end
          item
            Action = ActionConciliarLancamentos
            Caption = 'C&onciliar Lan'#231'amentos'
            ImageIndex = 31
          end
          item
            Caption = '-'
          end
          item
            Action = ActionCarregarExtrato
            Caption = 'C&arregar Extrato'
            ImageIndex = 33
          end
          item
            Action = ActionImportarArquivo
            Caption = '&Importar Arquivo Extrato'
            ImageIndex = 28
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 502
    Top = 338
    StyleName = 'Platform Default'
    object ActionImportarArquivo: TAction
      Caption = 'Importar Arquivo Extrato'
      ImageIndex = 28
      OnExecute = ActionImportarArquivoExecute
    end
    object ActionConciliarCheques: TAction
      Caption = 'Conciliar Cheques'
      ImageIndex = 29
      OnExecute = ActionConciliarChequesExecute
    end
    object ActionConciliarLancamentos: TAction
      Caption = 'Conciliar Lan'#231'amentos'
      ImageIndex = 31
      OnExecute = ActionConciliarLancamentosExecute
    end
    object ActionCarregarExtrato: TAction
      Caption = 'Carregar Extrato'
      ImageIndex = 33
      OnExecute = ActionCarregarExtratoExecute
    end
  end
end
