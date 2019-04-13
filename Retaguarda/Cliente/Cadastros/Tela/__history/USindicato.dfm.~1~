inherited FSindicato: TFSindicato
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Sindicato'
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
          Height = 343
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditNome: TLabeledEdit
          Left = 18
          Top = 32
          Width = 940
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 0
        end
        object EditContabilConta: TLabeledEdit
          Left = 79
          Top = 78
          Width = 879
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 2
        end
        object EditContaBanco: TLabeledEdit
          Left = 209
          Top = 128
          Width = 549
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Conta Banco:'
          TabOrder = 5
        end
        object EditCodigoCedente: TLabeledEdit
          Left = 764
          Top = 128
          Width = 194
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 81
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo Cedente:'
          TabOrder = 6
        end
        object EditLogradouro: TLabeledEdit
          Left = 19
          Top = 177
          Width = 939
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Logradouro:'
          TabOrder = 7
        end
        object EditNumero: TLabeledEdit
          Left = 19
          Top = 226
          Width = 89
          Height = 21
          AutoSize = False
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero:'
          TabOrder = 8
        end
        object EditBairro: TLabeledEdit
          Left = 114
          Top = 226
          Width = 683
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro:'
          TabOrder = 9
        end
        object EditUf: TLabeledEdit
          AlignWithMargins = True
          Left = 926
          Top = 226
          Width = 32
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 13
          EditLabel.Height = 13
          EditLabel.Caption = 'UF'
          MaxLength = 2
          TabOrder = 11
        end
        object EditFone1: TLabeledMaskEdit
          Left = 19
          Top = 274
          Width = 97
          Height = 21
          Color = clWhite
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone 1:'
          MaxLength = 13
          TabOrder = 12
          Text = '((()() )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditEmail: TLabeledEdit
          Left = 223
          Top = 274
          Width = 735
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail:'
          TabOrder = 14
        end
        object EditDataBase: TLabeledDateEdit
          Left = 192
          Top = 320
          Width = 137
          Height = 21
          TabOrder = 16
          DateEditLabel.Width = 53
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Base:'
        end
        object EditFone2: TLabeledMaskEdit
          Left = 124
          Top = 274
          Width = 93
          Height = 21
          Color = clWhite
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone 2:'
          MaxLength = 13
          TabOrder = 13
          Text = '((()() )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 18
          Top = 78
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
          CalcEditLabel.Caption = 'Cont'#225'bil Conta [F1]:'
        end
        object EditCodigoBanco: TLabeledCalcEdit
          Left = 19
          Top = 128
          Width = 89
          Height = 21
          ShowButton = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 69
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'C'#243'digo Banco:'
        end
        object EditCodigoAgencia: TLabeledCalcEdit
          Left = 114
          Top = 128
          Width = 89
          Height = 21
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 78
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'C'#243'digo Ag'#234'ncia:'
        end
        object EditMunicipioIbge: TLabeledCalcEdit
          Left = 803
          Top = 226
          Width = 117
          Height = 21
          Anchors = [akTop, akRight]
          ShowButton = False
          TabOrder = 10
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 73
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Munic'#237'pio IBGE:'
        end
        object EditPisoSalarial: TLabeledCalcEdit
          Left = 335
          Top = 320
          Width = 119
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 17
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 60
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Piso Salarial:'
        end
        object ComboboxTipo: TLabeledComboBox
          Left = 19
          Top = 320
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 15
          Text = 'P - Patronal'
          Items.Strings = (
            'P - Patronal'
            'E - Empregados')
          ComboBoxLabel.Width = 24
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Tipo:'
        end
        object EditCNPJ: TLabeledMaskEdit
          Left = 460
          Top = 320
          Width = 125
          Height = 21
          EditLabel.Width = 29
          EditLabel.Height = 13
          EditLabel.Caption = 'CNPJ:'
          MaxLength = 18
          TabOrder = 18
          Text = '__.___.___/____-__'
          Required = False
          EditMask = '##.###.###/####-##;0;_'
          MaskState = []
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
