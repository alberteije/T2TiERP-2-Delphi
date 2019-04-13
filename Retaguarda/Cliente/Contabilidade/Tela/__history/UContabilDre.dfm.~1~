inherited FContabilDre: TFContabilDre
  Left = 318
  Top = 203
  Caption = 'DRE'
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
          object ComboBoxPadrao: TLabeledComboBox
            Left = 9
            Top = 68
            Width = 74
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 38
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Padr'#227'o:'
          end
          object EditDescricao: TLabeledEdit
            Left = 9
            Top = 23
            Width = 934
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 50
            EditLabel.Height = 13
            EditLabel.Caption = 'Descri'#231#227'o:'
            TabOrder = 0
          end
          object EditPeriodoInicial: TLabeledMaskEdit
            Left = 89
            Top = 68
            Width = 72
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 70
            EditLabel.Height = 13
            EditLabel.Caption = 'Per'#237'odo Inicial:'
            MaxLength = 7
            TabOrder = 2
            Text = '  ////_'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object EditPeriodoFinal: TLabeledMaskEdit
            Left = 167
            Top = 68
            Width = 72
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = 'Per'#237'odo Final:'
            MaxLength = 7
            TabOrder = 3
            Text = '  /////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
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
                DataSource = DSContabilDreDetalhe
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
                    FieldName = 'CLASSIFICACAO'
                    Title.Caption = 'Classifica'#231#227'o'
                    Width = 130
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'Descri'#231#227'o'
                    Width = 400
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMA_CALCULO'
                    Title.Caption = 'Forma C'#225'lculo (S|V|R)'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SINAL'
                    Title.Caption = 'Sinal (+|-|=)'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NATUREZA'
                    Title.Caption = 'Natureza (C|D)'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Caption = 'Valor'
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
  object DSContabilDreDetalhe: TDataSource
    DataSet = CDSContabilDreDetalhe
    Left = 72
    Top = 320
  end
  object CDSContabilDreDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_DRE_CABECALHO'
        DataType = ftInteger
      end
      item
        Name = 'CLASSIFICACAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FORMA_CALCULO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SINAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NATUREZA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
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
      090100009619E0BD020000001800000008000000000003000000090102494404
      000100000000001949445F434F4E544142494C5F4452455F4341424543414C48
      4F04000100000000000D434C415353494649434143414F010049000000010005
      5749445448020002001E000944455343524943414F0100490000000100055749
      4454480200020064000D464F524D415F43414C43554C4F010049000000010005
      57494454480200020001000553494E414C010049000000010005574944544802
      0002000100084E41545552455A41010049000000010005574944544802000200
      01000556414C4F520B0012000000020008444543494D414C5302000200060005
      57494454480200020012000000}
    object CDSContabilDreDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSContabilDreDetalheID_CONTABIL_DRE_CABECALHO: TIntegerField
      FieldName = 'ID_CONTABIL_DRE_CABECALHO'
    end
    object CDSContabilDreDetalheCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Size = 30
    end
    object CDSContabilDreDetalheDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CDSContabilDreDetalheFORMA_CALCULO: TStringField
      FieldName = 'FORMA_CALCULO'
      Size = 1
    end
    object CDSContabilDreDetalheSINAL: TStringField
      FieldName = 'SINAL'
      Size = 1
    end
    object CDSContabilDreDetalheNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Size = 1
    end
    object CDSContabilDreDetalheVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
end
