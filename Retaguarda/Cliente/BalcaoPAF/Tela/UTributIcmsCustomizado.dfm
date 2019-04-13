inherited FTributIcmsCustomizado: TFTributIcmsCustomizado
  Left = 318
  Top = 139
  Caption = 'ICMS Customizado'
  ClientHeight = 525
  ExplicitTop = -84
  ExplicitWidth = 1008
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 494
    ActivePage = PaginaEdits
    ExplicitHeight = 494
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 466
      inherited PanelGrid: TPanel
        Height = 466
        ExplicitHeight = 466
        inherited Grid: TJvDBUltimGrid
          Height = 414
        end
        inherited PanelFiltroRapido: TPanel
          Top = 414
          ExplicitTop = 414
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 683
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 466
      inherited PanelEdits: TPanel
        Height = 466
        ExplicitHeight = 466
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 976
          Height = 458
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            976
            458)
          object BevelEdits: TBevel
            Left = 7
            Top = 11
            Width = 959
            Height = 56
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object PageControlDadosTributIcmsCustomizado: TPageControl
            Left = 7
            Top = 80
            Width = 959
            Height = 368
            ActivePage = tsIcms
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            object tsIcms: TTabSheet
              Caption = 'ICMS'
              ImageIndex = 2
              object PanelIcms: TPanel
                Left = 0
                Top = 0
                Width = 951
                Height = 340
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridIcms: TJvDBUltimGrid
                  Left = 0
                  Top = 26
                  Width = 951
                  Height = 314
                  Align = alClient
                  DataSource = DSIcms
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = GridIcmsKeyDown
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'UF_DESTINO'
                      Title.Caption = 'UF Destino [F1]'
                      Width = 100
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CFOP'
                      Title.Caption = 'CFOP [F1]'
                      Width = 100
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CSOSN_B'
                      Title.Caption = 'CSOSN_B [F1]'
                      Width = 100
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CST_B'
                      Title.Caption = 'CST_B [F1]'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MODALIDADE_BC'
                      PickList.Strings = (
                        '0-Margem Valor Agregado'
                        '1-Valor Pauta'
                        '2-Valor Pre'#231'o M'#225'ximo'
                        '3-Valor da Opera'#231#227'o')
                      Title.Caption = 'Modalidade BC ICMS'
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
                      FieldName = 'VALOR_PAUTA'
                      Title.Caption = 'Valor Pauta'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_PRECO_MAXIMO'
                      Title.Caption = 'Valor Pre'#231'o M'#225'ximo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PORCENTO_BC'
                      Title.Caption = 'Percentual BC'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MVA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MODALIDADE_BC_ST'
                      PickList.Strings = (
                        '0-Valor Pre'#231'o M'#225'ximo '
                        '1-Valor Lista Negativa'
                        '2-Valor Lista Positiva'
                        '3-valor Lista Neutra'
                        '4-Margem Valor Agregado'
                        '5-Valor Pauta')
                      Title.Caption = 'Modalidade BC ST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQUOTA_ICMS_ST'
                      Title.Caption = 'Al'#237'quota ST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQUOTA_INTERNA_ST'
                      Title.Caption = 'Al'#237'quota Interna ST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQUOTA_INTERESTADUAL_ST'
                      Title.Caption = 'Al'#237'quota Interestadual ST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_PAUTA_ST'
                      Title.Caption = 'Valor Pauta ST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_PRECO_MAXIMO_ST'
                      Title.Caption = 'Valor Pre'#231'o M'#225'ximo ST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PORCENTO_BC_ST'
                      Title.Caption = 'Percentual BC ST'
                      Visible = True
                    end>
                end
                object ActionToolBar3: TActionToolBar
                  Left = 0
                  Top = 0
                  Width = 951
                  Height = 26
                  ActionManager = ActionManager1
                  Caption = 'ActionToolBar2'
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
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
          end
          object EditDescricao: TLabeledEdit
            Left = 16
            Top = 36
            Width = 760
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 50
            EditLabel.Height = 13
            EditLabel.Caption = 'Descri'#231#227'o:'
            TabOrder = 0
          end
          object ComboboxOrigemMercadoria: TLabeledComboBox
            Left = 782
            Top = 36
            Width = 177
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemIndex = 0
            TabOrder = 1
            Text = '0 = Nacional'
            Items.Strings = (
              '0 = Nacional'
              '1 = Estrangeira - Importa'#231#227'o direta'
              '2 = Estrangeira - Adquirida no mercado interno')
            ComboBoxLabel.Width = 94
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Origem Mercadoria:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 678
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 778
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 578
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Top = 23
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 720
    Top = 24
  end
  object CDSIcms: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_TRIBUT_ICMS_CUSTOM_CAB'
        DataType = ftInteger
      end
      item
        Name = 'UF_DESTINO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CFOP'
        DataType = ftInteger
      end
      item
        Name = 'CSOSN_B'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CST_B'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MODALIDADE_BC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALIQUOTA'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_PAUTA'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_PRECO_MAXIMO'
        DataType = ftFloat
      end
      item
        Name = 'MVA'
        DataType = ftFloat
      end
      item
        Name = 'PORCENTO_BC'
        DataType = ftFloat
      end
      item
        Name = 'MODALIDADE_BC_ST'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALIQUOTA_INTERNA_ST'
        DataType = ftFloat
      end
      item
        Name = 'ALIQUOTA_INTERESTADUAL_ST'
        DataType = ftFloat
      end
      item
        Name = 'PORCENTO_BC_ST'
        DataType = ftFloat
      end
      item
        Name = 'ALIQUOTA_ICMS_ST'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_PAUTA_ST'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_PRECO_MAXIMO_ST'
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
    AfterEdit = CDSIcmsAfterEdit
    Left = 96
    Top = 387
    Data = {
      100200009619E0BD010000001800000014000000000003000000100202494404
      000100000000001949445F5452494255545F49434D535F435553544F4D5F4341
      4204000100000000000A55465F44455354494E4F010049002000010005574944
      54480200020002000443464F5004000100000000000743534F534E5F42010049
      0020000100055749445448020002000300054353545F42010049002000010005
      57494454480200020002000D4D4F44414C49444144455F424301004900200001
      0005574944544802000200010008414C4951554F544108000400000000000B56
      414C4F525F504155544108000400000000001256414C4F525F505245434F5F4D
      4158494D4F0800040000000000034D564108000400000000000B504F5243454E
      544F5F42430800040000000000104D4F44414C49444144455F42435F53540100
      49002000010005574944544802000200010013414C4951554F54415F494E5445
      524E415F5354080004000000000019414C4951554F54415F494E544552455354
      414455414C5F535408000400000000000E504F5243454E544F5F42435F535408
      0004000000000010414C4951554F54415F49434D535F53540800040000000000
      0E56414C4F525F50415554415F535408000400000000001556414C4F525F5052
      45434F5F4D4158494D4F5F535408000400000000000850455253495354450100
      4900000001000557494454480200020001000000}
    object CDSIcmsID: TIntegerField
      FieldName = 'ID'
    end
    object CDSIcmsUF_DESTINO: TStringField
      FieldName = 'UF_DESTINO'
      FixedChar = True
      Size = 2
    end
    object CDSIcmsCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object CDSIcmsCSOSN_B: TStringField
      FieldName = 'CSOSN_B'
      FixedChar = True
      Size = 3
    end
    object CDSIcmsCST_B: TStringField
      FieldName = 'CST_B'
      FixedChar = True
      Size = 2
    end
    object CDSIcmsPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSIcmsMODALIDADE_BC: TStringField
      FieldName = 'MODALIDADE_BC'
      FixedChar = True
      Size = 1
    end
    object CDSIcmsMODALIDADE_BC_ST: TStringField
      FieldName = 'MODALIDADE_BC_ST'
      FixedChar = True
      Size = 1
    end
    object CDSIcmsID_TRIBUT_ICMS_CUSTOM_CAB: TIntegerField
      FieldName = 'ID_TRIBUT_ICMS_CUSTOM_CAB'
    end
    object CDSIcmsALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsVALOR_PAUTA: TFloatField
      FieldName = 'VALOR_PAUTA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsVALOR_PRECO_MAXIMO: TFloatField
      FieldName = 'VALOR_PRECO_MAXIMO'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsPORCENTO_BC: TFloatField
      FieldName = 'PORCENTO_BC'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsALIQUOTA_INTERNA_ST: TFloatField
      FieldName = 'ALIQUOTA_INTERNA_ST'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsALIQUOTA_INTERESTADUAL_ST: TFloatField
      FieldName = 'ALIQUOTA_INTERESTADUAL_ST'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsPORCENTO_BC_ST: TFloatField
      FieldName = 'PORCENTO_BC_ST'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsALIQUOTA_ICMS_ST: TFloatField
      FieldName = 'ALIQUOTA_ICMS_ST'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsVALOR_PAUTA_ST: TFloatField
      FieldName = 'VALOR_PAUTA_ST'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSIcmsVALOR_PRECO_MAXIMO_ST: TFloatField
      FieldName = 'VALOR_PRECO_MAXIMO_ST'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object DSIcms: TDataSource
    DataSet = CDSIcms
    Left = 93
    Top = 440
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end
      item
      end
      item
        Items = <
          item
            Action = ActionExcluirItem
            Caption = '&Excluir Item'
            ImageIndex = 34
          end
          item
            Action = ActionUf
            Caption = '&Importar UFs'
            ImageIndex = 26
          end>
        ActionBar = ActionToolBar3
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 924
    Top = 168
    StyleName = 'Platform Default'
    object ActionUf: TAction
      Caption = 'Importar UFs'
      ImageIndex = 26
      OnExecute = ActionUfExecute
    end
    object ActionExcluirItem: TAction
      Caption = 'Excluir Item'
      ImageIndex = 34
      OnExecute = ActionExcluirItemExecute
    end
  end
end
