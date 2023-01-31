object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=wk'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 88
    Top = 40
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 96
  end
end
