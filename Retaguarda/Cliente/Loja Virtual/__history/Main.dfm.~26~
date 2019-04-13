object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 568
  ClientWidth = 916
  Caption = 'T2Ti ERP'
  OldCreateOrder = False
  Menu = UniMainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = SearchEdit
  OnAjaxEvent = UniFormAjaxEvent
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 197
    Height = 549
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    TitleAlign = taCenter
    Title = 'Navegar'
    Caption = 'UniPanel1'
    Collapsible = True
    CollapseDirection = cdLeft
    object NavTree: TUniTreeView
      Left = 1
      Top = 52
      Width = 195
      Height = 496
      Hint = ''
      Items.NodeData = {
        03010000001E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        00000000000100}
      Items.FontData = {0101000000FFFFFFFF00000000}
      Images = UniNativeImageList2
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ScreenMask.ShowMessage = False
      ScreenMask.Target = Owner
      ScreenMask.Color = clWhite
      ScreenMask.Opacity = 0.200000002980232200
      Color = clWindow
      BorderStyle = ubsNone
      OnLoaded = NavTreeLoaded
      OnClick = NavTreeClick
      OnCellContextClick = NavTreeCellContextClick
    end
    object UniToolBar1: TUniToolBar
      Left = 1
      Top = 1
      Width = 195
      Height = 29
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      ButtonHeight = 23
      Images = UniNativeImageList1
      BorderWidth = 1
      Anchors = [akLeft, akTop, akRight]
      Align = alTop
      TabOrder = 2
      ParentColor = False
      Color = clBtnFace
      object UniToolButton1: TUniToolButton
        Left = 0
        Top = 0
        Hint = 'Expandir Tudo'
        ShowHint = True
        ImageIndex = 0
        Caption = 'UniToolButton1'
        TabOrder = 1
        OnClick = UniToolButton1Click
      end
      object UniToolButton2: TUniToolButton
        Left = 23
        Top = 0
        Hint = 'Colapsar Tudo'
        ShowHint = True
        ImageIndex = 1
        Caption = 'UniToolButton2'
        TabOrder = 2
        OnClick = UniToolButton2Click
      end
      object UniToolButton3: TUniToolButton
        Left = 46
        Top = 0
        Width = 8
        Hint = ''
        ShowHint = True
        Style = tbsSeparator
        Caption = 'UniToolButton3'
        TabOrder = 3
      end
      object UniToolButton4: TUniToolButton
        Left = 54
        Top = 0
        Hint = 'Fechar Todas as Abas'
        ShowHint = True
        ImageIndex = 2
        Caption = 'UniToolButton4'
        ScreenMask.Enabled = True
        ScreenMask.Message = 'Cleaning up...'
        ScreenMask.Target = Owner
        ScreenMask.Color = clWhite
        ScreenMask.Opacity = 0.349999994039535500
        TabOrder = 4
        OnClick = UniToolButton4Click
      end
      object UniToolButton5: TUniToolButton
        Left = 77
        Top = 0
        Width = 8
        Hint = ''
        ShowHint = True
        Style = tbsSeparator
        Caption = 'UniToolButton5'
        TabOrder = 5
      end
      object UniToolButton6: TUniToolButton
        Left = 85
        Top = 0
        Hint = 'Go to uniGUI website'
        ShowHint = True
        ImageIndex = 3
        Caption = 'UniToolButton6'
        TabOrder = 6
        OnClick = UniToolButton6Click
      end
    end
    object SearchEdit: TUniComboBox
      Left = 1
      Top = 30
      Width = 195
      Hint = ''
      Text = 'Busca'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      MinQueryLength = 3
      CheckChangeDelay = 250
      ClearButton = True
      FieldLabelWidth = 250
      Triggers = <
        item
          ButtonId = 0
          IconCls = 'x-form-search-trigger'
          HandleClicks = True
        end>
      OnChange = SearchEditChange
      OnTriggerEvent = SearchEditTriggerEvent
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 197
    Top = 0
    Width = 6
    Height = 549
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 549
    Width = 916
    Height = 19
    Hint = ''
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Width = 200
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 203
    Top = 0
    Width = 713
    Height = 549
    Hint = ''
    ParentColor = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 713
      Height = 41
      Hint = ''
      ParentColor = False
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        713
        41)
      object ThemeComboBox: TUniComboBox
        Left = 547
        Top = 9
        Width = 156
        Hint = ''
        Style = csDropDownList
        Text = ''
        Anchors = [akTop, akRight]
        TabOrder = 0
        OnChange = ThemeComboBoxChange
      end
      object UniLabel1: TUniLabel
        Left = 512
        Top = 14
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Tema:'
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 41
      Width = 713
      Height = 508
      Hint = ''
      ActivePage = UniTabSheet1
      Images = UniNativeImageList2
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      OnChange = UniPageControl1Change
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        OnClose = TabSheetClose
        Caption = 'Main'
        inline FrameMain1: TFrameMain
          Left = 0
          Top = 0
          Width = 705
          Height = 480
          OnCreate = FrameMain1Create
          Color = clWhite
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ParentColor = False
          ParentBackground = False
          ParentRTL = False
          ExplicitWidth = 705
          ExplicitHeight = 480
          inherited UniContainerPanel1: TUniContainerPanel
            Width = 705
            Height = 464
            ExplicitWidth = 705
            ExplicitHeight = 464
            inherited UniImage1: TUniImage
              Width = 705
              Height = 394
              ExplicitWidth = 705
              ExplicitHeight = 394
            end
            inherited UniImage2: TUniImage
              Top = 394
              Width = 705
              ExplicitTop = 394
              ExplicitWidth = 705
            end
          end
          inherited UniLabel2: TUniLabel
            Top = 464
            Width = 705
            ExplicitTop = 464
            ExplicitWidth = 705
          end
        end
      end
    end
  end
  object UniClockTimer: TUniTimer
    Interval = 30000
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniClockTimerTimer
    Left = 62
    Top = 160
  end
  object UniMainMenu1: TUniMainMenu
    Images = UniNativeImageList2
    ScreenMask.Enabled = True
    ScreenMask.Color = clWhite
    ScreenMask.Opacity = 0.200000002980232200
    Left = 64
    Top = 240
    object File1: TUniMenuItem
      Caption = 'Arquivo'
      object uniGUIWebsite1: TUniMenuItem
        Caption = 'uniGUI Website'
        OnClick = UniToolButton6Click
      end
      object Exit1: TUniMenuItem
        Caption = 'Sair'
        OnClick = Exit1Click
      end
    end
    object Favorites1: TUniMenuItem
      Caption = 'Favoritos'
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 120
    Top = 56
    Images = {
      04000000FFFFFF1F057E04000000000100010010100000010020006804000016
      0000002800000010000000200000000100200000000000000000000000000000
      000000000000000000000000000000000000008C7973FF000000000000000000
      00000063A65AFF848684FF848684FF848684FF848684FF848684FF848684FF84
      8684FF848684FF848684FF00000000000000008C7163FF00000000000000007B
      6152FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7
      E7E7FFE7E7E7FF848684FF00000000000000008C7163FF8C7973FF8C7163FF31
      A631FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FF212021FFE7E7E7FFE7
      E7E7FFE7E7E7FF848684FF00000000000000008C7973FF000000000000000063
      A65AFF84B684FF848684FFF7F7EFFFF7F7EFFFF7F7EFFF212021FFF7F7EFFFF7
      F7EFFFF7F7EFFF848684FF00000000000000008C7163FF000000000000000000
      00000063A65AFF848684FFF7F7EFFF181818FF181818FF000000FF181818FF18
      1818FFF7F7EFFF848684FF00000000000000008C7973FF000000000000000000
      00000000000000848684FFFFF7F7FFFFF7F7FFFFF7F7FF081010FFFFF7F7FFFF
      F7F7FFFFF7F7FF848684FF00000000000000008C7163FF000000000000000000
      00000063A65AFF848684FFFFF7F7FFFFF7F7FFFFF7F7FF000000FFFFF7F7FFFF
      F7F7FFFFF7F7FF848684FF00000000000000008C7973FF000000000000000063
      A65AFF63A65AFF848684FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFF
      FFF7FFFFFFF7FF848684FF00000000000000008C7163FF8C7973FF8C7163FF31
      A631FF63A65AFF8C8E94FF848684FF848684FF848684FF848684FF848684FF84
      8684FF848684FF8C8E94FF00000000000000008C7163FF000000000000000063
      A65AFF63A65AFF84B684FF84B684FF63A65AFF00000000000000000000000000
      000000000000000000000000000000000000008C7163FF000000000000000000
      00000063A65AFF63A65AFF63A65AFF0000000000000000000000000000000000
      00000000000000000000000000000063A65AFF63A65AFF7B6152FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063A65AFF63A65AFF63A65AFF63A65AFF63A65AFF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031A631FF63A65AFF63A65AFF84B684FF31A631FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063A65AFF63A65AFF9CDFA5FF63A65AFF63A65AFF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000063A65AFF63A65AFF63A65AFF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000DC00AC41D800AC41C000AC41D800AC41DC00AC41DE
      00AC41DC00AC41D800AC41C000AC41D83FAC41DC7FAC418FFFAC4107FFAC4107
      FFAC4107FFAC418FFFAC41FFFFFF1F057E040000000001000100101000000100
      2000680400001600000028000000100000002000000001002000000000000000
      00000000000000000000000000000000000000000000000000008C7973FF0000
      0000000000000000000063A65AFF848684FF848684FF848684FF848684FF8486
      84FF848684FF848684FF848684FF848684FF00000000000000008C7163FF0000
      0000000000007B6152FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FF848684FF00000000000000008C7163FF8C79
      73FF8C7163FF31A631FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FF848684FF00000000000000008C7973FF0000
      00000000000063A65AFF84B684FF848684FFF7F7EFFFF7F7EFFFF7F7EFFFF7F7
      EFFFF7F7EFFFF7F7EFFFF7F7EFFF848684FF00000000000000008C7163FF0000
      0000000000000000000063A65AFF848684FFF7F7EFFF181818FF181818FF0000
      00FF181818FF181818FFF7F7EFFF848684FF00000000000000008C7973FF0000
      0000000000000000000000000000848684FFFFF7F7FFFFF7F7FFFFF7F7FFFFF7
      F7FFFFF7F7FFFFF7F7FFFFF7F7FF848684FF00000000000000008C7163FF0000
      0000000000000000000063A65AFF848684FFFFF7F7FFFFF7F7FFFFF7F7FFFFF7
      F7FFFFF7F7FFFFF7F7FFFFF7F7FF848684FF00000000000000008C7973FF0000
      00000000000063A65AFF63A65AFF848684FFFFFFF7FFFFFFF7FFFFFFF7FFFFFF
      F7FFFFFFF7FFFFFFF7FFFFFFF7FF848684FF00000000000000008C7163FF8C79
      73FF8C7163FF31A631FF63A65AFF8C8E94FF848684FF848684FF848684FF8486
      84FF848684FF848684FF848684FF8C8E94FF00000000000000008C7163FF0000
      00000000000063A65AFF63A65AFF84B684FF84B684FF63A65AFF000000000000
      00000000000000000000000000000000000000000000000000008C7163FF0000
      0000000000000000000063A65AFF63A65AFF63A65AFF00000000000000000000
      0000000000000000000000000000000000000000000063A65AFF63A65AFF7B61
      52FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A65AFF63A65AFF63A65AFF63A6
      5AFF63A65AFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A631FF63A65AFF63A65AFF84B6
      84FF31A631FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A65AFF63A65AFF9CDFA5FF63A6
      5AFF63A65AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063A65AFF63A65AFF63A6
      5AFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DC00AC41D800AC41C000AC41D800
      AC41DC00AC41DE00AC41DC00AC41D800AC41C000AC41D83FAC41DC7FAC418FFF
      AC4107FFAC4107FFAC4107FFAC418FFFAC41FFFFFF1F040101000089504E470D
      0A1A0A0000000D49484452000000100000001008060000001FF3FF6100000009
      7048597300000EC300000EC301C76FA864000000B349444154388D6360A01030
      3EEF739BCFC0C09080437E8164D1AE444206FCC7A760E6272B9C720D0D0D8C2C
      849C585F5F8F55BCB1B191818181818165E6272BBC8AB0CB20004117C06C22CB
      005C2E43369889900B08018A0D2018065090C8C8C8B8806C03181919175C0B35
      C29A5E8875010303030383E6AAB30CEFB62D636060606010F28A62B81E664C9A
      0177B27D1914BB96C1D90C0CD40A444289050654A66E867B4165EA6686EB61C6
      0C8CC4DA842B1001A91430D225B86B260000000049454E44AE426082FFFFFF1F
      057E040000000001000100101000000100200068040000160000002800000010
      0000002000000001002000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006AA361FF388D35FF1A
      7D1AFF1D7F1DFF3B8E38FF73A668FF0000000000000000000000000000000000
      0000000000000000000000000000007BAB70FF208121FF26912AFF26992CFF24
      9E2BFF219B27FF219527FF238E25FF1F801FFF93B583FF000000000000000000
      00000000000000000000003D8F39FF2F8F32FF3BAA46FF38AB42FF31A83BFF2D
      A535FF2BA433FF2DA535FF31A83BFF33A43CFF2A8B2CFF51984BFF0000000000
      000000000000007CAB70FF369539FF4BB558FF44B250FF3DAE49FF38AB43FF3C
      A342FF3DA141FF35A93FFF38AB43FF3DAE49FF44B250FF2F8D2FFF9AB88AFF00
      00000000000000248324FF52B760FF50B85EFF4AB557FF44B251FF46A94DFFE7
      E1DCFF4C9E4BFF3DAE48FF40AF4CFF44B251FF4AB557FF48AF54FF238222FF00
      00000073A769FF41A24AFF5CBE6CFF56BB65FF50B85FFF50AF59FFE7E1DCFFE7
      E1DCFF599B54FF53A254FF55A456FF57A559FF57AE5EFF56BB65FF38983DFF8C
      B17DFF499545FF58B768FF62C273FF5CBF6DFF5BB466FFE7E1DCFFE7E1DCFFE7
      E1DCFFE7E1DCFFE7E1DCFFE7E1DCFFF3EFEBFF61AA64FF5CBF6DFF4BAC56FF57
      9B51FF2D872CFF6CC67EFF68C57BFF66BA72FFE7E1DCFFE7E1DCFFE7E1DCFFE7
      E1DCFFE7E1DCFFE7E1DCFFE7E1DCFFF3EFEBFF66AD6AFF63C275FF5FBC6FFF27
      8426FF2A8529FF72CA86FF6FC983FFF3EFEBFFF3EFEBFFF3EFEBFFF3EFEBFFF3
      EFEBFFF3EFEBFFF3EFEBFFF3EFEBFFF3EFEBFF6CB071FF6AC67DFF65C076FF2D
      882CFF449341FF68BF79FF76CC8BFF71CA86FFFAF5F4FFFAF5F4FFFAF5F4FFFA
      F5F4FFFAF5F4FFFAF5F4FFFAF5F4FFFAF5F4FF72B378FF71CA86FF58B266FF59
      9B52FF71A667FF51AB5EFF7DD093FF79CE8FFF76CC8BFFFAF5F4FFF6F1F0FFF6
      F1F0FFFAF5F4FFFAF5F4FFFAF5F4FFFAF5F4FF77C386FF79CE8FFF459F4DFF8C
      B17EFF00000000268427FF7DCE92FF81D298FF7ED194FF7BCF91FFFAF5F4FFF6
      F1F0FF7AB781FF78CE8EFF79CE8FFF7BCF91FF7ED194FF71C585FF248324FF00
      000000000000007DAB71FF499E4FFF89D7A1FF86D59DFF83D49BFF82D399FFFA
      F5F4FF80C891FF81D297FF82D399FF83D49BFF86D59DFF3A923DFF9AB88AFF00
      000000000000000000000040903DFF439B49FF82CF98FF8CD8A4FF8AD7A3FF89
      D7A1FF89D7A1FF89D7A1FF8AD7A3FF7BCA8FFF3A933DFF559A4EFF0000000000
      0000000000000000000000000000007DAB71FF248324FF51A95DFF6EBF7FFF87
      D39EFF83D099FF6BBC7CFF4CA456FF218222FF93B584FF000000000000000000
      000000000000000000000000000000000000000000000075A86BFF4A9648FF28
      8527FF288527FF4B9648FF76A86BFF0000000000000000000000000000000000
      000000F81FAC41E007AC41C003AC418001AC418001AC410000AC410000AC4100
      00AC410000AC410000AC410000AC418001AC418001AC41C003AC41E007AC41F8
      1FAC41}
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 128
    Top = 344
    object AddtoFavorites1: TUniMenuItem
      Caption = 'Adicionar aos Favoritos'
      OnClick = AddtoFavorites1Click
    end
    object RemoveFromFavorites1: TUniMenuItem
      Caption = 'Remover dos Favoritos'
      OnClick = RemoveFromFavorites1Click
    end
  end
  object UniNativeImageList2: TUniNativeImageList
    Left = 80
    Top = 408
  end
  object SQLConnection: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver190.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=19.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver190.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=19.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=t2tierp'
      'User_Name=root'
      'Password=root'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 823
    Top = 97
  end
  object CDSCarrinho: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'GTIN'
        DataType = ftString
        Size = 14
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 830
    Top = 160
    Data = {
      780000009619E0BD010000001800000005000000000003000000780002494404
      00010000000000044E4F4D450100490000000100055749445448020002009600
      0A5155414E54494441444508000400000000000556414C4F5208000400000000
      00044754494E0100490000000100055749445448020002000E000000}
    object CDSCarrinhoID: TIntegerField
      FieldName = 'ID'
    end
    object CDSCarrinhoNOME: TStringField
      FieldName = 'NOME'
      Size = 150
    end
    object CDSCarrinhoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CDSCarrinhoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,###,###.00'
    end
    object CDSCarrinhoGTIN: TStringField
      FieldName = 'GTIN'
      Size = 14
    end
    object CDSCarrinhoTOTAL: TAggregateField
      FieldName = 'TOTAL'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
end
