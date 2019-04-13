inherited FComposicaoSaldo: TFComposicaoSaldo
  Left = 335
  Top = 137
  Caption = 'Composi'#231#227'o do Saldo'
  ClientHeight = 536
  ClientWidth = 973
  ExplicitLeft = 335
  ExplicitTop = 137
  ExplicitWidth = 981
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 973
    Height = 505
    ActivePage = PaginaEdits
    ExplicitTop = 35
    ExplicitWidth = 973
    ExplicitHeight = 497
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 965
      ExplicitHeight = 469
      inherited PanelGrid: TPanel
        Width = 965
        Height = 477
        ExplicitWidth = 965
        ExplicitHeight = 469
        inherited Grid: TJvDBUltimGrid
          Width = 965
          Height = 425
        end
        inherited PanelFiltroRapido: TPanel
          Top = 425
          Width = 965
          ExplicitTop = 417
          ExplicitWidth = 965
          inherited BotaoConsultar: TSpeedButton
            Left = 833
            ExplicitLeft = 879
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 664
            ExplicitWidth = 664
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 965
      ExplicitHeight = 469
      inherited PanelEdits: TPanel
        Width = 965
        Height = 477
        ExplicitWidth = 965
        ExplicitHeight = 469
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 944
          Height = 428
          Anchors = [akLeft, akTop, akRight, akBottom]
          Constraints.MinWidth = 753
        end
        object LabelSaldo: TLabel
          Left = 938
          Top = 411
          Width = 6
          Height = 23
          Alignment = taRightJustify
          Anchors = [akLeft, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditPlanoConta: TLabeledEdit
          Left = 81
          Top = 32
          Width = 863
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 1
        end
        object EditClassificacao: TLabeledEdit
          Left = 440
          Top = 124
          Width = 353
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Classifica'#231#227'o:'
          TabOrder = 6
        end
        object EditDescricao: TLabeledEdit
          Left = 20
          Top = 169
          Width = 924
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          TabOrder = 8
        end
        object EditPlanoContaRefSped: TLabeledEdit
          Left = 81
          Top = 78
          Width = 863
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object EditIdPlanoConta: TLabeledCalcEdit
          Left = 20
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 62
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Plano Conta:'
        end
        object EditIdPlanoContaRefSped: TLabeledCalcEdit
          Left = 20
          Top = 78
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 147
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Plano Conta Referencial SPED:'
        end
        object EditIdContaPai: TLabeledCalcEdit
          Left = 20
          Top = 124
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 50
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Pai:'
        end
        object EditContaPai: TLabeledEdit
          Left = 81
          Top = 124
          Width = 353
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 5
        end
        object ComboBoxTipo: TLabeledComboBox
          Left = 799
          Top = 124
          Width = 145
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 7
          Text = 'Sint'#233'tica'
          Items.Strings = (
            'Sint'#233'tica'
            'Anal'#237'tica')
          ComboBoxLabel.Width = 24
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Tipo:'
        end
        object GroupBox4: TGroupBox
          Left = 20
          Top = 196
          Width = 924
          Height = 237
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Lan'#231'amentos:'
          TabOrder = 9
          object GridDetalhe: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 920
            Height = 220
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
                Width = 500
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
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 447
          Width = 957
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
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 973
    ExplicitWidth = 973
    inherited BotaoSair: TSpeedButton
      Left = 869
      ExplicitLeft = 759
    end
    inherited BotaoExportar: TSpeedButton
      Left = 769
      ExplicitLeft = 815
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 669
      ExplicitLeft = 715
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 559
      ExplicitLeft = 605
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 569
      ExplicitLeft = 615
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionListarLancamentos
            Caption = '&Listar Lan'#231'amentos'
            ImageIndex = 31
          end>
      end
      item
        Items = <
          item
            Action = ActionImpressao
            Caption = '&Impress'#227'o'
            ImageIndex = 26
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
    Left = 863
    Top = 350
    StyleName = 'Platform Default'
    object ActionListarLancamentos: TAction
      Caption = 'Listar Lan'#231'amentos'
      ImageIndex = 31
      OnExecute = ActionListarLancamentosExecute
    end
    object ActionImpressao: TAction
      Caption = 'Impress'#227'o'
      ImageIndex = 26
    end
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
    Top = 368
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
    Top = 320
  end
end
