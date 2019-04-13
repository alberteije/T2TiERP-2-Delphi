inherited FPontoBancoHoras: TFPontoBancoHoras
  Tag = 1
  Left = 313
  Top = 176
  Caption = 'Ponto Banco de Horas'
  ClientWidth = 988
  ExplicitLeft = 313
  ExplicitTop = 176
  ExplicitWidth = 996
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 935
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
            Left = 847
            ExplicitLeft = 847
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 683
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 991
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 980
        ExplicitWidth = 980
        object BevelEdits: TBevel
          Left = 14
          Top = 12
          Width = 954
          Height = 100
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 22
          Top = 35
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Colaborador [F1]:'
        end
        object EditColaborador: TLabeledEdit
          Left = 83
          Top = 35
          Width = 876
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
        object EditDataTrabalho: TLabeledDateEdit
          Left = 22
          Top = 79
          Width = 121
          Height = 21
          TabOrder = 2
          DateEditLabel.Width = 72
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Trabalho:'
        end
        object EditQuantidade: TLabeledMaskEdit
          Left = 149
          Top = 79
          Width = 72
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = 'Quantidade:'
          MaxLength = 8
          TabOrder = 3
          Text = '  :::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object ComboboxSituacao: TLabeledComboBox
          Left = 227
          Top = 79
          Width = 170
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = 'N - N'#227'o Utilizado'
          Items.Strings = (
            'N - N'#227'o Utilizado'
            'U - Utilizado'
            'P - Utilizado Parcialmente')
          ComboBoxLabel.Width = 24
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Tipo:'
        end
        object PageControlItens: TPageControl
          Left = 14
          Top = 123
          Width = 954
          Height = 272
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 5
          ExplicitHeight = 220
          object tsItens: TTabSheet
            Caption = 'Utiliza'#231#227'o'
            object PanelItens: TPanel
              Left = 0
              Top = 0
              Width = 946
              Height = 244
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridParcelas: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 946
                Height = 244
                Align = alClient
                DataSource = DSPontoBancoHorasUtilizacao
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
                    FieldName = 'QUANTIDADE_UTILIZADA'
                    Title.Caption = 'Qtde Utilizada'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBSERVACAO'
                    Title.Caption = 'Observa'#231#227'o'
                    Width = 750
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
      ExplicitLeft = 884
    end
    inherited BotaoExportar: TSpeedButton
      Left = 784
      ExplicitLeft = 784
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 684
      ExplicitLeft = 684
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 574
      ExplicitLeft = 574
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 584
      ExplicitLeft = 584
    end
  end
  object DSPontoBancoHorasUtilizacao: TDataSource
    DataSet = CDSPontoBancoHorasUtilizacao
    Left = 72
    Top = 288
  end
  object CDSPontoBancoHorasUtilizacao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PONTO_BANCO_HORAS'
        DataType = ftInteger
      end
      item
        Name = 'DATA_UTILIZACAO'
        DataType = ftDate
      end
      item
        Name = 'QUANTIDADE_UTILIZADA'
        DataType = ftString
        Size = 8
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
    Top = 336
    Data = {
      A20000009619E0BD010000001800000005000000000003000000A20002494404
      000100000000001449445F504F4E544F5F42414E434F5F484F52415304000100
      000000000F444154415F5554494C495A4143414F040006000000000014515541
      4E5449444144455F5554494C495A414441010049000000010005574944544802
      00020008000A4F42534552564143414F02004900000001000557494454480200
      02002C010000}
    object CDSPontoBancoHorasUtilizacaoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoBancoHorasUtilizacaoID_PONTO_BANCO_HORAS: TIntegerField
      FieldName = 'ID_PONTO_BANCO_HORAS'
    end
    object CDSPontoBancoHorasUtilizacaoDATA_UTILIZACAO: TDateField
      FieldName = 'DATA_UTILIZACAO'
    end
    object CDSPontoBancoHorasUtilizacaoQUANTIDADE_UTILIZADA: TStringField
      FieldName = 'QUANTIDADE_UTILIZADA'
      Size = 8
    end
    object CDSPontoBancoHorasUtilizacaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 300
    end
  end
end
