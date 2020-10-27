unit UEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls;

type
  Tfrm_editar = class(TForm)
    dbtContato: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbtNome: TDBEdit;
    Label4: TLabel;
    dbtTel: TDBEdit;
    Label5: TLabel;
    dbtEmail: TDBEdit;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Label6: TLabel;
    dbtID: TDBText;
    meTel: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure meTelChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_editar: Tfrm_editar;
  valida: Boolean;
  msg: String;

implementation

{$R *.dfm}

uses UCadastro, UDM, UInicio;

procedure Tfrm_editar.btnCancelarClick(Sender: TObject);
begin
  // Executa quando o usuário clica em cancelar.
  // Basicamente, este comando desativa o modo de
  // edição do registro e fecha a tela.
  UInicio.frm_inicio.ds_pesquisa.DataSet.Cancel;
  Close;
end;

procedure Tfrm_editar.btnSalvarClick(Sender: TObject);
var
  nome, telefone, email: String;
begin
  // Executa quando o usuário clica em "salvar".
  // Salva as alterações e fecha a tela.
  nome := dbtNome.Text;
  telefone := dbtTel.Text;
  email := dbtEmail.Text;

  valida := frm_cadastro.verificar(nome, telefone, email);
  if(valida = true)then
  begin
    UInicio.frm_inicio.ds_pesquisa.DataSet.Post;
    MessageBox(Application.Handle, pChar('Salvo com sucesso!'), 'Confirmar', MB_OK);
    Close;
  end
  else
  begin
    MessageBox(Application.Handle, pChar(frm_cadastro.msg), 'Erro', MB_ICONERROR);
  end;

end;

procedure Tfrm_editar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UInicio.frm_inicio.ds_pesquisa.DataSet.Cancel;
end;

procedure Tfrm_editar.FormShow(Sender: TObject);
begin
  // Como esta tela serve para editar o registro,
  // assim que ela inicia, o DataSource abre o registro
  // para alterações com este comando.
  UInicio.frm_inicio.ds_pesquisa.DataSet.Edit;
  meTel.Text := UInicio.frm_inicio.ds_pesquisa.DataSet.FieldByName('telefone').Value;
end;

procedure Tfrm_editar.meTelChange(Sender: TObject);
begin
  dbtTel.Text := meTel.Text;
end;

end.
