inherited FWmsEndereco: TFWmsEndereco
  Caption = 'Endere'#231'os do WMS'
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
          DesignSize = (
            972
            395)
          object Bevel1: TBevel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 966
            Height = 54
            Align = alTop
          end
          object EditQuantidadeEstante: TLabeledCalcEdit
            Left = 839
            Top = 24
            Width = 121
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = ',0'
            Anchors = [akTop, akRight]
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 105
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Quantidade Estantes:'
          end
          object PageControl1: TPageControl
            Left = 0
            Top = 60
            Width = 972
            Height = 335
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 1
            object TabSheet1: TTabSheet
              Caption = 'Estantes e Caixas'
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 964
                Height = 307
                Align = alClient
                BevelOuter = bvLowered
                ParentBackground = False
                TabOrder = 0
                object Panel2: TPanel
                  Left = 1
                  Top = 1
                  Width = 962
                  Height = 150
                  Align = alTop
                  Caption = 'Panel2'
                  TabOrder = 0
                  object GridEstantes: TJvDBUltimGrid
                    Left = 1
                    Top = 27
                    Width = 960
                    Height = 122
                    Align = alClient
                    DataSource = DSEstantes
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
                  end
                  object ActionToolBarServicos: TActionToolBar
                    Left = 1
                    Top = 1
                    Width = 960
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
                object Panel3: TPanel
                  Left = 1
                  Top = 151
                  Width = 962
                  Height = 155
                  Align = alClient
                  Caption = 'Panel3'
                  TabOrder = 1
                  object ActionToolBarItens: TActionToolBar
                    Left = 1
                    Top = 1
                    Width = 960
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
                  object GridCaixas: TJvDBUltimGrid
                    Left = 1
                    Top = 27
                    Width = 960
                    Height = 127
                    Align = alClient
                    DataSource = DSCaixas
                    TabOrder = 1
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
                  end
                end
              end
            end
          end
          object EditCodigo: TLabeledEdit
            Left = 13
            Top = 24
            Width = 121
            Height = 21
            EditLabel.Width = 37
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo:'
            TabOrder = 2
          end
          object EditNome: TLabeledEdit
            Left = 140
            Top = 24
            Width = 693
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 31
            EditLabel.Height = 13
            EditLabel.Caption = 'Nome:'
            TabOrder = 3
          end
        end
      end
    end
  end
  object DSEstantes: TDataSource
    DataSet = CDSEstantes
    Left = 112
    Top = 304
  end
  object CDSEstantes: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 48
    Top = 304
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionRemoverEstante
            Caption = '&Remover Estante'
          end
          item
            Action = ActionAdicionarEstante
            Caption = '&Adicionar Estante'
          end>
      end
      item
        Items = <
          item
            Action = ActionRemoverCaixa
            Caption = '&Remover Caixa'
          end
          item
            Action = ActionAdicionarEstante
            Caption = '&Adicionar Estante'
          end
          item
            Action = ActionRemoverEstante
            Caption = 'R&emover Estante'
          end
          item
            Action = ActionAdicionarCaixa
            Caption = 'A&dicionar Caixa'
          end>
      end
      item
        Items = <
          item
            Action = ActionRemoverCaixa
            Caption = '&Remover Caixa'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarCaixa
            Caption = '&Adicionar Caixa'
            ImageIndex = 31
          end>
      end
      item
        Items = <
          item
            Action = ActionRemoverEstante
            Caption = '&Remover Estante'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarEstante
            Caption = '&Adicionar Estante'
            ImageIndex = 31
          end>
      end
      item
      end
      item
      end
      item
      end
      item
        Items = <
          item
            Action = ActionRemoverEstante
            Caption = '&Remover Estante'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarEstante
            Caption = '&Adicionar Estante'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarServicos
      end
      item
        Items = <
          item
            Action = ActionRemoverCaixa
            Caption = '&Remover Caixa'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarCaixa
            Caption = '&Adicionar Caixa'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBarItens
      end>
    Images = FDataModule.ImagensCadastros
    Left = 456
    Top = 304
    StyleName = 'Platform Default'
    object ActionAdicionarEstante: TAction
      Category = 'Estantes'
      Caption = 'Adicionar Estante'
      ImageIndex = 31
      OnExecute = ActionAdicionarEstanteExecute
    end
    object ActionRemoverEstante: TAction
      Category = 'Estantes'
      Caption = 'Remover Estante'
      ImageIndex = 10
      OnExecute = ActionRemoverEstanteExecute
    end
    object ActionAdicionarCaixa: TAction
      Category = 'Caixas'
      Caption = 'Adicionar Caixa'
      ImageIndex = 31
      OnExecute = ActionAdicionarCaixaExecute
    end
    object ActionRemoverCaixa: TAction
      Category = 'Caixas'
      Caption = 'Remover Caixa'
      ImageIndex = 10
      OnExecute = ActionRemoverCaixaExecute
    end
  end
  object CDSCaixas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
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
  end
  object DSCaixas: TDataSource
    DataSet = CDSCaixas
    Left = 384
    Top = 304
  end
end
