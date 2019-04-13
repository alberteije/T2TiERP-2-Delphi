inherited FPcpOp: TFPcpOp
  Caption = 'Ordem de Produ'#231#227'o'
  ExplicitWidth = 1008
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = PaginaEdits
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 976
          Height = 399
          Align = alClient
          TabOrder = 0
          object Bevel1: TBevel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 966
            Height = 54
            Align = alTop
          end
          object EditCustoTotalPrevisto: TLabeledCalcEdit
            Left = 394
            Top = 24
            Width = 121
            Height = 21
            DisplayFormat = ',0.00'
            TabOrder = 3
            DecimalPlacesAlwaysShown = True
            CalcEditLabel.Width = 101
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Custo Total Previsto:'
          end
          object EditInicio: TLabeledDateEdit
            Left = 13
            Top = 24
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 0
            DateEditLabel.Width = 29
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Inicio:'
          end
          object EditPrevisaoEntrega: TLabeledDateEdit
            Left = 140
            Top = 24
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 1
            DateEditLabel.Width = 86
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Previs'#227'o Entrega:'
          end
          object EditTermino: TLabeledDateEdit
            Left = 267
            Top = 24
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 2
            DateEditLabel.Width = 42
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'T'#233'rmino:'
          end
          object EditCustoTotalRealizado: TLabeledCalcEdit
            Left = 521
            Top = 24
            Width = 121
            Height = 21
            DisplayFormat = ',0.00'
            TabOrder = 4
            DecimalPlacesAlwaysShown = True
            CalcEditLabel.Width = 108
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Custo Total Realizado:'
          end
          object EditPercentualVenda: TLabeledCalcEdit
            Left = 648
            Top = 24
            Width = 121
            Height = 21
            DisplayFormat = ',0.00'
            TabOrder = 5
            DecimalPlacesAlwaysShown = True
            CalcEditLabel.Width = 113
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Percentual para Venda:'
          end
          object EditPercentualEstoque: TLabeledCalcEdit
            Left = 775
            Top = 24
            Width = 121
            Height = 21
            DisplayFormat = ',0.00'
            TabOrder = 6
            DecimalPlacesAlwaysShown = True
            CalcEditLabel.Width = 122
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Percentual para Estoque:'
          end
          object PageControl1: TPageControl
            Left = 0
            Top = 60
            Width = 972
            Height = 335
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 7
            object TabSheet1: TTabSheet
              Caption = 'Produtos'
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 964
                Height = 307
                Align = alClient
                BevelOuter = bvLowered
                ParentBackground = False
                TabOrder = 0
                object GridItens: TJvDBUltimGrid
                  Left = 1
                  Top = 27
                  Width = 962
                  Height = 89
                  Align = alTop
                  DataSource = DSItens
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
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
                      Title.Caption = 'Nome'
                      Width = 345
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_PRODUZIR'
                      Title.Caption = 'Quantidade a Produzir'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_PRODUZIDA'
                      Title.Caption = 'Quantidade Produzida'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_ENTREGUE'
                      Title.Caption = 'Quantidade Entregue'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CUSTO_PREVISTO'
                      Title.Caption = 'Custo Previsto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CUSTO_REALIZADO'
                      Title.Caption = 'Custo Realizado'
                      Visible = True
                    end>
                end
                object ActionToolBarItens: TActionToolBar
                  Left = 1
                  Top = 1
                  Width = 962
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarItens'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
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
                object GridServicos: TJvDBUltimGrid
                  Left = 1
                  Top = 142
                  Width = 962
                  Height = 81
                  Align = alTop
                  DataSource = DSServicos
                  TabOrder = 2
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'INICIO_PREVISTO'
                      Title.Caption = 'Inicio Previsto'
                      Width = 79
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'HORAS_PREVISTO'
                      Title.Caption = 'Horas Previsto'
                      Width = 81
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MINUTOS_PREVISTO'
                      Title.Caption = 'Minutos Previsto'
                      Width = 88
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SEGUNDOS_PREVISTO'
                      Title.Caption = 'Segundos Previsto'
                      Width = 96
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TERMINO_PREVISTO'
                      Title.Caption = 'T'#233'rmino Previsto'
                      Width = 91
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CUSTOS_PREVISTO'
                      Title.Caption = 'Custo Previsto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'INICIO_REALIZADO'
                      Title.Caption = 'Inicio Realizado'
                      Width = 94
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'HORAS_REALIZADO'
                      Title.Caption = 'Horas Realizado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MINUTOS_REALIZADO'
                      Title.Caption = 'Minutos Realizado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SEGUNDOS_REALIZADO'
                      Title.Caption = 'Segundos Realizado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TERMINO_REALIZADO'
                      Title.Caption = 'T'#233'rmino Realizado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'HORAS_REALIZADO'
                      Title.Caption = 'Horas Realizado'
                      Visible = True
                    end>
                end
                object Panel3: TPanel
                  Left = 1
                  Top = 223
                  Width = 450
                  Height = 83
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = 'Panel3'
                  TabOrder = 3
                  object GridColaborador: TJvDBUltimGrid
                    Left = 0
                    Top = 26
                    Width = 450
                    Height = 57
                    Align = alLeft
                    DataSource = DSColaboradores
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    AutoAppend = False
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'ID_COLABORADOR'
                        Title.Caption = 'Id Colaborador'
                        Width = 78
                        Visible = True
                      end
                      item
                        Expanded = False
                        Title.Caption = 'Nome'
                        Width = 323
                        Visible = True
                      end>
                  end
                  object ActionToolBarColaboradores: TActionToolBar
                    Left = 0
                    Top = 0
                    Width = 450
                    Height = 26
                    ActionManager = ActionManager
                    BiDiMode = bdRightToLeft
                    Caption = 'ActionToolBar1'
                    Color = clMenuBar
                    ColorMap.DisabledFontColor = 7171437
                    ColorMap.HighlightColor = clWhite
                    ColorMap.BtnSelectedFont = clBlack
                    ColorMap.UnusedColor = clWhite
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
                object Panel4: TPanel
                  Left = 451
                  Top = 223
                  Width = 512
                  Height = 83
                  Align = alClient
                  BevelOuter = bvNone
                  Caption = 'Panel4'
                  TabOrder = 4
                  object GridEquipamentos: TJvDBUltimGrid
                    Left = 0
                    Top = 26
                    Width = 512
                    Height = 57
                    Align = alClient
                    DataSource = DSEquipamentos
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    AutoAppend = False
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'ID_PATRIM_BEM'
                        Title.Caption = 'Id Equipamento'
                        Width = 94
                        Visible = True
                      end
                      item
                        Expanded = False
                        Title.Caption = 'Descri'#231#227'o'
                        Width = 324
                        Visible = True
                      end>
                  end
                  object ActionToolBarEquipamentos: TActionToolBar
                    Left = 0
                    Top = 0
                    Width = 512
                    Height = 26
                    ActionManager = ActionManager
                    BiDiMode = bdRightToLeft
                    Caption = 'ActionToolBar1'
                    Color = clMenuBar
                    ColorMap.DisabledFontColor = 7171437
                    ColorMap.HighlightColor = clWhite
                    ColorMap.BtnSelectedFont = clBlack
                    ColorMap.UnusedColor = clWhite
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
                object ActionToolBarServicos: TActionToolBar
                  Left = 1
                  Top = 116
                  Width = 962
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBar1'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
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
            object TabSheet2: TTabSheet
              Caption = 'Instru'#231#245'es'
              ImageIndex = 1
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 964
                Height = 307
                Align = alClient
                BevelOuter = bvLowered
                ParentBackground = False
                TabOrder = 0
                object JvDBUltimGrid2: TJvDBUltimGrid
                  Left = 1
                  Top = 27
                  Width = 962
                  Height = 279
                  Align = alClient
                  DataSource = DSInstrucoes
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ID'
                      Title.Caption = 'Id'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PCP_INSTRUCAO.CODIGO'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PCP_INSTRUCAO.DESCRICAO'
                      Title.Caption = 'Descri'#231#227'o'
                      Width = 634
                      Visible = True
                    end>
                end
                object ActionToolBarInstrucoes: TActionToolBar
                  Left = 1
                  Top = 1
                  Width = 962
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBar1'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
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
      end
    end
  end
  object DSItens: TDataSource
    DataSet = CDSItens
    Left = 112
    Top = 304
  end
  object CDSItens: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PCP_OP_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO.NOME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QUANTIDADE_PRODUZIR'
        DataType = ftFloat
      end
      item
        Name = 'QUANTIDADE_PRODUZIDA'
        DataType = ftFloat
      end
      item
        Name = 'QUANTIDADE_ENTREGUE'
        DataType = ftFloat
      end
      item
        Name = 'CUSTO_PREVISTO'
        DataType = ftFloat
      end
      item
        Name = 'CUSTO_REALIZADO'
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
    AfterEdit = ControlaPersistencia
    Left = 48
    Top = 304
    Data = {
      160100009619E0BD01000000180000000A000000000003000000160102494404
      000100000000001349445F5043505F4F505F4341424543414C484F0400010000
      0000000A49445F50524F4455544F04000100000000000C50524F4455544F2E4E
      4F4D450100490000000100055749445448020002001400135155414E54494441
      44455F50524F44555A49520800040000000000145155414E5449444144455F50
      524F44555A4944410800040000000000135155414E5449444144455F454E5452
      4547554508000400000000000E435553544F5F505245564953544F0800040000
      0000000F435553544F5F5245414C495A41444F08000400000000000850455253
      4953544501004900000001000557494454480200020001000000}
    object CDSItensID: TIntegerField
      FieldName = 'ID'
    end
    object CDSItensID_PCP_OP_CABECALHO: TIntegerField
      FieldName = 'ID_PCP_OP_CABECALHO'
    end
    object CDSItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSItensPRODUTONOME: TStringField
      FieldName = 'PRODUTO.NOME'
    end
    object CDSItensQUANTIDADE_PRODUZIR: TFloatField
      FieldName = 'QUANTIDADE_PRODUZIR'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSItensQUANTIDADE_PRODUZIDA: TFloatField
      FieldName = 'QUANTIDADE_PRODUZIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSItensQUANTIDADE_ENTREGUE: TFloatField
      FieldName = 'QUANTIDADE_ENTREGUE'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSItensCUSTO_PREVISTO: TFloatField
      FieldName = 'CUSTO_PREVISTO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSItensCUSTO_REALIZADO: TFloatField
      FieldName = 'CUSTO_REALIZADO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSItensPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object CDSInstrucoes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PCP_OP_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PCP_INSTRUCAO'
        DataType = ftInteger
      end
      item
        Name = 'PCP_INSTRUCAO.CODIGO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PCP_INSTRUCAO.DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 184
    Top = 304
    Data = {
      CC0000009619E0BD010000001800000006000000000003000000CC0002494404
      000100000000001349445F5043505F4F505F4341424543414C484F0400010000
      0000001049445F5043505F494E5354525543414F040001000000000014504350
      5F494E5354525543414F2E434F4449474F010049000000010005574944544802
      0002001400175043505F494E5354525543414F2E44455343524943414F010049
      0000000100055749445448020002006400085045525349535445010049000000
      01000557494454480200020001000000}
    object CDSInstrucoesID: TIntegerField
      FieldName = 'ID'
    end
    object CDSInstrucoesID_PCP_OP_CABECALHO: TIntegerField
      FieldName = 'ID_PCP_OP_CABECALHO'
    end
    object CDSInstrucoesID_PCP_INSTRUCAO: TIntegerField
      FieldName = 'ID_PCP_INSTRUCAO'
    end
    object CDSInstrucoesPCP_INSTRUCAOCODIGO: TStringField
      FieldName = 'PCP_INSTRUCAO.CODIGO'
    end
    object CDSInstrucoesPCP_INSTRUCAODESCRICAO: TStringField
      FieldName = 'PCP_INSTRUCAO.DESCRICAO'
      Size = 100
    end
    object CDSInstrucoesPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSInstrucoes: TDataSource
    DataSet = CDSInstrucoes
    Left = 256
    Top = 304
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionRemoverItem
            Caption = '&Remover Item'
          end
          item
            Action = ActionAdicionarItem
            Caption = '&Adicionar Item'
          end>
      end
      item
        Items = <
          item
            Action = ActionRemoverInstrucao
            Caption = '&Remover Instru'#231#227'o'
          end
          item
            Action = ActionAdicionarItem
            Caption = 'A&dicionar Item'
          end
          item
            Action = ActionRemoverItem
            Caption = 'R&emover Item'
          end
          item
            Action = ActionInstrucao
            Caption = '&Adicionar Instru'#231#227'o'
          end>
      end
      item
        Items = <
          item
            Action = ActionRemoverInstrucao
            Caption = '&Remover Instru'#231#227'o'
            ImageIndex = 10
          end
          item
            Action = ActionInstrucao
            Caption = '&Adicionar Instru'#231#227'o'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarInstrucoes
      end
      item
        Items = <
          item
            Action = ActionRemoverItem
            Caption = '&Remover Item'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarItem
            Caption = '&Adicionar Item'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarItens
      end
      item
        Items = <
          item
            Action = ActionRemoverServico
            Caption = '&Remover Servi'#231'o'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarServico
            Caption = 'Ad&icionar Servi'#231'o'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarServicos
      end
      item
        Items = <
          item
            Action = ActionRemoverEquipamento
            Caption = '&Remover Equipamento'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarEquipamento
            Caption = '&Adicionar Equipamento'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarEquipamentos
      end
      item
        Items = <
          item
            Action = ActionRemoverColaborador
            Caption = '&Remover Colaborador'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarColaborador
            Caption = '&Adicionar Colaborador'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarColaboradores
      end>
    Images = FDataModule.ImagensCadastros
    Left = 456
    Top = 304
    StyleName = 'Platform Default'
    object ActionAdicionarItem: TAction
      Category = 'Itens'
      Caption = 'Adicionar Item'
      ImageIndex = 31
      OnExecute = ActionAdicionarItemExecute
    end
    object ActionRemoverItem: TAction
      Category = 'Itens'
      Caption = 'Remover Item'
      ImageIndex = 10
      OnExecute = ActionRemoverItemExecute
    end
    object ActionRemoverServico: TAction
      Category = 'Servicos'
      Caption = 'Remover Servi'#231'o'
      ImageIndex = 10
      OnExecute = ActionRemoverServicoExecute
    end
    object ActionInstrucao: TAction
      Category = 'Instrucoes'
      Caption = 'Adicionar Instru'#231#227'o'
      ImageIndex = 31
      OnExecute = ActionInstrucaoExecute
    end
    object ActionRemoverInstrucao: TAction
      Category = 'Instrucoes'
      Caption = 'Remover Instru'#231#227'o'
      ImageIndex = 10
      OnExecute = ActionRemoverInstrucaoExecute
    end
    object ActionAdicionarColaborador: TAction
      Category = 'Servicos'
      Caption = 'Adicionar Colaborador'
      ImageIndex = 31
      OnExecute = ActionAdicionarColaboradorExecute
    end
    object ActionAdicionarEquipamento: TAction
      Category = 'Servicos'
      Caption = 'Adicionar Equipamento'
      ImageIndex = 31
      OnExecute = ActionAdicionarEquipamentoExecute
    end
    object ActionRemoverColaborador: TAction
      Category = 'Servicos'
      Caption = 'Remover Colaborador'
      ImageIndex = 10
      OnExecute = ActionRemoverColaboradorExecute
    end
    object ActionRemoverEquipamento: TAction
      Category = 'Servicos'
      Caption = 'Remover Equipamento'
      ImageIndex = 10
      OnExecute = ActionRemoverEquipamentoExecute
    end
    object ActionAdicionarServico: TAction
      Category = 'Servicos'
      Caption = 'Adicionar Servi'#231'o'
      ImageIndex = 31
      OnExecute = ActionAdicionarServicoExecute
    end
  end
  object CDSServicos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PCP_OP_DETALHE'
        DataType = ftInteger
      end
      item
        Name = 'INICIO_PREVISTO'
        DataType = ftDateTime
      end
      item
        Name = 'HORAS_PREVISTO'
        DataType = ftInteger
      end
      item
        Name = 'MINUTOS_PREVISTO'
        DataType = ftInteger
      end
      item
        Name = 'SEGUNDOS_PREVISTO'
        DataType = ftInteger
      end
      item
        Name = 'TERMINO_PREVISTO'
        DataType = ftDateTime
      end
      item
        Name = 'INICIO_REALIZADO'
        DataType = ftDateTime
      end
      item
        Name = 'HORAS_REALIZADO'
        DataType = ftInteger
      end
      item
        Name = 'MINUTOS_REALIZADO'
        DataType = ftInteger
      end
      item
        Name = 'SEGUNDOS_REALIZADO'
        DataType = ftInteger
      end
      item
        Name = 'TERMINO_REALIZADO'
        DataType = ftDateTime
      end
      item
        Name = 'CUSTOS_PREVISTO'
        DataType = ftFloat
      end
      item
        Name = 'CUSTO_REALIZADO'
        DataType = ftFloat
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 320
    Top = 304
    Data = {
      870100009619E0BD01000000180000000F000000000003000000870102494404
      000100000000001149445F5043505F4F505F444554414C484504000100000000
      000F494E4943494F5F505245564953544F08000800000000000E484F5241535F
      505245564953544F0400010000000000104D494E55544F535F50524556495354
      4F040001000000000011534547554E444F535F505245564953544F0400010000
      000000105445524D494E4F5F505245564953544F080008000000000010494E49
      43494F5F5245414C495A41444F08000800000000000F484F5241535F5245414C
      495A41444F0400010000000000114D494E55544F535F5245414C495A41444F04
      0001000000000012534547554E444F535F5245414C495A41444F040001000000
      0000115445524D494E4F5F5245414C495A41444F08000800000000000F435553
      544F535F505245564953544F08000400000000000F435553544F5F5245414C49
      5A41444F08000400000000000850455253495354450100490000000100055749
      4454480200020001000000}
    object CDSServicosID: TIntegerField
      FieldName = 'ID'
    end
    object CDSServicosID_PCP_OP_DETALHE: TIntegerField
      FieldName = 'ID_PCP_OP_DETALHE'
    end
    object CDSServicosINICIO_PREVISTO: TDateTimeField
      FieldName = 'INICIO_PREVISTO'
    end
    object CDSServicosHORAS_PREVISTO: TIntegerField
      FieldName = 'HORAS_PREVISTO'
    end
    object CDSServicosMINUTOS_PREVISTO: TIntegerField
      FieldName = 'MINUTOS_PREVISTO'
    end
    object CDSServicosSEGUNDOS_PREVISTO: TIntegerField
      FieldName = 'SEGUNDOS_PREVISTO'
    end
    object CDSServicosTERMINO_PREVISTO: TDateTimeField
      FieldName = 'TERMINO_PREVISTO'
    end
    object CDSServicosINICIO_REALIZADO: TDateTimeField
      FieldName = 'INICIO_REALIZADO'
    end
    object CDSServicosHORAS_REALIZADO: TIntegerField
      FieldName = 'HORAS_REALIZADO'
    end
    object CDSServicosMINUTOS_REALIZADO: TIntegerField
      FieldName = 'MINUTOS_REALIZADO'
    end
    object CDSServicosSEGUNDOS_REALIZADO: TIntegerField
      FieldName = 'SEGUNDOS_REALIZADO'
    end
    object CDSServicosTERMINO_REALIZADO: TDateTimeField
      FieldName = 'TERMINO_REALIZADO'
    end
    object CDSServicosCUSTOS_PREVISTO: TFloatField
      FieldName = 'CUSTOS_PREVISTO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSServicosCUSTO_REALIZADO: TFloatField
      FieldName = 'CUSTO_REALIZADO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSServicosPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSServicos: TDataSource
    DataSet = CDSServicos
    Left = 384
    Top = 304
  end
  object DSColaboradores: TDataSource
    DataSet = CDSColaboradores
    Left = 634
    Top = 303
  end
  object CDSColaboradores: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PCP_SERVICO'
        DataType = ftInteger
      end
      item
        Name = 'ID_COLABORADOR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 544
    Top = 303
    Data = {
      530000009619E0BD010000001800000003000000000003000000530002494404
      000100000000000E49445F5043505F5345525649434F04000100000000000E49
      445F434F4C41424F5241444F5204000100000000000000}
    object CDSColaboradoresID: TIntegerField
      FieldName = 'ID'
      DisplayFormat = '000000'
    end
    object CDSColaboradoresID_PCP_SERVICO: TIntegerField
      FieldName = 'ID_PCP_SERVICO'
      DisplayFormat = '000000'
    end
    object CDSColaboradoresID_COLABORADOR: TIntegerField
      FieldName = 'ID_COLABORADOR'
      DisplayFormat = '000000'
    end
  end
  object CDSEquipamentos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PATRIM_BEM'
        DataType = ftInteger
      end
      item
        Name = 'ID_PCP_SERVICO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 720
    Top = 303
    Data = {
      520000009619E0BD010000001800000003000000000003000000520002494404
      000100000000000D49445F50415452494D5F42454D04000100000000000E4944
      5F5043505F5345525649434F04000100000000000000}
    object CDSEquipamentosID: TIntegerField
      FieldName = 'ID'
    end
    object CDSEquipamentosID_PATRIM_BEM: TIntegerField
      FieldName = 'ID_PATRIM_BEM'
    end
    object CDSEquipamentosID_PCP_SERVICO: TIntegerField
      FieldName = 'ID_PCP_SERVICO'
    end
  end
  object DSEquipamentos: TDataSource
    DataSet = CDSEquipamentos
    Left = 794
    Top = 303
  end
end
