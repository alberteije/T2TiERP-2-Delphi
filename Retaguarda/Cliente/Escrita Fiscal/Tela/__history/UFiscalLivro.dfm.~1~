inherited FFiscalLivro: TFFiscalLivro
  Left = 318
  Top = 204
  Caption = 'Livros Fiscais'
  ClientWidth = 988
  ExplicitLeft = 318
  ExplicitTop = 204
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
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            53)
          object EditDescricao: TLabeledEdit
            Left = 9
            Top = 23
            Width = 936
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 50
            EditLabel.Height = 13
            EditLabel.Caption = 'Descri'#231#227'o:'
            TabOrder = 0
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
            Caption = 'Termos de Abertura e Encerramento'
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
                DataSource = DSFiscalTermo
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
                    FieldName = 'ABERTURA_ENCERRAMENTO'
                    Title.Caption = 'Tipo (A|E)'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Caption = 'N'#250'mero'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGINA_INICIAL'
                    Title.Caption = 'P'#225'gina Inicial'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGINA_FINAL'
                    Title.Caption = 'P'#225'gina Final'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'REGISTRADO'
                    Title.Caption = 'Registrado'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO_REGISTRO'
                    Title.Caption = 'N'#250'mero Registro'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_DESPACHO'
                    Title.Caption = 'Data Despacho'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_ABERTURA'
                    Title.Caption = 'Data Abertura'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_ENCERRAMENTO'
                    Title.Caption = 'Data Encerramento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESCRITURACAO_INICIO'
                    Title.Caption = 'In'#237'cio Escritura'#231#227'o'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESCRITURACAO_FIM'
                    Title.Caption = 'Fim Escritura'#231#227'o'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TEXTO'
                    Title.Caption = 'Texto'
                    Width = 300
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
  object DSFiscalTermo: TDataSource
    DataSet = CDSFiscalTermo
    Left = 72
    Top = 320
  end
  object CDSFiscalTermo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FISCAL_LIVRO'
        DataType = ftInteger
      end
      item
        Name = 'ABERTURA_ENCERRAMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMERO'
        DataType = ftInteger
      end
      item
        Name = 'PAGINA_INICIAL'
        DataType = ftInteger
      end
      item
        Name = 'PAGINA_FINAL'
        DataType = ftInteger
      end
      item
        Name = 'REGISTRADO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NUMERO_REGISTRO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATA_DESPACHO'
        DataType = ftDate
      end
      item
        Name = 'DATA_ABERTURA'
        DataType = ftDate
      end
      item
        Name = 'DATA_ENCERRAMENTO'
        DataType = ftDate
      end
      item
        Name = 'ESCRITURACAO_INICIO'
        DataType = ftDate
      end
      item
        Name = 'ESCRITURACAO_FIM'
        DataType = ftDate
      end
      item
        Name = 'TEXTO'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 368
    Data = {
      7A0100009619E0BD01000000180000000E0000000000030000007A0102494404
      000100000000000F49445F46495343414C5F4C4956524F040001000000000015
      41424552545552415F454E43455252414D454E544F0100490000000100055749
      445448020002000100064E554D45524F04000100000000000E504147494E415F
      494E494349414C04000100000000000C504147494E415F46494E414C04000100
      000000000A5245474953545241444F0100490000000100055749445448020002
      0064000F4E554D45524F5F524547495354524F01004900000001000557494454
      480200020032000D444154415F444553504143484F04000600000000000D4441
      54415F4142455254555241040006000000000011444154415F454E4345525241
      4D454E544F04000600000000001345534352495455524143414F5F494E494349
      4F04000600000000001045534352495455524143414F5F46494D040006000000
      000005544558544F020049000000010005574944544802000200F4010000}
    object CDSFiscalTermoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSFiscalTermoID_FISCAL_LIVRO: TIntegerField
      FieldName = 'ID_FISCAL_LIVRO'
    end
    object CDSFiscalTermoABERTURA_ENCERRAMENTO: TStringField
      FieldName = 'ABERTURA_ENCERRAMENTO'
      Size = 1
    end
    object CDSFiscalTermoNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object CDSFiscalTermoPAGINA_INICIAL: TIntegerField
      FieldName = 'PAGINA_INICIAL'
    end
    object CDSFiscalTermoPAGINA_FINAL: TIntegerField
      FieldName = 'PAGINA_FINAL'
    end
    object CDSFiscalTermoREGISTRADO: TStringField
      FieldName = 'REGISTRADO'
      Size = 100
    end
    object CDSFiscalTermoNUMERO_REGISTRO: TStringField
      FieldName = 'NUMERO_REGISTRO'
      Size = 50
    end
    object CDSFiscalTermoDATA_DESPACHO: TDateField
      FieldName = 'DATA_DESPACHO'
    end
    object CDSFiscalTermoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object CDSFiscalTermoDATA_ENCERRAMENTO: TDateField
      FieldName = 'DATA_ENCERRAMENTO'
    end
    object CDSFiscalTermoESCRITURACAO_INICIO: TDateField
      FieldName = 'ESCRITURACAO_INICIO'
    end
    object CDSFiscalTermoESCRITURACAO_FIM: TDateField
      FieldName = 'ESCRITURACAO_FIM'
    end
    object CDSFiscalTermoTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 500
    end
  end
end
