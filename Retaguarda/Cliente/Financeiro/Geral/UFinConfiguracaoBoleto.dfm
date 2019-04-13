inherited FFinConfiguracaoBoleto: TFFinConfiguracaoBoleto
  Left = 318
  Top = 144
  Caption = 'Configura'#231#245'es do Boleto Banc'#225'rio'
  ClientHeight = 510
  ClientWidth = 988
  ExplicitWidth = 1004
  ExplicitHeight = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    Height = 479
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 479
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      ExplicitHeight = 451
      inherited PanelGrid: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        inherited Grid: TJvDBUltimGrid
          Width = 980
          Height = 399
        end
        inherited PanelFiltroRapido: TPanel
          Top = 399
          Width = 980
          ExplicitTop = 399
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
      ExplicitWidth = 980
      inherited PanelEdits: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        object PanelParcelas: TPanel
          Left = 4
          Top = 4
          Width = 972
          Height = 443
          Align = alClient
          TabOrder = 1
        end
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 362
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            362)
          object SpeedButton1: TSpeedButton
            Left = 533
            Top = 108
            Width = 23
            Height = 24
            Caption = '...'
            Flat = True
            OnClick = SpeedButton1Click
          end
          object SpeedButton2: TSpeedButton
            Left = 920
            Top = 108
            Width = 23
            Height = 24
            Anchors = [akTop, akRight]
            Caption = '...'
            Flat = True
            OnClick = SpeedButton2Click
          end
          object SpeedButton3: TSpeedButton
            Left = 533
            Top = 151
            Width = 23
            Height = 24
            Caption = '...'
            Flat = True
            OnClick = SpeedButton3Click
          end
          object SpeedButton4: TSpeedButton
            Left = 920
            Top = 151
            Width = 23
            Height = 24
            Anchors = [akTop, akRight]
            Caption = '...'
            Flat = True
            OnClick = SpeedButton4Click
          end
          object EditInstrucao01: TLabeledEdit
            Left = 9
            Top = 67
            Width = 547
            Height = 21
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = 'Instru'#231#227'o 01:'
            TabOrder = 2
          end
          object EditTaxaMulta: TLabeledCalcEdit
            Left = 759
            Top = 328
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 16
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 57
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Multa:'
          end
          object EditIdContaCaixa: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdContaCaixaKeyUp
            CalcEditLabel.Width = 87
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Conta/Caixa [F1]:'
          end
          object EditContaCaixa: TLabeledEdit
            Left = 70
            Top = 24
            Width = 873
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
          object EditInstrucao02: TLabeledEdit
            Left = 562
            Top = 67
            Width = 381
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = 'Instru'#231#227'o 02:'
            TabOrder = 3
          end
          object EditCaminhoArquivoRemessa: TLabeledEdit
            Left = 9
            Top = 110
            Width = 518
            Height = 21
            EditLabel.Width = 161
            EditLabel.Height = 13
            EditLabel.Caption = 'Caminho do Arquivo de Remessa:'
            TabOrder = 4
          end
          object EditCaminhoArquivoRetorno: TLabeledEdit
            Left = 562
            Top = 110
            Width = 352
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 157
            EditLabel.Height = 13
            EditLabel.Caption = 'Caminho do Arquivo de Retorno:'
            TabOrder = 5
          end
          object EditCaminhoArquivoLogotipoBanco: TLabeledEdit
            Left = 9
            Top = 154
            Width = 518
            Height = 21
            EditLabel.Width = 206
            EditLabel.Height = 13
            EditLabel.Caption = 'Caminho do Arquivo de Logotipo do Banco:'
            TabOrder = 6
          end
          object EditCaminhoArquivoPdfBoleto: TLabeledEdit
            Left = 562
            Top = 154
            Width = 352
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 243
            EditLabel.Height = 13
            EditLabel.Caption = 'Caminho do Arquivo de Gera'#231#227'o do PDF do Boleto:'
            TabOrder = 7
          end
          object MemoMensagem: TLabeledMemo
            Left = 9
            Top = 200
            Width = 934
            Height = 57
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            MemoLabel.Width = 55
            MemoLabel.Height = 13
            MemoLabel.Caption = 'Mensagem:'
          end
          object EditLocalPagamento: TLabeledEdit
            Left = 9
            Top = 280
            Width = 934
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 85
            EditLabel.Height = 13
            EditLabel.Caption = 'Local Pagamento:'
            TabOrder = 9
          end
          object ComboBoxLayoutRemessa: TLabeledComboBox
            Left = 9
            Top = 328
            Width = 79
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 10
            Text = '240'
            Items.Strings = (
              '240'
              '400')
            ComboBoxLabel.Width = 67
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Layout CNAB:'
          end
          object ComboBoxAceite: TLabeledComboBox
            Left = 94
            Top = 328
            Width = 79
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 11
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 34
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Aceite:'
          end
          object ComboBoxEspecie: TLabeledComboBox
            Left = 179
            Top = 328
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 12
            Text = 'DM-Duplicata Mercantil'
            Items.Strings = (
              'DM-Duplicata Mercantil'
              'DS-Duplicata de Servi'#231'os'
              'RC-Recibo'
              'NP-Nota Promiss'#243'ria')
            ComboBoxLabel.Width = 40
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Esp'#233'cie:'
          end
          object EditCarteira: TLabeledEdit
            Left = 335
            Top = 328
            Width = 66
            Height = 21
            EditLabel.Width = 43
            EditLabel.Height = 13
            EditLabel.Caption = 'Carteira:'
            MaxLength = 3
            TabOrder = 13
          end
          object EditCodigoConvenio: TLabeledEdit
            Left = 407
            Top = 328
            Width = 170
            Height = 21
            EditLabel.Width = 85
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo Conv'#234'nio:'
            MaxLength = 20
            TabOrder = 14
          end
          object EditCodigoCedente: TLabeledEdit
            Left = 583
            Top = 328
            Width = 170
            Height = 21
            EditLabel.Width = 81
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo Cedente:'
            MaxLength = 20
            TabOrder = 15
          end
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
