object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 406
  Width = 680
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:2001/tms/xdata'
    Dispatcher = SparkleHttpSysDispatcher
    Pool = XDataConnectionPool
    EntitySetPermissions = <
      item
        EntitySetName = 'Servico'
        Permissions = [List, Get, Insert, Modify, Delete]
      end
      item
        EntitySetName = 'Pessoa'
        Permissions = [List, Get, Insert, Modify, Delete]
      end>
    Left = 216
    Top = 16
  end
  object XDataConnectionPool: TXDataConnectionPool
    Connection = AureliusConnection
    Left = 216
    Top = 72
  end
  object AureliusConnection: TAureliusConnection
    AdapterName = 'FireDac'
    AdaptedConnection = FDConnection2
    SQLDialect = 'MySQL'
    Left = 216
    Top = 128
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'Database=banco'
      'User_Name=root'
      'Password=123456'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 216
  end
end
