inherited FContabilLancamentoOrcado: TFContabilLancamentoOrcado
  Tag = 1
  Left = 318
  Top = 155
  Caption = 'Lan'#231'amento Or'#231'ado'
  ClientHeight = 407
  ClientWidth = 961
  ExplicitLeft = 318
  ExplicitTop = 155
  ExplicitWidth = 969
  ExplicitHeight = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 961
    Height = 376
    ActivePage = PaginaEdits
    ExplicitWidth = 961
    ExplicitHeight = 469
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 953
      inherited PanelGrid: TPanel
        Width = 953
        Height = 348
        ExplicitWidth = 953
        ExplicitHeight = 441
        inherited Grid: TJvDBUltimGrid
          Width = 953
          Height = 296
        end
        inherited PanelFiltroRapido: TPanel
          Top = 296
          Width = 953
          ExplicitTop = 389
          ExplicitWidth = 953
          inherited BotaoConsultar: TSpeedButton
            Left = 821
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 652
            ExplicitWidth = 652
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 953
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 953
        Height = 348
        ExplicitWidth = 953
        ExplicitHeight = 441
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 935
          Height = 54
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object PageControlItens: TPageControl
          Left = 10
          Top = 75
          Width = 935
          Height = 262
          ActivePage = tsMeses
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object tsMeses: TTabSheet
            Caption = 'Meses'
            ImageIndex = 1
            object PanelContas: TPanel
              Left = 0
              Top = 0
              Width = 927
              Height = 234
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridMeses: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 927
                Height = 234
                Align = alClient
                DataSource = DSMeses
                Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AlternateRowColor = 15593713
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
                    FieldName = 'MES'
                    ReadOnly = True
                    Title.Caption = 'M'#234's'
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
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContabilContaExit
          OnKeyDown = EditIdContabilContaKeyDown
          OnKeyPress = EditIdContabilContaKeyPress
          CalcEditLabel.Width = 98
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Cont'#225'bil [F1]:'
        end
        object EditContabilConta: TLabeledEdit
          Left = 79
          Top = 32
          Width = 803
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 2
        end
        object EditAno: TLabeledMaskEdit
          Left = 888
          Top = 32
          Width = 43
          Height = 21
          Alignment = taCenter
          Anchors = [akTop, akRight]
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'Ano:'
          MaxLength = 4
          TabOrder = 3
          Text = '____'
          Required = False
          EditMask = '####;0;_'
          MaskState = [msMasked]
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 961
    ExplicitWidth = 961
    inherited BotaoSair: TSpeedButton
      Left = 857
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 757
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 647
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 747
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 547
      ExplicitLeft = 639
    end
  end
  object CDSMeses: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MES'
        DataType = ftString
        Size = 30
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
    AfterPost = CDSMesesAfterPost
    Left = 880
    Top = 312
    Data = {
      5B0000009619E0BD0200000018000000020000000000030000005B00034D4553
      0100490000000100055749445448020002001E000556414C4F520B0012000000
      020008444543494D414C530200020006000557494454480200020012000000}
    object CDSMesesMES: TStringField
      FieldName = 'MES'
      Size = 30
    end
    object CDSMesesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 6
    end
  end
  object DSMeses: TDataSource
    DataSet = CDSMeses
    Left = 880
    Top = 264
  end
end
