object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  RecallLastTheme = True
  BrowserOptions = [boDisableMouseRightClick]
  MonitoredKeys.Keys = <>
  OnHandleRequest = UniGUIMainModuleHandleRequest
  Height = 382
  Width = 516
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'companyname'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'contactname'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'contacttitle'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'address'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'city'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'country'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'phone'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'postalcode'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end>
    SQL.Strings = (
      'select * from [Customers]'
      'where '
      'companyname like :companyname'
      'and '
      'contactname like :contactname'
      'and '
      'contacttitle like :contacttitle'
      'and '
      'address like :address'
      'and '
      'city like :city'
      'and '
      'country like :country'
      'and '
      'phone like :phone'
      'and '
      'postalcode like :postalcode'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 128
    Top = 8
    object ADOQuery1CustomerID: TWideStringField
      FieldName = 'CustomerID'
      Size = 5
    end
    object ADOQuery1CompanyName: TWideStringField
      FieldName = 'CompanyName'
      Size = 40
    end
    object ADOQuery1ContactName: TWideStringField
      FieldName = 'ContactName'
      Size = 30
    end
    object ADOQuery1ContactTitle: TWideStringField
      FieldName = 'ContactTitle'
      Size = 30
    end
    object ADOQuery1Address: TWideStringField
      FieldName = 'Address'
      Size = 60
    end
    object ADOQuery1City: TWideStringField
      FieldName = 'City'
      Size = 15
    end
    object ADOQuery1Region: TWideStringField
      FieldName = 'Region'
      Size = 15
    end
    object ADOQuery1PostalCode: TWideStringField
      FieldName = 'PostalCode'
      Size = 10
    end
    object ADOQuery1Country: TWideStringField
      FieldName = 'Country'
      Size = 15
    end
    object ADOQuery1Phone: TWideStringField
      FieldName = 'Phone'
      Size = 24
    end
    object ADOQuery1Fax: TWideStringField
      FieldName = 'Fax'
      Size = 24
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 344
    Top = 8
  end
  object DataSource: TDataSource
    DataSet = ADOQuery1
    Left = 272
    Top = 8
  end
  object ADOConnection2: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery3
    Left = 272
    Top = 64
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery4
    Left = 352
    Top = 64
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'companyname'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'contactname'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'contacttitle'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'address'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'city'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'country'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'phone'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'postalcode'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end>
    SQL.Strings = (
      'select * from [Customers]'
      'where '
      'companyname like :companyname'
      'and '
      'contactname like :contactname'
      'and '
      'contacttitle like :contacttitle'
      'and '
      'address like :address'
      'and '
      'city like :city'
      'and '
      'country like :country'
      'and '
      'phone like :phone'
      'and '
      'postalcode like :postalcode'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 128
    Top = 64
    object WideStringField1: TWideStringField
      FieldName = 'CustomerID'
      Size = 5
    end
    object WideStringField2: TWideStringField
      FieldName = 'CompanyName'
      Size = 40
    end
    object WideStringField3: TWideStringField
      FieldName = 'ContactName'
      Size = 30
    end
    object WideStringField4: TWideStringField
      FieldName = 'ContactTitle'
      Size = 30
    end
    object WideStringField5: TWideStringField
      FieldName = 'Address'
      Size = 60
    end
    object WideStringField6: TWideStringField
      FieldName = 'City'
      Size = 15
    end
    object WideStringField7: TWideStringField
      FieldName = 'Region'
      Size = 15
    end
    object WideStringField8: TWideStringField
      FieldName = 'PostalCode'
      Size = 10
    end
    object WideStringField9: TWideStringField
      FieldName = 'Country'
      Size = 15
    end
    object WideStringField10: TWideStringField
      FieldName = 'Phone'
      Size = 24
    end
    object WideStringField11: TWideStringField
      FieldName = 'Fax'
      Size = 24
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct Country from [Customers]'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 200
    Top = 8
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct Country from [Customers]'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 200
    Top = 64
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection3
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'companyname'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'contactname'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'contacttitle'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'address'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'city'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'country'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '%%'
      end
      item
        Name = 'phone'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'postalcode'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from [Customers]'
      'where '
      'companyname like :companyname'
      'and '
      'contactname like :contactname'
      'and '
      'contacttitle like :contacttitle'
      'and '
      'address like :address'
      'and '
      'city like :city'
      'and '
      'country like :country'
      'and '
      'phone like :phone'
      'and '
      'postalcode like :postalcode'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 120
    Top = 128
    object WideStringField12: TWideStringField
      FieldName = 'CustomerID'
      Size = 5
    end
    object WideStringField13: TWideStringField
      FieldName = 'CompanyName'
      Size = 40
    end
    object WideStringField14: TWideStringField
      FieldName = 'ContactName'
      Size = 30
    end
    object WideStringField15: TWideStringField
      FieldName = 'ContactTitle'
      Size = 30
    end
    object WideStringField16: TWideStringField
      FieldName = 'Address'
      Size = 60
    end
    object WideStringField17: TWideStringField
      FieldName = 'City'
      Size = 15
    end
    object WideStringField18: TWideStringField
      FieldName = 'Region'
      Size = 15
    end
    object WideStringField19: TWideStringField
      FieldName = 'PostalCode'
      Size = 10
    end
    object WideStringField20: TWideStringField
      FieldName = 'Country'
      Size = 15
    end
    object WideStringField21: TWideStringField
      FieldName = 'Phone'
      Size = 24
    end
    object WideStringField22: TWideStringField
      FieldName = 'Fax'
      Size = 24
    end
  end
  object ADOConnection3: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 128
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery6
    Left = 208
    Top = 192
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery5
    Left = 208
    Top = 128
  end
  object ADOConnection4: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 200
  end
  object ADOQuery6: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Customers')
    Left = 136
    Top = 200
  end
end
