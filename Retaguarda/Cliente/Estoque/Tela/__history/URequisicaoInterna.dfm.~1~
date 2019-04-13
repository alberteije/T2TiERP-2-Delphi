inherited FRequisicaoInterna: TFRequisicaoInterna
  Tag = 1
  Left = 309
  Top = 216
  Caption = 'Requisi'#231#227'o Interna'
  ClientWidth = 930
  ExplicitLeft = 309
  ExplicitTop = 216
  ExplicitWidth = 938
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 930
    ActivePage = PaginaEdits
    ExplicitWidth = 930
    inherited PaginaGrid: TTabSheet
      inherited PanelGrid: TPanel
        Width = 922
        ExplicitWidth = 922
        inherited Grid: TJvDBUltimGrid
          Width = 922
        end
        inherited PanelFiltroRapido: TPanel
          Width = 922
          ExplicitWidth = 922
          inherited BotaoConsultar: TSpeedButton
            Left = 790
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 621
            ExplicitWidth = 621
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 922
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 922
        ExplicitWidth = 922
        object BevelEdits: TBevel
          Left = 10
          Top = 38
          Width = 900
          Height = 54
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 98
          Width = 900
          Height = 279
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Itens'
          TabOrder = 0
          object GridItens: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 896
            Height = 262
            Align = alClient
            DataSource = DSRequisicaoInternaDetalhe
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = GridItensKeyDown
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
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Quantidade'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE_ESTOQUE'
                ReadOnly = True
                Title.Caption = 'Qtde. em Estoque'
                Visible = True
              end>
          end
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 16
          Top = 61
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdColaboradorExit
          OnKeyDown = EditIdColaboradorKeyDown
          OnKeyPress = EditIdColaboradorKeyPress
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Colaborador [F1]:'
        end
        object EditColaborador: TLabeledEdit
          Left = 77
          Top = 61
          Width = 697
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 2
        end
        object EditDataRequisicao: TLabeledDateEdit
          Left = 780
          Top = 61
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 3
          DateEditLabel.Width = 81
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Requisi'#231#227'o:'
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 4
          Width = 914
          Height = 26
          ActionManager = ActionManager1
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
          ExplicitHeight = 23
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 930
    ExplicitWidth = 930
    inherited BotaoSair: TSpeedButton
      Left = 826
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 726
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 516
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 526
      ExplicitLeft = 526
    end
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 216
  end
  object CDSRequisicaoInternaDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_REQUISICAO_INTERNA_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'QUANTIDADE_ESTOQUE'
        DataType = ftFloat
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSRequisicaoInternaDetalheAfterEdit
    Left = 836
    Top = 311
    Data = {
      CC0000009619E0BD010000001800000007000000000003000000CC0002494404
      000100000000001F49445F5245515549534943414F5F494E5445524E415F4341
      424543414C484F04000100000000000A49445F50524F4455544F040001000000
      00000C50524F4455544F2E4E4F4D450100490000000100055749445448020002
      0064000A5155414E5449444144450800040000000000125155414E5449444144
      455F4553544F5155450800040000000000085045525349535445010049000000
      01000557494454480200020001000000}
    object CDSRequisicaoInternaDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSRequisicaoInternaDetalheID_REQUISICAO_INTERNA_CABECALHO: TIntegerField
      FieldName = 'ID_REQUISICAO_INTERNA_CABECALHO'
    end
    object CDSRequisicaoInternaDetalheID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSRequisicaoInternaDetalheQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,##0.00'
    end
    object CDSRequisicaoInternaDetalhePRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
      Size = 100
    end
    object CDSRequisicaoInternaDetalheQUANTIDADE_ESTOQUE: TFloatField
      FieldName = 'QUANTIDADE_ESTOQUE'
      DisplayFormat = '###,##0.00'
    end
    object CDSRequisicaoInternaDetalhePERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSRequisicaoInternaDetalhe: TDataSource
    DataSet = CDSRequisicaoInternaDetalhe
    Left = 836
    Top = 367
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionAdicionarItem
            Caption = '&Adicionar Item'
            ImageIndex = 31
          end
          item
            Caption = '-'
          end
          item
            Action = ActionIndeferirSolicitacao
            Caption = '&Indeferir Solicita'#231#227'o'
            ImageIndex = 34
          end
          item
            Action = ActionDeferirSolicitacao
            Caption = '&Deferir Solicita'#231#227'o'
            ImageIndex = 32
          end>
        ActionBar = ActionToolBar1
      end>
    Images = FDataModule.ImagensCadastros
    Left = 574
    Top = 319
    StyleName = 'Platform Default'
    object ActionAdicionarItem: TAction
      Caption = 'Adicionar Item'
      ImageIndex = 31
      OnExecute = ActionAdicionarItemExecute
    end
    object ActionDeferirSolicitacao: TAction
      Caption = 'Deferir Solicita'#231#227'o'
      ImageIndex = 32
      OnExecute = ActionDeferirSolicitacaoExecute
    end
    object ActionIndeferirSolicitacao: TAction
      Caption = 'Indeferir Solicita'#231#227'o'
      ImageIndex = 34
      OnExecute = ActionIndeferirSolicitacaoExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Images = FDataModule.ImagensCadastros
    Left = 374
    Top = 257
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      ImageIndex = 10
      OnClick = ExcluirItem1Click
    end
  end
end
