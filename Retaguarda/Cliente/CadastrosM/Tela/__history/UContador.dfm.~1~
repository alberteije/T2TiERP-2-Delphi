inherited FContador: TFContador
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Contador'
  ClientHeight = 368
  ClientWidth = 913
  ExplicitLeft = 318
  ExplicitTop = 203
  ExplicitWidth = 921
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 913
    Height = 337
    ActivePage = PaginaEdits
    ExplicitWidth = 913
    ExplicitHeight = 337
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 905
      ExplicitHeight = 309
      inherited PanelGrid: TPanel
        Width = 905
        Height = 309
        ExplicitWidth = 905
        ExplicitHeight = 309
        inherited Grid: TJvDBUltimGrid
          Width = 905
          Height = 257
        end
        inherited PanelFiltroRapido: TPanel
          Top = 257
          Width = 905
          ExplicitTop = 257
          ExplicitWidth = 905
          inherited BotaoConsultar: TSpeedButton
            Left = 773
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
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
      ExplicitHeight = 309
      inherited PanelEdits: TPanel
        Width = 905
        Height = 309
        ExplicitWidth = 905
        ExplicitHeight = 309
        object BevelEdits: TBevel
          Left = 10
          Top = 10
          Width = 882
          Height = 255
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
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
          Left = 114
          Top = 126
          Width = 769
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = 'Complemento:'
          TabOrder = 6
        end
        object EditUFCRC: TLabeledEdit
          Left = 113
          Top = 80
          Width = 90
          Height = 21
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'UF CRC:'
          TabOrder = 3
        end
        object EditInscricaoCRC: TLabeledEdit
          Left = 18
          Top = 80
          Width = 90
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'N'#250'mero CRC:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 2
        end
        object EditLogradouro: TLabeledEdit
          Left = 209
          Top = 80
          Width = 674
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Logradouro:'
          TabOrder = 4
        end
        object EditNumero: TLabeledEdit
          Left = 18
          Top = 178
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
          Top = 178
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
          Top = 178
          Width = 117
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 73
          EditLabel.Height = 13
          EditLabel.Caption = 'Municipio IBGE:'
          TabOrder = 9
        end
        object EditUf: TLabeledEdit
          AlignWithMargins = True
          Left = 850
          Top = 178
          Width = 32
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
          Top = 226
          Width = 92
          Height = 21
          Color = clWhite
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone:'
          MaxLength = 13
          TabOrder = 11
          Text = '((()() )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditEmail: TLabeledEdit
          Left = 230
          Top = 226
          Width = 643
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail:'
          TabOrder = 13
        end
        object EditFax: TLabeledMaskEdit
          Left = 124
          Top = 226
          Width = 98
          Height = 21
          Color = clWhite
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Fax:'
          MaxLength = 13
          TabOrder = 12
          Text = '((()()()-()-()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditCep: TLabeledMaskEdit
          Left = 17
          Top = 126
          Width = 91
          Height = 21
          Color = clWhite
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep:'
          MaxLength = 9
          TabOrder = 5
          Text = '     ----'
          Required = False
          EditMask = '#####-###;0;_'
          MaskState = [msMasked]
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
