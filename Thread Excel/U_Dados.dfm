object Dados: TDados
  Height = 197
  Width = 303
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DB.mdb;Persist Secu' +
      'rity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 72
    Top = 40
  end
  object Query_Clientes: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select *  From Clientes')
    Left = 72
    Top = 112
    object Query_ClientesID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object Query_ClientesNOME: TWideStringField
      FieldName = 'NOME'
      Size = 255
    end
    object Query_ClientesTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Size = 255
    end
    object Query_ClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
  end
  object Source_Clientes: TDataSource
    DataSet = Query_Clientes
    Left = 168
    Top = 112
  end
end
