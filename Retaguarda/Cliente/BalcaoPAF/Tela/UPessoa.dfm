inherited FPessoa: TFPessoa
  Tag = 1
  Left = 0
  Top = 0
  Caption = 'Pessoa'
  ClientHeight = 548
  ClientWidth = 942
  Position = poDesigned
  ExplicitWidth = 958
  ExplicitHeight = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 942
    Height = 517
    ActivePage = PaginaEdits
    ExplicitWidth = 942
    ExplicitHeight = 517
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 934
      ExplicitHeight = 489
      inherited PanelGrid: TPanel
        Width = 934
        Height = 489
        ExplicitWidth = 934
        ExplicitHeight = 489
        inherited Grid: TJvDBUltimGrid
          Width = 934
          Height = 437
        end
        inherited PanelFiltroRapido: TPanel
          Top = 437
          Width = 934
          ExplicitTop = 437
          ExplicitWidth = 934
          inherited BotaoConsultar: TSpeedButton
            Left = 802
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 633
            ExplicitWidth = 633
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 934
      ExplicitHeight = 489
      inherited PanelEdits: TPanel
        Width = 934
        Height = 489
        ExplicitWidth = 934
        ExplicitHeight = 489
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 926
          Height = 481
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            926
            481)
          object PanelPessoaDadosBase: TPanel
            Left = 7
            Top = 8
            Width = 909
            Height = 107
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvLowered
            TabOrder = 1
            DesignSize = (
              909
              107)
            object EditEmail: TLabeledEdit
              Left = 9
              Top = 76
              Width = 376
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              EditLabel.Width = 32
              EditLabel.Height = 13
              EditLabel.Caption = 'E-mail:'
              TabOrder = 3
            end
            object EditNome: TLabeledEdit
              Left = 9
              Top = 27
              Width = 616
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              EditLabel.Width = 31
              EditLabel.Height = 13
              EditLabel.Caption = 'Nome:'
              MaxLength = 150
              TabOrder = 0
            end
            object ComboboxTipoPessoa: TLabeledComboBox
              Left = 631
              Top = 27
              Width = 139
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              ItemIndex = 0
              TabOrder = 1
              Text = 'F'#237'sica'
              OnChange = ComboboxTipoPessoaChange
              Items.Strings = (
                'F'#237'sica'
                'Jur'#237'dica')
              ComboBoxLabel.Width = 76
              ComboBoxLabel.Height = 13
              ComboBoxLabel.Caption = 'Tipo de Pessoa:'
            end
            object CheckListBoxPessoa: TJvCheckListBox
              Left = 784
              Top = 14
              Width = 113
              Height = 83
              Anchors = [akTop, akRight]
              DoubleBuffered = False
              ItemHeight = 13
              Items.Strings = (
                'Cliente'
                'Fornecedor'
                'Colaborador'
                'Transportadora')
              ParentDoubleBuffered = False
              ScrollWidth = 93
              TabOrder = 2
            end
            object EditSite: TLabeledEdit
              Left = 397
              Top = 76
              Width = 373
              Height = 21
              Anchors = [akTop, akRight]
              EditLabel.Width = 22
              EditLabel.Height = 13
              EditLabel.Caption = 'Site:'
              TabOrder = 4
            end
          end
          object PageControlDadosPessoa: TPageControl
            Left = 7
            Top = 130
            Width = 909
            Height = 343
            ActivePage = tsTipoPessoa
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tsTipoPessoa: TTabSheet
              Caption = 'Informa'#231#245'es do Tipo de Pessoa'
              object PanelDadosPessoa: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 315
                Align = alClient
                TabOrder = 0
                DesignSize = (
                  901
                  315)
                object PageControlTipoPessoa: TPageControl
                  Left = 3
                  Top = 5
                  Width = 892
                  Height = 298
                  ActivePage = tsPessoaFisica
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Visible = False
                  object tsPessoaFisica: TTabSheet
                    Caption = 'tsPessoaFisica'
                    object PanelPessoaFisica: TPanel
                      Left = 0
                      Top = 0
                      Width = 884
                      Height = 270
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      Visible = False
                      DesignSize = (
                        884
                        270)
                      object EditCPF: TLabeledMaskEdit
                        Left = 8
                        Top = 18
                        Width = 111
                        Height = 21
                        Color = clWhite
                        EditLabel.Width = 23
                        EditLabel.Height = 13
                        EditLabel.Caption = 'CPF:'
                        MaxLength = 14
                        TabOrder = 0
                        Text = 
                          '   ........-..-..-..-..-..-..-..-..-..-..-..-..-..-..-..-..-..-.' +
                          '.-..-. -. -. -. -  -'
                        Required = False
                        EditMask = '###.###.###-##;0;_'
                        MaskState = []
                      end
                      object GroupBoxRG: TGroupBox
                        Left = 8
                        Top = 136
                        Width = 449
                        Height = 57
                        Caption = 'RG'
                        TabOrder = 9
                        object EditRGNumero: TLabeledEdit
                          Left = 11
                          Top = 30
                          Width = 121
                          Height = 21
                          EditLabel.Width = 41
                          EditLabel.Height = 13
                          EditLabel.Caption = 'N'#250'mero:'
                          TabOrder = 0
                        end
                        object EditRGEmissao: TLabeledDateEdit
                          Left = 140
                          Top = 30
                          Width = 99
                          Height = 21
                          ShowNullDate = False
                          TabOrder = 1
                          DateEditLabel.Width = 42
                          DateEditLabel.Height = 13
                          DateEditLabel.Caption = 'Emiss'#227'o:'
                        end
                        object EditRGOrgaoEmissor: TLabeledEdit
                          Left = 247
                          Top = 30
                          Width = 193
                          Height = 21
                          EditLabel.Width = 73
                          EditLabel.Height = 13
                          EditLabel.Caption = 'Org'#227'o Emissor:'
                          TabOrder = 2
                        end
                      end
                      object EditNascimento: TLabeledDateEdit
                        Left = 131
                        Top = 18
                        Width = 99
                        Height = 21
                        ShowNullDate = False
                        TabOrder = 1
                        DateEditLabel.Width = 59
                        DateEditLabel.Height = 13
                        DateEditLabel.Caption = 'Nascimento:'
                      end
                      object RadioGroupSexo: TRadioGroup
                        Left = 679
                        Top = 136
                        Width = 93
                        Height = 57
                        Caption = 'Sexo: '
                        ItemIndex = 0
                        Items.Strings = (
                          'Feminino'
                          'Masculino')
                        TabOrder = 11
                      end
                      object LComboBoxEstadoCivil: TLabeledDBLookupComboBox
                        Left = 244
                        Top = 18
                        Width = 204
                        Height = 21
                        ListSource = DSEstadoCivil
                        TabOrder = 2
                        DBLookupComboBoxLabel.Width = 59
                        DBLookupComboBoxLabel.Height = 13
                        DBLookupComboBoxLabel.Caption = 'Estado Civil:'
                      end
                      object EditNomeMae: TLabeledEdit
                        Left = 456
                        Top = 106
                        Width = 419
                        Height = 21
                        Anchors = [akLeft, akTop, akRight]
                        EditLabel.Width = 69
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Nome da M'#227'e:'
                        MaxLength = 100
                        TabOrder = 8
                      end
                      object EditNaturalidade: TLabeledEdit
                        Left = 8
                        Top = 62
                        Width = 440
                        Height = 21
                        EditLabel.Width = 65
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Naturalidade:'
                        MaxLength = 100
                        TabOrder = 5
                      end
                      object EditNacionalidade: TLabeledEdit
                        Left = 456
                        Top = 62
                        Width = 419
                        Height = 21
                        Anchors = [akLeft, akTop, akRight]
                        EditLabel.Width = 70
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Nacionalidade:'
                        MaxLength = 100
                        TabOrder = 6
                      end
                      object ComboBoxRaca: TLabeledComboBox
                        Left = 456
                        Top = 18
                        Width = 198
                        Height = 21
                        Style = csDropDownList
                        TabOrder = 3
                        Items.Strings = (
                          'B - Branco '
                          'N - Negro '
                          'P - Pardo'
                          'I - Indio')
                        ComboBoxLabel.Width = 28
                        ComboBoxLabel.Height = 13
                        ComboBoxLabel.Caption = 'Ra'#231'a:'
                      end
                      object ComboBoxTipoSangue: TLabeledComboBox
                        Left = 664
                        Top = 18
                        Width = 211
                        Height = 21
                        Style = csDropDownList
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 4
                        Items.Strings = (
                          'A+'
                          'A-'
                          'B+'
                          'B-'
                          'O+'
                          'O-'
                          'AB+'
                          'AB-')
                        ComboBoxLabel.Width = 77
                        ComboBoxLabel.Height = 13
                        ComboBoxLabel.Caption = 'Tipo Sangu'#237'neo:'
                      end
                      object GroupBoxCNH: TGroupBox
                        Left = 8
                        Top = 202
                        Width = 389
                        Height = 57
                        Caption = 'CNH'
                        TabOrder = 12
                        object EditCNHNumero: TLabeledEdit
                          Left = 11
                          Top = 30
                          Width = 145
                          Height = 21
                          EditLabel.Width = 41
                          EditLabel.Height = 13
                          EditLabel.Caption = 'N'#250'mero:'
                          TabOrder = 0
                        end
                        object EditCNHVencimento: TLabeledDateEdit
                          Left = 164
                          Top = 30
                          Width = 99
                          Height = 21
                          ShowNullDate = False
                          TabOrder = 1
                          DateEditLabel.Width = 59
                          DateEditLabel.Height = 13
                          DateEditLabel.Caption = 'Vencimento:'
                        end
                        object ComboBoxCNHCategoria: TLabeledComboBox
                          Left = 272
                          Top = 30
                          Width = 108
                          Height = 21
                          Style = csDropDownList
                          TabOrder = 2
                          Items.Strings = (
                            'A'
                            'B'
                            'C'
                            'D'
                            'E')
                          ComboBoxLabel.Width = 51
                          ComboBoxLabel.Height = 13
                          ComboBoxLabel.Caption = 'Categoria:'
                        end
                      end
                      object GroupBoxTituloEleitoral: TGroupBox
                        Left = 403
                        Top = 202
                        Width = 369
                        Height = 57
                        Caption = 'T'#237'tulo Eleitoral'
                        TabOrder = 13
                        object EditTituloNumero: TLabeledEdit
                          Left = 11
                          Top = 30
                          Width = 166
                          Height = 21
                          EditLabel.Width = 41
                          EditLabel.Height = 13
                          EditLabel.Caption = 'N'#250'mero:'
                          TabOrder = 0
                        end
                        object EditTituloZona: TLabeledCalcEdit
                          Left = 188
                          Top = 30
                          Width = 80
                          Height = 21
                          ShowButton = False
                          TabOrder = 1
                          DecimalPlacesAlwaysShown = False
                          CalcEditLabel.Width = 28
                          CalcEditLabel.Height = 13
                          CalcEditLabel.Caption = 'Zona:'
                        end
                        object EditTituloSecao: TLabeledCalcEdit
                          Left = 279
                          Top = 30
                          Width = 80
                          Height = 21
                          ShowButton = False
                          TabOrder = 2
                          DecimalPlacesAlwaysShown = False
                          CalcEditLabel.Width = 33
                          CalcEditLabel.Height = 13
                          CalcEditLabel.Caption = 'Se'#231#227'o:'
                        end
                      end
                      object EditNomePai: TLabeledEdit
                        Left = 8
                        Top = 106
                        Width = 440
                        Height = 21
                        EditLabel.Width = 63
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Nome do Pai:'
                        MaxLength = 100
                        TabOrder = 7
                      end
                      object GroupBoxReservista: TGroupBox
                        Left = 463
                        Top = 136
                        Width = 208
                        Height = 57
                        Caption = 'Reservista'
                        TabOrder = 10
                        object EditReservistaNumero: TLabeledEdit
                          Left = 11
                          Top = 30
                          Width = 121
                          Height = 21
                          EditLabel.Width = 41
                          EditLabel.Height = 13
                          EditLabel.Caption = 'N'#250'mero:'
                          TabOrder = 0
                        end
                        object ComboBoxReservistaCategoria: TLabeledComboBox
                          Left = 141
                          Top = 30
                          Width = 55
                          Height = 21
                          Style = csDropDownList
                          TabOrder = 1
                          Items.Strings = (
                            '1'
                            '2'
                            '3')
                          ComboBoxLabel.Width = 51
                          ComboBoxLabel.Height = 13
                          ComboBoxLabel.Caption = 'Categoria:'
                        end
                      end
                    end
                  end
                  object tsPessoaJuridica: TTabSheet
                    Caption = 'tsPessoaJuridica'
                    ImageIndex = 1
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object PanelPessoaJuridica: TPanel
                      Left = 0
                      Top = 0
                      Width = 884
                      Height = 270
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      Visible = False
                      DesignSize = (
                        884
                        270)
                      object EditFantasia: TLabeledEdit
                        Left = 7
                        Top = 24
                        Width = 866
                        Height = 21
                        Anchors = [akLeft, akTop, akRight]
                        EditLabel.Width = 90
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Nome de Fantasia:'
                        MaxLength = 150
                        TabOrder = 0
                      end
                      object EditCNPJ: TLabeledMaskEdit
                        Left = 7
                        Top = 74
                        Width = 113
                        Height = 21
                        EditLabel.Width = 29
                        EditLabel.Height = 13
                        EditLabel.Caption = 'CNPJ:'
                        MaxLength = 18
                        TabOrder = 1
                        Text = 
                          '  ......../../.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.-' +
                          './.-./.-./.-./.-./.-./.- /.- /.- /.- / - / -   -'
                        Required = False
                        EditMask = '##.###.###/####-##;0;_'
                        MaskState = []
                      end
                      object EditInscricaoMunicipal: TLabeledEdit
                        Left = 330
                        Top = 74
                        Width = 190
                        Height = 21
                        EditLabel.Width = 88
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Incri'#231#227'o Municipal:'
                        MaxLength = 30
                        TabOrder = 3
                      end
                      object EditDataConstituicao: TLabeledDateEdit
                        Left = 532
                        Top = 74
                        Width = 104
                        Height = 21
                        ShowNullDate = False
                        TabOrder = 4
                        DateEditLabel.Width = 104
                        DateEditLabel.Height = 13
                        DateEditLabel.Caption = 'Data da Constitui'#231#227'o:'
                      end
                      object EditInscricaoEstadual: TLabeledEdit
                        Left = 130
                        Top = 74
                        Width = 190
                        Height = 21
                        EditLabel.Width = 86
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Incri'#231#227'o Estadual:'
                        MaxLength = 30
                        TabOrder = 2
                      end
                      object EditSuframa: TLabeledEdit
                        Left = 644
                        Top = 74
                        Width = 229
                        Height = 21
                        Anchors = [akLeft, akTop, akRight]
                        EditLabel.Width = 44
                        EditLabel.Height = 13
                        EditLabel.Caption = 'Suframa:'
                        MaxLength = 9
                        TabOrder = 5
                      end
                      object ComboBoxTipoRegime: TLabeledComboBox
                        Left = 7
                        Top = 122
                        Width = 233
                        Height = 21
                        Style = csDropDownList
                        TabOrder = 6
                        Items.Strings = (
                          '1-Lucro Real'
                          '2-Lucro Presumido'
                          '3-Simples Nacional')
                        ComboBoxLabel.Width = 62
                        ComboBoxLabel.Height = 13
                        ComboBoxLabel.Caption = 'Tipo Regime:'
                      end
                      object ComboBoxCRT: TLabeledComboBox
                        Left = 249
                        Top = 122
                        Width = 624
                        Height = 21
                        Style = csDropDownList
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 7
                        Items.Strings = (
                          '1-Simples Nacional'
                          '2-Simples Nacional - excesso de sublimite da receita bruta'
                          '3-Regime Normal ')
                        ComboBoxLabel.Width = 24
                        ComboBoxLabel.Height = 13
                        ComboBoxLabel.Caption = 'CRT:'
                      end
                    end
                  end
                end
              end
            end
            object tsContato: TTabSheet
              Caption = 'Contatos'
              ImageIndex = 2
              object PanelContatos: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 315
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridContato: TJvDBUltimGrid
                  Left = 0
                  Top = 30
                  Width = 901
                  Height = 285
                  Align = alClient
                  DataSource = DSContato
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                end
                object ActionToolBar2: TActionToolBar
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 895
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
            object tsEndereco: TTabSheet
              Caption = 'Endere'#231'os'
              ImageIndex = 2
              object PanelEnderecos: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 315
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridEndereco: TJvDBUltimGrid
                  Left = 0
                  Top = 30
                  Width = 901
                  Height = 285
                  Align = alClient
                  DataSource = DSEndereco
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  SortWith = swClient
                end
                object ActionToolBar1: TActionToolBar
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 895
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
            object tsTelefone: TTabSheet
              Caption = 'Telefones'
              ImageIndex = 3
              object PanelTelefones: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 315
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridTelefone: TJvDBUltimGrid
                  Left = 0
                  Top = 30
                  Width = 901
                  Height = 285
                  Align = alClient
                  DataSource = DSTelefone
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  SortWith = swClient
                end
                object ActionToolBar3: TActionToolBar
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 895
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
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 942
    ExplicitWidth = 942
    inherited BotaoSair: TSpeedButton
      Left = 838
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      Left = 738
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 628
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 728
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 528
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Top = 23
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 720
    Top = 24
  end
  object CDSEndereco: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 864
    Top = 419
  end
  object DSEndereco: TDataSource
    DataSet = CDSEndereco
    Left = 861
    Top = 464
  end
  object CDSContato: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 784
    Top = 416
  end
  object DSContato: TDataSource
    DataSet = CDSContato
    Left = 781
    Top = 464
  end
  object CDSEstadoCivil: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 416
  end
  object DSEstadoCivil: TDataSource
    AutoEdit = False
    DataSet = CDSEstadoCivil
    Left = 694
    Top = 464
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
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionExcluirContato
            Caption = '&Excluir Contato'
            ImageIndex = 10
          end>
      end
      item
        Items = <
          item
            Action = ActionExcluirContato
            Caption = '&Excluir Contato'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar2
      end
      item
        Items = <
          item
            Action = ActionExcluirTelefone
            Caption = '&Excluir Telefone'
            ImageIndex = 10
          end>
      end
      item
      end
      item
      end
      item
        Items = <
          item
            Action = ActionExcluirEndereco
            Caption = '&Excluir Endere'#231'o'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar1
      end
      item
        Items = <
          item
            Action = ActionExcluirTelefone
            Caption = '&Excluir Telefone'
            ImageIndex = 10
          end>
      end
      item
        Items = <
          item
            Action = ActionExcluirTelefone
            Caption = '&Excluir Telefone'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar3
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 227
    Top = 8
    StyleName = 'Ribbon - Silver'
    object ActionExcluirContato: TAction
      Category = 'Geral'
      Caption = 'Excluir Contato'
      ImageIndex = 10
      OnExecute = ActionExcluirContatoExecute
    end
    object ActionExcluirEndereco: TAction
      Category = 'Geral'
      Caption = 'Excluir Endere'#231'o'
      ImageIndex = 10
      OnExecute = ActionExcluirEnderecoExecute
    end
    object ActionExcluirTelefone: TAction
      Category = 'Geral'
      Caption = 'Excluir Telefone'
      ImageIndex = 10
      OnExecute = ActionExcluirTelefoneExecute
    end
  end
  object CDSTelefone: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 600
    Top = 419
  end
  object DSTelefone: TDataSource
    DataSet = CDSTelefone
    Left = 597
    Top = 464
  end
end
