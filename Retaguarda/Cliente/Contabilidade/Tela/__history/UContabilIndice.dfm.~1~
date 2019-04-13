inherited FContabilIndice: TFContabilIndice
  Left = 318
  Top = 203
  Caption = 'Cont'#225'bil '#205'ndices'
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
          object ComboBoxPeriodicidade: TLabeledComboBox
            Left = 9
            Top = 65
            Width = 132
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'D - Di'#225'rio'
            Items.Strings = (
              'D - Di'#225'rio'
              'M -Mensal')
            ComboBoxLabel.Width = 67
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Periodicidade:'
          end
          object EditMensalMesAno: TLabeledMaskEdit
            Left = 147
            Top = 65
            Width = 86
            Height = 21
            Alignment = taCenter
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = 'M'#234's/Ano:'
            MaxLength = 7
            TabOrder = 1
            Text = '  ////////'
            Required = False
            EditMask = '##/####;1;_'
            MaskState = [msMasked]
          end
          object EditDiarioAPartirDe: TLabeledDateEdit
            Left = 239
            Top = 64
            Width = 121
            Height = 21
            TabOrder = 2
            DateEditLabel.Width = 85
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Di'#225'rio a Partir De:'
          end
          object EditIdIndiceEconomico: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 3
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdIndiceEconomicoExit
            OnKeyDown = EditIdIndiceEconomicoKeyDown
            OnKeyPress = EditIdIndiceEconomicoKeyPress
            CalcEditLabel.Width = 109
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = #205'ndice Econ'#244'mico [F1]:'
          end
          object EditIndiceEconomico: TLabeledEdit
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
            TabOrder = 4
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
                DataSource = DSContabilIndiceValor
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
                    FieldName = 'DATA_INDICE'
                    Title.Caption = 'Data '#205'ndice'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Caption = 'Valor'
                    Width = 200
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
  object DSContabilIndiceValor: TDataSource
    DataSet = CDSContabilIndiceValor
    Left = 72
    Top = 320
  end
  object CDSContabilIndiceValor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_INDICE'
        DataType = ftInteger
      end
      item
        Name = 'DATA_INDICE'
        DataType = ftDate
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
      7D0000009619E0BD0200000018000000040000000000030000007D0002494404
      000100000000001249445F434F4E544142494C5F494E44494345040001000000
      00000B444154415F494E4449434504000600000000000556414C4F520B001200
      0000020008444543494D414C5302000200060005574944544802000200120000
      00}
    object CDSContabilIndiceValorID: TIntegerField
      FieldName = 'ID'
    end
    object CDSContabilIndiceValorID_CONTABIL_INDICE: TIntegerField
      FieldName = 'ID_CONTABIL_INDICE'
    end
    object CDSContabilIndiceValorDATA_INDICE: TDateField
      FieldName = 'DATA_INDICE'
      EditMask = '##/##/####'
    end
    object CDSContabilIndiceValorVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
end
