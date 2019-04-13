inherited FEntradaNF: TFEntradaNF
  Left = 332
  Top = 134
  Caption = 'Entrada de Nota Fiscal'
  ClientHeight = 576
  ClientWidth = 1041
  ExplicitWidth = 1057
  ExplicitHeight = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1041
    Height = 545
    ActivePage = PaginaEdits
    ExplicitWidth = 1041
    ExplicitHeight = 545
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 1033
      ExplicitHeight = 517
      inherited PanelGrid: TPanel
        Width = 1033
        Height = 517
        ExplicitWidth = 1033
        ExplicitHeight = 517
        inherited Grid: TJvDBUltimGrid
          Width = 1033
          Height = 465
        end
        inherited PanelFiltroRapido: TPanel
          Top = 465
          Width = 1033
          ExplicitTop = 465
          ExplicitWidth = 1033
          inherited BotaoConsultar: TSpeedButton
            Left = 901
            ExplicitLeft = 896
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 732
            ExplicitWidth = 732
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1033
      ExplicitHeight = 517
      inherited PanelEdits: TPanel
        Width = 1033
        Height = 517
        ExplicitWidth = 1033
        ExplicitHeight = 517
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 1025
          Height = 509
          Align = alClient
          TabOrder = 0
          object BevelEdits: TBevel
            Left = 0
            Top = 30
            Width = 1021
            Height = 362
            Align = alClient
            ExplicitLeft = 312
            ExplicitTop = 112
            ExplicitWidth = 50
            ExplicitHeight = 50
          end
          object ActionToolBarEdits: TActionToolBar
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1015
            Height = 24
            ActionManager = ActionManager
            BiDiMode = bdRightToLeft
            Caption = 'ActionToolBarEdits'
            ColorMap.MenuColor = clMenu
            ColorMap.BtnSelectedColor = clBtnFace
            ColorMap.UnusedColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Orientation = boRightToLeft
            ParentBiDiMode = False
            ParentFont = False
            Spacing = 0
          end
          object PageControlEdits: TPageControl
            Left = 0
            Top = 30
            Width = 1021
            Height = 362
            ActivePage = TabSheetDadosNotaFiscal
            Align = alClient
            TabOrder = 1
            object TabSheetDadosNotaFiscal: TTabSheet
              Caption = 'Dados da NF'
              object PanelDadosNotaFiscal: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                Ctl3D = True
                UseDockManager = False
                DoubleBuffered = False
                FullRepaint = False
                ParentBiDiMode = False
                ParentBackground = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ShowCaption = False
                TabOrder = 0
                DesignSize = (
                  1013
                  334)
                object EditNumeroNfe: TLabeledEdit
                  Left = 566
                  Top = 66
                  Width = 84
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 41
                  EditLabel.Height = 13
                  EditLabel.Caption = 'N'#250'mero:'
                  TabOrder = 8
                end
                object EditSerie: TLabeledEdit
                  Left = 498
                  Top = 66
                  Width = 62
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 28
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Serie:'
                  TabOrder = 7
                end
                object EditNaturezaOperacao: TLabeledEdit
                  Left = 764
                  Top = 23
                  Width = 239
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  EditLabel.Width = 113
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Natureza da Opera'#231#227'o:'
                  TabOrder = 3
                end
                object GroupBoxEmitente: TGroupBox
                  Left = 8
                  Top = 136
                  Width = 995
                  Height = 191
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Emitente:'
                  TabOrder = 17
                  DesignSize = (
                    995
                    191)
                  object EditEmitenteCpfCnpj: TLabeledEdit
                    Left = 69
                    Top = 32
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 1
                  end
                  object EditEmitenteFantasia: TLabeledEdit
                    Left = 678
                    Top = 32
                    Width = 307
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 45
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Fantasia:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                  object EditEmitenteIE: TLabeledEdit
                    Left = 672
                    Top = 115
                    Width = 138
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 91
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Inscri'#231#227'o Estadual:'
                    MaxLength = 14
                    TabOrder = 12
                  end
                  object EditEmitenteTelefone: TLabeledEdit
                    Left = 816
                    Top = 115
                    Width = 169
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 46
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Telefone:'
                    MaxLength = 14
                    TabOrder = 13
                  end
                  object EditEmitenteLogradouro: TLabeledEdit
                    Left = 87
                    Top = 73
                    Width = 478
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 5
                  end
                  object EditEmitenteNumero: TLabeledEdit
                    Left = 571
                    Top = 73
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 41
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Numero:'
                    MaxLength = 60
                    TabOrder = 6
                  end
                  object EditEmitenteBairro: TLabeledEdit
                    Left = 9
                    Top = 115
                    Width = 200
                    Height = 21
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Bairro:'
                    MaxLength = 60
                    TabOrder = 8
                  end
                  object EditEmitenteCEP: TLabeledEdit
                    Left = 9
                    Top = 73
                    Width = 72
                    Height = 21
                    EditLabel.Width = 23
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CEP:'
                    MaxLength = 8
                    TabOrder = 4
                  end
                  object EditEmitenteCidade: TLabeledEdit
                    Left = 284
                    Top = 115
                    Width = 337
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 10
                  end
                  object EditEmitenteUF: TLabeledEdit
                    Left = 627
                    Top = 115
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 11
                  end
                  object EditEmitenteComplemento: TLabeledEdit
                    Left = 677
                    Top = 73
                    Width = 308
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 69
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Complemento:'
                    MaxLength = 60
                    TabOrder = 7
                  end
                  object EditEmitenteRazao: TLabeledEdit
                    Left = 211
                    Top = 32
                    Width = 461
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 105
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Raz'#227'o Social / Nome::'
                    MaxLength = 60
                    TabOrder = 2
                  end
                  object EditEmitenteEmail: TLabeledEdit
                    Left = 543
                    Top = 159
                    Width = 395
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'E-Mail:'
                    MaxLength = 14
                    TabOrder = 18
                  end
                  object EditEmitenteTipo: TLabeledEdit
                    Left = 944
                    Top = 159
                    Width = 41
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 24
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Tipo:'
                    MaxLength = 2
                    TabOrder = 19
                  end
                  object ComboEmitenteCrt: TLabeledComboBox
                    Left = 9
                    Top = 158
                    Width = 152
                    Height = 22
                    Style = csOwnerDrawFixed
                    ItemIndex = 0
                    TabOrder = 14
                    Text = '1 - Simples Nacional'
                    Items.Strings = (
                      '1 - Simples Nacional'
                      '2 - Simples Nac - Excesso'
                      '3 - Regime Normal')
                    ComboBoxLabel.Width = 24
                    ComboBoxLabel.Height = 13
                    ComboBoxLabel.Caption = 'CRT:'
                  end
                  object EditEmitenteId: TLabeledCalcEdit
                    Left = 9
                    Top = 32
                    Width = 54
                    Height = 21
                    ShowButton = False
                    TabOrder = 0
                    DecimalPlacesAlwaysShown = False
                    OnKeyUp = EditEmitenteIdKeyUp
                    CalcEditLabel.Width = 37
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Id [F1]:'
                  end
                  object EditEmitenteIEST: TLabeledEdit
                    Left = 167
                    Top = 159
                    Width = 138
                    Height = 21
                    EditLabel.Width = 106
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Inscri'#231#227'o Estadual ST:'
                    MaxLength = 14
                    TabOrder = 15
                  end
                  object EditEmitenteIM: TLabeledEdit
                    Left = 311
                    Top = 159
                    Width = 138
                    Height = 21
                    EditLabel.Width = 93
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Inscri'#231#227'o Municipal:'
                    MaxLength = 15
                    TabOrder = 16
                  end
                  object EditEmitenteCnae: TLabeledEdit
                    Left = 455
                    Top = 159
                    Width = 82
                    Height = 21
                    EditLabel.Width = 31
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CNAE:'
                    MaxLength = 7
                    TabOrder = 17
                  end
                  object EditEmitenteCodigoIbge: TLabeledEdit
                    Left = 215
                    Top = 115
                    Width = 63
                    Height = 21
                    EditLabel.Width = 49
                    EditLabel.Height = 13
                    EditLabel.Caption = 'C'#243'd IBGE:'
                    MaxLength = 60
                    TabOrder = 9
                  end
                end
                object EditDataEmissao: TLabeledDateEdit
                  Left = 656
                  Top = 66
                  Width = 110
                  Height = 21
                  Anchors = [akTop, akRight]
                  ShowNullDate = False
                  TabOrder = 9
                  DateEditLabel.Width = 83
                  DateEditLabel.Height = 13
                  DateEditLabel.Caption = 'Data de Emiss'#227'o:'
                end
                object EditDataEntradaSaida: TLabeledDateEdit
                  Left = 772
                  Top = 66
                  Width = 110
                  Height = 21
                  Anchors = [akTop, akRight]
                  ShowNullDate = False
                  TabOrder = 10
                  DateEditLabel.Width = 98
                  DateEditLabel.Height = 13
                  DateEditLabel.Caption = 'Data Entrada/Sa'#237'da:'
                end
                object EditHoraEntradaSaida: TLabeledMaskEdit
                  Left = 888
                  Top = 66
                  Width = 115
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 102
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Hora: Entrada/Sa'#237'da:'
                  MaxLength = 8
                  TabOrder = 11
                  Text = 
                    '  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::' +
                    ':::::::::::::::::::::::::::::: : :'
                  Required = False
                  EditMask = '##:##:##;1;_'
                  MaskState = [msMasked]
                end
                object ComboTipoOperacao: TLabeledComboBox
                  Left = 9
                  Top = 108
                  Width = 200
                  Height = 22
                  Style = csOwnerDrawFixed
                  ItemIndex = 0
                  TabOrder = 12
                  Text = '0 - Entrada'
                  Items.Strings = (
                    '0 - Entrada')
                  ComboBoxLabel.Width = 89
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Tipo de Opera'#231#227'o:'
                end
                object ComboTipoEmissao: TLabeledComboBox
                  Left = 215
                  Top = 108
                  Width = 190
                  Height = 22
                  Style = csOwnerDrawFixed
                  ItemIndex = 0
                  TabOrder = 13
                  Text = '1 '#8211' Normal'
                  Items.Strings = (
                    '1 '#8211' Normal'
                    '2 '#8211' Conting'#234'ncia FS'
                    '3 '#8211' Conting'#234'ncia SCAN'
                    '4 '#8211' Conting'#234'ncia DPEC'
                    '5 '#8211' Conting'#234'ncia FS-DA'
                    '6 '#8211' Conting'#234'ncia SVC-AN'
                    '7 '#8211' Conting'#234'ncia SVC-RS')
                  ComboBoxLabel.Width = 80
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Tipo de Emiss'#227'o:'
                end
                object ComboFinalidadeEmissao: TLabeledComboBox
                  Left = 411
                  Top = 108
                  Width = 190
                  Height = 22
                  Style = csOwnerDrawFixed
                  ItemIndex = 0
                  TabOrder = 14
                  Text = '1 - Normal'
                  Items.Strings = (
                    '1 - Normal'
                    '2 - Complementar'
                    '3 - Ajuste')
                  ComboBoxLabel.Width = 108
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Finalidade de Emiss'#227'o:'
                end
                object ComboFormaImpDanfe: TLabeledComboBox
                  Left = 607
                  Top = 108
                  Width = 190
                  Height = 22
                  Style = csOwnerDrawFixed
                  ItemIndex = 0
                  TabOrder = 15
                  Text = '1 - Retrato'
                  Items.Strings = (
                    '1 - Retrato'
                    '2 - Paisagem')
                  ComboBoxLabel.Width = 133
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Formato Impress'#227'o DANFE:'
                end
                object ComboBoxFormaPagamento: TLabeledComboBox
                  Left = 803
                  Top = 108
                  Width = 200
                  Height = 22
                  Style = csOwnerDrawFixed
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 0
                  TabOrder = 16
                  Text = 'A Vista'
                  Items.Strings = (
                    'A Vista'
                    'A Prazo'
                    'Outros')
                  ComboBoxLabel.Width = 106
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Forma de Pagamento:'
                end
                object EditChaveAcesso: TLabeledEdit
                  Left = 9
                  Top = 65
                  Width = 318
                  Height = 22
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  EditLabel.Width = 87
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Chave de Acesso:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object EditCodigoNumerico: TLabeledEdit
                  Left = 354
                  Top = 66
                  Width = 138
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 74
                  EditLabel.Height = 13
                  EditLabel.Caption = 'C'#243'd. Num'#233'rico:'
                  TabOrder = 6
                end
                object EditDigitoChaveAcesso: TLabeledEdit
                  Left = 327
                  Top = 65
                  Width = 21
                  Height = 22
                  Anchors = [akTop, akRight]
                  AutoSize = False
                  EditLabel.Width = 17
                  EditLabel.Height = 13
                  EditLabel.Caption = 'DV:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
                object ComboboxModeloNotaFiscal: TLabeledComboBox
                  Left = 9
                  Top = 23
                  Width = 368
                  Height = 22
                  Style = csOwnerDrawFixed
                  ItemIndex = 1
                  TabOrder = 0
                  Text = '55 - Nota Fiscal Eletr'#244'nica - NFe'
                  Items.Strings = (
                    '01 - Nota Fiscal 1/1A'
                    '55 - Nota Fiscal Eletr'#244'nica - NFe')
                  ComboBoxLabel.Width = 93
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Modelo Nota Fiscal:'
                end
                object EditIdEmpresa: TLabeledCalcEdit
                  Left = 383
                  Top = 23
                  Width = 61
                  Height = 21
                  ShowButton = False
                  TabOrder = 1
                  DecimalPlacesAlwaysShown = False
                  OnKeyUp = EditIdEmpresaKeyUp
                  CalcEditLabel.Width = 165
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Empresa Entrada Mercadoria [F1]:'
                end
                object EditEmpresa: TLabeledEdit
                  Left = 444
                  Top = 23
                  Width = 314
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  EditLabel.Width = 6
                  EditLabel.Height = 13
                  EditLabel.Caption = '  '
                  ReadOnly = True
                  TabOrder = 2
                end
              end
            end
            object TabSheetProdutos: TTabSheet
              Caption = 'Produtos / Servi'#231'os'
              ImageIndex = 1
              object JvNetscapeSplitter1: TJvNetscapeSplitter
                Left = 0
                Top = 313
                Width = 1013
                Height = 20
                Cursor = crDefault
                Align = alBottom
                Color = clBtnFace
                MinSize = 1
                ParentColor = False
                Maximized = False
                Minimized = True
                ButtonCursor = crDefault
                ButtonStyle = bsWindows
                WindowsButtons = [wbMin, wbMax]
                ButtonWidth = 300
                ExplicitTop = 0
                RestorePos = 185
              end
              object PanelDetalhes: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 313
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object GridItens: TJvDBUltimGrid
                  Left = 1
                  Top = 31
                  Width = 1011
                  Height = 281
                  Align = alClient
                  DataSource = FDataModuleNFe.DSNfeDetalhe
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = GridItensDrawColumnCell
                  OnKeyDown = GridItensKeyDown
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ID'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'ID_PRODUTO'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'ID_NFE_CABECALHO'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'NUMERO_ITEM'
                      Title.Caption = 'Numero Item'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CODIGO_PRODUTO'
                      Title.Caption = 'Codigo Produto'
                      Width = 200
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CADASTRADO'
                      ReadOnly = True
                      Title.Caption = 'Cadastrado'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GTIN'
                      Title.Caption = 'Gtin'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME_PRODUTO'
                      Title.Caption = 'Nome Produto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NCM'
                      Title.Caption = 'Ncm'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'EX_TIPI'
                      Title.Caption = 'Ex Tipi'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CFOP'
                      Title.Caption = 'Cfop'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'UNIDADE_COMERCIAL'
                      Title.Caption = 'Unidade Comercial'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_COMERCIAL'
                      Title.Caption = 'Quantidade Comercial'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_UNITARIO_COMERCIAL'
                      Title.Caption = 'Valor Unitario Comercial'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_BRUTO_PRODUTO'
                      Title.Caption = 'Valor Bruto Produtos'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GTIN_UNIDADE_TRIBUTAVEL'
                      Title.Caption = 'Gtin Unidade Tributavel'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'UNIDADE_TRIBUTAVEL'
                      Title.Caption = 'Unidade Tributavel'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_TRIBUTAVEL'
                      Title.Caption = 'Quantidade Tributavel'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_UNITARIO_TRIBUTAVEL'
                      Title.Caption = 'Valor Unitario Tributa'#231#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_FRETE'
                      Title.Caption = 'Valor Frete'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_SEGURO'
                      Title.Caption = 'Valor Seguro'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_DESCONTO'
                      Title.Caption = 'Valor Desconto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_OUTRAS_DESPESAS'
                      Title.Caption = 'Valor Outras Despesas'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ENTRA_TOTAL'
                      Title.Caption = 'Entra Total'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_SUBTOTAL'
                      Title.Caption = 'Valor Subtotal'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_TOTAL'
                      Title.Caption = 'Valor Total'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'INFORMACOES_ADICIONAIS'
                      Title.Caption = 'Informa'#231#245'es Adicionais'
                      Width = 200
                      Visible = True
                    end>
                end
                object ActionToolBar1: TActionToolBar
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 1005
                  Height = 24
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  ColorMap.MenuColor = clMenu
                  ColorMap.BtnSelectedColor = clBtnFace
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
              object PanelDetalhesAnexo: TPanel
                Left = 0
                Top = 333
                Width = 1013
                Height = 1
                Align = alBottom
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
            object TabSheetDocumentosReferenciados: TTabSheet
              Caption = 'Documentos Referenciados'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object PageControlReferenciado: TPageControl
                Left = 0
                Top = 30
                Width = 1013
                Height = 304
                ActivePage = TabSheetReferenciadoNfe
                Align = alClient
                TabOrder = 0
                object TabSheetReferenciadoNfe: TTabSheet
                  Caption = 'NF-e'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GridNfeReferenciada: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 1005
                    Height = 276
                    Align = alClient
                    DataSource = FDataModuleNFe.DSNfeReferenciada
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'ID'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'ID_NFE_CABECALHO'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'CHAVE_ACESSO'
                        Title.Caption = 'Chave de Acesso'
                        Visible = True
                      end>
                  end
                end
                object TabSheetReferenciadoNf: TTabSheet
                  Caption = 'NF 1/1A'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GridNfReferenciada: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 1005
                    Height = 276
                    Align = alClient
                    DataSource = FDataModuleNFe.DSNfReferenciada
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'CODIGO_UF'
                        Title.Caption = 'C'#243'digo UF'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ANO_MES'
                        Title.Caption = 'Ano / M'#234's'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CNPJ'
                        Width = 150
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MODELO'
                        Title.Caption = 'Modelo'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SERIE'
                        Title.Caption = 'S'#233'rie'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUMERO_NF'
                        Title.Caption = 'N'#250'mero'
                        Width = 100
                        Visible = True
                      end>
                  end
                end
                object TabSheetReferenciadoCte: TTabSheet
                  Caption = 'CT-e'
                  ImageIndex = 2
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GridCteReferenciado: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 1005
                    Height = 276
                    Align = alClient
                    DataSource = FDataModuleNFe.DSCteReferenciado
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'CHAVE_ACESSO'
                        Title.Caption = 'Chave de Acesso'
                        Visible = True
                      end>
                  end
                end
                object TabSheetReferenciadoRural: TTabSheet
                  Caption = 'NF Produtor Rural'
                  ImageIndex = 3
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GridNfRuralReferenciada: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 1005
                    Height = 276
                    Align = alClient
                    DataSource = FDataModuleNFe.DSNfRuralReferenciada
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'CODIGO_UF'
                        Title.Caption = 'C'#243'digo UF'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ANO_MES'
                        Title.Caption = 'Ano / M'#234's'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CNPJ'
                        Width = 150
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CPF'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'INSCRICAO_ESTADUAL'
                        Title.Caption = 'Inscri'#231#227'o Estadual'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MODELO'
                        Title.Caption = 'Modelo'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SERIE'
                        Title.Caption = 'S'#233'rie'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUMERO_NF'
                        Title.Caption = 'N'#250'mero'
                        Width = 100
                        Visible = True
                      end>
                  end
                end
                object TabSheetReferenciadoCupom: TTabSheet
                  Caption = 'Cupom Fiscal'
                  ImageIndex = 4
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GridCupomReferenciado: TJvDBUltimGrid
                    Left = 0
                    Top = 0
                    Width = 1005
                    Height = 276
                    Align = alClient
                    DataSource = FDataModuleNFe.DSCupomReferenciado
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'MODELO_DOCUMENTO_FISCAL'
                        Title.Caption = 'Modelo Documento Fiscal'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUMERO_ORDEM_ECF'
                        Title.Caption = 'N'#250'mero Ordem ECF'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_EMISSAO_CUPOM'
                        Title.Caption = 'Data Emiss'#227'o'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUMERO_CAIXA'
                        Title.Caption = 'N'#250'mero Caixa'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUMERO_SERIE_ECF'
                        Title.Caption = 'N'#250'mero S'#233'rie ECF'
                        Visible = True
                      end>
                  end
                end
              end
              object ActionToolBar2: TActionToolBar
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 1007
                Height = 24
                ActionManager = ActionManager
                BiDiMode = bdRightToLeft
                Caption = 'ActionToolBarEdits'
                ColorMap.MenuColor = clMenu
                ColorMap.BtnSelectedColor = clBtnFace
                ColorMap.UnusedColor = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Orientation = boRightToLeft
                ParentBiDiMode = False
                ParentFont = False
                Spacing = 0
              end
            end
            object TabSheetEntregaRetirada: TTabSheet
              Caption = 'Entrega / Retirada'
              ImageIndex = 6
              object PanelEntregaRetirada: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                Ctl3D = True
                UseDockManager = False
                DoubleBuffered = False
                FullRepaint = False
                ParentBiDiMode = False
                ParentBackground = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ShowCaption = False
                TabOrder = 0
                DesignSize = (
                  1013
                  334)
                object GroupBoxEntrega: TGroupBox
                  Left = 8
                  Top = 35
                  Width = 995
                  Height = 113
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Dados para entrega:'
                  TabOrder = 0
                  DesignSize = (
                    995
                    113)
                  object EditEntregaCpfCnpj: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 0
                  end
                  object EditEntregaLogradouro: TLabeledEdit
                    Left = 154
                    Top = 31
                    Width = 413
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditEntregaNumero: TLabeledEdit
                    Left = 577
                    Top = 31
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 41
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Numero:'
                    MaxLength = 60
                    TabOrder = 2
                  end
                  object EditEntregaBairro: TLabeledEdit
                    Left = 9
                    Top = 76
                    Width = 200
                    Height = 21
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Bairro:'
                    MaxLength = 60
                    TabOrder = 4
                  end
                  object EditEntregaCidade: TLabeledEdit
                    Left = 284
                    Top = 76
                    Width = 655
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 6
                  end
                  object EditEntregaUf: TLabeledEdit
                    Left = 946
                    Top = 76
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 7
                  end
                  object EditEntregaComplemento: TLabeledEdit
                    Left = 685
                    Top = 31
                    Width = 300
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 69
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Complemento:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                  object EditEntregaIbge: TLabeledCalcEdit
                    Left = 215
                    Top = 76
                    Width = 63
                    Height = 21
                    ShowButton = False
                    TabOrder = 5
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 63
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'C'#243'digo IBGE:'
                  end
                end
                object GroupBoxRetirada: TGroupBox
                  Left = 8
                  Top = 165
                  Width = 995
                  Height = 113
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Dados para retirada:'
                  TabOrder = 1
                  DesignSize = (
                    995
                    113)
                  object EditRetiradaCpfCnpj: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 0
                  end
                  object EditRetiradaLogradouro: TLabeledEdit
                    Left = 154
                    Top = 31
                    Width = 413
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditRetiradaNumero: TLabeledEdit
                    Left = 577
                    Top = 31
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 41
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Numero:'
                    MaxLength = 60
                    TabOrder = 2
                  end
                  object EditRetiradaBairro: TLabeledEdit
                    Left = 9
                    Top = 76
                    Width = 200
                    Height = 21
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Bairro:'
                    MaxLength = 60
                    TabOrder = 4
                  end
                  object EditRetiradaCidade: TLabeledEdit
                    Left = 284
                    Top = 76
                    Width = 655
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 6
                  end
                  object EditRetiradaUf: TLabeledEdit
                    Left = 946
                    Top = 76
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 7
                  end
                  object EditRetiradaComplemento: TLabeledEdit
                    Left = 685
                    Top = 31
                    Width = 300
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 69
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Complemento:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                  object EditRetiradaIbge: TLabeledCalcEdit
                    Left = 215
                    Top = 76
                    Width = 63
                    Height = 21
                    ShowButton = False
                    TabOrder = 5
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 63
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'C'#243'digo IBGE:'
                  end
                end
                object ActionToolBar3: TActionToolBar
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 1005
                  Height = 24
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  ColorMap.MenuColor = clMenu
                  ColorMap.BtnSelectedColor = clBtnFace
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object TabSheetTransporte: TTabSheet
              Caption = 'Transporte'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object PanelTransporte: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                Ctl3D = True
                UseDockManager = False
                DoubleBuffered = False
                FullRepaint = False
                ParentBiDiMode = False
                ParentBackground = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ShowCaption = False
                TabOrder = 0
                DesignSize = (
                  1013
                  334)
                object GroupBoxTransportador: TGroupBox
                  Left = 8
                  Top = 50
                  Width = 995
                  Height = 99
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Transportador:'
                  TabOrder = 2
                  DesignSize = (
                    995
                    99)
                  object EditTransportadorCpfCnpj: TLabeledEdit
                    Left = 70
                    Top = 31
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 1
                  end
                  object EditTransportadorIE: TLabeledEdit
                    Left = 679
                    Top = 31
                    Width = 306
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 91
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Inscri'#231#227'o Estadual:'
                    MaxLength = 14
                    TabOrder = 3
                  end
                  object EditTransportadorLogradouro: TLabeledEdit
                    Left = 10
                    Top = 72
                    Width = 510
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 4
                  end
                  object EditTransportadorCidade: TLabeledEdit
                    Left = 526
                    Top = 72
                    Width = 414
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 5
                  end
                  object EditTransportadorUF: TLabeledEdit
                    Left = 946
                    Top = 72
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 6
                  end
                  object EditTransportadorRazaoSocial: TLabeledEdit
                    Left = 212
                    Top = 31
                    Width = 461
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 105
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Raz'#227'o Social / Nome::'
                    MaxLength = 60
                    TabOrder = 2
                  end
                  object EditTransportadorId: TLabeledCalcEdit
                    Left = 10
                    Top = 31
                    Width = 54
                    Height = 21
                    ShowButton = False
                    TabOrder = 0
                    DecimalPlacesAlwaysShown = False
                    OnKeyUp = EditTransportadorIdKeyUp
                    CalcEditLabel.Width = 37
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Id [F1]:'
                  end
                end
                object GroupBoxTransporteRetencaoICMS: TGroupBox
                  Left = 292
                  Top = 155
                  Width = 711
                  Height = 60
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Reten'#231#227'o ICMS:'
                  TabOrder = 7
                  object EditRetencaoIcmsUf: TLabeledEdit
                    Left = 10
                    Top = 34
                    Width = 39
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 0
                  end
                  object EditRetencaoIcmsBaseCalculo: TLabeledCalcEdit
                    Left = 199
                    Top = 34
                    Width = 120
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 79
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Base de C'#225'lculo:'
                  end
                  object EditRetencaoIcmsAliquota: TLabeledCalcEdit
                    Left = 325
                    Top = 34
                    Width = 120
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 43
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota:'
                  end
                  object EditRetencaoIcmsValorServico: TLabeledCalcEdit
                    Left = 451
                    Top = 34
                    Width = 120
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 5
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 81
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor do Servi'#231'o:'
                  end
                  object EditRetencaoIcmsIcmsRetido: TLabeledCalcEdit
                    Left = 577
                    Top = 34
                    Width = 120
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 6
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 63
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'ICMS Retido:'
                  end
                  object EditRetencaoIcmsCidade: TLabeledCalcEdit
                    Left = 55
                    Top = 34
                    Width = 82
                    Height = 21
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 63
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'C'#243'digo IBGE:'
                  end
                  object EditRetencaoIcmsCfop: TLabeledCalcEdit
                    Left = 143
                    Top = 34
                    Width = 50
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 31
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'CFOP:'
                  end
                end
                object GroupBoxVeiculo: TGroupBox
                  Left = 8
                  Top = 155
                  Width = 278
                  Height = 60
                  Caption = 'Ve'#237'culo:'
                  TabOrder = 5
                  object EditVeiculoRntc: TLabeledEdit
                    Left = 136
                    Top = 34
                    Width = 133
                    Height = 21
                    EditLabel.Width = 31
                    EditLabel.Height = 13
                    EditLabel.Caption = 'RNTC:'
                    MaxLength = 20
                    TabOrder = 2
                  end
                  object EditVeiculoPlaca: TLabeledEdit
                    Left = 55
                    Top = 34
                    Width = 75
                    Height = 21
                    EditLabel.Width = 29
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Placa:'
                    MaxLength = 8
                    TabOrder = 1
                  end
                  object EditVeiculoUf: TLabeledEdit
                    Left = 10
                    Top = 34
                    Width = 39
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 0
                  end
                end
                object GroupBoxReboque: TGroupBox
                  Left = 8
                  Top = 221
                  Width = 401
                  Height = 104
                  Anchors = [akLeft, akTop, akBottom]
                  Caption = 'Reboque:'
                  TabOrder = 6
                  object GridReboque: TJvDBUltimGrid
                    Left = 2
                    Top = 15
                    Width = 397
                    Height = 87
                    Align = alClient
                    DataSource = FDataModuleNFe.DSReboque
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'PLACA'
                        Title.Caption = 'Placa'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'UF'
                        Width = 50
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RNTC'
                        Width = 200
                        Visible = True
                      end>
                  end
                end
                object GroupBoxVolumes: TGroupBox
                  Left = 415
                  Top = 221
                  Width = 588
                  Height = 104
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Caption = 'Volumes:'
                  TabOrder = 4
                  object GridVolumes: TJvDBUltimGrid
                    Left = 2
                    Top = 15
                    Width = 342
                    Height = 87
                    Align = alClient
                    DataSource = FDataModuleNFe.DSVolumes
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'QUANTIDADE'
                        Title.Caption = 'Quantidade'
                        Width = 70
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ESPECIE'
                        Title.Caption = 'Esp'#233'cie'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MARCA'
                        Title.Caption = 'Marca'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUMERACAO'
                        Title.Caption = 'Numera'#231#227'o'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PESO_LIQUIDO'
                        Title.Caption = 'Peso L'#237'quido'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PESO_BRUTO'
                        Title.Caption = 'Peso Bruto'
                        Visible = True
                      end>
                  end
                  object GroupBoxLacres: TGroupBox
                    Left = 344
                    Top = 15
                    Width = 242
                    Height = 87
                    Align = alRight
                    Caption = 'Lacres:'
                    TabOrder = 1
                    object GridVolumesLacres: TJvDBUltimGrid
                      Left = 2
                      Top = 15
                      Width = 238
                      Height = 70
                      Align = alClient
                      DataSource = FDataModuleNFe.DSVolumesLacres
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      SelectColumnsDialogStrings.Caption = 'Select columns'
                      SelectColumnsDialogStrings.OK = '&OK'
                      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                      EditControls = <>
                      RowsHeight = 17
                      TitleRowHeight = 17
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NUMERO'
                          Title.Caption = 'N'#250'mero'
                          Width = 200
                          Visible = True
                        end>
                    end
                  end
                end
                object ComboModalidadeFrete: TLabeledComboBox
                  Left = 8
                  Top = 21
                  Width = 190
                  Height = 22
                  Style = csOwnerDrawFixed
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '0 - ContaEmitente'
                  Items.Strings = (
                    '0 - ContaEmitente'
                    '1 - ContaEmitente'
                    '2 - ContaTerceiros'
                    '9 - SemFrete')
                  ComboBoxLabel.Width = 87
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Modalidade Frete:'
                end
                object EditTransporteVagao: TLabeledEdit
                  Left = 204
                  Top = 22
                  Width = 109
                  Height = 21
                  CharCase = ecUpperCase
                  EditLabel.Width = 34
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Vag'#227'o:'
                  MaxLength = 2
                  TabOrder = 1
                end
                object EditTransporteBalsa: TLabeledEdit
                  Left = 319
                  Top = 22
                  Width = 109
                  Height = 21
                  CharCase = ecUpperCase
                  EditLabel.Width = 29
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Balsa:'
                  MaxLength = 2
                  TabOrder = 3
                end
                object ActionToolBar4: TActionToolBar
                  Left = 518
                  Top = 3
                  Width = 492
                  Height = 24
                  ActionManager = ActionManager
                  Align = alCustom
                  Anchors = [akLeft, akTop, akRight]
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  ColorMap.MenuColor = clMenu
                  ColorMap.BtnSelectedColor = clBtnFace
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object TabSheetCobranca: TTabSheet
              Caption = 'Cobran'#231'a'
              ImageIndex = 7
              object PanelCobranca: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object PanelFatura: TPanel
                  Left = 1
                  Top = 31
                  Width = 1011
                  Height = 123
                  Align = alTop
                  BevelOuter = bvLowered
                  TabOrder = 0
                  DesignSize = (
                    1011
                    123)
                  object GroupBoxFatura: TGroupBox
                    Left = 8
                    Top = 6
                    Width = 994
                    Height = 107
                    Anchors = [akLeft, akTop, akRight]
                    Caption = 'Fatura:'
                    TabOrder = 0
                    DesignSize = (
                      994
                      107)
                    object EditFaturaNumero: TLabeledEdit
                      Left = 10
                      Top = 33
                      Width = 973
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      EditLabel.Width = 41
                      EditLabel.Height = 13
                      EditLabel.Caption = 'N'#250'mero:'
                      MaxLength = 60
                      TabOrder = 0
                    end
                    object EditFaturaValorOriginal: TLabeledCalcEdit
                      Left = 10
                      Top = 77
                      Width = 121
                      Height = 21
                      DisplayFormat = '###,###,##0.00'
                      ShowButton = False
                      TabOrder = 1
                      DecimalPlacesAlwaysShown = False
                      CalcEditLabel.Width = 67
                      CalcEditLabel.Height = 13
                      CalcEditLabel.Caption = 'Valor Original:'
                    end
                    object EditFaturaValorDesconto: TLabeledCalcEdit
                      Left = 137
                      Top = 77
                      Width = 121
                      Height = 21
                      DisplayFormat = '###,###,##0.00'
                      ShowButton = False
                      TabOrder = 2
                      DecimalPlacesAlwaysShown = False
                      CalcEditLabel.Width = 91
                      CalcEditLabel.Height = 13
                      CalcEditLabel.Caption = 'Valor do Desconto:'
                    end
                    object EditFaturaValorLiquido: TLabeledCalcEdit
                      Left = 264
                      Top = 77
                      Width = 121
                      Height = 21
                      DisplayFormat = '###,###,##0.00'
                      ShowButton = False
                      TabOrder = 3
                      DecimalPlacesAlwaysShown = False
                      CalcEditLabel.Width = 64
                      CalcEditLabel.Height = 13
                      CalcEditLabel.Caption = 'Valor L'#237'quido:'
                    end
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 1
                  Top = 154
                  Width = 1011
                  Height = 179
                  Align = alClient
                  Caption = 'Duplicatas'
                  TabOrder = 1
                  object GridDuplicatas: TJvDBUltimGrid
                    Left = 2
                    Top = 15
                    Width = 1007
                    Height = 162
                    Align = alClient
                    DataSource = FDataModuleNFe.DSDuplicata
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    SelectColumnsDialogStrings.Caption = 'Select columns'
                    SelectColumnsDialogStrings.OK = '&OK'
                    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                    EditControls = <>
                    RowsHeight = 17
                    TitleRowHeight = 17
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NUMERO'
                        Title.Caption = 'N'#250'mero'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENCIMENTO'
                        Title.Caption = 'Vencimento'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR'
                        Title.Caption = 'Valor'
                        Visible = True
                      end>
                  end
                end
                object ActionToolBar5: TActionToolBar
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 1005
                  Height = 24
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  ColorMap.MenuColor = clMenu
                  ColorMap.BtnSelectedColor = clBtnFace
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object TabSheetInformacoesAdicionais: TTabSheet
              Caption = 'Informa'#231#245'es Adicionais'
              ImageIndex = 4
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object PanelInformacoesAdicionais: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                TabOrder = 0
                DesignSize = (
                  1013
                  334)
                object MemoInfComplementarFisco: TLabeledMemo
                  Left = 8
                  Top = 184
                  Width = 995
                  Height = 57
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  MemoLabel.Width = 220
                  MemoLabel.Height = 13
                  MemoLabel.Caption = 'Informa'#231#245'es Adicionais de Interesse do Fisco:'
                end
                object MemoInfComplementarContribuinte: TLabeledMemo
                  Left = 8
                  Top = 264
                  Width = 995
                  Height = 57
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 3
                  MemoLabel.Width = 255
                  MemoLabel.Height = 13
                  MemoLabel.Caption = 'Informa'#231#245'es Adicionais de Interesse do Contribuinte:'
                end
                object GroupBox2: TGroupBox
                  Left = 8
                  Top = 11
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Informa'#231#245'es de Com'#233'rcio Exterior:'
                  TabOrder = 0
                  DesignSize = (
                    995
                    64)
                  object EditComexLocalEmbarque: TLabeledEdit
                    Left = 54
                    Top = 31
                    Width = 931
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 79
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Local Embarque:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditComexUfEmbarque: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 39
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 0
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 8
                  Top = 91
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Informa'#231#245'es de Compras:'
                  TabOrder = 1
                  DesignSize = (
                    995
                    64)
                  object EditCompraPedido: TLabeledEdit
                    Left = 199
                    Top = 31
                    Width = 370
                    Height = 21
                    EditLabel.Width = 36
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Pedido:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditCompraNotaEmpenho: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 184
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 74
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Nota Empenho:'
                    MaxLength = 22
                    TabOrder = 0
                  end
                  object EditCompraContrato: TLabeledEdit
                    Left = 575
                    Top = 31
                    Width = 410
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 47
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Contrato:'
                    MaxLength = 60
                    TabOrder = 2
                  end
                end
              end
            end
            object TabSheetEscrituracao: TTabSheet
              Caption = 'Escritura'#231#227'o'
              ImageIndex = 3
              object PanelEscrituracao: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                TabOrder = 0
                DesignSize = (
                  1013
                  334)
                object EditEscrituracaoCompetencia: TLabeledMaskEdit
                  Left = 9
                  Top = 27
                  Width = 72
                  Height = 21
                  Alignment = taCenter
                  EditLabel.Width = 66
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Compet'#234'ncia:'
                  MaxLength = 7
                  TabOrder = 0
                  Text = '  //////////'
                  Required = False
                  EditMask = '##/####;1;_'
                  MaskState = [msMasked]
                end
                object EditEscrituracaoCfopEntrada: TLabeledCalcEdit
                  Left = 87
                  Top = 27
                  Width = 91
                  Height = 21
                  ShowButton = False
                  TabOrder = 1
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 72
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'CFOP Entrada:'
                end
                object EditEscritutacaoValorRateioFrete: TLabeledCalcEdit
                  Left = 184
                  Top = 27
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 2
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 91
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Rateio Frete:'
                end
                object EditEscritutacaoValorCustoMedio: TLabeledCalcEdit
                  Left = 311
                  Top = 27
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 3
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 90
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Custo M'#233'dio:'
                end
                object EditEscritutacaoValorIcmsAntecipado: TLabeledCalcEdit
                  Left = 572
                  Top = 26
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 5
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 113
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor ICMS Antecipado:'
                end
                object EditEscritutacaoValorBcIcmsAntecipado: TLabeledCalcEdit
                  Left = 438
                  Top = 26
                  Width = 128
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 4
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 129
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor BC ICMS Antecipado:'
                end
                object GroupBox4: TGroupBox
                  Left = 9
                  Top = 53
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Cr'#233'dito ICMS:'
                  TabOrder = 6
                  object EditEscritutacaoCstCreditoIcms: TLabeledEdit
                    Left = 9
                    Top = 33
                    Width = 114
                    Height = 22
                    Alignment = taCenter
                    AutoSize = False
                    EditLabel.Width = 89
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CST Cr'#233'dito ICMS:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = [fsBold]
                    MaxLength = 3
                    ParentFont = False
                    TabOrder = 0
                  end
                  object EditEscritutacaoAliquotaCreditoIcms: TLabeledCalcEdit
                    Left = 129
                    Top = 34
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 109
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota Cr'#233'dito ICMS:'
                  end
                  object EditEscritutacaoQuantidadeParcelaCreditoIcms: TLabeledCalcEdit
                    Left = 256
                    Top = 34
                    Width = 161
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 141
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Qtde. Parcelas Cr'#233'dito ICMS:'
                  end
                  object EditEscritutacaoValorBcIcmsCreditado: TLabeledCalcEdit
                    Left = 423
                    Top = 34
                    Width = 143
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 122
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor BC ICMS Creditado:'
                  end
                  object EditEscritutacaoValorIcmsCreditado: TLabeledCalcEdit
                    Left = 572
                    Top = 34
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 106
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor ICMS Creditado:'
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 9
                  Top = 123
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Cr'#233'dito PIS:'
                  TabOrder = 7
                  object EditEscritutacaoValorBcPisCreditado: TLabeledCalcEdit
                    Left = 423
                    Top = 33
                    Width = 143
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 113
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor BC PIS Creditado:'
                  end
                  object EditEscritutacaoCstCreditoPis: TLabeledEdit
                    Left = 9
                    Top = 33
                    Width = 114
                    Height = 22
                    Alignment = taCenter
                    AutoSize = False
                    EditLabel.Width = 80
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CST Cr'#233'dito PIS:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = [fsBold]
                    MaxLength = 2
                    ParentFont = False
                    TabOrder = 0
                  end
                  object EditEscritutacaoValorPisCreditado: TLabeledCalcEdit
                    Left = 572
                    Top = 33
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 97
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor PIS Creditado:'
                  end
                  object EditEscritutacaoQuantidadeParcelaCreditoPis: TLabeledCalcEdit
                    Left = 256
                    Top = 33
                    Width = 161
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 132
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Qtde. Parcelas Cr'#233'dito PIS:'
                  end
                  object EditEscritutacaoAliquotaCreditoPis: TLabeledCalcEdit
                    Left = 129
                    Top = 33
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 100
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota Cr'#233'dito PIS:'
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 9
                  Top = 193
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Cr'#233'dito COFINS:'
                  TabOrder = 8
                  object EditEscritutacaoValorBcCofinsCreditado: TLabeledCalcEdit
                    Left = 423
                    Top = 34
                    Width = 143
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 135
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor BC COFINS Creditado:'
                  end
                  object EditEscritutacaoCstCreditoCofins: TLabeledEdit
                    Left = 9
                    Top = 33
                    Width = 114
                    Height = 22
                    Alignment = taCenter
                    AutoSize = False
                    EditLabel.Width = 102
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CST Cr'#233'dito COFINS:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = [fsBold]
                    MaxLength = 2
                    ParentFont = False
                    TabOrder = 0
                  end
                  object EditEscritutacaoValorCofinsCreditado: TLabeledCalcEdit
                    Left = 572
                    Top = 34
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 119
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor COFINS Creditado:'
                  end
                  object EditEscritutacaoQuantidadeParcelaCreditoCofins: TLabeledCalcEdit
                    Left = 256
                    Top = 34
                    Width = 161
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 154
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Qtde. Parcelas Cr'#233'dito COFINS:'
                  end
                  object EditEscritutacaoAliquotaCreditoCofins: TLabeledCalcEdit
                    Left = 129
                    Top = 34
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 122
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota Cr'#233'dito COFINS:'
                  end
                end
                object GroupBox7: TGroupBox
                  Left = 9
                  Top = 263
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Cr'#233'dito IPI:'
                  TabOrder = 9
                  object EditEscritutacaoValorBcIpiCreditado: TLabeledCalcEdit
                    Left = 423
                    Top = 33
                    Width = 143
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 111
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor BC IPI Creditado:'
                  end
                  object EditEscritutacaoCstCreditoIpi: TLabeledEdit
                    Left = 9
                    Top = 33
                    Width = 114
                    Height = 22
                    Alignment = taCenter
                    AutoSize = False
                    EditLabel.Width = 78
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CST Cr'#233'dito IPI:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = [fsBold]
                    MaxLength = 2
                    ParentFont = False
                    TabOrder = 0
                  end
                  object EditEscritutacaoValorIpiCreditado: TLabeledCalcEdit
                    Left = 572
                    Top = 33
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 95
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor IPI Creditado:'
                  end
                  object EditEscritutacaoQuantidadeParcelaCreditoIpi: TLabeledCalcEdit
                    Left = 256
                    Top = 33
                    Width = 161
                    Height = 21
                    ShowButton = False
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 130
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Qtde. Parcelas Cr'#233'dito IPI:'
                  end
                  object EditEscritutacaoAliquotaCreditoIpi: TLabeledCalcEdit
                    Left = 129
                    Top = 33
                    Width = 121
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    ShowButton = False
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 98
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota Cr'#233'dito IPI:'
                  end
                end
              end
            end
          end
          object PageControlTotais: TPageControl
            Left = 0
            Top = 392
            Width = 1021
            Height = 113
            ActivePage = tsTotaisGeral
            Align = alBottom
            TabOrder = 2
            object tsTotaisGeral: TTabSheet
              Caption = 'Totais Geral'
              object PanelTotais: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 85
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  1013
                  85)
                object EditBCIcms: TLabeledCalcEdit
                  Left = 12
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 0
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 122
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Base de C'#225'lculo do ICMS:'
                end
                object EditValorIcms: TLabeledCalcEdit
                  Left = 160
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 1
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 71
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor do ICMS:'
                end
                object EditBCIcmsSt: TLabeledCalcEdit
                  Left = 308
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 2
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 107
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Base C'#225'lculo ICMS ST:'
                end
                object EditValorIcmsSt: TLabeledCalcEdit
                  Left = 456
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 3
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 86
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor do ICMS ST:'
                end
                object EditValorCOFINS: TLabeledCalcEdit
                  Left = 604
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 4
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 96
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Total COFINS:'
                end
                object EditValorIPI: TLabeledCalcEdit
                  Left = 743
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 5
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 72
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Total IPI:'
                end
                object EditTotalProdutos: TLabeledCalcEdit
                  Left = 883
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  Anchors = [akTop, akRight]
                  ParentFont = False
                  ShowButton = False
                  TabOrder = 6
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 86
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Total Produtos:'
                  CalcEditLabel.Font.Charset = DEFAULT_CHARSET
                  CalcEditLabel.Font.Color = clWindowText
                  CalcEditLabel.Font.Height = -11
                  CalcEditLabel.Font.Name = 'Tahoma'
                  CalcEditLabel.Font.Style = [fsBold]
                  CalcEditLabel.ParentFont = False
                end
                object EditTotalImpostoImportacao: TLabeledCalcEdit
                  Left = 743
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = False
                  TabOrder = 12
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 66
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Total II:'
                  CalcEditLabel.Font.Charset = DEFAULT_CHARSET
                  CalcEditLabel.Font.Color = clWindowText
                  CalcEditLabel.Font.Height = -11
                  CalcEditLabel.Font.Name = 'Tahoma'
                  CalcEditLabel.Font.Style = []
                  CalcEditLabel.ParentFont = False
                end
                object EditValorTotalNota: TLabeledCalcEdit
                  Left = 883
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  Anchors = [akTop, akRight]
                  ParentFont = False
                  ShowButton = False
                  TabOrder = 13
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 61
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Total Nota:'
                  CalcEditLabel.Font.Charset = DEFAULT_CHARSET
                  CalcEditLabel.Font.Color = clWindowText
                  CalcEditLabel.Font.Height = -11
                  CalcEditLabel.Font.Name = 'Tahoma'
                  CalcEditLabel.Font.Style = [fsBold]
                  CalcEditLabel.ParentFont = False
                end
                object EditValorFrete: TLabeledCalcEdit
                  Left = 12
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 7
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 72
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor do Frete:'
                end
                object EditValorSeguro: TLabeledCalcEdit
                  Left = 160
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 8
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 80
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor do Seguro:'
                end
                object EditValorOutrasDespesas: TLabeledCalcEdit
                  Left = 308
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 9
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 122
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Outras Desp. Acessorias:'
                end
                object EditValorPIS: TLabeledCalcEdit
                  Left = 456
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 10
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 74
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Total PIS:'
                end
                object EditValorDesconto: TLabeledCalcEdit
                  Left = 604
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 11
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 49
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Desconto:'
                end
              end
            end
            object tsOutrosTotais: TTabSheet
              Caption = 'Outros Totais'
              ImageIndex = 1
              object PanelOutrosTotais: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 85
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  1013
                  85)
                object EditBaseCalculoIssqn: TLabeledCalcEdit
                  Left = 12
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 0
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 128
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Base de C'#225'lculo do ISSQN:'
                end
                object EditValorIssqn: TLabeledCalcEdit
                  Left = 160
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 1
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 77
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor do ISSQN:'
                end
                object EditValorPisIssqn: TLabeledCalcEdit
                  Left = 308
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 2
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 81
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor PIS ISSQN:'
                end
                object EditValorCofinsIssqn: TLabeledCalcEdit
                  Left = 456
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 3
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 118
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor do COFINS ISSQN:'
                end
                object EditValorRetidoPis: TLabeledCalcEdit
                  Left = 12
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 4
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 81
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Retido PIS:'
                end
                object EditValorRetidoCofins: TLabeledCalcEdit
                  Left = 160
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 5
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 103
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Retido COFINS:'
                end
                object EditValorRetidoCsll: TLabeledCalcEdit
                  Left = 308
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = False
                  TabOrder = 6
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 88
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Retido CSLL:'
                  CalcEditLabel.Font.Charset = DEFAULT_CHARSET
                  CalcEditLabel.Font.Color = clWindowText
                  CalcEditLabel.Font.Height = -11
                  CalcEditLabel.Font.Name = 'Tahoma'
                  CalcEditLabel.Font.Style = []
                  CalcEditLabel.ParentFont = False
                end
                object EditValorTotalServicos: TLabeledCalcEdit
                  Left = 883
                  Top = 20
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Anchors = [akTop, akRight]
                  ParentFont = False
                  ShowButton = False
                  TabOrder = 11
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 71
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Total Servi'#231'os:'
                  CalcEditLabel.Font.Charset = DEFAULT_CHARSET
                  CalcEditLabel.Font.Color = clWindowText
                  CalcEditLabel.Font.Height = -11
                  CalcEditLabel.Font.Name = 'Tahoma'
                  CalcEditLabel.Font.Style = []
                  CalcEditLabel.ParentFont = False
                end
                object EditBaseCalculoIrrf: TLabeledCalcEdit
                  Left = 456
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  ShowButton = False
                  TabOrder = 7
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 106
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Base de C'#225'lculo IRRF:'
                end
                object EditValorRetidoIrrf: TLabeledCalcEdit
                  Left = 604
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Anchors = [akTop, akRight]
                  ShowButton = False
                  TabOrder = 8
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 89
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Retido IRRF:'
                end
                object EditBaseCalculoPrevidencia: TLabeledCalcEdit
                  Left = 743
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Anchors = [akTop, akRight]
                  ShowButton = False
                  TabOrder = 9
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 122
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Base C'#225'lculo Previd'#234'ncia:'
                end
                object EditValorRetidoPrevidencia: TLabeledCalcEdit
                  Left = 883
                  Top = 59
                  Width = 121
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  Anchors = [akTop, akRight]
                  ShowButton = False
                  TabOrder = 10
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 120
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Valor Retido Previd'#234'ncia:'
                end
              end
            end
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 1041
    ExplicitWidth = 1041
    inherited BotaoSair: TSpeedButton
      Left = 937
      ExplicitLeft = 932
    end
    inherited BotaoExportar: TSpeedButton
      Left = 837
      ExplicitLeft = 832
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 737
      ExplicitLeft = 732
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 627
      ExplicitLeft = 622
    end
    inherited BotaoAlterar: TSpeedButton
      ExplicitLeft = 287
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 637
      ExplicitLeft = 632
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 24
    Top = 0
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 124
    Top = 65535
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 264
    Top = 0
  end
  object ActionManager: TActionManager
    ActionBars.ShowHints = False
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Action = ActionSelecionarArquivo
            Caption = '&Selecionar Arquivo XML'
            ImageIndex = 36
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionSelecionarArquivo
            Caption = '&Selecionar Arquivo XML'
            ImageIndex = 36
          end>
        ActionBar = ActionToolBarEdits
      end
      item
      end
      item
        Items = <
          item
            Action = ActionExcluirItem
            Caption = '&Excluir Item da Nota'
            ImageIndex = 10
          end
          item
            Action = ActionIncluirItem
            Caption = '&Incluir Item na Nota'
            ImageIndex = 31
          end
          item
            Action = ActionCadastrarProduto
            Caption = '&Cadastrar Produto'
            ImageIndex = 0
          end>
        ActionBar = ActionToolBar1
      end
      item
        Items = <
          item
            Action = ActionExcluirDocumentosReferenciados
            Caption = '&Excluir Documentos Referenciados'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar2
      end
      item
        Items = <
          item
            Action = ActionExcluirEntregaRetirada
            Caption = '&Excluir Dados Entrega/Retirada'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar3
      end
      item
        Items = <
          item
            Action = ActionExcluirTransporte
            Caption = '&Excluir Dados Transporte'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar4
      end
      item
        Items = <
          item
            Action = ActionExcluirCobranca
            Caption = '&Excluir Dados Cobran'#231'a'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar5
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 427
    StyleName = 'Ribbon - Silver'
    object ActionSelecionarArquivo: TAction
      Category = 'EntradaNF'
      Caption = 'Selecionar Arquivo XML'
      ImageIndex = 36
      OnExecute = ActionSelecionarArquivoExecute
    end
    object ActionCadastrarProduto: TAction
      Category = 'EntradaNF'
      Caption = 'Cadastrar Produto'
      ImageIndex = 0
      OnExecute = ActionCadastrarProdutoExecute
    end
    object ActionIncluirItem: TAction
      Category = 'EntradaNF'
      Caption = 'Incluir Item na Nota'
      ImageIndex = 31
      OnExecute = ActionIncluirItemExecute
    end
    object ActionExcluirItem: TAction
      Category = 'EntradaNF'
      Caption = 'Excluir Item da Nota'
      ImageIndex = 10
      OnExecute = ActionExcluirItemExecute
    end
    object ActionExcluirDocumentosReferenciados: TAction
      Category = 'EntradaNF'
      Caption = 'Excluir Documentos Referenciados'
      ImageIndex = 10
      OnExecute = ActionExcluirDocumentosReferenciadosExecute
    end
    object ActionExcluirEntregaRetirada: TAction
      Category = 'EntradaNF'
      Caption = 'Excluir Dados Entrega/Retirada'
      ImageIndex = 10
      OnExecute = ActionExcluirEntregaRetiradaExecute
    end
    object ActionExcluirTransporte: TAction
      Category = 'EntradaNF'
      Caption = 'Excluir Dados Transporte'
      ImageIndex = 10
      OnExecute = ActionExcluirTransporteExecute
    end
    object ActionExcluirCobranca: TAction
      Category = 'EntradaNF'
      Caption = 'Excluir Dados Cobran'#231'a'
      ImageIndex = 10
    end
  end
end
