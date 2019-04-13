inherited FFolhaLancamento: TFFolhaLancamento
  Left = 318
  Top = 203
  Caption = 'Folha Lan'#231'amento'
  ClientWidth = 988
  ExplicitLeft = 318
  ExplicitTop = 203
  ExplicitWidth = 996
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
      ExplicitWidth = 980
      inherited PanelEdits: TPanel
        Width = 980
        ExplicitWidth = 980
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            101)
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
          object EditCompetencia: TLabeledMaskEdit
            Left = 9
            Top = 65
            Width = 86
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Compet'#234'ncia:'
            MaxLength = 7
            TabOrder = 2
            Text = '  //////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object ComboBoxTipo: TLabeledComboBox
            Left = 101
            Top = 65
            Width = 132
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 3
            Text = '1 - Folha Mensal'
            Items.Strings = (
              '1 - Folha Mensal'
              '2 - Rescis'#227'o')
            ComboBoxLabel.Width = 24
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo:'
          end
        end
        object PageControlItens: TPageControl
          Left = 10
          Top = 128
          Width = 954
          Height = 252
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object tsItens: TTabSheet
            Caption = 'Detalhe'
            object PanelItens: TPanel
              Left = 0
              Top = 0
              Width = 946
              Height = 224
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridDetalhe: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 946
                Height = 224
                Align = alClient
                DataSource = DSFolhaLancamentoDetalhe
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = GridDetalheKeyDown
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
                    FieldName = 'ID_FOLHA_EVENTO'
                    Title.Caption = 'ID Evento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FOLHA_EVENTO.NOME'
                    Title.Caption = 'Evento'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORIGEM'
                    Title.Caption = 'Origem'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PROVENTO'
                    Title.Caption = 'Provento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCONTO'
                    Title.Caption = 'Desconto'
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
  object DSFolhaLancamentoDetalhe: TDataSource
    DataSet = CDSFolhaLancamentoDetalhe
    Left = 72
    Top = 320
  end
  object CDSFolhaLancamentoDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FOLHA_EVENTO'
        DataType = ftInteger
      end
      item
        Name = 'ID_FOLHA_LANCAMENTO_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'ORIGEM'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'PROVENTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'DESCONTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FOLHA_EVENTO.NOME'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSFolhaLancamentoDetalheAfterEdit
    Left = 72
    Top = 368
    Data = {
      280100009619E0BD020000001800000008000000000003000000280102494404
      000100000000000F49445F464F4C48415F4556454E544F04000100000000001D
      49445F464F4C48415F4C414E43414D454E544F5F4341424543414C484F040001
      0000000000064F524947454D0B0012000000020008444543494D414C53020002
      0006000557494454480200020012000850524F56454E544F0B00120000000200
      08444543494D414C530200020006000557494454480200020012000844455343
      4F4E544F0B0012000000020008444543494D414C530200020006000557494454
      4802000200120008504552534953544501004900000001000557494454480200
      0200010011464F4C48415F4556454E544F2E4E4F4D4501004900000001000557
      494454480200020064000000}
    object CDSFolhaLancamentoDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSFolhaLancamentoDetalheID_FOLHA_EVENTO: TIntegerField
      FieldName = 'ID_FOLHA_EVENTO'
    end
    object CDSFolhaLancamentoDetalheID_FOLHA_LANCAMENTO_CABECALHO: TIntegerField
      FieldName = 'ID_FOLHA_LANCAMENTO_CABECALHO'
    end
    object CDSFolhaLancamentoDetalheORIGEM: TFMTBCDField
      FieldName = 'ORIGEM'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSFolhaLancamentoDetalhePROVENTO: TFMTBCDField
      FieldName = 'PROVENTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSFolhaLancamentoDetalheDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSFolhaLancamentoDetalhePERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSFolhaLancamentoDetalheFOLHA_EVENTONOME: TStringField
      FieldName = 'FOLHA_EVENTO.NOME'
      Size = 100
    end
  end
end
