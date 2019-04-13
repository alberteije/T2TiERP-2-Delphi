inherited FPontoAbono: TFPontoAbono
  Left = 311
  Top = 174
  Caption = 'Ponto Abono'
  ClientHeight = 469
  ClientWidth = 988
  ExplicitLeft = 311
  ExplicitTop = 174
  ExplicitWidth = 996
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    Height = 438
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 438
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      inherited PanelGrid: TPanel
        Width = 980
        Height = 410
        ExplicitWidth = 980
        ExplicitHeight = 410
        inherited Grid: TJvDBUltimGrid
          Width = 980
          Height = 358
        end
        inherited PanelFiltroRapido: TPanel
          Top = 358
          Width = 980
          ExplicitTop = 358
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            Left = 848
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
      ExplicitWidth = 980
      inherited PanelEdits: TPanel
        Width = 980
        Height = 410
        ExplicitWidth = 980
        ExplicitHeight = 410
        object PanelMestre: TPanel
          Left = 14
          Top = 12
          Width = 954
          Height = 153
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            153)
          object EditIdColaborador: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdColaboradorExit
            OnKeyDown = EditIdColaboradorKeyDown
            OnKeyPress = EditIdColaboradorKeyPress
            CalcEditLabel.Width = 86
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Colaborador [F1]:'
          end
          object EditColaborador: TLabeledEdit
            Left = 70
            Top = 24
            Width = 873
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
          object EditInicioUtilizacao: TLabeledDateEdit
            Left = 517
            Top = 65
            Width = 121
            Height = 21
            TabOrder = 6
            DateEditLabel.Width = 77
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'In'#237'cio Utiliza'#231#227'o:'
          end
          object EditQuantidade: TLabeledCalcEdit
            Left = 9
            Top = 65
            Width = 121
            Height = 21
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 60
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Quantidade:'
          end
          object EditDataCadastro: TLabeledDateEdit
            Left = 390
            Top = 65
            Width = 121
            Height = 21
            TabOrder = 5
            DateEditLabel.Width = 74
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Cadastro:'
          end
          object EditUtilizado: TLabeledCalcEdit
            Left = 136
            Top = 65
            Width = 121
            Height = 21
            ShowButton = False
            TabOrder = 3
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 44
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Utilizado:'
          end
          object EditSaldo: TLabeledCalcEdit
            Left = 263
            Top = 65
            Width = 121
            Height = 21
            ShowButton = False
            TabOrder = 4
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 30
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Saldo:'
          end
          object MemoObservacao: TLabeledMemo
            Left = 9
            Top = 109
            Width = 934
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
        end
        object PageControlItens: TPageControl
          Left = 14
          Top = 177
          Width = 954
          Height = 222
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object tsItens: TTabSheet
            Caption = 'Utiliza'#231#227'o'
            object PanelItens: TPanel
              Left = 0
              Top = 0
              Width = 946
              Height = 194
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridParcelas: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 946
                Height = 194
                Align = alClient
                DataSource = DSPontoAbonoUtilizacao
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
                    FieldName = 'DATA_UTILIZACAO'
                    Title.Caption = 'Data Utiliza'#231#227'o'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBSERVACAO'
                    Title.Caption = 'Observa'#231#227'o'
                    Width = 800
                    Visible = True
                  end>
              end
            end
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
  object DSPontoAbonoUtilizacao: TDataSource
    DataSet = CDSPontoAbonoUtilizacao
    Left = 72
    Top = 320
  end
  object CDSPontoAbonoUtilizacao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PONTO_ABONO'
        DataType = ftInteger
      end
      item
        Name = 'DATA_UTILIZACAO'
        DataType = ftDate
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 300
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 368
    Data = {
      730000009619E0BD010000001800000004000000000003000000730002494404
      000100000000000E49445F504F4E544F5F41424F4E4F04000100000000000F44
      4154415F5554494C495A4143414F04000600000000000A4F4253455256414341
      4F0200490000000100055749445448020002002C010000}
    object CDSPontoAbonoUtilizacaoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoAbonoUtilizacaoID_PONTO_ABONO: TIntegerField
      FieldName = 'ID_PONTO_ABONO'
    end
    object CDSPontoAbonoUtilizacaoDATA_UTILIZACAO: TDateField
      FieldName = 'DATA_UTILIZACAO'
    end
    object CDSPontoAbonoUtilizacaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 300
    end
  end
end
