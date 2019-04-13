inherited FGedTipoDocumento: TFGedTipoDocumento
  Caption = 'Tipo de Documento'
  ExplicitWidth = 1008
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = PaginaEdits
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        object BevelEdits: TBevel
          Left = 10
          Top = 12
          Width = 969
          Height = 102
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditNome: TLabeledEdit
          Left = 18
          Top = 35
          Width = 951
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 0
        end
        object EditTamanhoMaximo: TLabeledCalcEdit
          Left = 18
          Top = 80
          Width = 119
          Height = 21
          DisplayFormat = ',0.000'
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 112
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Tamanho M'#225'ximo (MB):'
        end
      end
    end
  end
end
