inherited FFinResumoTesouraria: TFFinResumoTesouraria
  Tag = 1
  Left = 324
  Top = 157
  Caption = 'Resumo da Tesouraria'
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
            Width = 438
            ExplicitWidth = 438
          end
          object GroupBox1: TGroupBox
            Left = 602
            Top = 8
            Width = 210
            Height = 40
            Anchors = [akTop, akRight]
            Caption = 'Per'#237'odo para consulta:'
            TabOrder = 2
            object Label1: TLabel
              Left = 104
              Top = 20
              Width = 6
              Height = 13
              Caption = 'e'
            end
            object EditDataInicio: TLabeledDateEdit
              Left = 8
              Top = 15
              Width = 90
              Height = 21
              TabOrder = 0
              DateEditLabel.Width = 3
              DateEditLabel.Height = 13
              DateEditLabel.Caption = ' '
            end
            object EditDataFim: TLabeledDateEdit
              Left = 115
              Top = 15
              Width = 90
              Height = 21
              TabOrder = 1
              DateEditLabel.Width = 3
              DateEditLabel.Height = 13
              DateEditLabel.Caption = ' '
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
          Top = 12
          Width = 926
          Height = 418
          Anchors = [akLeft, akTop, akRight, akBottom]
          Constraints.MinWidth = 753
          ExplicitHeight = 386
        end
        object PanelEditsInterno: TPanel
          Left = 18
          Top = 21
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
          Top = 91
          Width = 907
          Height = 330
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvLowered
          TabOrder = 1
          object GridPagamentos: TJvDBUltimGrid
            Left = 1
            Top = 1
            Width = 905
            Height = 302
            Align = alClient
            DataSource = DSResumoTesouraria
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
            Top = 303
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
  object DSResumoTesouraria: TDataSource
    DataSet = CDSResumoTesouraria
    Left = 304
    Top = 312
  end
  object CDSResumoTesouraria: TClientDataSet
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
    object CDSResumoTesourariaID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSResumoTesourariaNOME_CONTA_CAIXA: TStringField
      FieldName = 'NOME_CONTA_CAIXA'
      Size = 50
    end
    object CDSResumoTesourariaNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 150
    end
    object CDSResumoTesourariaDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDSResumoTesourariaDATA_PAGO_RECEBIDO: TDateField
      FieldName = 'DATA_PAGO_RECEBIDO'
    end
    object CDSResumoTesourariaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 250
    end
    object CDSResumoTesourariaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSResumoTesourariaDESCRICAO_DOCUMENTO_ORIGEM: TStringField
      FieldName = 'DESCRICAO_DOCUMENTO_ORIGEM'
      Size = 250
    end
    object CDSResumoTesourariaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
  end
end
