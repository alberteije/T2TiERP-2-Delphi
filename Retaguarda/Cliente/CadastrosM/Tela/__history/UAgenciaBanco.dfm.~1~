inherited FAgenciaBanco: TFAgenciaBanco
  Tag = 1
  Left = 368
  Top = 180
  Caption = 'Ag'#234'ncias Banc'#225'rias'
  ClientHeight = 506
  ClientWidth = 863
  ExplicitLeft = 368
  ExplicitTop = 180
  ExplicitWidth = 871
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 863
    Height = 475
    ActivePage = PaginaEdits
    ExplicitWidth = 863
    ExplicitHeight = 475
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 855
      ExplicitHeight = 447
      inherited PanelGrid: TPanel
        Width = 855
        Height = 447
        ExplicitWidth = 855
        ExplicitHeight = 447
        inherited Grid: TJvDBUltimGrid
          Width = 855
          Height = 395
        end
        inherited PanelFiltroRapido: TPanel
          Top = 395
          Width = 855
          ExplicitTop = 395
          ExplicitWidth = 855
          inherited BotaoConsultar: TSpeedButton
            Left = 723
            ExplicitLeft = 879
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 554
            ExplicitWidth = 554
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 855
      ExplicitHeight = 447
      inherited PanelEdits: TPanel
        Width = 855
        Height = 447
        ExplicitWidth = 855
        ExplicitHeight = 447
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 834
          Height = 424
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditCodigo: TLabeledEdit
          Left = 19
          Top = 32
          Width = 75
          Height = 21
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo:'
          TabOrder = 0
        end
        object EditIdBanco: TLabeledCalcEdit
          Left = 100
          Top = 32
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdBancoExit
          OnKeyDown = EditIdBancoKeyDown
          OnKeyPress = EditIdBancoKeyPress
          CalcEditLabel.Width = 56
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Banco [F1]:'
        end
        object EditBanco: TLabeledEdit
          Left = 161
          Top = 32
          Width = 673
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 2
        end
        object EditNome: TLabeledEdit
          Left = 19
          Top = 80
          Width = 815
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 3
        end
        object EditLogradouro: TLabeledEdit
          Left = 19
          Top = 128
          Width = 815
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Logradouro:'
          TabOrder = 4
        end
        object EditNumero: TLabeledEdit
          Left = 19
          Top = 177
          Width = 59
          Height = 21
          AutoSize = False
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero:'
          TabOrder = 5
        end
        object EditBairro: TLabeledEdit
          Left = 84
          Top = 177
          Width = 750
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro:'
          TabOrder = 6
        end
        object EditMunicipio: TLabeledEdit
          Left = 141
          Top = 225
          Width = 653
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 47
          EditLabel.Height = 13
          EditLabel.Caption = 'Munic'#237'pio:'
          TabOrder = 8
        end
        object EditUf: TLabeledEdit
          AlignWithMargins = True
          Left = 802
          Top = 225
          Width = 32
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 13
          EditLabel.Height = 13
          EditLabel.Caption = 'UF'
          MaxLength = 2
          TabOrder = 9
        end
        object EditGerente: TLabeledEdit
          Left = 19
          Top = 322
          Width = 815
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Gerente:'
          TabOrder = 12
        end
        object EditContato: TLabeledEdit
          Left = 146
          Top = 274
          Width = 688
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Contato:'
          TabOrder = 11
        end
        object EditCEP: TLabeledMaskEdit
          Left = 20
          Top = 225
          Width = 110
          Height = 21
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'CEP:'
          MaxLength = 9
          TabOrder = 7
          Text = '     .................'
          Required = False
          EditMask = '#####.###;0;_'
          MaskState = [msMasked, msReEnter]
        end
        object EditTelefone: TLabeledMaskEdit
          Left = 19
          Top = 274
          Width = 114
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone:'
          MaxLength = 13
          TabOrder = 10
          Text = '((()()()-()-()-()-()-()-()-()-()-()-()-()-()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object MemoObservacao: TLabeledMemo
          Left = 19
          Top = 365
          Width = 815
          Height = 60
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 13
          MemoLabel.Width = 62
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Observa'#231#227'o:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 863
    ExplicitWidth = 863
    inherited BotaoSair: TSpeedButton
      Left = 759
      ExplicitLeft = 759
    end
    inherited BotaoExportar: TSpeedButton
      Left = 659
      ExplicitLeft = 815
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 559
      ExplicitLeft = 715
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 449
      ExplicitLeft = 605
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 459
      ExplicitLeft = 615
    end
  end
end
