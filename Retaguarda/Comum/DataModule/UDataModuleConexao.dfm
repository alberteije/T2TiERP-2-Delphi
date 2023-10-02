object FDataModuleConexao: TFDataModuleConexao
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Conexao: TSQLConnection
    LoginPrompt = False
    Left = 32
    Top = 16
  end
end
