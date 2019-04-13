inherited FSocio: TFSocio
  Left = 318
  Top = 128
  Caption = 'Socio'
  ClientHeight = 536
  ClientWidth = 913
  ExplicitLeft = 318
  ExplicitTop = 128
  ExplicitWidth = 921
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 913
    Height = 505
    ActivePage = PaginaEdits
    ExplicitWidth = 913
    ExplicitHeight = 505
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 905
      ExplicitHeight = 477
      inherited PanelGrid: TPanel
        Width = 905
        Height = 477
        ExplicitWidth = 905
        ExplicitHeight = 477
        inherited Grid: TJvDBUltimGrid
          Width = 905
          Height = 425
        end
        inherited PanelFiltroRapido: TPanel
          Top = 425
          Width = 905
          ExplicitTop = 425
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
      ExplicitHeight = 477
      inherited PanelEdits: TPanel
        Width = 905
        Height = 477
        ExplicitWidth = 905
        ExplicitHeight = 477
        object PageControlSocio: TPageControl
          Left = 10
          Top = 251
          Width = 883
          Height = 213
          ActivePage = tsDependente
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object tsDependente: TTabSheet
            Caption = 'Dependentes'
            ExplicitWidth = 887
            object PanelDependente: TPanel
              Left = 0
              Top = 0
              Width = 875
              Height = 185
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 887
              object GridDependente: TDBGrid
                Left = 1
                Top = 1
                Width = 873
                Height = 183
                Align = alClient
                DataSource = DSSocioDependente
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = GridDependenteKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Nome'
                    Width = 400
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_TIPO_RELACIONAMENTO'
                    Title.Caption = 'Id Relacionamento [F1]'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_RELACIONAMENTO.NOME'
                    Title.Caption = 'Nome Relacionamento'
                    Width = 400
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_NASCIMENTO'
                    Title.Caption = 'Data Nascimento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_INICIO_DEPENDENCIA'
                    Title.Caption = 'Inicio Depend'#234'ncia'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_FIM_DEPENDENCIA'
                    Title.Caption = 'Fim Depend'#234'ncia'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CPF'
                    Width = 100
                    Visible = True
                  end>
              end
            end
          end
          object TabSheetParticipacaoSocietaria: TTabSheet
            Caption = 'Participa'#231#227'o Societ'#225'ria'
            ImageIndex = 1
            ExplicitWidth = 887
            object PanelParticipacaoSocietaria: TPanel
              Left = 0
              Top = 0
              Width = 875
              Height = 185
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 887
              object GridParticipacaoSocietaria: TDBGrid
                Left = 1
                Top = 1
                Width = 873
                Height = 183
                Align = alClient
                DataSource = DSParticipacaoSocietaria
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = GridParticipacaoSocietariaKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CNPJ'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RAZAO_SOCIAL'
                    Title.Caption = 'Raz'#227'o Social'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_ENTRADA'
                    Title.Caption = 'Data Entrada'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_SAIDA'
                    Title.Caption = 'Data Sa'#237'da'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARTICIPACAO'
                    Title.Caption = 'Participa'#231#227'o no Capital'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DIRIGENTE'
                    PickList.Strings = (
                      'S - Sim'
                      'N - N'#227'o')
                    Title.Caption = 'Dirigente [S/N]'
                    Visible = True
                  end>
              end
            end
          end
        end
        object PanelDados: TPanel
          Left = 10
          Top = 11
          Width = 883
          Height = 229
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            883
            229)
          object EditIdPessoa: TLabeledCalcEdit
            Left = 8
            Top = 22
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
          object EditPessoa: TLabeledEdit
            Left = 69
            Top = 22
            Width = 803
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
          object EditIdQuadroSocietario: TLabeledCalcEdit
            Left = 8
            Top = 65
            Width = 114
            Height = 21
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnExit = EditIdQuadroSocietarioExit
            OnKeyDown = EditIdQuadroSocietarioKeyDown
            OnKeyPress = EditIdQuadroSocietarioKeyPress
            CalcEditLabel.Width = 113
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Quadro Societ'#225'rio [F1]:'
          end
          object EditCep: TLabeledMaskEdit
            Left = 128
            Top = 65
            Width = 87
            Height = 21
            Color = clWhite
            EditLabel.Width = 23
            EditLabel.Height = 13
            EditLabel.Caption = 'Cep:'
            MaxLength = 9
            TabOrder = 3
            Required = False
            EditMask = '#####-###;0;_'
            MaskState = [msMasked]
          end
          object EditLogradouro: TLabeledEdit
            Left = 221
            Top = 65
            Width = 651
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 59
            EditLabel.Height = 13
            EditLabel.Caption = 'Logradouro:'
            TabOrder = 4
          end
          object EditComplemento: TLabeledEdit
            Left = 8
            Top = 108
            Width = 315
            Height = 21
            EditLabel.Width = 69
            EditLabel.Height = 13
            EditLabel.Caption = 'Complemento:'
            TabOrder = 5
          end
          object EditMunicipio: TLabeledEdit
            Left = 8
            Top = 151
            Width = 212
            Height = 21
            EditLabel.Width = 47
            EditLabel.Height = 13
            EditLabel.Caption = 'Municipio:'
            TabOrder = 8
          end
          object EditUf: TLabeledEdit
            AlignWithMargins = True
            Left = 226
            Top = 151
            Width = 29
            Height = 21
            Anchors = [akTop]
            EditLabel.Width = 13
            EditLabel.Height = 13
            EditLabel.Caption = 'UF'
            MaxLength = 2
            TabOrder = 9
          end
          object EditFone: TLabeledMaskEdit
            Left = 261
            Top = 151
            Width = 90
            Height = 21
            Color = clWhite
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = 'Telefone:'
            MaxLength = 13
            TabOrder = 10
            Text = '((()()()-()-()-()-()- )- )-  -  -'
            Required = False
            EditMask = '(##)####-####;0;_'
            MaskState = [msMasked]
          end
          object EditCelular: TLabeledMaskEdit
            Left = 357
            Top = 151
            Width = 98
            Height = 21
            Color = clWhite
            EditLabel.Width = 37
            EditLabel.Height = 13
            EditLabel.Caption = 'Celular:'
            MaxLength = 13
            TabOrder = 11
            Text = '((()()()-()-()-()-()-()-()-()- )- )-  -  -'
            Required = False
            EditMask = '(##)####-####;0;_'
            MaskState = [msMasked]
          end
          object EditEmail: TLabeledEdit
            Left = 461
            Top = 151
            Width = 411
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 32
            EditLabel.Height = 13
            EditLabel.Caption = 'E-mail:'
            TabOrder = 12
          end
          object EditBairro: TLabeledEdit
            Left = 424
            Top = 108
            Width = 448
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 32
            EditLabel.Height = 13
            EditLabel.Caption = 'Bairro:'
            TabOrder = 7
          end
          object EditNumero: TLabeledCalcEdit
            Left = 329
            Top = 108
            Width = 89
            Height = 21
            ShowButton = False
            TabOrder = 6
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 41
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'N'#250'mero:'
          end
          object EditDataIngresso: TLabeledDateEdit
            Left = 8
            Top = 195
            Width = 118
            Height = 21
            TabOrder = 13
            DateEditLabel.Width = 72
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Ingresso:'
          end
          object EditDataSaida: TLabeledDateEdit
            Left = 132
            Top = 195
            Width = 118
            Height = 21
            TabOrder = 14
            DateEditLabel.Width = 56
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Sa'#237'da:'
          end
          object EditParticipacao: TLabeledCalcEdit
            Left = 256
            Top = 194
            Width = 130
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 15
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 62
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Participa'#231#227'o:'
          end
          object EditQuotas: TLabeledCalcEdit
            Left = 528
            Top = 194
            Width = 130
            Height = 21
            DisplayFormat = '#,###,##0'
            ShowButton = False
            TabOrder = 17
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 39
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Quotas:'
          end
          object EditIntegralizar: TLabeledCalcEdit
            Left = 392
            Top = 194
            Width = 130
            Height = 21
            DisplayFormat = '#,###,##0.00'
            TabOrder = 16
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 95
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor a Integralizar:'
          end
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
  object CDSSocioDependente: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_SOCIO'
        DataType = ftInteger
      end
      item
        Name = 'ID_TIPO_RELACIONAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_NASCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_INICIO_DEPENDENCIA'
        DataType = ftDate
      end
      item
        Name = 'DATA_FIM_DEPENDENCIA'
        DataType = ftDate
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'TIPO_RELACIONAMENTO.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Persiste'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSSocioDependenteAfterEdit
    Left = 656
    Top = 400
    Data = {
      250100009619E0BD01000000180000000A000000000003000000250102494404
      000100000000000849445F534F43494F04000100000000001649445F5449504F
      5F52454C4143494F4E414D454E544F0400010000000000044E4F4D4501004900
      000001000557494454480200020064000F444154415F4E415343494D454E544F
      040006000000000017444154415F494E4943494F5F444550454E44454E434941
      040006000000000014444154415F46494D5F444550454E44454E434941040006
      0000000000034350460100490000000100055749445448020002000B00185449
      504F5F52454C4143494F4E414D454E544F2E4E4F4D4501004900000001000557
      4944544802000200640008506572736973746501004900000001000557494454
      480200020001000000}
    object CDSSocioDependenteID: TIntegerField
      FieldName = 'ID'
    end
    object CDSSocioDependenteID_SOCIO: TIntegerField
      FieldName = 'ID_SOCIO'
    end
    object CDSSocioDependenteID_TIPO_RELACIONAMENTO: TIntegerField
      FieldName = 'ID_TIPO_RELACIONAMENTO'
    end
    object CDSSocioDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CDSSocioDependenteDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      EditMask = '##/##/####'
    end
    object CDSSocioDependenteDATA_INICIO_DEPENDENCIA: TDateField
      FieldName = 'DATA_INICIO_DEPENDENCIA'
      EditMask = '##/##/####'
    end
    object CDSSocioDependenteDATA_FIM_DEPENDENCIA: TDateField
      FieldName = 'DATA_FIM_DEPENDENCIA'
      EditMask = '##/##/####'
    end
    object CDSSocioDependenteCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;'
      Size = 11
    end
    object CDSSocioDependentePersiste: TStringField
      FieldName = 'Persiste'
      Size = 1
    end
    object CDSSocioDependenteTIPO_RELACIONAMENTONOME: TStringField
      FieldName = 'TIPO_RELACIONAMENTO.NOME'
      Size = 100
    end
  end
  object DSSocioDependente: TDataSource
    DataSet = CDSSocioDependente
    Left = 656
    Top = 464
  end
  object CDSParticipacaoSocietaria: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_SOCIO'
        DataType = ftInteger
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_ENTRADA'
        DataType = ftDate
      end
      item
        Name = 'DATA_SAIDA'
        DataType = ftDate
      end
      item
        Name = 'PARTICIPACAO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'DIRIGENTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSParticipacaoSocietariaAfterEdit
    Left = 808
    Top = 408
    Data = {
      030100009619E0BD020000001800000009000000000003000000030102494404
      000100000000000849445F534F43494F040001000000000004434E504A010049
      0000000100055749445448020002000E000C52415A414F5F534F4349414C0100
      4900000001000557494454480200020064000C444154415F454E545241444104
      000600000000000A444154415F534149444104000600000000000C5041525449
      4349504143414F0B0012000000020008444543494D414C530200020006000557
      49445448020002001200094449524947454E5445010049000000010005574944
      5448020002000100085045525349535445010049000000010005574944544802
      00020001000000}
    object CDSParticipacaoSocietariaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSParticipacaoSocietariaID_SOCIO: TIntegerField
      FieldName = 'ID_SOCIO'
    end
    object CDSParticipacaoSocietariaCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;'
      Size = 14
    end
    object CDSParticipacaoSocietariaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object CDSParticipacaoSocietariaDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      EditMask = '##/##/####'
    end
    object CDSParticipacaoSocietariaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      EditMask = '##/##/####'
    end
    object CDSParticipacaoSocietariaPARTICIPACAO: TFMTBCDField
      FieldName = 'PARTICIPACAO'
      EditFormat = '#,###,##0.00'
      Precision = 18
      Size = 6
    end
    object CDSParticipacaoSocietariaDIRIGENTE: TStringField
      FieldName = 'DIRIGENTE'
      Size = 1
    end
    object CDSParticipacaoSocietariaPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSParticipacaoSocietaria: TDataSource
    DataSet = CDSParticipacaoSocietaria
    Left = 800
    Top = 464
  end
end
