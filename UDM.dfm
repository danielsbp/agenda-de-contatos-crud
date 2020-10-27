object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 267
  Width = 409
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1234;Persist Security Info=True;Use' +
      'r ID=sa;Initial Catalog=crud;Data Source=SPAMDZN-PC\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 152
    Top = 64
  end
  object qry_pesq_contato: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM contato ORDER BY nome ASC')
    Left = 144
    Top = 136
    object qry_pesq_contatoid: TAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'id'
      ReadOnly = True
    end
    object qry_pesq_contatonome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 80
    end
    object qry_pesq_contatotelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 15
    end
    object qry_pesq_contatoemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 256
    end
  end
end
