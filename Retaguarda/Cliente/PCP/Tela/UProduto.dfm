inherited FProduto: TFProduto
  Tag = 1
  Left = 316
  Top = 148
  Caption = 'Produto'
  ClientHeight = 548
  ClientWidth = 942
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
          object BevelEdits: TBevel
            Tag = 1
            Left = 7
            Top = 8
            Width = 909
            Height = 137
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object PanelProdutoDadosBase: TPanel
            Left = 8
            Top = 9
            Width = 908
            Height = 135
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              908
              135)
            object EditIdSubgrupoProduto: TLabeledCalcEdit
              Left = 8
              Top = 21
              Width = 61
              Height = 21
              ShowButton = False
              TabOrder = 0
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdSubgrupoProdutoKeyUp
              CalcEditLabel.Width = 92
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Agrupamento [F1]:'
            end
            object EditSubGrupoProduto: TLabeledEdit
              Left = 69
              Top = 21
              Width = 828
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
            object EditIdMarcaProduto: TLabeledCalcEdit
              Left = 434
              Top = 64
              Width = 61
              Height = 21
              ShowButton = False
              TabOrder = 4
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdMarcaProdutoKeyUp
              CalcEditLabel.Width = 56
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Marca [F1]:'
            end
            object EditMarcaProduto: TLabeledEdit
              Left = 495
              Top = 64
              Width = 402
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 5
            end
            object EditUnidadeProduto: TLabeledEdit
              Left = 69
              Top = 64
              Width = 359
              Height = 21
              TabStop = False
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 3
            end
            object EditIdUnidadeProduto: TLabeledCalcEdit
              Left = 8
              Top = 64
              Width = 61
              Height = 21
              ShowButton = False
              TabOrder = 2
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdUnidadeProdutoKeyUp
              CalcEditLabel.Width = 66
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Unidade [F1]:'
            end
            object EditIdAlmoxarifado: TLabeledCalcEdit
              Left = 8
              Top = 106
              Width = 61
              Height = 21
              ShowButton = False
              TabOrder = 6
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdAlmoxarifadoKeyUp
              CalcEditLabel.Width = 90
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Almoxarifado [F1]:'
            end
            object EditAlmoxarifado: TLabeledEdit
              Left = 69
              Top = 106
              Width = 359
              Height = 21
              TabStop = False
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 7
            end
            object EditIdTributGrupoTributario: TLabeledCalcEdit
              Left = 543
              Top = 106
              Width = 61
              Height = 21
              ShowButton = False
              TabOrder = 9
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdTributGrupoTributarioKeyUp
              CalcEditLabel.Width = 105
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 'Grupo Tribut'#225'rio [F1]:'
            end
            object EditTributGrupoTributario: TLabeledEdit
              Left = 604
              Top = 106
              Width = 293
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 10
            end
            object ComboboxIcmsCustomizado: TLabeledComboBox
              Left = 434
              Top = 106
              Width = 103
              Height = 21
              Style = csDropDownList
              ItemIndex = 1
              TabOrder = 8
              Text = 'N'#227'o'
              OnChange = ComboboxIcmsCustomizadoChange
              Items.Strings = (
                'Sim'
                'N'#227'o')
              ComboBoxLabel.Width = 94
              ComboBoxLabel.Height = 13
              ComboBoxLabel.Caption = 'ICMS Customizado?'
            end
          end
          object PageControlDadosProduto: TPageControl
            Left = 3
            Top = 164
            Width = 909
            Height = 314
            ActivePage = tsProdutoPrincipal
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tsProdutoPrincipal: TTabSheet
              Caption = 'Principal'
              object PanelProdutoPrincipal: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 286
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  901
                  286)
                object GroupBoxRG: TGroupBox
                  Left = 8
                  Top = 150
                  Width = 879
                  Height = 108
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Valores Principais'
                  TabOrder = 8
                  object EditValorCompra: TLabeledCalcEdit
                    Left = 18
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 0
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 68
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor Compra:'
                  end
                  object EditValorVenda: TLabeledCalcEdit
                    Left = 139
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 61
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor Venda:'
                  end
                  object EditPrecoVendaMinimo: TLabeledCalcEdit
                    Left = 260
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 2
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 96
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor Venda M'#237'nimo:'
                  end
                  object EditPrecoSugerido: TLabeledCalcEdit
                    Left = 381
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 3
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 73
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Valor Sugerido:'
                  end
                  object EditCustoMedioLiquido: TLabeledCalcEdit
                    Left = 502
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 4
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 99
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Custo M'#233'dio L'#237'quido:'
                  end
                  object EditPrecoLucroZero: TLabeledCalcEdit
                    Left = 623
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 5
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 85
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Pre'#231'o Lucro Zero:'
                  end
                  object EditPrecoLucroMinimo: TLabeledCalcEdit
                    Left = 745
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 6
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 95
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Pre'#231'o Lucro M'#237'nimo:'
                  end
                  object EditPrecoLucroMaximo: TLabeledCalcEdit
                    Left = 18
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 7
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 99
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Pre'#231'o Lucro M'#225'ximo:'
                  end
                  object EditMarkup: TLabeledCalcEdit
                    Left = 139
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 8
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 39
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Markup:'
                  end
                  object EditQuantidadeEstoque: TLabeledCalcEdit
                    Left = 260
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 9
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 102
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Quantidade Estoque:'
                  end
                  object EditQuantidadeEstoqueAnterior: TLabeledCalcEdit
                    Left = 381
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 10
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 112
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Qtde Estoque Anterior:'
                  end
                  object EditEstoqueIdeal: TLabeledCalcEdit
                    Left = 502
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 11
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 70
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Estoque Ideal:'
                  end
                  object EditEstoqueMinimo: TLabeledCalcEdit
                    Left = 623
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 12
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 78
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Estoque M'#237'nimo:'
                  end
                  object EditEstoqueMaximo: TLabeledCalcEdit
                    Left = 745
                    Top = 76
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 13
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 82
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Estoque M'#225'ximo:'
                  end
                end
                object EditNome: TLabeledEdit
                  Left = 8
                  Top = 60
                  Width = 516
                  Height = 21
                  EditLabel.Width = 31
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Nome:'
                  MaxLength = 100
                  TabOrder = 5
                end
                object ComboBoxInativo: TLabeledComboBox
                  Left = 742
                  Top = 18
                  Width = 71
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 1
                  TabOrder = 3
                  Text = 'N'#227'o'
                  Items.Strings = (
                    'Sim'
                    'N'#227'o')
                  ComboBoxLabel.Width = 39
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Inativo?'
                end
                object EditGtin: TLabeledEdit
                  Left = 8
                  Top = 18
                  Width = 119
                  Height = 21
                  EditLabel.Width = 28
                  EditLabel.Height = 13
                  EditLabel.Caption = 'GTIN:'
                  MaxLength = 14
                  TabOrder = 0
                end
                object EditCodigoInterno: TLabeledEdit
                  Left = 133
                  Top = 18
                  Width = 391
                  Height = 21
                  EditLabel.Width = 76
                  EditLabel.Height = 13
                  EditLabel.Caption = 'C'#243'digo Interno:'
                  MaxLength = 60
                  TabOrder = 1
                end
                object EditNcm: TLabeledEdit
                  Left = 530
                  Top = 18
                  Width = 206
                  Height = 21
                  EditLabel.Width = 49
                  EditLabel.Height = 13
                  EditLabel.Caption = 'NCM [F1]:'
                  MaxLength = 8
                  TabOrder = 2
                  OnKeyUp = EditNcmKeyUp
                end
                object ComboBoxClasseAbc: TLabeledComboBox
                  Left = 819
                  Top = 18
                  Width = 68
                  Height = 21
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 0
                  TabOrder = 4
                  Text = 'A'
                  Items.Strings = (
                    'A'
                    'B'
                    'C')
                  ComboBoxLabel.Width = 35
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Classe:'
                end
                object EditDescricaoPdv: TLabeledEdit
                  Left = 530
                  Top = 60
                  Width = 357
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  EditLabel.Width = 72
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Descri'#231#227'o PDV:'
                  MaxLength = 30
                  TabOrder = 6
                end
                object MemoDescricao: TLabeledMemo
                  Left = 8
                  Top = 103
                  Width = 879
                  Height = 41
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 7
                  MemoLabel.Width = 50
                  MemoLabel.Height = 13
                  MemoLabel.Caption = 'Descri'#231#227'o:'
                end
              end
            end
            object tsDadosComplementares: TTabSheet
              Caption = 'Dados Complementares'
              ImageIndex = 2
              object PanelDadosComplementares: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 286
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  901
                  286)
                object ImagemProduto: TImage
                  Left = 11
                  Top = 25
                  Width = 250
                  Height = 250
                  Center = True
                  PopupMenu = PopupMenu1
                  Transparent = True
                  OnClick = ImagemProdutoClick
                end
                object Label1: TLabel
                  Left = 8
                  Top = 6
                  Width = 98
                  Height = 13
                  Caption = 'Imagem do Produto:'
                end
                object ComboBoxIat: TLabeledComboBox
                  Left = 469
                  Top = 18
                  Width = 124
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 1
                  TabOrder = 3
                  Text = 'T - Truncamento'
                  Items.Strings = (
                    'A - Arredondamento'
                    'T - Truncamento')
                  ComboBoxLabel.Width = 21
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'IAT:'
                end
                object ComboBoxIppt: TLabeledComboBox
                  Left = 599
                  Top = 18
                  Width = 86
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 1
                  TabOrder = 4
                  Text = 'T - Terceiro'
                  Items.Strings = (
                    'P - Pr'#243'prio'
                    'T - Terceiro')
                  ComboBoxLabel.Width = 26
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'IPPT:'
                end
                object ComboBoxTipoItemSped: TLabeledComboBox
                  Left = 691
                  Top = 18
                  Width = 199
                  Height = 21
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 0
                  TabOrder = 5
                  Text = '00 - Mercadoria para Revenda'
                  Items.Strings = (
                    '00 - Mercadoria para Revenda'
                    '01 - Mat'#233'ria-Prima'
                    '02 - Embalagem'
                    '03 - Produto em Processo'
                    '04 - Produto Acabado'
                    '05 - Subproduto'
                    '06 - Produto Intermedi'#225'rio'
                    '07 - Material de Uso e Consumo'
                    '08 - Ativo Imobilizado'
                    '09 - Servi'#231'os'
                    '10 - Outros insumos'
                    '99 - Outras')
                  ComboBoxLabel.Width = 76
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Tipo Item Sped:'
                end
                object EditCodigoLst: TLabeledEdit
                  Left = 267
                  Top = 18
                  Width = 42
                  Height = 21
                  EditLabel.Width = 21
                  EditLabel.Height = 13
                  EditLabel.Caption = 'LST:'
                  MaxLength = 4
                  TabOrder = 0
                end
                object EditExTipi: TLabeledEdit
                  Left = 315
                  Top = 18
                  Width = 42
                  Height = 21
                  EditLabel.Width = 36
                  EditLabel.Height = 13
                  EditLabel.Caption = 'EXTIPI:'
                  MaxLength = 3
                  TabOrder = 1
                end
                object EditTotalizadorParcial: TLabeledEdit
                  Left = 267
                  Top = 60
                  Width = 90
                  Height = 21
                  EditLabel.Width = 91
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Totalizador Parcial:'
                  MaxLength = 10
                  TabOrder = 6
                end
                object EditCodigoBalanca: TLabeledCalcEdit
                  Left = 363
                  Top = 60
                  Width = 80
                  Height = 21
                  ShowButton = False
                  TabOrder = 7
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 77
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'C'#243'digo Balan'#231'a:'
                end
                object EditPeso: TLabeledCalcEdit
                  Left = 267
                  Top = 102
                  Width = 110
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 8
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 27
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Peso:'
                end
                object EditPorcentoComissao: TLabeledCalcEdit
                  Left = 383
                  Top = 102
                  Width = 110
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 9
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 76
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Taxa Comiss'#227'o:'
                end
                object EditPontoPedido: TLabeledCalcEdit
                  Left = 499
                  Top = 102
                  Width = 110
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 10
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 67
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Ponto Pedido:'
                end
                object EditLoteEconomicoCompra: TLabeledCalcEdit
                  Left = 615
                  Top = 102
                  Width = 110
                  Height = 21
                  DisplayFormat = '###,###,##0.00'
                  TabOrder = 11
                  DecimalPlacesAlwaysShown = False
                  CalcEditLabel.Width = 118
                  CalcEditLabel.Height = 13
                  CalcEditLabel.Caption = 'Lote Econ'#244'mico Compra:'
                end
                object GroupBoxValoresPaf: TGroupBox
                  Left = 267
                  Top = 130
                  Width = 623
                  Height = 67
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Valores para PAF:'
                  TabOrder = 12
                  object EditAliquotaIcmsPaf: TLabeledCalcEdit
                    Left = 14
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 0
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 71
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota ICMS:'
                  end
                  object EditAliquotaIssqnPaf: TLabeledCalcEdit
                    Left = 130
                    Top = 33
                    Width = 110
                    Height = 21
                    DisplayFormat = '###,###,##0.00'
                    TabOrder = 1
                    DecimalPlacesAlwaysShown = False
                    CalcEditLabel.Width = 77
                    CalcEditLabel.Height = 13
                    CalcEditLabel.Caption = 'Al'#237'quota ISSQN:'
                  end
                end
                object ComboboxTipo: TLabeledComboBox
                  Left = 363
                  Top = 18
                  Width = 100
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 2
                  Text = 'V - Venda'
                  Items.Strings = (
                    'V - Venda'
                    'C - Composi'#231#227'o'
                    'P - Produ'#231#227'o'
                    'I - Insumo'
                    'U - Uso Proprio')
                  ComboBoxLabel.Width = 24
                  ComboBoxLabel.Height = 13
                  ComboBoxLabel.Caption = 'Tipo:'
                end
              end
            end
            object TabSheet1: TTabSheet
              Caption = 'Ficha T'#233'cnica'
              ImageIndex = 2
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 286
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object GridFichaTecnica: TJvDBUltimGrid
                  Left = 1
                  Top = 27
                  Width = 899
                  Height = 258
                  Align = alClient
                  DataSource = DSFichaTecnica
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlue
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = GridFichaTecnicaKeyDown
                  AutoAppend = False
                  TitleButtons = True
                  AlternateRowColor = 15593713
                  TitleArrow = True
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  SortWith = swFields
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ID_PRODUTO_FILHO'
                      Title.Caption = 'Id Produto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCRICAO'
                      Title.Caption = 'Descri'#231#227'o'
                      Width = 303
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SEQUENCIA_PRODUCAO'
                      Title.Caption = 'Sequ'#234'ncia'
                      Width = 104
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE'
                      Title.Caption = 'Quantidade'
                      Visible = True
                    end>
                end
                object ActionToolBar1: TActionToolBar
                  Left = 1
                  Top = 1
                  Width = 899
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBar1'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
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
  object PopupMenu1: TPopupMenu
    Images = FDataModule.ImagensCadastros
    Left = 224
    Top = 467
    object CarregarImaem1: TMenuItem
      Caption = 'Carregar Imagem'
      ImageIndex = 28
      OnClick = CarregarImaem1Click
    end
  end
  object DSFichaTecnica: TDataSource
    DataSet = CDSFichaTecnica
    Left = 144
    Top = 392
  end
  object CDSFichaTecnica: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO_FILHO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SEQUENCIA_PRODUCAO'
        DataType = ftInteger
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 64
    Top = 392
    Data = {
      BA0000009619E0BD010000001800000007000000000003000000BA0002494404
      000100000000000A49445F50524F4455544F04000100000000001049445F5052
      4F4455544F5F46494C484F04000100000000000944455343524943414F010049
      00000001000557494454480200020064001253455155454E4349415F50524F44
      5543414F04000100000000000A5155414E544944414445080004000000000008
      504552534953544501004900000001000557494454480200020001000000}
    object CDSFichaTecnicaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSFichaTecnicaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSFichaTecnicaID_PRODUTO_FILHO: TIntegerField
      FieldName = 'ID_PRODUTO_FILHO'
    end
    object CDSFichaTecnicaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CDSFichaTecnicaSEQUENCIA_PRODUCAO: TIntegerField
      FieldName = 'SEQUENCIA_PRODUCAO'
      DisplayFormat = '000'
    end
    object CDSFichaTecnicaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object CDSFichaTecnicaPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Action = ActionRemoverItem
            Caption = '&Remover Item'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarItem
            Caption = '&Adicionar Item [F1]'
            ImageIndex = 31
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionRemoverItem
            Caption = '&Remover Item'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarItem
            Caption = 'A&dicionar Item [F1]'
            ImageIndex = 31
          end
          item
            Action = ActionAdicionarItem
            Caption = '&Adicionar Item [F1]'
            ImageIndex = 31
          end>
      end
      item
      end
      item
      end
      item
        Items = <
          item
            Action = ActionRemoverItem
            Caption = '&Remover Item'
            ImageIndex = 10
          end
          item
            Action = ActionAdicionarItem
            Caption = '&Adicionar Item [F1]'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end>
    Images = FDataModule.ImagensCadastros
    Left = 746
    Top = 387
    StyleName = 'Platform Default'
    object ActionAdicionarItem: TAction
      Category = 'Geral'
      Caption = 'Adicionar Item [F1]'
      ImageIndex = 31
      OnExecute = ActionAdicionarItemExecute
    end
    object ActionRemoverItem: TAction
      Category = 'Geral'
      Caption = 'Remover Item'
      ImageIndex = 10
      OnExecute = ActionRemoverItemExecute
    end
  end
end
