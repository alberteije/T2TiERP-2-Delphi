inherited FCondicoesPagamento: TFCondicoesPagamento
  Tag = 1
  Left = 309
  Top = 217
  Caption = 'Condi'#231#245'es de Pagamento'
  ClientWidth = 930
  ExplicitLeft = 309
  ExplicitTop = 217
  ExplicitWidth = 938
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 930
    ActivePage = PaginaEdits
    ExplicitWidth = 930
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 922
      inherited PanelGrid: TPanel
        Width = 922
        ExplicitWidth = 922
        inherited Grid: TJvDBUltimGrid
          Width = 922
        end
        inherited PanelFiltroRapido: TPanel
          Width = 922
          ExplicitWidth = 922
          inherited BotaoConsultar: TSpeedButton
            Left = 790
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 621
            ExplicitWidth = 621
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 922
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 922
        ExplicitWidth = 922
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 900
          Height = 182
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
          ExplicitWidth = 969
        end
        object EditNome: TLabeledEdit
          Left = 16
          Top = 33
          Width = 885
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          MaxLength = 50
          TabOrder = 0
        end
        object MemoDescricao: TLabeledMemo
          Left = 16
          Top = 75
          Width = 885
          Height = 65
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 1
          MemoLabel.Width = 50
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Descri'#231#227'o:'
        end
        object EditFaturamentoMinimo: TLabeledCalcEdit
          Left = 16
          Top = 161
          Width = 121
          Height = 21
          DisplayFormat = '#,###,##0.00'
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 101
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Faturamento M'#237'nimo:'
        end
        object EditFaturamentoMaximo: TLabeledCalcEdit
          Left = 143
          Top = 161
          Width = 121
          Height = 21
          DisplayFormat = '#,###,##0.00'
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 105
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Faturamento M'#225'ximo:'
        end
        object EditDiasTolerancia: TLabeledCalcEdit
          Left = 397
          Top = 161
          Width = 97
          Height = 21
          ShowButton = False
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 91
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Dias de Toler'#226'ncia:'
        end
        object EditValorTolerancia: TLabeledCalcEdit
          Left = 500
          Top = 161
          Width = 121
          Height = 21
          DisplayFormat = '#,###,##0.00'
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 80
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Toler'#226'ncia:'
        end
        object EditPrazoMedio: TLabeledCalcEdit
          Left = 627
          Top = 161
          Width = 97
          Height = 21
          TabStop = False
          DisplayFormat = '#'
          ReadOnly = True
          ShowButton = False
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 62
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Prazo M'#233'dio:'
        end
        object EditIndiceCorrecao: TLabeledCalcEdit
          Left = 270
          Top = 161
          Width = 121
          Height = 21
          DisplayFormat = '#,###,##0.00'
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 95
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = #205'ndice de Corre'#231#227'o:'
        end
        object GroupBoxParcelas: TGroupBox
          Left = 10
          Top = 199
          Width = 900
          Height = 194
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Parcelas'
          TabOrder = 8
          object GridParcelas: TJvDBUltimGrid
            Left = 2
            Top = 15
            Width = 896
            Height = 177
            Align = alClient
            DataSource = DSCondicoesParcelas
            PopupMenu = PopupMenuParcelas
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
                FieldName = 'PARCELA'
                Title.Caption = 'Parcela'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIAS'
                Title.Caption = 'Dias a Partir da Venda'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA'
                Title.Caption = '% da Parcela'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 930
    ExplicitWidth = 930
    inherited BotaoSair: TSpeedButton
      Left = 826
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 726
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 516
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 526
      ExplicitLeft = 526
    end
  end
  object CDSCondicoesParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONDICOES_PAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'TAXA'
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
    AfterEdit = CDSCondicoesParcelasAfterEdit
    Left = 836
    Top = 311
    Data = {
      8B0000009619E0BD0100000018000000060000000000030000008B0002494404
      000100000000001649445F434F4E4449434F45535F504147414D454E544F0400
      0100000000000750415243454C41040001000000000004444941530400010000
      0000000454415841080004000000000008504552534953544501004900000001
      000557494454480200020001000000}
    object CDSCondicoesParcelasID: TIntegerField
      FieldName = 'ID'
    end
    object CDSCondicoesParcelasID_CONDICOES_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICOES_PAGAMENTO'
    end
    object CDSCondicoesParcelasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object CDSCondicoesParcelasDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object CDSCondicoesParcelasTAXA: TFloatField
      FieldName = 'TAXA'
      DisplayFormat = '##0.00'
    end
    object CDSCondicoesParcelasPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSCondicoesParcelas: TDataSource
    DataSet = CDSCondicoesParcelas
    Left = 836
    Top = 367
  end
  object PopupMenuParcelas: TPopupMenu
    Images = FDataModule.ImagensCadastros
    Left = 638
    Top = 334
    object ExcluirParcela1: TMenuItem
      Caption = 'Excluir Parcela'
      ImageIndex = 10
      ShortCut = 46
      OnClick = ExcluirParcela1Click
    end
  end
end
