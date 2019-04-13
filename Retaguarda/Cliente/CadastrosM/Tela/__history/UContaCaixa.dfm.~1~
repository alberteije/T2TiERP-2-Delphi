inherited FContaCaixa: TFContaCaixa
  Tag = 1
  Left = 318
  Top = 204
  Caption = 'Conta Caixa'
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
      ExplicitHeight = 395
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 980
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 980
        ExplicitWidth = 980
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 957
          Height = 267
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditContabilConta: TLabeledEdit
          Left = 79
          Top = 32
          Width = 879
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
        object EditCodigo: TLabeledEdit
          Left = 18
          Top = 128
          Width = 90
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'C'#243'digo:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 4
        end
        object EditNome: TLabeledEdit
          Left = 154
          Top = 128
          Width = 656
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 6
        end
        object EditAgenciaBanco: TLabeledEdit
          Left = 79
          Top = 77
          Width = 879
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object MemoDescricao: TLabeledMemo
          Left = 18
          Top = 176
          Width = 940
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 8
          MemoLabel.Width = 50
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Descri'#231#227'o:'
        end
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContabilContaExit
          OnKeyDown = EditIdContabilContaKeyDown
          OnKeyPress = EditIdContabilContaKeyPress
          CalcEditLabel.Width = 98
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Cont'#225'bil Conta [F1]:'
        end
        object EditIdAgenciaBanco: TLabeledCalcEdit
          Left = 18
          Top = 77
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdAgenciaBancoExit
          OnKeyDown = EditIdAgenciaBancoKeyDown
          OnKeyPress = EditIdAgenciaBancoKeyPress
          CalcEditLabel.Width = 97
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Ag'#234'ncia Banco [F1]:'
        end
        object ComboboxTipo: TLabeledComboBox
          Left = 816
          Top = 128
          Width = 142
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 7
          Text = 'C - Corrente'
          Items.Strings = (
            'C - Corrente'
            'P - Poupan'#231'a'
            'I - Investimento'
            'X - Caixa Interno')
          ComboBoxLabel.Width = 24
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Tipo:'
        end
        object EditDigito: TLabeledEdit
          Left = 114
          Top = 128
          Width = 34
          Height = 21
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'D'#237'gito:'
          EditLabel.ParentBiDiMode = False
          MaxLength = 1
          TabOrder = 5
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
end
