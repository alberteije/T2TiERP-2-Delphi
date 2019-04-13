inherited FFolhaRescisao: TFFolhaRescisao
  Tag = 1
  Caption = 'Folha Rescis'#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = PaginaEdits
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 991
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        object BevelEdits: TBevel
          Left = 10
          Top = 12
          Width = 965
          Height = 224
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 16
          Top = 35
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnExit = EditIdColaboradorExit
          OnKeyDown = EditIdColaboradorKeyDown
          OnKeyPress = EditIdColaboradorKeyPress
          CalcEditLabel.Width = 63
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Colaborador:'
        end
        object EditColaborador: TLabeledEdit
          Left = 77
          Top = 35
          Width = 890
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
        object EditDataDemissao: TLabeledDateEdit
          Left = 16
          Top = 121
          Width = 110
          Height = 21
          TabOrder = 3
          DateEditLabel.Width = 75
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Demiss'#227'o:'
        end
        object EditDataPagamento: TLabeledDateEdit
          Left = 132
          Top = 121
          Width = 110
          Height = 21
          TabOrder = 4
          DateEditLabel.Width = 84
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Pagamento:'
        end
        object EditDiasAvisoPrevio: TLabeledCalcEdit
          Left = 364
          Top = 121
          Width = 98
          Height = 21
          ShowButton = False
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Dias Aviso Pr'#233'vio:'
        end
        object EditDataAvisoPrevio: TLabeledDateEdit
          Left = 248
          Top = 121
          Width = 110
          Height = 21
          TabOrder = 5
          DateEditLabel.Width = 63
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Aviso Pr'#233'vio:'
        end
        object ComboBoxComprovouNovoEmprego: TLabeledComboBox
          Left = 468
          Top = 121
          Width = 138
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 7
          Text = 'Sim'
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ComboBoxLabel.Width = 132
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Comprovou Novo Emprego:'
        end
        object ComboBoxDispensouEmpregado: TLabeledComboBox
          Left = 612
          Top = 121
          Width = 122
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 8
          Text = 'Sim'
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ComboBoxLabel.Width = 115
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Dispensou Colaborador:'
        end
        object EditMotivo: TLabeledEdit
          Left = 16
          Top = 78
          Width = 951
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Motivo:'
          TabOrder = 2
        end
        object EditPensaoAlimenticia: TLabeledCalcEdit
          Left = 740
          Top = 121
          Width = 123
          Height = 21
          DisplayFormat = '###,###,##0.00'
          Anchors = [akTop, akRight]
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 114
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Pens'#227'o Aliment'#237'cia (%):'
        end
        object EditPensaoAlimenticiaFgts: TLabeledCalcEdit
          Left = 869
          Top = 121
          Width = 98
          Height = 21
          DisplayFormat = '###,###,##0.00'
          Anchors = [akTop, akRight]
          TabOrder = 10
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 86
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Pens'#227'o FGTS(%):'
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 156
          Width = 951
          Height = 69
          Anchors = [akLeft, akTop, akRight]
          Caption = 'FGTS:'
          TabOrder = 11
          object EditFgtsValorRescisao: TLabeledCalcEdit
            Left = 10
            Top = 35
            Width = 123
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 73
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Rescis'#227'o:'
          end
          object EditFgtsSaldoBanco: TLabeledCalcEdit
            Left = 139
            Top = 35
            Width = 123
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 62
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Saldo Banco:'
          end
          object EditFgtsComplementoSaldo: TLabeledCalcEdit
            Left = 268
            Top = 35
            Width = 123
            Height = 21
            DisplayFormat = '###,###,##0.00'
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 98
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Complemento Saldo:'
          end
          object EditFgtsCodigoAfastamento: TLabeledEdit
            Left = 397
            Top = 35
            Width = 105
            Height = 21
            EditLabel.Width = 102
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo Afastamento:'
            TabOrder = 3
          end
          object EditFgtsCodigoSaque: TLabeledEdit
            Left = 508
            Top = 35
            Width = 105
            Height = 21
            EditLabel.Width = 70
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo Saque:'
            TabOrder = 4
          end
        end
      end
    end
  end
end
