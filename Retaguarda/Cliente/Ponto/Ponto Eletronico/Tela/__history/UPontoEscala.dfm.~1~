inherited FPontoEscala: TFPontoEscala
  Caption = 'Ponto Escala'
  ExplicitWidth = 1000
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      inherited PanelGrid: TPanel
        ExplicitWidth = 980
        inherited PanelFiltroRapido: TPanel
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 980
      inherited PanelEdits: TPanel
        ExplicitWidth = 622
        object PanelMestre: TPanel
          Left = 12
          Top = 12
          Width = 959
          Height = 153
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            959
            153)
          object EditNome: TLabeledEdit
            Left = 9
            Top = 22
            Width = 557
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 31
            EditLabel.Height = 13
            EditLabel.Caption = 'Nome:'
            TabOrder = 0
          end
          object EditDescontoHoraDia: TLabeledMaskEdit
            Left = 9
            Top = 67
            Width = 156
            Height = 21
            EditLabel.Width = 144
            EditLabel.Height = 13
            EditLabel.Caption = 'Falta Desconta Horas por Dia:'
            MaxLength = 8
            TabOrder = 1
            Text = '  :::::::::::::::::::::::::::: : :'
            Required = False
            EditMask = '##:##:##;1;_'
            MaskState = [msMasked]
          end
          object EditDescontoDsr: TLabeledMaskEdit
            Left = 171
            Top = 67
            Width = 156
            Height = 21
            EditLabel.Width = 145
            EditLabel.Height = 13
            EditLabel.Caption = 'Falta Desconta Horas do DSR:'
            MaxLength = 8
            TabOrder = 2
            Text = '  :::::::::::::::::::::::::::::: : :'
            Required = False
            EditMask = '##:##:##;1;_'
            MaskState = [msMasked]
          end
          object GroupBoxHorarios: TGroupBox
            Left = 572
            Top = 3
            Width = 378
            Height = 138
            Anchors = [akTop, akRight]
            Caption = 'Hor'#225'rios [F1]'
            TabOrder = 3
            object GridHorarios: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 374
              Height = 121
              Align = alClient
              DataSource = DSHorarios
              Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = GridHorariosKeyDown
              AlternateRowColor = 15593713
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
                  FieldName = 'DIA'
                  ReadOnly = True
                  Title.Caption = 'Dia'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Title.Caption = 'Nome'
                  Width = 200
                  Visible = True
                end>
            end
          end
        end
        object PageControlItens: TPageControl
          Left = 12
          Top = 176
          Width = 959
          Height = 220
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object tsItens: TTabSheet
            Caption = 'Turmas'
            object PanelItens: TPanel
              Left = 0
              Top = 0
              Width = 951
              Height = 192
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridTurmas: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 951
                Height = 192
                Align = alClient
                DataSource = DSPontoTurma
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = GridTurmasKeyDown
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
                    FieldName = 'CODIGO'
                    Title.Caption = 'C'#243'digo'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Nome'
                    Width = 500
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    ExplicitWidth = 988
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 678
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 778
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 578
      ExplicitLeft = 639
    end
  end
  object DSPontoTurma: TDataSource
    DataSet = CDSPontoTurma
    Left = 72
    Top = 320
  end
  object CDSPontoTurma: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PONTO_ESCALA'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSPontoTurmaAfterEdit
    BeforeDelete = CDSPontoTurmaBeforeDelete
    Left = 72
    Top = 368
    Data = {
      8E0000009619E0BD0100000018000000050000000000030000008E0002494404
      000100000000000F49445F504F4E544F5F455343414C41040001000000000006
      434F4449474F0100490000000100055749445448020002000500044E4F4D4501
      0049000000010005574944544802000200320008504552534953544501004900
      000001000557494454480200020001000000}
    object CDSPontoTurmaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoTurmaID_PONTO_ESCALA: TIntegerField
      FieldName = 'ID_PONTO_ESCALA'
    end
    object CDSPontoTurmaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 5
    end
    object CDSPontoTurmaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CDSPontoTurmaPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
  end
  object DSHorarios: TDataSource
    DataSet = CDSHorarios
    Left = 880
    Top = 136
  end
  object CDSHorarios: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = CDSHorariosAfterPost
    Left = 880
    Top = 184
    Data = {
      660000009619E0BD010000001800000003000000000003000000660003444941
      010049000000010005574944544802000200140006434F4449474F0100490000
      000100055749445448020002000400044E4F4D45010049000000010005574944
      54480200020032000000}
    object CDSHorariosDIA: TStringField
      FieldName = 'DIA'
    end
    object CDSHorariosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CDSHorariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 4
    end
  end
end
