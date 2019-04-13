inherited FWmsArmazenamento: TFWmsArmazenamento
  Left = 342
  Top = 220
  Caption = 'Armazenamento'
  ClientWidth = 933
  ExplicitWidth = 949
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 933
    ActivePage = PaginaEdits
    ExplicitWidth = 933
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 925
      inherited PanelGrid: TPanel
        Width = 925
        ExplicitWidth = 925
        inherited Grid: TJvDBUltimGrid
          Width = 925
        end
        inherited PanelFiltroRapido: TPanel
          Width = 925
          ExplicitWidth = 925
          inherited BotaoConsultar: TSpeedButton
            Left = 793
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 624
            ExplicitWidth = 624
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 925
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 925
        ExplicitWidth = 925
        object BevelEdits: TBevel
          Left = 10
          Top = 12
          Width = 905
          Height = 97
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object GroupBoxWmsRecebimentoDetalhe: TGroupBox
          Left = 10
          Top = 119
          Width = 905
          Height = 265
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Detalhes'
          TabOrder = 3
          object ActionToolBar1: TActionToolBar
            AlignWithMargins = True
            Left = 5
            Top = 18
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
          object PageControl1: TPageControl
            Left = 2
            Top = 45
            Width = 901
            Height = 218
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 1
            object TabSheet1: TTabSheet
              Caption = 'Itens'
              object GridWmsRecebimentoDetalhe: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 893
                Height = 190
                Align = alClient
                DataSource = DSWmsRecebimentoDetalhe
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = GridWmsRecebimentoDetalheKeyDown
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
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Armazenamento'
              ImageIndex = 1
              object GridArmazenamento: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 893
                Height = 190
                Align = alClient
                DataSource = DSWmsArmazenamento
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = GridWmsRecebimentoDetalheKeyDown
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
              end
            end
          end
        end
        object EditIdWmsAgendamento: TLabeledCalcEdit
          Left = 18
          Top = 77
          Width = 99
          Height = 21
          DisplayFormat = '#'
          ParentShowHint = False
          ShowButton = False
          ShowHint = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdWmsAgendamentoKeyUp
          CalcEditLabel.Width = 94
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Agendamento [F1]:'
        end
        object EditObservacao: TLabeledEdit
          Left = 123
          Top = 77
          Width = 783
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 62
          EditLabel.Height = 13
          EditLabel.Caption = 'Observa'#231#227'o:'
          TabOrder = 2
        end
        object EditDataRecebimento: TLabeledDateEdit
          Left = 18
          Top = 35
          Width = 121
          Height = 21
          ShowNullDate = False
          TabOrder = 0
          DateEditLabel.Width = 23
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data'
        end
        object EditHoraInicio: TLabeledMaskEdit
          Left = 145
          Top = 35
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'Hora In'#237'cio:'
          MaxLength = 8
          TabOrder = 4
          Text = '  :::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object EditHoraFim: TLabeledMaskEdit
          Left = 261
          Top = 35
          Width = 110
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Hora Fim:'
          MaxLength = 8
          TabOrder = 5
          Text = '  :::::::: : :'
          Required = False
          EditMask = '##:##:##;1;_'
          MaskState = [msMasked]
        end
        object EditVolumeRecebido: TLabeledCalcEdit
          Left = 377
          Top = 35
          Width = 104
          Height = 21
          ShowButton = False
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 85
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Volume Recebido:'
        end
        object EditPesoRecebido: TLabeledCalcEdit
          Left = 487
          Top = 35
          Width = 121
          Height = 21
          DisplayFormat = '###,###,##0.00'
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 74
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Peso Recebido:'
        end
        object ComboInconsistencia: TLabeledComboBox
          Left = 614
          Top = 35
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 8
          Text = 'N'#227'o'
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ComboBoxLabel.Width = 68
          ComboBoxLabel.Height = 13
          ComboBoxLabel.Caption = 'Inconsist'#234'ncia'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited BotaoSair: TSpeedButton
      Left = 829
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 729
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 629
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 519
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 529
      ExplicitLeft = 526
    end
  end
  object CDSWmsRecebimentoDetalhe: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSWmsRecebimentoDetalheAfterEdit
    Left = 712
    Top = 264
  end
  object DSWmsRecebimentoDetalhe: TDataSource
    DataSet = CDSWmsRecebimentoDetalhe
    Left = 720
    Top = 312
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
            Action = ActionArmazenar
            Caption = '&Armazenar'
            ImageIndex = 30
          end
          item
            Action = ActionExcluirItem
            Caption = '&Excluir Item'
            ImageIndex = 10
          end
          item
            Action = ActionIncluirItem
            Caption = '&Incluir Item'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 307
    Top = 120
    StyleName = 'Ribbon - Silver'
    object ActionIncluirItem: TAction
      Category = 'Opcoes'
      Caption = 'Incluir Item'
      ImageIndex = 31
      OnExecute = ActionIncluirItemExecute
    end
    object ActionExcluirItem: TAction
      Category = 'Opcoes'
      Caption = 'Excluir Item'
      ImageIndex = 10
      OnExecute = ActionExcluirItemExecute
    end
    object ActionArmazenar: TAction
      Category = 'Opcoes'
      Caption = 'Armazenar'
      ImageIndex = 30
      OnExecute = ActionArmazenarExecute
    end
  end
  object CDSWmsArmazenamento: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSWmsRecebimentoDetalheAfterEdit
    Left = 488
    Top = 272
  end
  object DSWmsArmazenamento: TDataSource
    DataSet = CDSWmsArmazenamento
    Left = 496
    Top = 320
  end
end
