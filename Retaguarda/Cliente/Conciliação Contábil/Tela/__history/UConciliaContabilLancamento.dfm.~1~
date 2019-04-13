inherited FConciliaContabilLancamento: TFConciliaContabilLancamento
  Left = 318
  Top = 203
  Caption = 'Concilia Lan'#231'amento Cont'#225'bil'
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
          Width = 959
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            959
            101)
          object EditIdLote: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 25
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Lote:'
          end
          object EditLote: TLabeledEdit
            Left = 70
            Top = 24
            Width = 878
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
          object ComboBoxTipo: TLabeledComboBox
            Left = 343
            Top = 68
            Width = 605
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 5
            Text = 'UDVC - Um D'#233'bito para V'#225'rios Cr'#233'ditos'
            Items.Strings = (
              'UDVC - Um D'#233'bito para V'#225'rios Cr'#233'ditos'
              'UCVD - Um Cr'#233'dito para V'#225'rios D'#233'bitos'
              'UDUC - Um D'#233'bito para Um Cr'#233'dito'
              'VDVC - V'#225'rios D'#233'bitos para V'#225'rios Cr'#233'ditos')
            ComboBoxLabel.Width = 24
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo:'
            ExplicitWidth = 600
          end
          object EditDataLancamento: TLabeledDateEdit
            Left = 9
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 2
            DateEditLabel.Width = 88
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Lan'#231'amento:'
          end
          object EditDataInclusao: TLabeledDateEdit
            Left = 136
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 3
            DateEditLabel.Width = 70
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Inclus'#227'o:'
          end
          object ComboBoxLiberado: TLabeledComboBox
            Left = 263
            Top = 68
            Width = 74
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 4
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 45
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Liberado:'
          end
        end
        object PageControlItens: TPageControl
          Left = 10
          Top = 128
          Width = 959
          Height = 230
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object tsItens: TTabSheet
            Caption = 'Detalhe'
            object PanelItens: TPanel
              Left = 0
              Top = 0
              Width = 951
              Height = 202
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridDetalhe: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 951
                Height = 202
                Align = alClient
                DataSource = DSContabilLancamentoDetalhe
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
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'HISTORICO'
                    Title.Caption = 'Hist'#243'rico'
                    Width = 550
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Title.Caption = 'Tipo (C|D)'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Caption = 'Valor'
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CONCILIADO'
                    Title.Caption = 'Conciliado'
                    Visible = True
                  end>
              end
            end
          end
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 377
          Width = 972
          Height = 26
          ActionManager = ActionManager1
          Align = alBottom
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
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
  object DSContabilLancamentoDetalhe: TDataSource
    DataSet = CDSContabilLancamentoDetalhe
    Left = 80
    Top = 280
  end
  object CDSContabilLancamentoDetalhe: TClientDataSet
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
        Name = 'ID_CONTABIL_HISTORICO'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_LANCAMENTO_CAB'
        DataType = ftInteger
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'CONCILIADO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 328
    Data = {
      FF0000009619E0BD020000001800000008000000000003000000FF0002494404
      000100000000001149445F434F4E544142494C5F434F4E544104000100000000
      001549445F434F4E544142494C5F484953544F5249434F04000100000000001A
      49445F434F4E544142494C5F4C414E43414D454E544F5F434142040001000000
      000009484953544F5249434F010049000000010005574944544802000200FA00
      045449504F01004900000001000557494454480200020001000556414C4F520B
      0012000000020008444543494D414C5302000200060005574944544802000200
      12000A434F4E43494C4941444F01004900000001000557494454480200020001
      000000}
    object CDSContabilLancamentoDetalheID: TIntegerField
      FieldName = 'ID'
    end
    object CDSContabilLancamentoDetalheID_CONTABIL_CONTA: TIntegerField
      FieldName = 'ID_CONTABIL_CONTA'
    end
    object CDSContabilLancamentoDetalheID_CONTABIL_HISTORICO: TIntegerField
      FieldName = 'ID_CONTABIL_HISTORICO'
    end
    object CDSContabilLancamentoDetalheID_CONTABIL_LANCAMENTO_CAB: TIntegerField
      FieldName = 'ID_CONTABIL_LANCAMENTO_CAB'
    end
    object CDSContabilLancamentoDetalheHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 250
    end
    object CDSContabilLancamentoDetalheTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CDSContabilLancamentoDetalheVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSContabilLancamentoDetalheCONCILIADO: TStringField
      FieldName = 'CONCILIADO'
      Size = 1
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionConciliacao
            Caption = '&Concilia'#231#227'o'
            ImageIndex = 32
          end>
      end
      item
        Items = <
          item
            Action = ActionConciliacao
            Caption = '&Concilia'#231#227'o'
            ImageIndex = 32
          end
          item
            Caption = '-'
          end
          item
            Action = ActionComplementacao
            Caption = 'C&omplementa'#231#227'o'
            ImageIndex = 35
          end
          item
            Action = Transferência
            Caption = '&Transfer'#234'ncia'
            ImageIndex = 29
          end
          item
            Action = ActionEstorno
            Caption = '&Estorno'
            ImageIndex = 34
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 815
    Top = 278
    StyleName = 'Platform Default'
    object ActionConciliacao: TAction
      Caption = 'Concilia'#231#227'o'
      ImageIndex = 32
      OnExecute = ActionConciliacaoExecute
    end
    object ActionEstorno: TAction
      Caption = 'Estorno'
      ImageIndex = 34
      OnExecute = ActionEstornoExecute
    end
    object Transferência: TAction
      Caption = 'Transfer'#234'ncia'
      ImageIndex = 29
      OnExecute = TransferênciaExecute
    end
    object ActionComplementacao: TAction
      Caption = 'Complementa'#231#227'o'
      ImageIndex = 35
      OnExecute = ActionComplementacaoExecute
    end
  end
end
