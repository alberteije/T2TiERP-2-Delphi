inherited FOrcamentoEmpresarial: TFOrcamentoEmpresarial
  Tag = 1
  Left = 318
  Top = 169
  Caption = 'Or'#231'amento Empresarial'
  ClientWidth = 988
  ExplicitLeft = 318
  ExplicitTop = 169
  ExplicitWidth = 996
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      inherited PanelGrid: TPanel
        Width = 980
        ExplicitWidth = 980
        inherited Grid: TJvDBUltimGrid
          Width = 980
        end
        inherited PanelFiltroRapido: TPanel
          Width = 980
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
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 980
        ExplicitWidth = 980
        object PanelParcelas: TPanel
          Left = 4
          Top = 4
          Width = 972
          Height = 399
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 387
          DesignSize = (
            972
            399)
          object PageControlItens: TPageControl
            Left = 6
            Top = 184
            Width = 954
            Height = 193
            ActivePage = tsItens
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tsItens: TTabSheet
              Caption = 'Itens'
              object PanelItens: TPanel
                Left = 0
                Top = 0
                Width = 946
                Height = 165
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridOrcamentoDetalhe: TJvDBUltimGrid
                  Left = 0
                  Top = 30
                  Width = 946
                  Height = 135
                  Align = alClient
                  DataSource = DSOrcamentoDetalhe
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = GridOrcamentoDetalheKeyDown
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
                  OnUserSort = GridOrcamentoDetalheUserSort
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ID'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'PERIODO'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Per'#237'odo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Classifica'#231#227'o da Natureza Financeira'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NATUREZA_FINANCEIRA.DESCRICAO'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Descri'#231#227'o da Natureza Financeira'
                      Width = 400
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_ORCADO'
                      Title.Alignment = taCenter
                      Title.Caption = 'Valor Or'#231'ado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_REALIZADO'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Valor Realizado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_VARIACAO'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Taxa Varia'#231#227'o (%)'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_VARIACAO'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Valor Varia'#231#227'o'
                      Visible = True
                    end>
                end
                object ActionToolBarEdits: TActionToolBar
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 940
                  Height = 24
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  ColorMap.BtnSelectedColor = clBtnFace
                  ColorMap.UnusedColor = 15660791
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
          end
        end
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 168
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            954
            168)
          object EditIdOrcamentoPeriodo: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdOrcamentoPeriodoExit
            OnKeyDown = EditIdOrcamentoPeriodoKeyDown
            OnKeyPress = EditIdOrcamentoPeriodoKeyPress
            CalcEditLabel.Width = 63
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Per'#237'odo [F1]:'
          end
          object EditOrcamentoPeriodo: TLabeledEdit
            Left = 105
            Top = 24
            Width = 279
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 2
          end
          object EditNome: TLabeledEdit
            Left = 390
            Top = 24
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 31
            EditLabel.Height = 13
            EditLabel.Caption = 'Nome:'
            TabOrder = 3
          end
          object EditDataBase: TLabeledDateEdit
            Left = 136
            Top = 69
            Width = 121
            Height = 21
            TabOrder = 5
            DateEditLabel.Width = 53
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Base:'
          end
          object EditNumeroPeriodos: TLabeledCalcEdit
            Left = 263
            Top = 69
            Width = 121
            Height = 21
            DisplayFormat = '###,###,###'
            ShowButton = False
            TabOrder = 6
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 100
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'N'#250'mero de Periodos:'
          end
          object EditDataInicial: TLabeledDateEdit
            Left = 9
            Top = 69
            Width = 121
            Height = 21
            TabOrder = 4
            DateEditLabel.Width = 57
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Inicial:'
          end
          object MemoDescricao: TLabeledMemo
            Left = 9
            Top = 112
            Width = 935
            Height = 46
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 7
            MemoLabel.Width = 50
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Descric'#227'o:'
          end
          object EditOrcamentoPeriodoCodigo: TLabeledEdit
            Left = 70
            Top = 24
            Width = 35
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 1
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
            Action = ActionCalcularVariacao
            Caption = 'C&alcular Varia'#231#227'o'
            ImageIndex = 29
          end
          item
            Action = ActionPegarRealizado
            Caption = '&Pegar Realizado'
            ImageIndex = 31
          end
          item
            Action = ActionGerarOrcamentoEmpresarial
            Caption = '&Gerar Or'#231'amento'
            ImageIndex = 30
          end>
        ActionBar = ActionToolBarEdits
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 856
    Top = 328
    StyleName = 'Ribbon - Silver'
    object ActionGerarOrcamentoEmpresarial: TAction
      Category = 'OrcamentoEmpresarial'
      Caption = 'Gerar Or'#231'amento'
      ImageIndex = 30
      OnExecute = ActionGerarOrcamentoEmpresarialExecute
    end
    object ActionPegarRealizado: TAction
      Category = 'OrcamentoEmpresarial'
      Caption = 'Pegar Realizado'
      ImageIndex = 31
      OnExecute = ActionPegarRealizadoExecute
    end
    object ActionCalcularVariacao: TAction
      Category = 'OrcamentoEmpresarial'
      Caption = 'Calcular Varia'#231#227'o'
      ImageIndex = 29
      OnExecute = ActionCalcularVariacaoExecute
    end
  end
  object DSOrcamentoDetalhe: TDataSource
    DataSet = CDSOrcamentoDetalhe
    Left = 584
    Top = 336
  end
  object CDSOrcamentoDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_NATUREZA_FINANCEIRA'
        DataType = ftInteger
      end
      item
        Name = 'ID_ORCAMENTO_EMPRESARIAL'
        DataType = ftInteger
      end
      item
        Name = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NATUREZA_FINANCEIRA.DESCRICAO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'PERIODO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VALOR_ORCADO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_REALIZADO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_VARIACAO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_VARIACAO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSOrcamentoDetalheAfterEdit
    AfterPost = CDSOrcamentoDetalheAfterPost
    Left = 704
    Top = 336
    Data = {
      FA0100009619E0BD02000000180000000B000000000003000000FA0102494404
      000100000000001649445F4E41545552455A415F46494E414E43454952410400
      0100000000001849445F4F5243414D454E544F5F454D50524553415249414C04
      000100000000001F4E41545552455A415F46494E414E43454952412E434C4153
      534946494341430100490000000200055749445448020002001E00094649454C
      444E414D45220009804E41545552455A415F46494E414E43454952412E434C41
      5353494649434143414F001D4E41545552455A415F46494E414E43454952412E
      44455343524943414F010049000000010005574944544802000200FA00075045
      52494F444F0100490000000100055749445448020002000A000C56414C4F525F
      4F524341444F0A0012000000020008444543494D414C53020002000600055749
      445448020002000F000F56414C4F525F5245414C495A41444F0A001200000002
      0008444543494D414C53020002000600055749445448020002000F000D544158
      415F564152494143414F0A0012000000020008444543494D414C530200020006
      00055749445448020002000F000E56414C4F525F564152494143414F0A001200
      0000020008444543494D414C53020002000600055749445448020002000F0008
      504552534953544501004900000001000557494454480200020001000000}
    object CDSOrcamentoDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSOrcamentoDetalheID_NATUREZA_FINANCEIRA: TIntegerField
      FieldName = 'ID_NATUREZA_FINANCEIRA'
    end
    object CDSOrcamentoDetalheID_ORCAMENTO_EMPRESARIAL: TIntegerField
      FieldName = 'ID_ORCAMENTO_EMPRESARIAL'
    end
    object CDSOrcamentoDetalheNATUREZA_FINANCEIRACLASSIFICACAO: TStringField
      FieldName = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
      Size = 30
    end
    object CDSOrcamentoDetalheNATUREZA_FINANCEIRADESCRICAO: TStringField
      FieldName = 'NATUREZA_FINANCEIRA.DESCRICAO'
      Size = 250
    end
    object CDSOrcamentoDetalhePERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 10
    end
    object CDSOrcamentoDetalheVALOR_ORCADO: TFMTBCDField
      FieldName = 'VALOR_ORCADO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoDetalheVALOR_REALIZADO: TFMTBCDField
      FieldName = 'VALOR_REALIZADO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoDetalheTAXA_VARIACAO: TFMTBCDField
      FieldName = 'TAXA_VARIACAO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoDetalheVALOR_VARIACAO: TFMTBCDField
      FieldName = 'VALOR_VARIACAO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSOrcamentoDetalhePERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
end
