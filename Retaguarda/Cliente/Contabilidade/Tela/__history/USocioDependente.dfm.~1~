inherited FSocioDependente: TFSocioDependente
  Left = 318
  Top = 203
  Caption = 'Dependentes dos S'#243'cios'
  ClientWidth = 961
  ExplicitWidth = 969
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 961
    ActivePage = PaginaEdits
    ExplicitWidth = 961
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 953
      ExplicitHeight = 395
      inherited PanelGrid: TPanel
        Width = 953
        ExplicitWidth = 953
        inherited Grid: TJvDBUltimGrid
          Width = 953
        end
        inherited PanelFiltroRapido: TPanel
          Width = 953
          ExplicitWidth = 953
          inherited BotaoConsultar: TSpeedButton
            Left = 821
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 652
            ExplicitWidth = 652
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 953
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Width = 953
        ExplicitWidth = 953
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 932
          Height = 248
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditDependente: TLabeledEdit
          Left = 18
          Top = 137
          Width = 913
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 108
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do Dependente:'
          TabOrder = 2
        end
        object EditIdSocio: TLabeledEdit
          Left = 18
          Top = 38
          Width = 32
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'S'#243'cio [F1]:'
          MaxLength = 100
          TabOrder = 0
          OnExit = EditIdSocioExit
          OnKeyDown = EditIdSocioKeyDown
        end
        object EditIdRelacionamento: TLabeledEdit
          Left = 18
          Top = 86
          Width = 32
          Height = 21
          EditLabel.Width = 126
          EditLabel.Height = 13
          EditLabel.Caption = 'Tipo Relacionamento [F1]:'
          MaxLength = 100
          TabOrder = 1
          OnExit = EditIdRelacionamentoExit
          OnKeyDown = EditIdRelacionamentoKeyDown
        end
        object EditCPF: TLabeledMaskEdit
          Left = 18
          Top = 188
          Width = 111
          Height = 21
          Color = clWhite
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'CPF:'
          MaxLength = 14
          TabOrder = 3
          Text = 
            '   ........-..-..-..-..-..-..-..-..-..-..-..-..-..-..-..-..-..-.' +
            '.-..-..-. -. -. -. -  -'
          OnExit = EditCPFExit
          Required = False
          EditMask = '###.###.###-##;0;_'
          MaskState = []
        end
        object EditNascimento: TLabeledDateEdit
          Left = 151
          Top = 188
          Width = 99
          Height = 21
          TabOrder = 4
          DateEditLabel.Width = 59
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Nascimento:'
        end
        object EditInicioDependencia: TLabeledDateEdit
          Left = 278
          Top = 188
          Width = 107
          Height = 21
          TabOrder = 5
          DateEditLabel.Width = 109
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Inicio da Depend'#234'ncia:'
        end
        object EditFimDependencia: TLabeledDateEdit
          Left = 414
          Top = 188
          Width = 107
          Height = 21
          TabOrder = 6
          DateEditLabel.Width = 100
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Fim da Depend'#234'ncia:'
        end
        object EditSocio: TLabeledEdit
          Left = 48
          Top = 38
          Width = 883
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
        object EditRelacionamento: TLabeledEdit
          Left = 48
          Top = 86
          Width = 883
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          EditLabel.Width = 6
          EditLabel.Height = 13
          EditLabel.Caption = '  '
          ReadOnly = True
          TabOrder = 8
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 961
    ExplicitWidth = 961
    inherited BotaoSair: TSpeedButton
      Left = 857
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 757
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 647
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 747
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 547
      ExplicitLeft = 639
    end
  end
end
