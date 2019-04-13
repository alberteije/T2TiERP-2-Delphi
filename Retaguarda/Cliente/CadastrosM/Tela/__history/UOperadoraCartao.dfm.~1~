inherited FOperadoraCartao: TFOperadoraCartao
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Operadora de Cart'#227'o'
  ClientWidth = 988
  ExplicitLeft = 318
  ExplicitTop = 203
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
          Height = 207
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditContaCaixa: TLabeledEdit
          Left = 79
          Top = 32
          Width = 879
          Height = 21
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
          Width = 879
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 3
        end
        object EditBandeira: TLabeledEdit
          Left = 18
          Top = 128
          Width = 335
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Bandeira:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 4
        end
        object EditNome: TLabeledEdit
          Left = 359
          Top = 128
          Width = 599
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 5
        end
        object EditFone1: TLabeledMaskEdit
          Left = 487
          Top = 176
          Width = 100
          Height = 21
          Color = clWhite
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone 1:'
          MaxLength = 13
          TabOrder = 10
          Text = '((()()()-()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditFone2: TLabeledMaskEdit
          Left = 593
          Top = 176
          Width = 100
          Height = 21
          Color = clWhite
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone 2:'
          MaxLength = 13
          TabOrder = 11
          Text = '((()()()-()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditTaxaAdm: TLabeledCalcEdit
          Left = 20
          Top = 176
          Width = 121
          Height = 21
          DisplayFormat = '0.00'
          ShowButton = False
          TabOrder = 6
          DecimalPlacesAlwaysShown = True
          CalcEditLabel.Width = 98
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Taxa Administra'#231#227'o:'
        end
        object EditTaxaAdmDebito: TLabeledCalcEdit
          Left = 147
          Top = 176
          Width = 121
          Height = 21
          DisplayFormat = '0.00'
          ShowButton = False
          TabOrder = 7
          DecimalPlacesAlwaysShown = True
          CalcEditLabel.Width = 90
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Taxa Adm. D'#233'bito:'
        end
        object EditValorAluguelPosPin: TLabeledCalcEdit
          Left = 274
          Top = 176
          Width = 121
          Height = 21
          DisplayFormat = '0.00'
          ShowButton = False
          TabOrder = 8
          DecimalPlacesAlwaysShown = True
          CalcEditLabel.Width = 66
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor Aluguel:'
        end
        object EditVencimentoAluguel: TLabeledCalcEdit
          Left = 401
          Top = 176
          Width = 80
          Height = 21
          DecimalPlaces = 0
          DisplayFormat = '0'
          ShowButton = False
          TabOrder = 9
          DecimalPlacesAlwaysShown = True
          CalcEditLabel.Width = 77
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Dia Vencimento:'
        end
        object EditIdContaCaixa: TLabeledCalcEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdContaCaixaExit
          OnKeyDown = EditIdContaCaixaKeyDown
          OnKeyPress = EditIdContaCaixaKeyPress
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Conta Caixa [F1]:'
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
          CalcEditLabel.Caption = 'Cont'#225'bil Conta [F1]:'
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
