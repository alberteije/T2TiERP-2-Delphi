inherited FPontoEspelho: TFPontoEspelho
  Tag = 1
  Left = 207
  Top = 174
  Caption = 'Ponto Espelho'
  ClientHeight = 499
  ExplicitLeft = 207
  ExplicitTop = 174
  ExplicitWidth = 1000
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 468
    ActivePage = PaginaEdits
    ExplicitHeight = 468
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 935
      inherited PanelGrid: TPanel
        Height = 440
        ExplicitHeight = 440
        inherited Grid: TJvDBUltimGrid
          Height = 388
        end
        inherited PanelFiltroRapido: TPanel
          Top = 388
          ExplicitTop = 388
          inherited BotaoConsultar: TSpeedButton
            ExplicitLeft = 851
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 991
      ExplicitHeight = 395
      inherited PanelEdits: TPanel
        Height = 440
        ExplicitLeft = -32
        ExplicitTop = -53
        ExplicitHeight = 440
        object BevelEdits: TBevel
          Left = 11
          Top = 40
          Width = 962
          Height = 167
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 18
          Top = 65
          Width = 61
          Height = 21
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 63
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Colaborador:'
        end
        object EditColaborador: TLabeledEdit
          Left = 79
          Top = 65
          Width = 717
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
        object EditMesAno: TLabeledMaskEdit
          Left = 18
          Top = 113
          Width = 86
          Height = 21
          Alignment = taCenter
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#234's/Ano:'
          MaxLength = 7
          TabOrder = 2
          Text = '  ///////////////////'
          OnChange = EditMesAnoChange
          Required = False
          EditMask = '##/####;1;_'
          MaskState = [msMasked]
        end
        object PageControlItens: TPageControl
          Left = 10
          Top = 218
          Width = 962
          Height = 213
          ActivePage = tsItens
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 3
          object tsItens: TTabSheet
            Caption = 'Fechamento Jornada Mensal'
            object GridFechamento: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 954
              Height = 185
              Align = alClient
              DataSource = DSPontoFechamentoJornada
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DATA_FECHAMENTO'
                  Title.Caption = 'Data'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIA_SEMANA'
                  Title.Caption = 'Dia'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_COLABORADOR'
                  Title.Caption = 'Colaborador'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PIS_NUMERO'
                  Title.Caption = 'PIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_CLASSIFICACAO'
                  Title.Caption = 'C'#243'd Classifica'#231#227'o'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLASSIFICACAO'
                  Title.Caption = 'Classifica'#231#227'o'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADA01'
                  Title.Caption = 'Entrada 01'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SAIDA01'
                  Title.Caption = 'Sa'#237'da 01'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADA02'
                  Title.Caption = 'Entrada 02'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SAIDA02'
                  Title.Caption = 'Sa'#237'da 02'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADA03'
                  Title.Caption = 'Entrada 03'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SAIDA03'
                  Title.Caption = 'Sa'#237'da 03'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADA04'
                  Title.Caption = 'Entrada 04'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SAIDA04'
                  Title.Caption = 'Sa'#237'da 04'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADA05'
                  Title.Caption = 'Entrada 05'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SAIDA05'
                  Title.Caption = 'Sa'#237'da 05'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HORA_EXTRA01'
                  Title.Caption = 'Hora Extra 01'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERCENTUAL_HORA_EXTRA01'
                  Title.Caption = 'Percentual HE 01'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODALIDADE_HORA_EXTRA01'
                  Title.Caption = 'Modalidade HE 01'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HORA_EXTRA02'
                  Title.Caption = 'Hora Extra 02'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERCENTUAL_HORA_EXTRA02'
                  Title.Caption = 'Percentual HE 02'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODALIDADE_HORA_EXTRA02'
                  Title.Caption = 'Modalidade HE 02'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HORA_EXTRA03'
                  Title.Caption = 'Hora Extra 03'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERCENTUAL_HORA_EXTRA03'
                  Title.Caption = 'Percentual HE 03'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODALIDADE_HORA_EXTRA03'
                  Title.Caption = 'Modalidade HE 03'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HORA_EXTRA04'
                  Title.Caption = 'Hora Extra 04'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERCENTUAL_HORA_EXTRA04'
                  Title.Caption = 'Percentual HE 04'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODALIDADE_HORA_EXTRA04'
                  Title.Caption = 'Modalidade HE 04'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FALTA_ATRASO'
                  Title.Caption = 'Horas de Falta/Atraso'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HORA_INICIO_JORNADA'
                  Title.Caption = 'In'#237'cio da Jornada'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HORA_FIM_JORNADA'
                  Title.Caption = 'Fim da Jornada'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_HORARIO'
                  Title.Caption = 'C'#243'digo Hor'#225'rio'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CARGA_HORARIA_ESPERADA'
                  Title.Caption = 'Carga Hor'#225'ria Esperada'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CARGA_HORARIA_DIURNA'
                  Title.Caption = 'Carga Hor'#225'ria Diurna'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CARGA_HORARIA_NOTURNA'
                  Title.Caption = 'Carga Hor'#225'ria Noturna'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CARGA_HORARIA_TOTAL'
                  Title.Caption = 'Carga Hor'#225'ria Total'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMPENSAR'
                  Title.Caption = 'Compensar'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BANCO_HORAS'
                  Title.Caption = 'Banco de Horas'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBSERVACAO'
                  Title.Caption = 'Observa'#231#227'o'
                  Width = 300
                  Visible = True
                end>
            end
          end
        end
        object ActionToolBar1: TActionToolBar
          Left = 4
          Top = 4
          Width = 976
          Height = 23
          ActionManager = ActionManager1
          Caption = 'ActionToolBar1'
          ColorMap.HighlightColor = 15660791
          ColorMap.BtnSelectedColor = clBtnFace
          ColorMap.UnusedColor = 15660791
          Orientation = boRightToLeft
          Spacing = 0
          ExplicitHeight = 26
        end
        object Calendario: TMonthCalendar
          Left = 802
          Top = 48
          Width = 162
          Height = 153
          Anchors = [akTop, akRight]
          Date = 41229.609784629630000000
          TabOrder = 4
          TabStop = True
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoImprimir: TSpeedButton
      ExplicitLeft = 688
    end
    inherited BotaoSeparador1: TSpeedButton
      ExplicitLeft = 578
    end
    inherited BotaoFiltrar: TSpeedButton
      ExplicitLeft = 588
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 384
    Top = 96
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Top = 87
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 696
    Top = 96
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionClassificarDia
            Caption = 'C&lassificar Dia'
            ImageIndex = 35
          end
          item
            Action = ActionConsultar
            Caption = '&Consultar Dados Armazenados'
            ImageIndex = 36
          end
          item
            Caption = '-'
          end
          item
            Action = ActionGerarParaWord
            Caption = '&Gerar Espelho no Word'
            ImageIndex = 17
          end
          item
            Action = ActionImprimirVDOPrint
            Caption = 'I&mprimir VDOPrint'
            ImageIndex = 26
          end
          item
            Action = ActionImprimirRSPrint
            Caption = 'Im&primir RSPrint'
            ImageIndex = 4
          end
          item
            Action = ActionImprimirPrintFast
            Caption = 'Imp&rimir PrintFast'
            ImageIndex = 26
          end
          item
            Action = ActionImprimirRDPrint
            Caption = '&Imprimir RDPrint'
            ImageIndex = 4
          end>
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 732
    Top = 311
    StyleName = 'Platform Default'
    object ActionConsultar: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Consultar Dados Armazenados'
      ImageIndex = 36
      OnExecute = ActionConsultarExecute
    end
    object ActionClassificarDia: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Classificar Dia'
      ImageIndex = 35
      OnExecute = ActionClassificarDiaExecute
    end
    object ActionImprimirRDPrint: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Imprimir RDPrint'
      ImageIndex = 4
      OnExecute = ActionImprimirRDPrintExecute
    end
    object ActionImprimirVDOPrint: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Imprimir VDOPrint'
      ImageIndex = 26
      OnExecute = ActionImprimirVDOPrintExecute
    end
    object ActionGerarParaWord: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Gerar Espelho no Word'
      ImageIndex = 17
      OnExecute = ActionGerarParaWordExecute
    end
    object ActionImprimirRSPrint: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Imprimir RSPrint'
      ImageIndex = 4
      OnExecute = ActionImprimirRSPrintExecute
    end
    object ActionImprimirPrintFast: TAction
      Category = 'Op'#231#245'es'
      Caption = 'Imprimir PrintFast'
      ImageIndex = 26
      OnExecute = ActionImprimirPrintFastExecute
    end
  end
  object CDSPontoFechamentoJornada: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PONTO_CLASSIFICACAO_JORNADA'
        DataType = ftInteger
      end
      item
        Name = 'ID_COLABORADOR'
        DataType = ftInteger
      end
      item
        Name = 'DATA_FECHAMENTO'
        DataType = ftDate
      end
      item
        Name = 'DIA_SEMANA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'CODIGO_HORARIO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CARGA_HORARIA_ESPERADA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CARGA_HORARIA_DIURNA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CARGA_HORARIA_NOTURNA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CARGA_HORARIA_TOTAL'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA01'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA01'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA02'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA02'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA03'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA03'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA04'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA04'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA05'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA05'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'HORA_INICIO_JORNADA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'HORA_FIM_JORNADA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'HORA_EXTRA01'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PERCENTUAL_HORA_EXTRA01'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'MODALIDADE_HORA_EXTRA01'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HORA_EXTRA02'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PERCENTUAL_HORA_EXTRA02'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'MODALIDADE_HORA_EXTRA02'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HORA_EXTRA03'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PERCENTUAL_HORA_EXTRA03'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'MODALIDADE_HORA_EXTRA03'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HORA_EXTRA04'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PERCENTUAL_HORA_EXTRA04'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'MODALIDADE_HORA_EXTRA04'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_COLABORADOR'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'COMPENSAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BANCO_HORAS'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'FALTA_ATRASO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PIS_NUMERO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'CODIGO_CLASSIFICACAO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOME_CLASSIFICACAO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 404
    Top = 321
    Data = {
      040600009619E0BD02000000180000002A000000000003000000040602494404
      000100000000001E49445F504F4E544F5F434C415353494649434143414F5F4A
      4F524E41444104000100000000000E49445F434F4C41424F5241444F52040001
      00000000000F444154415F46454348414D454E544F04000600000000000A4449
      415F53454D414E4101004900000001000557494454480200020007000E434F44
      49474F5F484F524152494F010049000000010005574944544802000200040016
      43415247415F484F52415249415F455350455241444101004900000001000557
      494454480200020008001443415247415F484F52415249415F444955524E4101
      004900000001000557494454480200020008001543415247415F484F52415249
      415F4E4F5455524E410100490000000100055749445448020002000800134341
      5247415F484F52415249415F544F54414C010049000000010005574944544802
      000200080009454E545241444130310100490000000100055749445448020002
      0008000753414944413031010049000000010005574944544802000200080009
      454E545241444130320100490000000100055749445448020002000800075341
      4944413032010049000000010005574944544802000200080009454E54524144
      4130330100490000000100055749445448020002000800075341494441303301
      0049000000010005574944544802000200080009454E54524144413034010049
      0000000100055749445448020002000800075341494441303401004900000001
      0005574944544802000200080009454E54524144413035010049000000010005
      5749445448020002000800075341494441303501004900000001000557494454
      4802000200080013484F52415F494E4943494F5F4A4F524E4144410100490000
      00010005574944544802000200080010484F52415F46494D5F4A4F524E414441
      01004900000001000557494454480200020008000C484F52415F455854524130
      3101004900000001000557494454480200020008001750455243454E5455414C
      5F484F52415F455854524130310C0012000000020008444543494D414C530200
      02000600055749445448020002001400174D4F44414C49444144455F484F5241
      5F4558545241303101004900000001000557494454480200020001000C484F52
      415F455854524130320100490000000100055749445448020002000800175045
      5243454E5455414C5F484F52415F455854524130320C00120000000200084445
      43494D414C53020002000600055749445448020002001400174D4F44414C4944
      4144455F484F52415F4558545241303201004900000001000557494454480200
      020001000C484F52415F45585452413033010049000000010005574944544802
      00020008001750455243454E5455414C5F484F52415F455854524130330C0012
      000000020008444543494D414C53020002000600055749445448020002001400
      174D4F44414C49444144455F484F52415F455854524130330100490000000100
      0557494454480200020001000C484F52415F4558545241303401004900000001
      000557494454480200020008001750455243454E5455414C5F484F52415F4558
      54524130340C0012000000020008444543494D414C5302000200060005574944
      5448020002001400174D4F44414C49444144455F484F52415F45585452413034
      0100490000000100055749445448020002000100104E4F4D455F434F4C41424F
      5241444F52010049000000010005574944544802000200960009434F4D50454E
      53415201004900000001000557494454480200020001000B42414E434F5F484F
      52415301004900000001000557494454480200020008000A4F42534552564143
      414F010049000000010005574944544802000200FA000C46414C54415F415452
      41534F01004900000001000557494454480200020008000A5049535F4E554D45
      524F0100490000000100055749445448020002000C0014434F4449474F5F434C
      415353494649434143414F010049000000010005574944544802000200030012
      4E4F4D455F434C415353494649434143414F0100490000000100055749445448
      0200020032000000}
    object CDSPontoFechamentoJornadaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoFechamentoJornadaID_PONTO_CLASSIFICACAO_JORNADA: TIntegerField
      FieldName = 'ID_PONTO_CLASSIFICACAO_JORNADA'
    end
    object CDSPontoFechamentoJornadaID_COLABORADOR: TIntegerField
      FieldName = 'ID_COLABORADOR'
    end
    object CDSPontoFechamentoJornadaDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      EditMask = '##/##/####'
    end
    object CDSPontoFechamentoJornadaDIA_SEMANA: TStringField
      FieldName = 'DIA_SEMANA'
      Size = 7
    end
    object CDSPontoFechamentoJornadaCODIGO_HORARIO: TStringField
      FieldName = 'CODIGO_HORARIO'
      Size = 4
    end
    object CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA: TStringField
      FieldName = 'CARGA_HORARIA_ESPERADA'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaCARGA_HORARIA_DIURNA: TStringField
      FieldName = 'CARGA_HORARIA_DIURNA'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaCARGA_HORARIA_NOTURNA: TStringField
      FieldName = 'CARGA_HORARIA_NOTURNA'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL: TStringField
      FieldName = 'CARGA_HORARIA_TOTAL'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaENTRADA01: TStringField
      FieldName = 'ENTRADA01'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaSAIDA01: TStringField
      FieldName = 'SAIDA01'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaENTRADA02: TStringField
      FieldName = 'ENTRADA02'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaSAIDA02: TStringField
      FieldName = 'SAIDA02'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaENTRADA03: TStringField
      FieldName = 'ENTRADA03'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaSAIDA03: TStringField
      FieldName = 'SAIDA03'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaENTRADA04: TStringField
      FieldName = 'ENTRADA04'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaSAIDA04: TStringField
      FieldName = 'SAIDA04'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaENTRADA05: TStringField
      FieldName = 'ENTRADA05'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaSAIDA05: TStringField
      FieldName = 'SAIDA05'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaHORA_INICIO_JORNADA: TStringField
      FieldName = 'HORA_INICIO_JORNADA'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaHORA_FIM_JORNADA: TStringField
      FieldName = 'HORA_FIM_JORNADA'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaHORA_EXTRA01: TStringField
      FieldName = 'HORA_EXTRA01'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA01: TFMTBCDField
      FieldName = 'PERCENTUAL_HORA_EXTRA01'
      DisplayFormat = '##0.00'
      Precision = 20
      Size = 6
    end
    object CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA01: TStringField
      FieldName = 'MODALIDADE_HORA_EXTRA01'
      Size = 1
    end
    object CDSPontoFechamentoJornadaHORA_EXTRA02: TStringField
      FieldName = 'HORA_EXTRA02'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA02: TFMTBCDField
      FieldName = 'PERCENTUAL_HORA_EXTRA02'
      DisplayFormat = '##0.00'
      Precision = 20
      Size = 6
    end
    object CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA02: TStringField
      FieldName = 'MODALIDADE_HORA_EXTRA02'
      Size = 1
    end
    object CDSPontoFechamentoJornadaHORA_EXTRA03: TStringField
      FieldName = 'HORA_EXTRA03'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA03: TFMTBCDField
      FieldName = 'PERCENTUAL_HORA_EXTRA03'
      DisplayFormat = '##0.00'
      Precision = 20
      Size = 6
    end
    object CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA03: TStringField
      FieldName = 'MODALIDADE_HORA_EXTRA03'
      Size = 1
    end
    object CDSPontoFechamentoJornadaHORA_EXTRA04: TStringField
      FieldName = 'HORA_EXTRA04'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA04: TFMTBCDField
      FieldName = 'PERCENTUAL_HORA_EXTRA04'
      DisplayFormat = '##0.00'
      Precision = 20
      Size = 6
    end
    object CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA04: TStringField
      FieldName = 'MODALIDADE_HORA_EXTRA04'
      Size = 1
    end
    object CDSPontoFechamentoJornadaNOME_COLABORADOR: TStringField
      FieldName = 'NOME_COLABORADOR'
      Size = 150
    end
    object CDSPontoFechamentoJornadaCOMPENSAR: TStringField
      FieldName = 'COMPENSAR'
      Size = 1
    end
    object CDSPontoFechamentoJornadaBANCO_HORAS: TStringField
      FieldName = 'BANCO_HORAS'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object CDSPontoFechamentoJornadaFALTA_ATRASO: TStringField
      FieldName = 'FALTA_ATRASO'
      EditMask = '##:##:##'
      Size = 8
    end
    object CDSPontoFechamentoJornadaPIS_NUMERO: TStringField
      FieldName = 'PIS_NUMERO'
      Size = 12
    end
    object CDSPontoFechamentoJornadaCODIGO_CLASSIFICACAO: TStringField
      FieldName = 'CODIGO_CLASSIFICACAO'
      Size = 3
    end
    object CDSPontoFechamentoJornadaNOME_CLASSIFICACAO: TStringField
      FieldName = 'NOME_CLASSIFICACAO'
      Size = 50
    end
  end
  object DSPontoFechamentoJornada: TDataSource
    DataSet = CDSPontoFechamentoJornada
    Left = 572
    Top = 321
  end
  object CDSPontoEscalaTurma: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCONTO_HORA_DIA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DESCONTO_DSR'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CODIGO_HORARIO_DOMINGO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_HORARIO_SEGUNDA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_HORARIO_TERCA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_HORARIO_QUARTA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_HORARIO_QUINTA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_HORARIO_SEXTA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_HORARIO_SABADO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODIGO_TURMA'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 376
    Data = {
      DF0100009619E0BD01000000180000000D000000000003000000DF0102494404
      000100000000000A49445F454D50524553410400010000000000044E4F4D4501
      0049000000010005574944544802000200320011444553434F4E544F5F484F52
      415F44494101004900000001000557494454480200020008000C444553434F4E
      544F5F445352010049000000010005574944544802000200080016434F444947
      4F5F484F524152494F5F444F4D494E474F010049000000010005574944544802
      000200040016434F4449474F5F484F524152494F5F534547554E444101004900
      0000010005574944544802000200040014434F4449474F5F484F524152494F5F
      5445524341010049000000010005574944544802000200040015434F4449474F
      5F484F524152494F5F5155415254410100490000000100055749445448020002
      00040015434F4449474F5F484F524152494F5F5155494E544101004900000001
      0005574944544802000200040014434F4449474F5F484F524152494F5F534558
      5441010049000000010005574944544802000200040015434F4449474F5F484F
      524152494F5F53414241444F0100490000000100055749445448020002000400
      0C434F4449474F5F5455524D4101004900000001000557494454480200020005
      000000}
    object CDSPontoEscalaTurmaID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoEscalaTurmaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
    end
    object CDSPontoEscalaTurmaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CDSPontoEscalaTurmaDESCONTO_HORA_DIA: TStringField
      FieldName = 'DESCONTO_HORA_DIA'
      Size = 8
    end
    object CDSPontoEscalaTurmaDESCONTO_DSR: TStringField
      FieldName = 'DESCONTO_DSR'
      Size = 8
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_DOMINGO: TStringField
      FieldName = 'CODIGO_HORARIO_DOMINGO'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_SEGUNDA: TStringField
      FieldName = 'CODIGO_HORARIO_SEGUNDA'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_TERCA: TStringField
      FieldName = 'CODIGO_HORARIO_TERCA'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_QUARTA: TStringField
      FieldName = 'CODIGO_HORARIO_QUARTA'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_QUINTA: TStringField
      FieldName = 'CODIGO_HORARIO_QUINTA'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_SEXTA: TStringField
      FieldName = 'CODIGO_HORARIO_SEXTA'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_HORARIO_SABADO: TStringField
      FieldName = 'CODIGO_HORARIO_SABADO'
      Size = 4
    end
    object CDSPontoEscalaTurmaCODIGO_TURMA: TStringField
      FieldName = 'CODIGO_TURMA'
      Size = 5
    end
  end
  object CDSPontoHorario: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
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
      end
      item
        Name = 'TIPO_TRABALHO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CARGA_HORARIA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA01'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA01'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA02'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA02'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA03'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA03'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA04'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA04'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADA05'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SAIDA05'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'HORA_INICIO_JORNADA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'HORA_FIM_JORNADA'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 376
    Data = {
      380200009619E0BD010000001800000013000000000003000000380202494404
      000100000000000A49445F454D50524553410400010000000000045449504F01
      0049000000010005574944544802000200010006434F4449474F010049000000
      0100055749445448020002000400044E4F4D4501004900000001000557494454
      480200020032000D5449504F5F54524142414C484F0100490000000100055749
      4454480200020001000D43415247415F484F5241524941010049000000010005
      574944544802000200080009454E545241444130310100490000000100055749
      4454480200020008000753414944413031010049000000010005574944544802
      000200080009454E545241444130320100490000000100055749445448020002
      0008000753414944413032010049000000010005574944544802000200080009
      454E545241444130330100490000000100055749445448020002000800075341
      4944413033010049000000010005574944544802000200080009454E54524144
      4130340100490000000100055749445448020002000800075341494441303401
      0049000000010005574944544802000200080009454E54524144413035010049
      0000000100055749445448020002000800075341494441303501004900000001
      0005574944544802000200080013484F52415F494E4943494F5F4A4F524E4144
      41010049000000010005574944544802000200080010484F52415F46494D5F4A
      4F524E41444101004900000001000557494454480200020008000000}
    object CDSPontoHorarioID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoHorarioID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
    end
    object CDSPontoHorarioTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CDSPontoHorarioCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object CDSPontoHorarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CDSPontoHorarioTIPO_TRABALHO: TStringField
      FieldName = 'TIPO_TRABALHO'
      Size = 1
    end
    object CDSPontoHorarioCARGA_HORARIA: TStringField
      FieldName = 'CARGA_HORARIA'
      Size = 8
    end
    object CDSPontoHorarioENTRADA01: TStringField
      FieldName = 'ENTRADA01'
      Size = 8
    end
    object CDSPontoHorarioSAIDA01: TStringField
      FieldName = 'SAIDA01'
      Size = 8
    end
    object CDSPontoHorarioENTRADA02: TStringField
      FieldName = 'ENTRADA02'
      Size = 8
    end
    object CDSPontoHorarioSAIDA02: TStringField
      FieldName = 'SAIDA02'
      Size = 8
    end
    object CDSPontoHorarioENTRADA03: TStringField
      FieldName = 'ENTRADA03'
      Size = 8
    end
    object CDSPontoHorarioSAIDA03: TStringField
      FieldName = 'SAIDA03'
      Size = 8
    end
    object CDSPontoHorarioENTRADA04: TStringField
      FieldName = 'ENTRADA04'
      Size = 8
    end
    object CDSPontoHorarioSAIDA04: TStringField
      FieldName = 'SAIDA04'
      Size = 8
    end
    object CDSPontoHorarioENTRADA05: TStringField
      FieldName = 'ENTRADA05'
      Size = 8
    end
    object CDSPontoHorarioSAIDA05: TStringField
      FieldName = 'SAIDA05'
      Size = 8
    end
    object CDSPontoHorarioHORA_INICIO_JORNADA: TStringField
      FieldName = 'HORA_INICIO_JORNADA'
      Size = 8
    end
    object CDSPontoHorarioHORA_FIM_JORNADA: TStringField
      FieldName = 'HORA_FIM_JORNADA'
      Size = 8
    end
  end
  object RDprint: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Visualiza'#231#227'o do Relat'#243'rio'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'ALBERT EIJE BARRETO MOUTA'
    RegistroUsuario.SerieProduto = 'SINGLE-0112/01920'
    RegistroUsuario.AutorizacaoKey = 'K9K8-WA1Z-YP6H-2AZQ-H76G'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = SemAcento
    CaptionSetup = 'Configura'#231#245'es'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = 15263976
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = False
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 124
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnNewPage = RDprintNewPage
    OnBeforeNewPage = RDprintBeforeNewPage
    OnAfterPrint = RDprintAfterPrint
    Left = 665
    Top = 397
  end
  object CDSPontoMarcacao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_COLABORADOR'
        DataType = ftInteger
      end
      item
        Name = 'ID_PONTO_RELOGIO'
        DataType = ftInteger
      end
      item
        Name = 'NSR'
        DataType = ftInteger
      end
      item
        Name = 'DATA_MARCACAO'
        DataType = ftDate
      end
      item
        Name = 'HORA_MARCACAO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'TIPO_MARCACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO_REGISTRO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'JUSTIFICATIVA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PAR_ENTRADA_SAIDA'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 376
    Data = {
      250100009619E0BD01000000180000000A000000000003000000250102494404
      000100000000000E49445F434F4C41424F5241444F5204000100000000001049
      445F504F4E544F5F52454C4F47494F0400010000000000034E53520400010000
      0000000D444154415F4D4152434143414F04000600000000000D484F52415F4D
      4152434143414F01004900000001000557494454480200020008000D5449504F
      5F4D4152434143414F01004900000001000557494454480200020001000D5449
      504F5F524547495354524F01004900000001000557494454480200020001000D
      4A55535449464943415449564101004900000001000557494454480200020064
      00115041525F454E54524144415F534149444101004900000001000557494454
      480200020002000000}
    object CDSPontoMarcacaoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSPontoMarcacaoID_COLABORADOR: TIntegerField
      FieldName = 'ID_COLABORADOR'
    end
    object CDSPontoMarcacaoID_PONTO_RELOGIO: TIntegerField
      FieldName = 'ID_PONTO_RELOGIO'
    end
    object CDSPontoMarcacaoNSR: TIntegerField
      FieldName = 'NSR'
    end
    object CDSPontoMarcacaoDATA_MARCACAO: TDateField
      FieldName = 'DATA_MARCACAO'
    end
    object CDSPontoMarcacaoHORA_MARCACAO: TStringField
      FieldName = 'HORA_MARCACAO'
      Size = 8
    end
    object CDSPontoMarcacaoTIPO_MARCACAO: TStringField
      FieldName = 'TIPO_MARCACAO'
      Size = 1
    end
    object CDSPontoMarcacaoTIPO_REGISTRO: TStringField
      FieldName = 'TIPO_REGISTRO'
      Size = 1
    end
    object CDSPontoMarcacaoJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Size = 100
    end
    object CDSPontoMarcacaoPAR_ENTRADA_SAIDA: TStringField
      FieldName = 'PAR_ENTRADA_SAIDA'
      Size = 2
    end
  end
  object VDOPrinter: TVDOPrinter
    ShowDialog = True
    ShowPreview = True
    ShowProgress = True
    Title = 'VDOPrint Document'
    OnNewPage = VDOPrinterNewPage
    CanvasSets.Font.Align = taLeftJustify
    CanvasSets.Font.Color = clBlack
    CanvasSets.Font.Name = 'Lucida Console'
    CanvasSets.Font.Pitch = fpFixed
    CanvasSets.Font.Size = 8
    CanvasSets.Font.Style = []
    CanvasSets.LineSpacing = 10
    CanvasSets.Paper.AutoNewPage = True
    CanvasSets.Paper.Columns = 120
    CanvasSets.Paper.Lines = 77
    CanvasSets.Paper.MarginLeft = 0
    CanvasSets.Paper.MarginRight = 0
    CanvasSets.Orientation = poPortrait
    DotMatrixSets.CharMode = cmClear
    DotMatrixSets.Font.Align = faLeft
    DotMatrixSets.Font.FontType = ftDraft
    DotMatrixSets.Font.NLQFont = ntSansSerif
    DotMatrixSets.Font.Pitch = fp10cpp
    DotMatrixSets.Font.Size = fsDefault
    DotMatrixSets.Font.Style = []
    DotMatrixSets.LineSpacing = ls6lpp
    DotMatrixSets.LineSpacingCustomValue = 36
    DotMatrixSets.Paper.AutoNewPage = True
    DotMatrixSets.Paper.AutoNewPageLines = 3
    DotMatrixSets.Paper.Columns = 80
    DotMatrixSets.Paper.Lines = 66
    DotMatrixSets.Paper.MarginLeft = 0
    DotMatrixSets.Paper.MarginRight = 0
    PrinterType = ptCanvas
    ShowTypeDialog = True
    Left = 733
    Top = 397
  end
  object PrintFast: TPrintFast
    PrinterName = pfEpson9pinos
    HeaderData.FirstPage = 1
    Preview.ShowPreview = False
    Preview.BorderIcons = [biSystemMenu]
    Preview.SaveToFile = True
    Preview.PrintConfigEnabled = True
    Preview.PrintEnabled = True
    Preview.FirstEnabled = True
    Preview.PreviousEnabled = True
    Preview.NextEnabled = True
    Preview.LastEnabled = True
    Preview.FontConfigEnabled = True
    Preview.PrintWindowsEnabled = True
    Preview.SelectPagesToPrint = True
    Preview.PreviewTitle = 'Visualiza'#231#227'o do Relat'#243'rio'
    Preview.Font.Charset = DEFAULT_CHARSET
    Preview.Font.Color = clWindowText
    Preview.Font.Height = -11
    Preview.Font.Name = 'Courier New'
    Preview.Font.Style = []
    QtLines = 66
    PageWidth = 80
    Windows.PrintForWindows = False
    Windows.Font.Charset = DEFAULT_CHARSET
    Windows.Font.Color = clWindowText
    Windows.Font.Height = -11
    Windows.Font.Name = 'Courier New'
    Windows.Font.Style = []
    Windows.LineSpace = 25
    Windows.Orientation = poPortrait
    PrinterTermic = False
    ConfigPortCom.Baud = 9600
    ConfigPortCom.Parity = 'n'
    ConfigPortCom.Data = 8
    ConfigPortCom.Stop = 1
    ConfigPortCom.Retry = 'p'
    LanguageMessages = lmPortuguese
    PrintToSpool = False
    PageSize = pzCustom
    LinhasPolegada = lNoChange
    SaltaUltima = False
    EjetaQuebra = False
    eMail = False
    Left = 866
    Top = 401
  end
end
