inherited FContabilEncerramentoExercicio: TFContabilEncerramentoExercicio
  Left = 318
  Top = 203
  Caption = 'Encerramento do Exerc'#237'cio'
  ClientWidth = 988
  ExplicitLeft = 318
  ExplicitTop = 203
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
          object EditDataInicio: TLabeledDateEdit
            Left = 9
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 1
            DateEditLabel.Width = 55
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data In'#237'cio:'
          end
          object EditDataInclusao: TLabeledDateEdit
            Left = 263
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 3
            DateEditLabel.Width = 70
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Inclus'#227'o:'
          end
          object EditMotivo: TLabeledEdit
            Left = 9
            Top = 24
            Width = 934
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 36
            EditLabel.Height = 13
            EditLabel.Caption = 'Motivo:'
            TabOrder = 0
          end
          object EditDataFim: TLabeledDateEdit
            Left = 136
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 2
            DateEditLabel.Width = 46
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Fim:'
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
                DataSource = DSContabilEncerramentoExercicioDetalhe
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
                    FieldName = 'ID_CONTABIL_CONTA'
                    Title.Caption = 'Id Conta'
                    Visible = True
                  end
                  item
                    Expanded = False
                    Title.Caption = 'Classifica'#231#227'o'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDO_ANTERIOR'
                    Title.Caption = 'Saldo Anterior'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_DEBITO'
                    Title.Caption = 'Valor D'#233'bito'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_CREDITO'
                    Title.Caption = 'Valor Cr'#233'dito'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDO'
                    Title.Caption = 'Saldo'
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
  object DSContabilEncerramentoExercicioDetalhe: TDataSource
    DataSet = CDSContabilEncerramentoExercicioDetalhe
    Left = 160
    Top = 304
  end
  object CDSContabilEncerramentoExercicioDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_ENCERRAMENTO_EXE'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_DEBITO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_CREDITO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'SALDO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 360
    Data = {
      200100009619E0BD020000001800000007000000000003000000200102494404
      000100000000001149445F434F4E544142494C5F434F4E544104000100000000
      001C49445F434F4E544142494C5F454E43455252414D454E544F5F4558450400
      0100000000000E53414C444F5F414E544552494F520B00120000000200084445
      43494D414C530200020006000557494454480200020012000C56414C4F525F44
      454249544F0B0012000000020008444543494D414C5302000200060005574944
      54480200020012000D56414C4F525F4352454449544F0B001200000002000844
      4543494D414C530200020006000557494454480200020012000553414C444F0B
      0012000000020008444543494D414C5302000200060005574944544802000200
      12000000}
    object CDSContabilEncerramentoExercicioDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSContabilEncerramentoExercicioDetalheID_CONTABIL_CONTA: TIntegerField
      FieldName = 'ID_CONTABIL_CONTA'
    end
    object CDSContabilEncerramentoExercicioDetalheID_CONTABIL_ENCERRAMENTO_EXE: TIntegerField
      FieldName = 'ID_CONTABIL_ENCERRAMENTO_EXE'
    end
    object CDSContabilEncerramentoExercicioDetalheSALDO_ANTERIOR: TFMTBCDField
      FieldName = 'SALDO_ANTERIOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSContabilEncerramentoExercicioDetalheVALOR_DEBITO: TFMTBCDField
      FieldName = 'VALOR_DEBITO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSContabilEncerramentoExercicioDetalheVALOR_CREDITO: TFMTBCDField
      FieldName = 'VALOR_CREDITO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSContabilEncerramentoExercicioDetalheSALDO: TFMTBCDField
      FieldName = 'SALDO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
end
