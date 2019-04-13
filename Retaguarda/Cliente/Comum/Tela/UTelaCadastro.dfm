inherited FTelaCadastro: TFTelaCadastro
  Caption = 'FTelaCadastro'
  PopupMenu = PopupMenuAtalhosBotoesTelaCadastro
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited PaginaGrid: TTabSheet
      inherited PanelGrid: TPanel
        inherited Grid: TJvDBUltimGrid
          OnDblClick = GridDblClick
          OnKeyPress = GridKeyPress
        end
        inherited PanelFiltroRapido: TPanel
          DesignSize = (
            984
            52)
          object BotaoConsultar: TSpeedButton
            Left = 848
            Top = 24
            Width = 125
            Height = 22
            Anchors = [akTop, akRight]
            Caption = 'Consultar [F9]'
            Flat = True
            OnClick = BotaoConsultarClick
          end
          object LabelCampoFiltro: TLabel
            Left = 9
            Top = 8
            Width = 37
            Height = 13
            Caption = 'Campo:'
          end
          object ComboBoxCampos: TComboBox
            Left = 7
            Top = 24
            Width = 145
            Height = 22
            Style = csOwnerDrawFixed
            TabOrder = 0
            OnChange = ComboBoxCamposChange
          end
          object EditCriterioRapido: TLabeledMaskEdit
            Left = 158
            Top = 24
            Width = 684
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = 'Consulta:'
            TabOrder = 1
            OnEnter = EditCriterioRapidoEnter
            OnExit = EditCriterioRapidoExit
            OnKeyPress = EditCriterioRapidoKeyPress
            Required = False
            MaskState = []
          end
        end
      end
    end
    object PaginaEdits: TTabSheet
      Caption = 'PaginaEdits'
      ImageIndex = 1
      object PanelEdits: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 407
        Align = alClient
        BevelInner = bvLowered
        BevelWidth = 2
        TabOrder = 0
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 888
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 788
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 688
      ExplicitLeft = 695
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 578
      ExplicitLeft = 585
    end
    object BotaoSeparador3: TSpeedButton [4]
      Left = 153
      Top = 0
      Width = 10
      Height = 27
      Align = alLeft
      Caption = '|'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = -4
    end
    object BotaoInserir: TSpeedButton [5]
      Left = 163
      Top = 0
      Width = 100
      Height = 27
      Hint = 'Inserir [F2]'
      Align = alLeft
      Caption = 'Inserir [F2]'
      ParentShowHint = False
      ShowHint = True
      OnClick = BotaoInserirClick
    end
    object BotaoAlterar: TSpeedButton [6]
      Left = 263
      Top = 0
      Width = 100
      Height = 27
      Hint = 'Alterar [F3]'
      Align = alLeft
      Caption = 'Alterar [F3]'
      ParentShowHint = False
      ShowHint = True
      OnClick = BotaoAlterarClick
      ExplicitLeft = 243
    end
    object BotaoExcluir: TSpeedButton [7]
      Left = 363
      Top = 0
      Width = 100
      Height = 27
      Hint = 'Excluir [F4]'
      Align = alLeft
      Caption = 'Excluir [F4]'
      ParentShowHint = False
      ShowHint = True
      OnClick = BotaoExcluirClick
      ExplicitLeft = 323
    end
    object BotaoCancelar: TSpeedButton [8]
      Left = 463
      Top = 0
      Width = 100
      Height = 27
      Hint = 'Cancelar [F11]'
      Align = alLeft
      Caption = 'Cancelar [F11]'
      ParentShowHint = False
      ShowHint = True
      OnClick = BotaoCancelarClick
      ExplicitLeft = 403
    end
    object BotaoSalvar: TSpeedButton [9]
      Left = 563
      Top = 0
      Width = 100
      Height = 27
      Hint = 'Salvar [F12]'
      Align = alLeft
      Caption = 'Salvar [F12]'
      ParentShowHint = False
      ShowHint = True
      OnClick = BotaoSalvarClick
      ExplicitLeft = 483
    end
    object BotaoFiltrar: TSpeedButton [10]
      Left = 588
      Top = 0
      Width = 100
      Height = 27
      Hint = 'Filtrar [F5]'
      Align = alRight
      Caption = 'Filtrar [F5]'
      ParentShowHint = False
      ShowHint = True
      OnClick = BotaoFiltrarClick
      ExplicitLeft = 605
    end
    inherited PanelNavegacao: TPanel
      Width = 153
      ExplicitWidth = 153
    end
  end
  object PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 712
    Top = 32
    object menuInserir: TMenuItem
      Caption = 'Inserir'
      ShortCut = 113
      OnClick = BotaoInserirClick
    end
    object menuAlterar: TMenuItem
      Caption = 'Alterar'
      ShortCut = 114
      OnClick = BotaoAlterarClick
    end
    object menuExcluir: TMenuItem
      Caption = 'Excluir'
      ShortCut = 115
      OnClick = BotaoExcluirClick
    end
    object menuFiltrar: TMenuItem
      Caption = 'Filtrar'
      ShortCut = 116
      OnClick = BotaoFiltrarClick
    end
    object menuExportarCompleto: TMenuItem
      Caption = 'Exportar'
      ShortCut = 117
      OnClick = BotaoExportarClick
    end
    object menuImprimirCompleto: TMenuItem
      Caption = 'Imprimir'
      ShortCut = 118
      OnClick = BotaoImprimirClick
    end
    object menuSairCompleto: TMenuItem
      Caption = 'Sair'
      ShortCut = 119
      OnClick = BotaoSairClick
    end
    object menuConsultar: TMenuItem
      Caption = 'Consultar'
      ShortCut = 120
      OnClick = BotaoConsultarClick
    end
    object menuCancelar: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 122
      OnClick = BotaoCancelarClick
    end
    object menuSalvar: TMenuItem
      Caption = 'Salvar'
      ShortCut = 123
      OnClick = BotaoSalvarClick
    end
  end
end
