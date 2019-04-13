inherited FNaturezaFinanceira: TFNaturezaFinanceira
  Left = 344
  Top = 160
  Caption = 'Natureza Financeira'
  ClientHeight = 454
  ClientWidth = 980
  ExplicitLeft = 344
  ExplicitTop = 160
  ExplicitWidth = 988
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 980
    Height = 423
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 423
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      ExplicitHeight = 355
      inherited PanelGrid: TPanel
        Width = 972
        Height = 395
        ExplicitWidth = 980
        ExplicitHeight = 395
        inherited Grid: TJvDBUltimGrid
          Width = 972
          Height = 343
        end
        inherited PanelFiltroRapido: TPanel
          Top = 343
          Width = 972
          ExplicitTop = 343
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            Left = 840
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 671
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 980
      inherited PanelEdits: TPanel
        Width = 972
        Height = 395
        ExplicitWidth = 980
        ExplicitHeight = 395
        object BevelEdits: TBevel
          Left = 11
          Top = 10
          Width = 947
          Height = 265
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
          ExplicitWidth = 955
        end
        object EditPlanoNaturezaFinanceira: TLabeledEdit
          Left = 79
          Top = 32
          Width = 871
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
        object EditContabilConta: TLabeledEdit
          Left = 79
          Top = 76
          Width = 871
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
        object EditAplicacao: TLabeledEdit
          Left = 18
          Top = 161
          Width = 932
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Aplica'#231#227'o:'
          MaxLength = 250
          TabOrder = 6
        end
        object EditDescricao: TLabeledEdit
          Left = 18
          Top = 118
          Width = 736
          Height = 21
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          MaxLength = 100
          TabOrder = 4
        end
        object EditClassificacao: TLabeledEdit
          Left = 760
          Top = 118
          Width = 190
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Classifica'#231#227'o:'
          TabOrder = 5
        end
        object EditIdPlanoNaturezaFinanceira: TLabeledCalcEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdPlanoNaturezaFinanceiraExit
          OnKeyDown = EditIdPlanoNaturezaFinanceiraKeyDown
          OnKeyPress = EditIdPlanoNaturezaFinanceiraKeyPress
          CalcEditLabel.Width = 152
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Plano Natureza Financeira [F1]:'
        end
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 18
          Top = 76
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContabilContaExit
          OnKeyDown = EditIdContabilContaKeyDown
          OnKeyPress = EditIdContabilContaKeyPress
          CalcEditLabel.Width = 98
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Cont'#225'bil Conta [F1]:'
        end
        object GroupBoxOpcoes: TGroupBox
          Left = 18
          Top = 194
          Width = 932
          Height = 71
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Op'#231#245'es: '
          TabOrder = 7
          ExplicitWidth = 940
          object ComboBoxTipo: TLabeledComboBox
            Left = 12
            Top = 34
            Width = 71
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'Receita'
            Items.Strings = (
              'Receita'
              'Despesa')
            ComboBoxLabel.Width = 24
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo:'
          end
          object ComboBoxAPagar: TLabeledComboBox
            Left = 89
            Top = 34
            Width = 154
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 136
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Aparece no Contas a Pagar:'
          end
          object ComboBoxAReceber: TLabeledComboBox
            Left = 249
            Top = 34
            Width = 160
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 2
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 148
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Aparece no Contas a Receber:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 980
    ExplicitWidth = 988
    inherited BotaoSair: TSpeedButton
      Left = 876
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 776
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 666
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 766
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 566
      ExplicitLeft = 639
    end
  end
end
