inherited FFornecedor: TFFornecedor
  Tag = 1
  Left = 309
  Top = 150
  Caption = 'Fornecedor'
  ClientHeight = 543
  ClientWidth = 1115
  ExplicitWidth = 1131
  ExplicitHeight = 582
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1115
    Height = 512
    ActivePage = PaginaEdits
    ExplicitWidth = 1115
    ExplicitHeight = 512
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 1107
      ExplicitHeight = 484
      inherited PanelGrid: TPanel
        Width = 1107
        Height = 484
        ExplicitWidth = 1107
        ExplicitHeight = 484
        inherited Grid: TJvDBUltimGrid
          Width = 1107
          Height = 432
        end
        inherited PanelFiltroRapido: TPanel
          Top = 432
          Width = 1107
          ExplicitTop = 432
          ExplicitWidth = 1107
          inherited BotaoConsultar: TSpeedButton
            Left = 975
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 806
            ExplicitWidth = 806
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1107
      ExplicitHeight = 484
      inherited PanelEdits: TPanel
        Width = 1107
        Height = 484
        ExplicitWidth = 1107
        ExplicitHeight = 484
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
            ShowNullDate = False
            TabOrder = 8
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
            Width = 1008
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
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
          object EditIdAtividadeFornecedor: TLabeledCalcEdit
            Left = 490
            Top = 76
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 4
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdAtividadeFornecedorExit
            OnKeyDown = EditIdAtividadeFornecedorKeyDown
            OnKeyPress = EditIdAtividadeFornecedorKeyPress
            CalcEditLabel.Width = 72
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Atividade [F1]:'
          end
          object EditIdSituacaoFornecedor: TLabeledCalcEdit
            Left = 14
            Top = 76
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdSituacaoFornecedorExit
            OnKeyDown = EditIdSituacaoFornecedorKeyDown
            OnKeyPress = EditIdSituacaoFornecedorKeyPress
            CalcEditLabel.Width = 68
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Situa'#231#227'o [F1]:'
          end
          object EditAtividadeFornecedor: TLabeledEdit
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
          object EditSituacaoFornecedor: TLabeledEdit
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
            TabOrder = 19
            MemoLabel.Width = 62
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Observa'#231#227'o:'
          end
          object ComboBoxGeraFaturamento: TLabeledComboBox
            Left = 427
            Top = 165
            Width = 118
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 10
            Text = 'S - Sim'
            Items.Strings = (
              'S - Sim'
              'N - N'#227'o')
            ComboBoxLabel.Width = 96
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Gerar Faturamento:'
          end
          object ComboBoxOptanteSimples: TLabeledComboBox
            Left = 551
            Top = 165
            Width = 139
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 11
            Text = 'S - Sim'
            Items.Strings = (
              'S - Sim'
              'N - N'#227'o')
            ComboBoxLabel.Width = 82
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Optante Simples:'
          end
          object ComboBoxLocalizacao: TLabeledComboBox
            Left = 696
            Top = 165
            Width = 177
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 12
            Text = 'N - Nacional'
            Items.Strings = (
              'N - Nacional'
              'E - Exterior')
            ComboBoxLabel.Width = 58
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Localiza'#231#227'o:'
          end
          object EditContaRemetente: TLabeledEdit
            Left = 119
            Top = 165
            Width = 302
            Height = 21
            EditLabel.Width = 89
            EditLabel.Height = 13
            EditLabel.Caption = 'Conta Remetente:'
            MaxLength = 100
            TabOrder = 9
          end
          object ComboBoxSofreRetencao: TLabeledComboBox
            Left = 879
            Top = 165
            Width = 204
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 1
            TabOrder = 13
            Text = 'N - N'#227'o'
            Items.Strings = (
              'S - Sim'
              'N - N'#227'o')
            ComboBoxLabel.Width = 79
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Sofre Reten'#231#227'o:'
          end
          object EditPrazoMedioEntrega: TLabeledCalcEdit
            Left = 14
            Top = 212
            Width = 130
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = '0'
            ShowButton = False
            TabOrder = 14
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 103
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Prazo M'#233'dio Entrega:'
          end
          object EditChequeNominal: TLabeledEdit
            Left = 558
            Top = 212
            Width = 525
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 91
            EditLabel.Height = 13
            EditLabel.Caption = 'Cheque Nominal A:'
            MaxLength = 100
            TabOrder = 18
          end
          object EditNumDiasPrimeiroVencimento: TLabeledCalcEdit
            Left = 150
            Top = 212
            Width = 130
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = '0'
            ShowButton = False
            TabOrder = 15
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 120
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Num Dias 1'#186' Vencimento:'
          end
          object EditNumDiasIntervalo: TLabeledCalcEdit
            Left = 286
            Top = 212
            Width = 130
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = '0'
            ShowButton = False
            TabOrder = 16
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 95
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Num Dias Intervalo:'
          end
          object EditQuantidadeParcelas: TLabeledCalcEdit
            Left = 422
            Top = 212
            Width = 130
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = '0'
            ShowButton = False
            TabOrder = 17
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 103
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Quantidade Parcelas:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 1115
    ExplicitWidth = 1115
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
