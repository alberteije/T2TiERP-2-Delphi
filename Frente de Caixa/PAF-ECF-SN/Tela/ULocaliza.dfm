object FLocaliza: TFLocaliza
  Left = 441
  Top = 361
  Align = alCustom
  BorderStyle = bsSingle
  Caption = 'Localiza - Teclado Reduzido'
  ClientHeight = 128
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  object btnProdutos: TJvSpeedButton
    Left = 24
    Top = 8
    Width = 230
    Height = 35
    Alignment = taLeftJustify
    Caption = '  1 - Pesquisa Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    HotTrackFont.Charset = ANSI_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -16
    HotTrackFont.Name = 'Verdana'
    HotTrackFont.Style = []
    ParentFont = False
    OnClick = btnProdutosClick
  end
  object btnClientes: TJvSpeedButton
    Left = 24
    Top = 47
    Width = 230
    Height = 35
    Alignment = taLeftJustify
    Caption = '  2 - Identifica Clientes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    HotTrackFont.Charset = ANSI_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -16
    HotTrackFont.Name = 'Verdana'
    HotTrackFont.Style = []
    ParentFont = False
    OnClick = btnClientesClick
  end
  object btnVendedor: TJvSpeedButton
    Left = 24
    Top = 85
    Width = 230
    Height = 35
    Alignment = taLeftJustify
    Caption = '  3 - Identifica Vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    HotTrackFont.Charset = ANSI_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -16
    HotTrackFont.Name = 'Verdana'
    HotTrackFont.Style = []
    ParentFont = False
    OnClick = btnVendedorClick
  end
end
