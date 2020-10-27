object frm_editar: Tfrm_editar
  Left = 0
  Top = 0
  Caption = 'Editar Contato'
  ClientHeight = 366
  ClientWidth = 328
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
  object dbtContato: TDBText
    Left = 121
    Top = 80
    Width = 153
    Height = 17
    DataField = 'nome'
    DataSource = frm_inicio.ds_pesquisa
  end
  object Label1: TLabel
    Left = 72
    Top = 80
    Width = 43
    Height = 13
    Caption = 'Contato:'
  end
  object Label2: TLabel
    Left = 72
    Top = 104
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label3: TLabel
    Left = 72
    Top = 144
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = dbtNome
  end
  object Label4: TLabel
    Left = 72
    Top = 184
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = dbtTel
  end
  object Label5: TLabel
    Left = 72
    Top = 224
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = dbtEmail
  end
  object Label6: TLabel
    Left = 72
    Top = 48
    Width = 175
    Height = 32
    Caption = 'Editar Contato'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object dbtID: TDBText
    Left = 72
    Top = 123
    Width = 65
    Height = 17
    DataField = 'id'
    DataSource = frm_inicio.ds_pesquisa
  end
  object dbtNome: TDBEdit
    Left = 72
    Top = 160
    Width = 185
    Height = 21
    DataField = 'nome'
    DataSource = frm_inicio.ds_pesquisa
    TabOrder = 0
  end
  object dbtTel: TDBEdit
    Left = 72
    Top = 311
    Width = 185
    Height = 21
    DataField = 'telefone'
    DataSource = frm_inicio.ds_pesquisa
    TabOrder = 1
    Visible = False
  end
  object dbtEmail: TDBEdit
    Left = 72
    Top = 240
    Width = 185
    Height = 21
    DataField = 'email'
    DataSource = frm_inicio.ds_pesquisa
    TabOrder = 2
  end
  object btnSalvar: TBitBtn
    Left = 72
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnCancelar: TBitBtn
    Left = 182
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object meTel: TMaskEdit
    Left = 72
    Top = 203
    Width = 175
    Height = 21
    EditMask = '!\(999\)99999-9999;1;_'
    MaxLength = 15
    TabOrder = 5
    Text = '(   )     -    '
    OnChange = meTelChange
  end
end
