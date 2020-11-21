object ServerContainer: TServerContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
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
        EntitySetName = 'Paciente'
        Permissions = [List, Get, Insert, Modify, Delete]
      end
      item
        EntitySetName = 'Farmaceutico'
        Permissions = [List, Get, Insert, Modify, Delete]
      end
      item
        EntitySetName = 'Procedimento'
        Permissions = [List, Get, Insert, Modify, Delete]
      end>
    OnEntityInserting = XDataServerEntityInserting
    OnEntityModifying = XDataServerEntityModifying
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
    AdaptedConnection = Banco
    SQLDialect = 'MySQL'
    Left = 216
    Top = 136
  end
  object Banco: TFDConnection
    Params.Strings = (
      'Database=banco'
      'User_Name=root'
      'Password=123456'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 216
    Top = 192
  end
  object AureliusModelEvents1: TAureliusModelEvents
    OnSQLExecuting = AureliusModelEvents1SQLExecuting
    Left = 304
    Top = 16
  end
end
