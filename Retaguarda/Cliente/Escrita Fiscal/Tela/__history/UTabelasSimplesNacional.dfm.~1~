inherited FTabelasSimplesNacional: TFTabelasSimplesNacional
  Left = 318
  Top = 203
  Caption = 'Tabelas Simples Nacional'
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
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            53)
          object ComboBoxAnexo: TLabeledComboBox
            Left = 263
            Top = 22
            Width = 210
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 2
            Text = 'Anexo I'
            Items.Strings = (
              'Anexo I'
              'Anexo II'
              'Anexo III'
              'Anexo IV'
              'Anexo V')
            ComboBoxLabel.Width = 35
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Anexo:'
          end
          object EditVigenciaInicial: TLabeledDateEdit
            Left = 9
            Top = 22
            Width = 121
            Height = 21
            TabOrder = 0
            DateEditLabel.Width = 73
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Vig'#234'ncia Inicial:'
          end
          object EditVigenciaFinal: TLabeledDateEdit
            Left = 136
            Top = 22
            Width = 121
            Height = 21
            TabOrder = 1
            DateEditLabel.Width = 68
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Vig'#234'ncia Final:'
          end
          object ComboboxTabela: TLabeledComboBox
            Left = 479
            Top = 22
            Width = 466
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 3
            Text = 'Tabela I'
            Items.Strings = (
              'Tabela I'
              'Tabela II'
              'Tabela III'
              'Tabela IV'
              'Tabela V-A'
              'Tabela V-B')
            ComboBoxLabel.Width = 36
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tabela:'
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
            Caption = 'Detalhe'
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
                DataSource = DSTabelasSimplesNacionalDetalhe
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
                    FieldName = 'FAIXA'
                    Title.Caption = 'Faixa'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_INICIAL'
                    Title.Caption = 'Valor Inicial'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_FINAL'
                    Title.Caption = 'Valor Final'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQUOTA'
                    Title.Caption = 'Al'#237'quota'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IRPJ'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CSLL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COFINS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PIS_PASEP'
                    Title.Caption = 'PIS/PASEP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CPP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ICMS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IPI'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ISS'
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
  object DSTabelasSimplesNacionalDetalhe: TDataSource
    DataSet = CDSTabelasSimplesNacionalDetalhe
    Left = 88
    Top = 320
  end
  object CDSTabelasSimplesNacionalDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_SIMPLES_NACIONAL_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'FAIXA'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_INICIAL'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR_FINAL'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'ALIQUOTA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'IRPJ'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'CSLL'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'COFINS'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'PIS_PASEP'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'CPP'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'ICMS'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'IPI'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'ISS'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 368
    Data = {
      290200009619E0BD02000000180000000E000000000003000000290202494404
      000100000000001D49445F53494D504C45535F4E4143494F4E414C5F43414245
      43414C484F040001000000000005464149584104000100000000000D56414C4F
      525F494E494349414C0B0012000000020008444543494D414C53020002000600
      0557494454480200020012000B56414C4F525F46494E414C0B00120000000200
      08444543494D414C5302000200060005574944544802000200120008414C4951
      554F54410B0012000000020008444543494D414C530200020006000557494454
      48020002001200044952504A0B0012000000020008444543494D414C53020002
      0006000557494454480200020012000443534C4C0B0012000000020008444543
      494D414C5302000200060005574944544802000200120006434F46494E530B00
      12000000020008444543494D414C530200020006000557494454480200020012
      00095049535F50415345500B0012000000020008444543494D414C5302000200
      0600055749445448020002001200034350500B0012000000020008444543494D
      414C530200020006000557494454480200020012000449434D530B0012000000
      020008444543494D414C53020002000600055749445448020002001200034950
      490B0012000000020008444543494D414C530200020006000557494454480200
      02001200034953530B0012000000020008444543494D414C5302000200060005
      57494454480200020012000000}
    object CDSTabelasSimplesNacionalDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSTabelasSimplesNacionalDetalheID_SIMPLES_NACIONAL_CABECALHO: TIntegerField
      FieldName = 'ID_SIMPLES_NACIONAL_CABECALHO'
    end
    object CDSTabelasSimplesNacionalDetalheFAIXA: TIntegerField
      FieldName = 'FAIXA'
    end
    object CDSTabelasSimplesNacionalDetalheVALOR_INICIAL: TFMTBCDField
      FieldName = 'VALOR_INICIAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheVALOR_FINAL: TFMTBCDField
      FieldName = 'VALOR_FINAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheIRPJ: TFMTBCDField
      FieldName = 'IRPJ'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheCSLL: TFMTBCDField
      FieldName = 'CSLL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheCOFINS: TFMTBCDField
      FieldName = 'COFINS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalhePIS_PASEP: TFMTBCDField
      FieldName = 'PIS_PASEP'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheCPP: TFMTBCDField
      FieldName = 'CPP'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheICMS: TFMTBCDField
      FieldName = 'ICMS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheIPI: TFMTBCDField
      FieldName = 'IPI'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSTabelasSimplesNacionalDetalheISS: TFMTBCDField
      FieldName = 'ISS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
end
