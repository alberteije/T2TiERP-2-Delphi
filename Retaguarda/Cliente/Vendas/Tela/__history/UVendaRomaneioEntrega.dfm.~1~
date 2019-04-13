inherited FVendaRomaneioEntrega: TFVendaRomaneioEntrega
  Left = 339
  Top = 168
  Caption = 'Romaneio de Entrega'
  ClientHeight = 497
  ClientWidth = 933
  ExplicitLeft = 339
  ExplicitTop = 168
  ExplicitWidth = 941
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 933
    Height = 466
    ActivePage = PaginaEdits
    ExplicitWidth = 933
    ExplicitHeight = 518
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 925
      ExplicitHeight = 490
      inherited PanelGrid: TPanel
        Width = 925
        Height = 438
        ExplicitWidth = 925
        ExplicitHeight = 490
        inherited Grid: TJvDBUltimGrid
          Width = 925
          Height = 386
        end
        inherited PanelFiltroRapido: TPanel
          Top = 386
          Width = 925
          ExplicitTop = 438
          ExplicitWidth = 925
          inherited BotaoConsultar: TSpeedButton
            Left = 793
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 624
            ExplicitWidth = 624
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 925
      ExplicitHeight = 490
      inherited PanelEdits: TPanel
        Width = 925
        Height = 438
        ExplicitWidth = 925
        ExplicitHeight = 490
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 232
          Width = 905
          Height = 194
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Vendas Vinculadas [F1]:'
          TabOrder = 0
          object GridParcelas: TJvDBUltimGrid
            Left = 2
            Top = 41
            Width = 901
            Height = 151
            Align = alClient
            BiDiMode = bdLeftToRight
            DataSource = DSVenda
            ParentBiDiMode = False
            ReadOnly = True
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
                FieldName = 'ID'
                Title.Caption = 'Id Venda'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLIENTE.NOME'
                Title.Caption = 'Nome Cliente'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_VENDA'
                Title.Caption = 'Data Venda'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Title.Caption = 'Valor Total'
                Width = 120
                Visible = True
              end>
          end
          object ActionToolBar1: TActionToolBar
            Left = 2
            Top = 15
            Width = 901
            Height = 26
            ActionManager = ActionManager1
            BiDiMode = bdRightToLeft
            Caption = 'ActionToolBar1'
            ColorMap.HighlightColor = 15660791
            ColorMap.BtnSelectedColor = clBtnFace
            ColorMap.UnusedColor = 15660791
            Orientation = boRightToLeft
            ParentBiDiMode = False
            Spacing = 0
          end
        end
        object ScrollBox1: TScrollBox
          Left = 4
          Top = 4
          Width = 920
          Height = 213
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            916
            209)
          object Bevel1: TBevel
            Left = 8
            Top = 10
            Width = 897
            Height = 191
            Anchors = [akLeft, akTop, akRight]
          end
          object EditDescricao: TLabeledEdit
            Left = 443
            Top = 35
            Width = 454
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 50
            EditLabel.Height = 13
            EditLabel.Caption = 'Descri'#231#227'o:'
            MaxLength = 20
            TabOrder = 2
          end
          object MemoObservacao: TLabeledMemo
            Left = 17
            Top = 124
            Width = 880
            Height = 65
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 8
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
          object EditEntregador: TLabeledEdit
            Left = 78
            Top = 35
            Width = 359
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 1
          end
          object ComboBoxSituacao: TLabeledComboBox
            Left = 17
            Top = 79
            Width = 134
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 3
            Text = 'A - Aberto'
            Items.Strings = (
              'A - Aberto'
              'T - Transito'
              'E - Encerrado')
            ComboBoxLabel.Width = 45
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Situa'#231#227'o:'
          end
          object EditDataEmissao: TLabeledDateEdit
            Left = 157
            Top = 79
            Width = 121
            Height = 21
            TabOrder = 4
            DateEditLabel.Width = 68
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Emiss'#227'o:'
          end
          object EditDataPrevista: TLabeledDateEdit
            Left = 284
            Top = 79
            Width = 121
            Height = 21
            TabOrder = 5
            DateEditLabel.Width = 69
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Prevista:'
          end
          object EditDataSaida: TLabeledDateEdit
            Left = 411
            Top = 79
            Width = 121
            Height = 21
            TabOrder = 6
            DateEditLabel.Width = 56
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Sa'#237'da:'
          end
          object EditIdEntregador: TLabeledCalcEdit
            Left = 17
            Top = 35
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdEntregadorExit
            OnKeyDown = EditIdEntregadorKeyDown
            OnKeyPress = EditIdEntregadorKeyPress
            CalcEditLabel.Width = 81
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Entregador [F1]:'
          end
          object EditDataEncerramento: TLabeledDateEdit
            Left = 538
            Top = 79
            Width = 121
            Height = 21
            TabOrder = 7
            DateEditLabel.Width = 97
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Encerramento:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited BotaoSair: TSpeedButton
      Left = 829
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 729
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 629
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 519
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 529
      ExplicitLeft = 526
    end
  end
  object DSVenda: TDataSource
    DataSet = CDSVenda
    Left = 668
    Top = 392
  end
  object CDSVenda: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'DATA_VENDA'
        DataType = ftDate
      end
      item
        Name = 'CLIENTE.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 760
    Top = 392
    Data = {
      880000009619E0BD020000001800000004000000000003000000880002494404
      000100000000000A444154415F56454E444104000600000000000C434C49454E
      54452E4E4F4D4501004900000001000557494454480200020064000B56414C4F
      525F544F54414C0A0012000000020008444543494D414C530200020006000557
      49445448020002000F000000}
    object CDSVendaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSVendaDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
    end
    object CDSVendaCLIENTENOME: TStringField
      FieldName = 'CLIENTE.NOME'
      Size = 100
    end
    object CDSVendaVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionRemoverVenda
            Caption = '&Remover Venda Selecionada'
            ImageIndex = 34
          end
          item
            Action = ActionAdicionarVenda
            Caption = '&Adicionar Venda'
            ImageIndex = 29
          end>
        ActionBar = ActionToolBar1
      end>
    Images = FDataModule.ImagensCadastros
    Left = 374
    Top = 411
    StyleName = 'Platform Default'
    object ActionAdicionarVenda: TAction
      Caption = 'Adicionar Venda'
      ImageIndex = 29
      OnExecute = ActionAdicionarVendaExecute
    end
    object ActionRemoverVenda: TAction
      Caption = 'Remover Venda Selecionada'
      ImageIndex = 34
      OnExecute = ActionRemoverVendaExecute
    end
  end
end
