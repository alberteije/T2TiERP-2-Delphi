inherited FFolhaInss: TFFolhaInss
  Left = 318
  Top = 203
  Caption = 'Folha INSS'
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
          Height = 54
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          object EditCompetencia: TLabeledMaskEdit
            Left = 9
            Top = 21
            Width = 86
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Compet'#234'ncia:'
            MaxLength = 7
            TabOrder = 0
            Text = '  ///////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
        end
        object PageControlItens: TPageControl
          Left = 10
          Top = 80
          Width = 954
          Height = 300
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object tsItens: TTabSheet
            Caption = 'Reten'#231#245'es'
            object PanelItens: TPanel
              Left = 0
              Top = 0
              Width = 946
              Height = 272
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridDetalhe: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 946
                Height = 272
                Align = alClient
                DataSource = DSFolhaInssRetencao
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
                    FieldName = 'ID_FOLHA_INSS_SERVICO'
                    Title.Caption = 'Id Servi'#231'o'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_MENSAL'
                    Title.Caption = 'Valor Mensal'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_13'
                    Title.Caption = 'Valor 13'#186
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
  object DSFolhaInssRetencao: TDataSource
    DataSet = CDSFolhaInssRetencao
    Left = 72
    Top = 320
  end
  object CDSFolhaInssRetencao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FOLHA_INSS'
        DataType = ftInteger
      end
      item
        Name = 'ID_FOLHA_INSS_SERVICO'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_MENSAL'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_13'
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
      B50000009619E0BD020000001800000005000000000003000000B50002494404
      000100000000000D49445F464F4C48415F494E53530400010000000000154944
      5F464F4C48415F494E53535F5345525649434F04000100000000000C56414C4F
      525F4D454E53414C0B0012000000020008444543494D414C5302000200060005
      57494454480200020012000856414C4F525F31330B0012000000020008444543
      494D414C530200020006000557494454480200020012000000}
    object CDSFolhaInssRetencaoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSFolhaInssRetencaoID_FOLHA_INSS: TIntegerField
      FieldName = 'ID_FOLHA_INSS'
    end
    object CDSFolhaInssRetencaoID_FOLHA_INSS_SERVICO: TIntegerField
      FieldName = 'ID_FOLHA_INSS_SERVICO'
    end
    object CDSFolhaInssRetencaoVALOR_MENSAL: TFMTBCDField
      FieldName = 'VALOR_MENSAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSFolhaInssRetencaoVALOR_13: TFMTBCDField
      FieldName = 'VALOR_13'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
end
