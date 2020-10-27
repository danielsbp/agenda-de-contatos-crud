unit UCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Data.DB;

type
  Tfrm_cadastro = class(TForm)
    DataSource1: TDataSource;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbeTelefone: TDBEdit;
    Label4: TLabel;
    dbeEmail: TDBEdit;
    btnCadastro: TBitBtn;
    meTelefone: TMaskEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure meTelefoneChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
    function verificar(nome, tel, email: String):Boolean;
    var
      msg: String;
  end;

var
  frm_cadastro: Tfrm_cadastro;
  valida: Boolean;


implementation

{$R *.dfm}

uses UInicio;


procedure Tfrm_cadastro.btnCadastroClick(Sender: TObject);
var
  nome, email, tel: String;
begin

  nome := dbeNome.Text;
  tel := meTelefone.Text;
  email := dbeEmail.Text;
  valida := verificar(nome, tel, email);

  if(valida=true)then
  begin
     msg := 'Verifique os dados: '
    + sLineBreak + 'Nome: ' + nome
    + sLineBreak + 'E-mail: ' + email
    + sLineBreak + 'Telefone: ' + tel;
    // Mostra uma mensagem de confirmação para o usuário.
    // Se ele clicar em sim, o registro é armazenado no
    // banco de dados. Se clicar em não, o DataSource sai
    // do modo de novo registro.
    if(MessageBox(Application.Handle, pChar(msg), 'Confirmar', MB_YESNO) = ID_YES) then
    begin
      DataSource1.DataSet.Post;
      UInicio.frm_inicio.btnEditar.Enabled := True;
      UInicio.frm_inicio.btnExcluir.Enabled := True;
      meTelefone.Text := '';
      frm_cadastro.Close;
    end
    else
    begin
      DataSource1.DataSet.Cancel;
    end;
  end
  else
  begin
    MessageBox(Application.Handle, pChar(msg), 'Erro', MB_OK + MB_ICONWARNING);
  end;

end;

procedure Tfrm_cadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet.Cancel;
end;

procedure Tfrm_cadastro.FormShow(Sender: TObject);
begin
  // Assim que o formulário abrir, o DataSource muda seu
  // modo para adicionar mais um registro, através do
  // procedure Append.
  DataSource1.DataSet.Append;
  dbeTelefone.Visible := False;
end;

procedure Tfrm_cadastro.meTelefoneChange(Sender: TObject);
begin
  dbeTelefone.Text := meTelefone.Text;
end;

function Tfrm_cadastro.verificar(nome, tel, email: String): Boolean;
var
  aux: String;
begin
  Result := True;
  aux := '';

  if(nome=null)then
  begin
    nome := '';
  end;

  if(email=null)then
  begin
    email := '';
  end;

  msg := 'Corrija os erros citados: ' + sLineBreak;

  {
  Aqui são verificado os erros que possivelmente
  os usuários podem fazer em relação aos campos
  }

  if (nome.Length<2) and (nome<>'') then
  begin
    Result := false;
    msg := msg + '- Não existe nome com apenas um caracter' + sLineBreak;
  end;

  //f
  if (nome='') then
  begin
    Result := false;
    msg := msg + '- Nada foi digitado no campo nome' + sLineBreak;
  end
  else
  begin
    aux := nome[1];
    if not(strToIntDef(aux, 1000) = 1000) then
    begin
      Result := false;
      msg := msg + '- Não comece o campo nome com número' + sLineBreak;
    end;

  end;




  //f
  if(nome.Length>80) then
  begin
    Result := False;
    msg := msg + '- O nome deve ter menos de 80 caracteres' + sLineBreak;
  end;
  //f


  if(email.Length>256) then
  begin
    Result := false;
    msg := msg + '- O E-mail não pode ter mais 256 caracteres' + sLineBreak;
  end;

  if(tel='(   )     -    ')then
  begin
    Result := false;
    msg := msg + '- Campo Telefone está vazio' + sLineBreak;
  end;

  if(email='')then
  begin
    Result := false;
    msg := msg + '- Campo E-mail está vazio' + sLineBreak;
  end
  else
  begin
    if not((email.Contains('@')) and (email.Contains('.com'))) then
    begin
      Result := false;
      msg := msg + '- Endereço de E-mail inválido' + sLineBreak;
    end;
  end;


end;

end.
