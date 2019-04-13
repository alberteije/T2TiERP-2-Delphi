inherited FPcpInstrucao: TFPcpInstrucao
  Caption = 'Instru'#231#227'o'
  ExplicitWidth = 1008
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = PaginaEdits
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 407
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        ParentBackground = False
        object Bevel1: TBevel
          AlignWithMargins = True
          Left = 7
          Top = 7
          Width = 970
          Height = 74
          Align = alTop
        end
        object EditDescricao: TLabeledEdit
          Left = 85
          Top = 34
          Width = 884
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o:'
          MaxLength = 100
          TabOrder = 0
        end
        object EditCodigo: TLabeledEdit
          Left = 15
          Top = 34
          Width = 66
          Height = 21
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo:'
          MaxLength = 100
          TabOrder = 1
        end
      end
    end
  end
end
