object frm_inicio: Tfrm_inicio
  Left = 0
  Top = 0
  Caption = 'AGENDA'
  ClientHeight = 390
  ClientWidth = 410
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
  object lblContatos: TLabel
    Left = 32
    Top = 27
    Width = 201
    Height = 42
    Caption = 'CONTATOS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 75
    Width = 345
    Height = 120
    DataSource = ds_pesquisa
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end>
  end
  object btnCad: TBitBtn
    Left = 32
    Top = 201
    Width = 81
    Height = 40
    Caption = 'Novo Contato'
    TabOrder = 1
    OnClick = btnCadClick
  end
  object btnExcluir: TBitBtn
    Left = 318
    Top = 201
    Width = 59
    Height = 40
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object Panel1: TPanel
    Left = 32
    Top = 264
    Width = 345
    Height = 89
    TabOrder = 3
    object DBText1: TDBText
      Left = 64
      Top = 16
      Width = 273
      Height = 17
      DataField = 'nome'
      DataSource = ds_pesquisa
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Nome: '
    end
    object Label3: TLabel
      Left = 24
      Top = 35
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object DBText2: TDBText
      Left = 64
      Top = 35
      Width = 273
      Height = 17
      DataField = 'email'
      DataSource = ds_pesquisa
    end
    object Label4: TLabel
      Left = 9
      Top = 54
      Width = 49
      Height = 13
      Caption = 'Telefone: '
    end
    object DBText3: TDBText
      Left = 64
      Top = 54
      Width = 273
      Height = 17
      DataField = 'telefone'
      DataSource = ds_pesquisa
    end
  end
  object btnEditar: TBitBtn
    Left = 232
    Top = 201
    Width = 75
    Height = 40
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object ds_pesquisa: TDataSource
    DataSet = DataModule1.qry_pesq_contato
    Left = 312
    Top = 8
  end
end
