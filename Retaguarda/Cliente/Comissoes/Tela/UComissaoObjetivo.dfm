inherited FComissaoObjetivo: TFComissaoObjetivo
  Tag = 1
  Left = 368
  Top = 180
  Caption = 'Objetivos / Metas'
  ClientHeight = 506
  ClientWidth = 863
  ExplicitWidth = 879
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 863
    Height = 475
    ActivePage = PaginaEdits
    ExplicitWidth = 863
    ExplicitHeight = 475
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 855
      ExplicitHeight = 447
      inherited PanelGrid: TPanel
        Width = 855
        Height = 447
        ExplicitWidth = 855
        ExplicitHeight = 447
        inherited Grid: TJvDBUltimGrid
          Width = 855
          Height = 395
        end
        inherited PanelFiltroRapido: TPanel
          Top = 395
          Width = 855
          ExplicitTop = 395
          ExplicitWidth = 855
          inherited BotaoConsultar: TSpeedButton
            Left = 723
            ExplicitLeft = 879
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 554
            ExplicitWidth = 554
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 855
      ExplicitHeight = 447
      inherited PanelEdits: TPanel
        Width = 855
        Height = 447
        ExplicitWidth = 855
        ExplicitHeight = 447
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 834
          Height = 424
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditCodigo: TLabeledEdit
          Left = 19
          Top = 32
          Width = 75
          Height = 21
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo:'
          TabOrder = 0
        end
        object EditIdPerfil: TLabeledCalcEdit
          Left = 100
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdPerfilKeyUp
          CalcEditLabel.Width = 51
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Perfil [F1]:'
        end
        object EditPerfil: TLabeledEdit
          Left = 161
          Top = 32
          Width = 673
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 2
        end
        object EditNome: TLabeledEdit
          Left = 19
          Top = 123
          Width = 815
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 5
        end
        object MemoDescricao: TLabeledMemo
          Left = 19
          Top = 168
          Width = 815
          Height = 60
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 6
          MemoLabel.Width = 50
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Descri'#231#227'o:'
        end
        object EditIdProduto: TLabeledCalcEdit
          Left = 19
          Top = 77
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdProdutoKeyUp
          CalcEditLabel.Width = 65
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Produto [F1]:'
        end
        object EditProduto: TLabeledEdit
          Left = 80
          Top = 77
          Width = 754
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 4
        end
        object ComboboxFormaPagamento: TLabeledComboBox
          Left = 19
          Top = 254
          Width = 132
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 7
          Text = '0=VALOR FIXO'
          Items.Strings = (
            '0=VALOR FIXO'
            '1=PERCENTUAL')
          ComboBoxLabel.Width = 106
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Forma de Pagamento:'
        end
        object EditTaxaPagamento: TLabeledCalcEdit
          Left = 157
          Top = 254
          Width = 110
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 8
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 85
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Taxa Pagamento:'
        end
        object EditValorPagamento: TLabeledCalcEdit
          Left = 273
          Top = 254
          Width = 110
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 85
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Pagamento:'
        end
        object EditValorMeta: TLabeledCalcEdit
          Left = 389
          Top = 254
          Width = 110
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 10
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 55
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Meta:'
        end
        object EditQuantidade: TLabeledCalcEdit
          Left = 505
          Top = 254
          Width = 110
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 11
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 60
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Quantidade:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 863
    ExplicitWidth = 863
    inherited BotaoSair: TSpeedButton
      Left = 759
      ExplicitLeft = 759
    end
    inherited BotaoExportar: TSpeedButton
      Left = 659
      ExplicitLeft = 815
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 559
      ExplicitLeft = 715
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 449
      ExplicitLeft = 605
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 459
      ExplicitLeft = 615
    end
  end
end
