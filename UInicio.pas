unit UInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfrm_inicio = class(TForm)
    lblContatos: TLabel;
    DBGrid1: TDBGrid;
    ds_pesquisa: TDataSource;
    btnCad: TBitBtn;
    btnExcluir: TBitBtn;
    Panel1: TPanel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    btnEditar: TBitBtn;
    procedure btnCadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_inicio: Tfrm_inicio;

implementation

{$R *.dfm}

uses UDM, UCadastro, UEditar;

procedure Tfrm_inicio.btnCadClick(Sender: TObject);
begin
  //Este c�digo � executado quando o usu�rio
  //Clica no bot�o "Novo Contato".
  //Basicamente, ele abre uma tela de cadastro
  //De contato.
  UCadastro.frm_cadastro.ShowModal;
end;

procedure Tfrm_inicio.btnEditarClick(Sender: TObject);
begin
  //Este c�digo � executado quando o usu�rio
  //Clica no bot�o "Editar".
  //Basicamente, ele abre uma tela de edi��o
  //com as informa��es do contato.
  UEditar.frm_editar.ShowModal;
end;

procedure Tfrm_inicio.btnExcluirClick(Sender: TObject);
begin
  // Estes c�digos executam quando o bot�o de "Excluir"
  // � acionado.
  //O IF vai verificar se o usu�rio deseja excluir ou n�o.
  if(MESSAGEBOX(application.Handle, 'Deseja mesmo excluir?', pChar('Confirmar'), MB_YESNO) = ID_YES) then
  begin
     ds_pesquisa.DataSet.Delete;
     //Este IF serve para desativar os bot�es de excluir
     //e editar caso n�o haja dados registrados
     //na tabela "contato".
     if(DBGrid1.DataSource.DataSet.IsEmpty) then
     begin
      btnExcluir.Enabled := False;
      btnEditar.Enabled := False;
     end;
  end;

end;

procedure Tfrm_inicio.DBGrid1CellClick(Column: TColumn);
begin
   if not DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    btnExcluir.Enabled := True;
    btnEditar.Enabled := True;
  end
  else
  begin
    btnExcluir.Enabled := False;
    btnEditar.Enabled := False;
  end;
end;



procedure Tfrm_inicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Fecha a query assim que o programa for fechado.
  UDM.DataModule1.qry_pesq_contato.Close;
end;

procedure Tfrm_inicio.FormShow(Sender: TObject);

begin
  //Abre a query assim que o programa inicia
  UDM.DataModule1.qry_pesq_contato.Open;
  // Verifica se h� dados na tabela "contato".
  // Se o resultado for verdadeiro, ent�o os bot�es
  // s�o desativados.
  if(DBGrid1.DataSource.DataSet.IsEmpty) then
  begin
    btnExcluir.Enabled := False;
    btnEditar.Enabled := False;
  end;


end;

end.
