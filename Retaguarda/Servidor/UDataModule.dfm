object FDataModule: TFDataModule
  OldCreateOrder = False
  Height = 273
  Width = 265
  object ACBrSintegra: TACBrSintegra
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 50
    Top = 144
  end
  object ACBrSPEDFiscal: TACBrSPEDFiscal
    Path = '.\'
    Arquivo = 'SpedFiscal.txt'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 48
    Top = 16
  end
  object ACBrSPEDContabil: TACBrSPEDContabil
    Path = '.\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 48
    Top = 80
  end
end
