object FServerContainer: TFServerContainer
  OldCreateOrder = False
  Height = 162
  Width = 445
  object DSServer: TDSServer
    AutoStart = False
    Left = 40
    Top = 11
  end
  object DSHTTPService: TDSHTTPService
    HttpPort = 8080
    RESTContext = 'restT2Ti/'
    Server = DSServer
    Filters = <>
    Left = 128
    Top = 15
  end
end
