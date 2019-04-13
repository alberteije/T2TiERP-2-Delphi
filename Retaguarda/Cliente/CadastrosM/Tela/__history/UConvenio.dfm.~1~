inherited FConvenio: TFConvenio
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Conv'#234'nio'
  ClientWidth = 990
  ExplicitLeft = 318
  ExplicitTop = 203
  ExplicitWidth = 998
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 990
    ActivePage = PaginaEdits
    ExplicitWidth = 990
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 982
      inherited PanelGrid: TPanel
        Width = 982
        ExplicitWidth = 982
        inherited Grid: TJvDBUltimGrid
          Width = 982
        end
        inherited PanelFiltroRapido: TPanel
          Width = 982
          ExplicitWidth = 982
          inherited BotaoConsultar: TSpeedButton
            Left = 850
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 681
            ExplicitWidth = 681
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 982
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 982
        ExplicitWidth = 982
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 958
          Height = 358
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditLogradouro: TLabeledEdit
          Left = 255
          Top = 128
          Width = 705
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Logradouro:'
          TabOrder = 6
        end
        object EditContato: TLabeledEdit
          Left = 183
          Top = 225
          Width = 540
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Contato:'
          TabOrder = 11
        end
        object EditBairro: TLabeledEdit
          Left = 129
          Top = 177
          Width = 831
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro:'
          TabOrder = 8
        end
        object EditPessoa: TLabeledEdit
          Left = 79
          Top = 32
          Width = 881
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
          Top = 78
          Width = 881
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
        object EditDesconto: TLabeledCalcEdit
          Left = 18
          Top = 128
          Width = 105
          Height = 21
          DisplayFormat = '0.00'
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = True
          CalcEditLabel.Width = 49
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Desconto:'
        end
        object EditVencimento: TLabeledDateEdit
          Left = 129
          Top = 128
          Width = 120
          Height = 21
          TabOrder = 5
          DateEditLabel.Width = 59
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Vencimento:'
        end
        object EditUf: TLabeledEdit
          Left = 143
          Top = 225
          Width = 34
          Height = 21
          EditLabel.Width = 15
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Uf:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 10
        end
        object EditTelefone: TLabeledMaskEdit
          Left = 729
          Top = 225
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          Color = clWhite
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone:'
          MaxLength = 13
          TabOrder = 12
          Text = '((()()()-()-()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditDataCadastro: TLabeledDateEdit
          Left = 840
          Top = 225
          Width = 120
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 13
          DateEditLabel.Width = 74
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Cadastro:'
        end
        object MemoDescricao: TLabeledMemo
          Left = 18
          Top = 281
          Width = 942
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 14
          MemoLabel.Width = 50
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Descri'#231#227'o:'
        end
        object EditIdContabilConta: TLabeledCalcEdit
          Left = 18
          Top = 78
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContabilContaExit
          OnKeyDown = EditIdContabilContaKeyDown
          OnKeyPress = EditIdContabilContaKeyPress
          CalcEditLabel.Width = 98
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Cont'#225'bil [F1]:'
        end
        object EditIdPessoa: TLabeledCalcEdit
          Left = 18
          Top = 32
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
        object EditNumero: TLabeledEdit
          Left = 18
          Top = 177
          Width = 105
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'N'#250'mero:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 7
        end
        object EditMunicipioIbge: TLabeledCalcEdit
          Left = 18
          Top = 225
          Width = 119
          Height = 21
          ShowButton = False
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 73
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Munic'#237'pio IBGE:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 990
    ExplicitWidth = 990
    inherited BotaoSair: TSpeedButton
      Left = 886
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 786
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 676
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 776
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 576
      ExplicitLeft = 639
    end
  end
end
