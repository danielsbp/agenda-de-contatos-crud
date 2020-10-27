object frm_cadastro: Tfrm_cadastro
  Left = 0
  Top = 0
  Caption = 'frm_cadastro'
  ClientHeight = 270
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 112
    Top = 72
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = dbeNome
  end
  object Label3: TLabel
    Left = 112
    Top = 112
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = dbeTelefone
  end
  object Label4: TLabel
    Left = 112
    Top = 152
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = dbeEmail
  end
  object Label1: TLabel
    Left = 112
    Top = 24
    Width = 112
    Height = 35
    Caption = 'Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbeNome: TDBEdit
    Left = 112
    Top = 88
    Width = 134
    Height = 21
    DataField = 'nome'
    DataSource = DataSource1
    TabOrder = 0
  end
  object dbeTelefone: TDBEdit
    Left = 112
    Top = 237
    Width = 134
    Height = 21
    DataField = 'telefone'
    DataSource = DataSource1
    TabOrder = 3
  end
  object dbeEmail: TDBEdit
    Left = 112
    Top = 168
    Width = 134
    Height = 21
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 2
  end
  object btnCadastro: TBitBtn
    Left = 144
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btnCadastroClick
  end
  object meTelefone: TMaskEdit
    Left = 112
    Top = 131
    Width = 126
    Height = 21
    EditMask = '!\(999\)00000-0000;1;_'
    MaxLength = 15
    TabOrder = 1
    Text = '(   )     -    '
    OnChange = meTelefoneChange
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.qry_pesq_contato
    Left = 296
    Top = 80
  end
end
