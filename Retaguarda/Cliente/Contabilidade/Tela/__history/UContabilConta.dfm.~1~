inherited FContabilConta: TFContabilConta
  Left = 335
  Top = 150
  Caption = 'Cont'#225'bil Conta'
  ClientHeight = 456
  ClientWidth = 973
  ExplicitLeft = 335
  ExplicitTop = 150
  ExplicitWidth = 981
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 973
    Height = 425
    ActivePage = PaginaEdits
    ExplicitTop = 35
    ExplicitWidth = 973
    ExplicitHeight = 497
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 965
      ExplicitHeight = 469
      inherited PanelGrid: TPanel
        Width = 965
        Height = 397
        ExplicitWidth = 965
        ExplicitHeight = 469
        inherited Grid: TJvDBUltimGrid
          Width = 965
          Height = 345
        end
        inherited PanelFiltroRapido: TPanel
          Top = 345
          Width = 965
          ExplicitTop = 417
          ExplicitWidth = 965
          inherited BotaoConsultar: TSpeedButton
            Left = 833
            ExplicitLeft = 879
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 664
            ExplicitWidth = 664
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 965
      ExplicitHeight = 469
      inherited PanelEdits: TPanel
        Width = 965
        Height = 397
        ExplicitWidth = 965
        ExplicitHeight = 469
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 944
          Height = 278
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditPlanoConta: TLabeledEdit
          Left = 81
          Top = 32
          Width = 863
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 1
        end
        object EditClassificacao: TLabeledEdit
          Left = 440
          Top = 124
          Width = 353
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Classifica'#231#227'o:'
          TabOrder = 6
        end
        object EditDescricao: TLabeledEdit
          Left = 20
          Top = 169
          Width = 924
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          TabOrder = 8
        end
        object EditPlanoContaRefSped: TLabeledEdit
          Left = 81
          Top = 78
          Width = 863
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object EditDataInclusao: TLabeledDateEdit
          Left = 20
          Top = 214
          Width = 128
          Height = 21
          TabOrder = 9
          DateEditLabel.Width = 70
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Inclus'#227'o:'
        end
        object EditOrdem: TLabeledEdit
          Left = 20
          Top = 258
          Width = 386
          Height = 21
          AutoSize = False
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Ordem:'
          TabOrder = 15
        end
        object EditCodigoReduzido: TLabeledEdit
          Left = 412
          Top = 258
          Width = 198
          Height = 21
          AutoSize = False
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo Reduzido:'
          TabOrder = 16
        end
        object EditIdPlanoConta: TLabeledCalcEdit
          Left = 20
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdPlanoContaExit
          OnKeyDown = EditIdPlanoContaKeyDown
          OnKeyPress = EditIdPlanoContaKeyPress
          CalcEditLabel.Width = 85
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Plano Conta [F1]:'
        end
        object EditIdPlanoContaRefSped: TLabeledCalcEdit
          Left = 20
          Top = 78
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdPlanoContaRefSpedExit
          OnKeyDown = EditIdPlanoContaRefSpedKeyDown
          OnKeyPress = EditIdPlanoContaRefSpedKeyPress
          CalcEditLabel.Width = 170
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Plano Conta Referencial SPED [F1]:'
        end
        object EditIdContaPai: TLabeledCalcEdit
          Left = 20
          Top = 124
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContaPaiExit
          OnKeyDown = EditIdContaPaiKeyDown
          OnKeyPress = EditIdContaPaiKeyPress
          CalcEditLabel.Width = 73
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Pai [F1]:'
        end
        object EditContaPai: TLabeledEdit
          Left = 81
          Top = 124
          Width = 353
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 5
        end
        object ComboBoxTipo: TLabeledComboBox
          Left = 799
          Top = 124
          Width = 145
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemIndex = 0
          TabOrder = 7
          Text = 'Sint'#233'tica'
          Items.Strings = (
            'Sint'#233'tica'
            'Anal'#237'tica')
          ComboBoxLabel.Width = 24
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Tipo:'
        end
        object ComboBoxSituacao: TLabeledComboBox
          Left = 154
          Top = 214
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 10
          Text = 'Ativa'
          Items.Strings = (
            'Ativa'
            'Inativa')
          ComboBoxLabel.Width = 45
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Situa'#231#227'o:'
        end
        object ComboBoxNatureza: TLabeledComboBox
          Left = 305
          Top = 214
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 11
          Text = 'Credora'
          Items.Strings = (
            'Credora'
            'Devedora')
          ComboBoxLabel.Width = 48
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Natureza:'
        end
        object ComboBoxPatrimonioResultado: TLabeledComboBox
          Left = 456
          Top = 214
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 12
          Text = 'Patrim'#244'nio'
          Items.Strings = (
            'Patrim'#244'nio'
            'Resultado')
          ComboBoxLabel.Width = 120
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Patrim'#244'nio ou Resultado:'
        end
        object ComboBoxLivroCaixa: TLabeledComboBox
          Left = 607
          Top = 214
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 13
          Text = 'Sim'
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ComboBoxLabel.Width = 57
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Livro Caixa:'
        end
        object ComboBoxDfc: TLabeledComboBox
          Left = 758
          Top = 214
          Width = 186
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 14
          Text = 'N - N'#227'o participa'
          Items.Strings = (
            'N - N'#227'o participa'
            'O - Atividades Operacionais'
            'F - Atividades de Financiamento'
            'I - Atividades de Investimento')
          ComboBoxLabel.Width = 172
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Demonstra'#231#227'o dos Fluxos de Caixa:'
        end
        object ComboBoxCodigoEfd: TLabeledComboBox
          Left = 616
          Top = 258
          Width = 186
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 17
          Text = '01 - Contas de Ativo'
          Items.Strings = (
            '01 - Contas de Ativo'
            '02 - Contas de Passivo'
            '03 - Patrim'#244'nio L'#237'quido'
            '04 - Contas de Resultado'
            '05 - Contas de Compensa'#231#227'o'
            '09 - Outras')
          ComboBoxLabel.Width = 59
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'C'#243'digo EFD:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 973
    ExplicitWidth = 973
    inherited BotaoSair: TSpeedButton
      Left = 869
      ExplicitLeft = 759
    end
    inherited BotaoExportar: TSpeedButton
      Left = 769
      ExplicitLeft = 815
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 669
      ExplicitLeft = 715
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 559
      ExplicitLeft = 605
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 569
      ExplicitLeft = 615
    end
  end
end
