inherited FResponsavelSocio: TFResponsavelSocio
  Left = 318
  Top = 203
  Caption = 'ResponsavelSocio'
  ClientHeight = 444
  ClientWidth = 913
  ExplicitWidth = 921
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 913
    Height = 413
    ActivePage = PaginaEdits
    ExplicitWidth = 913
    ExplicitHeight = 413
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 905
      ExplicitHeight = 385
      inherited PanelGrid: TPanel
        Width = 905
        Height = 385
        ExplicitWidth = 905
        ExplicitHeight = 385
        inherited Grid: TJvDBUltimGrid
          Width = 905
          Height = 333
        end
        inherited PanelFiltroRapido: TPanel
          Top = 333
          Width = 905
          ExplicitTop = 333
          ExplicitWidth = 905
          inherited BotaoConsultar: TSpeedButton
            Left = 773
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledEdit
            Width = 604
            ExplicitWidth = 604
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 905
      ExplicitHeight = 385
      inherited PanelEdits: TPanel
        Width = 905
        Height = 385
        ExplicitWidth = 905
        ExplicitHeight = 385
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 882
          Height = 343
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditIdPessoa: TLabeledEdit
          Left = 18
          Top = 32
          Width = 61
          Height = 21
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'Pessoa  [F1]:'
          TabOrder = 0
          OnExit = EditIdPessoaExit
          OnKeyDown = EditIdPessoaKeyDown
        end
        object EditPessoa: TLabeledEdit
          Left = 79
          Top = 32
          Width = 804
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
        object EditComplemento: TLabeledEdit
          Left = 115
          Top = 161
          Width = 768
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = 'Complemento:'
          TabOrder = 6
        end
        object EditPisNit: TLabeledEdit
          Left = 220
          Top = 249
          Width = 90
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Pis/Nit:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 13
        end
        object EditLogradouro: TLabeledEdit
          Left = 18
          Top = 118
          Width = 865
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Logradouro:'
          TabOrder = 4
        end
        object EditNumero: TLabeledEdit
          Left = 18
          Top = 205
          Width = 89
          Height = 21
          AutoSize = False
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero:'
          TabOrder = 7
        end
        object EditBairro: TLabeledEdit
          Left = 113
          Top = 205
          Width = 608
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro:'
          TabOrder = 8
        end
        object EditMunicipioIbge: TLabeledEdit
          Left = 727
          Top = 205
          Width = 117
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 96
          EditLabel.Height = 13
          EditLabel.Caption = 'Municipio IBGE [F1]:'
          TabOrder = 9
          OnExit = EditMunicipioIbgeExit
          OnKeyDown = EditMunicipioIbgeKeyDown
        end
        object EditUf: TLabeledEdit
          AlignWithMargins = True
          Left = 850
          Top = 205
          Width = 33
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 13
          EditLabel.Height = 13
          EditLabel.Caption = 'UF'
          MaxLength = 2
          TabOrder = 10
        end
        object EditFone1: TLabeledMaskEdit
          Left = 18
          Top = 249
          Width = 92
          Height = 21
          Color = clWhite
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone:'
          MaxLength = 13
          TabOrder = 11
          Text = '(( ) )  -  -_'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditEmail: TLabeledEdit
          Left = 316
          Top = 249
          Width = 567
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail:'
          TabOrder = 14
        end
        object EditFax: TLabeledMaskEdit
          Left = 116
          Top = 249
          Width = 98
          Height = 21
          Color = clWhite
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Fax:'
          MaxLength = 13
          TabOrder = 12
          Text = '((()()()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditCep: TLabeledMaskEdit
          Left = 18
          Top = 161
          Width = 91
          Height = 21
          Color = clWhite
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep:'
          MaxLength = 9
          TabOrder = 5
          Text = '     --__'
          Required = False
          EditMask = '#####-###;0;_'
          MaskState = [msMasked]
        end
        object EditIdContabilConta: TLabeledEdit
          Left = 18
          Top = 75
          Width = 61
          Height = 21
          EditLabel.Width = 98
          EditLabel.Height = 13
          EditLabel.Caption = 'Cont'#225'bil Conta [F1]:'
          TabOrder = 2
          OnExit = EditIdContabilContaExit
        end
        object EditContabilConta: TLabeledEdit
          Left = 85
          Top = 75
          Width = 798
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
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 913
    ExplicitWidth = 913
    inherited BotaoSair: TSpeedButton
      Left = 809
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 709
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 599
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 699
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 499
      ExplicitLeft = 639
    end
  end
end
