inherited FFinChequeRecebido: TFFinChequeRecebido
  Left = 318
  Top = 144
  Caption = 'Cust'#243'dia de Cheques'
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 980
      ExplicitHeight = 451
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
          ExplicitLeft = 0
        end
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 269
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            269)
          object EditCpfCnpj: TLabeledEdit
            Left = 9
            Top = 67
            Width = 176
            Height = 21
            EditLabel.Width = 58
            EditLabel.Height = 13
            EditLabel.Caption = 'CPF / CNPJ:'
            TabOrder = 2
          end
          object EditValor: TLabeledCalcEdit
            Left = 9
            Top = 238
            Width = 132
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 13
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 67
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Original:'
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
          object EditNome: TLabeledEdit
            Left = 191
            Top = 67
            Width = 752
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 31
            EditLabel.Height = 13
            EditLabel.Caption = 'Nome:'
            TabOrder = 3
          end
          object EditCodigoBanco: TLabeledEdit
            Left = 9
            Top = 110
            Width = 104
            Height = 21
            EditLabel.Width = 69
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo Banco:'
            TabOrder = 4
          end
          object EditCodigoAgencia: TLabeledEdit
            Left = 119
            Top = 110
            Width = 98
            Height = 21
            EditLabel.Width = 78
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo Ag'#234'ncia:'
            EditLabel.ParentShowHint = False
            EditLabel.ShowHint = True
            TabOrder = 5
          end
          object EditConta: TLabeledEdit
            Left = 223
            Top = 110
            Width = 146
            Height = 21
            EditLabel.Width = 33
            EditLabel.Height = 13
            EditLabel.Caption = 'Conta:'
            TabOrder = 6
          end
          object EditNumero: TLabeledCalcEdit
            Left = 375
            Top = 110
            Width = 90
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = ',0'
            ShowButton = False
            TabOrder = 7
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 41
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'N'#250'mero:'
          end
          object EditDataEmissao: TLabeledDateEdit
            Left = 471
            Top = 110
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 8
            DateEditLabel.Width = 68
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Emiss'#227'o:'
          end
          object EditBomPara: TLabeledDateEdit
            Left = 598
            Top = 110
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 9
            DateEditLabel.Width = 49
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Bom Para:'
          end
          object EditDataCompensacao: TLabeledDateEdit
            Left = 725
            Top = 110
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 10
            DateEditLabel.Width = 71
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Compensa'#231#227'o:'
          end
          object GroupBox1: TGroupBox
            Left = 9
            Top = 137
            Width = 400
            Height = 72
            Caption = 'Cust'#243'dia:'
            TabOrder = 11
            object EditCustodiaData: TLabeledDateEdit
              Left = 11
              Top = 36
              Width = 121
              Height = 21
              ShowNullDate = False
              TabOrder = 0
              DateEditLabel.Width = 27
              DateEditLabel.Height = 13
              DateEditLabel.Caption = 'Data:'
            end
            object EditCustodiaTarifa: TLabeledCalcEdit
              Left = 138
              Top = 36
              Width = 121
              Height = 21
              DisplayFormat = '###,###,##0.00'
              ShowButton = False
              TabOrder = 1
              DecimalPlacesAlwaysShown = False
              CalcEditLabel.Width = 32
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Tarifa:'
            end
            object EditCustodiaComissao: TLabeledCalcEdit
              Left = 265
              Top = 36
              Width = 121
              Height = 21
              DisplayFormat = '###,###,##0.00'
              ShowButton = False
              TabOrder = 2
              DecimalPlacesAlwaysShown = False
              CalcEditLabel.Width = 49
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Comiss'#227'o:'
            end
          end
          object GroupBox2: TGroupBox
            Left = 415
            Top = 137
            Width = 400
            Height = 72
            Caption = 'Desconto:'
            TabOrder = 12
            object EditDescontoData: TLabeledDateEdit
              Left = 11
              Top = 36
              Width = 121
              Height = 21
              ShowNullDate = False
              TabOrder = 0
              DateEditLabel.Width = 27
              DateEditLabel.Height = 13
              DateEditLabel.Caption = 'Data:'
            end
            object EditDescontoTarifa: TLabeledCalcEdit
              Left = 138
              Top = 36
              Width = 121
              Height = 21
              DisplayFormat = '###,###,##0.00'
              ShowButton = False
              TabOrder = 1
              DecimalPlacesAlwaysShown = False
              CalcEditLabel.Width = 32
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Tarifa:'
            end
            object EditDescontoComissao: TLabeledCalcEdit
              Left = 265
              Top = 36
              Width = 121
              Height = 21
              DisplayFormat = '###,###,##0.00'
              ShowButton = False
              TabOrder = 2
              DecimalPlacesAlwaysShown = False
              CalcEditLabel.Width = 49
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Comiss'#227'o:'
            end
          end
          object EditValorRecebido: TLabeledCalcEdit
            Left = 147
            Top = 238
            Width = 132
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 14
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 75
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Recebido:'
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
