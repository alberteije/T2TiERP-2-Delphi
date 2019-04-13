inherited FCliente: TFCliente
  Tag = 1
  Left = 309
  Top = 150
  Caption = 'Cliente'
  ClientHeight = 543
  ClientWidth = 1115
  ExplicitLeft = 309
  ExplicitTop = 150
  ExplicitWidth = 1123
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1115
    Height = 512
    ActivePage = PaginaEdits
    ExplicitWidth = 1091
    ExplicitHeight = 480
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 1083
      ExplicitHeight = 452
      inherited PanelGrid: TPanel
        Width = 1107
        Height = 484
        ExplicitWidth = 1083
        ExplicitHeight = 452
        inherited Grid: TJvDBUltimGrid
          Width = 1107
          Height = 432
        end
        inherited PanelFiltroRapido: TPanel
          Top = 432
          Width = 1107
          ExplicitTop = 400
          ExplicitWidth = 1083
          inherited BotaoConsultar: TSpeedButton
            Left = 975
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 806
            ExplicitWidth = 782
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 1083
      ExplicitHeight = 452
      inherited PanelEdits: TPanel
        Width = 1107
        Height = 484
        ExplicitWidth = 1083
        ExplicitHeight = 452
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 1099
          Height = 476
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 1073
          ExplicitHeight = 444
          DesignSize = (
            1099
            476)
          object BevelEdits: TBevel
            Left = 6
            Top = 6
            Width = 1086
            Height = 351
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object EditDataDesde: TLabeledDateEdit
            Left = 14
            Top = 165
            Width = 99
            Height = 21
            TabOrder = 10
            DateEditLabel.Width = 34
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Desde:'
          end
          object EditIdContabilConta: TLabeledCalcEdit
            Left = 14
            Top = 117
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 6
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdContabilContaExit
            OnKeyDown = EditIdContabilContaKeyDown
            OnKeyPress = EditIdContabilContaKeyPress
            CalcEditLabel.Width = 98
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Conta Cont'#225'bil [F1]:'
          end
          object EditContabilConta: TLabeledEdit
            Left = 75
            Top = 117
            Width = 409
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 7
          end
          object EditIdPessoa: TLabeledCalcEdit
            Left = 14
            Top = 33
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdPessoaExit
            OnKeyDown = EditIdPessoaKeyDown
            OnKeyPress = EditIdPessoaKeyPress
            CalcEditLabel.Width = 61
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Pessoa [F1]:'
          end
          object EditIdOperacaoFiscal: TLabeledCalcEdit
            Left = 490
            Top = 117
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 8
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdOperacaoFiscalExit
            OnKeyDown = EditIdOperacaoFiscalKeyDown
            OnKeyPress = EditIdOperacaoFiscalKeyPress
            CalcEditLabel.Width = 103
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Opera'#231#227'o Fiscal [F1]:'
          end
          object EditIdAtividadeForCli: TLabeledCalcEdit
            Left = 490
            Top = 76
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 4
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdAtividadeForCliExit
            OnKeyDown = EditIdAtividadeForCliKeyDown
            OnKeyPress = EditIdAtividadeForCliKeyPress
            CalcEditLabel.Width = 72
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Atividade [F1]:'
          end
          object EditIdSituacaoForCli: TLabeledCalcEdit
            Left = 14
            Top = 76
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdSituacaoForCliExit
            OnKeyDown = EditIdSituacaoForCliKeyDown
            OnKeyPress = EditIdSituacaoForCliKeyPress
            CalcEditLabel.Width = 68
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Situa'#231#227'o [F1]:'
          end
          object EditAtividadeForCli: TLabeledEdit
            Left = 551
            Top = 76
            Width = 532
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 5
          end
          object EditOperacaoFiscal: TLabeledEdit
            Left = 551
            Top = 117
            Width = 532
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 9
          end
          object EditSituacaoForCli: TLabeledEdit
            Left = 75
            Top = 76
            Width = 409
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 3
          end
          object EditNomePessoa: TLabeledEdit
            Left = 75
            Top = 33
            Width = 1008
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
          object MemoObservacao: TLabeledMemo
            Left = 14
            Top = 256
            Width = 1069
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 18
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
          object ComboBoxGeraFinanceiro: TLabeledComboBox
            Left = 427
            Top = 165
            Width = 89
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 12
            Text = 'S - Sim'
            Items.Strings = (
              'S - Sim'
              'N - N'#227'o')
            ComboBoxLabel.Width = 83
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Gerar Financeiro:'
          end
          object ComboBoxIndicadorPreco: TLabeledComboBox
            Left = 522
            Top = 165
            Width = 168
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 13
            Text = 'T - Tabela'
            Items.Strings = (
              'T - Tabela'
              'P - '#218'ltimo Pedido')
            ComboBoxLabel.Width = 94
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Indicador de Pre'#231'o:'
          end
          object ComboBoxTipoFrete: TLabeledComboBox
            Left = 696
            Top = 165
            Width = 177
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 14
            Text = 'E - Emitente'
            Items.Strings = (
              'E - Emitente'
              'D - Destinat'#225'rio'
              'S - Sem Frete'
              'T - Terceiros')
            ComboBoxLabel.Width = 68
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Tipo de Frete:'
          end
          object EditContaTomador: TLabeledEdit
            Left = 119
            Top = 165
            Width = 302
            Height = 21
            EditLabel.Width = 78
            EditLabel.Height = 13
            EditLabel.Caption = 'Conta Tomador:'
            MaxLength = 100
            TabOrder = 11
          end
          object ComboBoxFormaDesconto: TLabeledComboBox
            Left = 879
            Top = 165
            Width = 204
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 15
            Text = 'P - Produto'
            Items.Strings = (
              'P - Produto'
              'F - Fim do Pedido')
            ComboBoxLabel.Width = 97
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Forma de Desconto:'
          end
          object EditDesconto: TLabeledCalcEdit
            Left = 14
            Top = 212
            Width = 130
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 16
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Desconto:'
          end
          object EditLimiteCredito: TLabeledCalcEdit
            Left = 150
            Top = 212
            Width = 130
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 17
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 84
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Limite de Cr'#233'dito:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 1115
    ExplicitWidth = 1091
    inherited BotaoSair: TSpeedButton
      Left = 1011
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      Left = 911
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 801
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 901
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 701
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 496
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 636
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 752
  end
end
