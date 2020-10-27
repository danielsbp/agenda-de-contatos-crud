// Caso queira utilizar o programa, clique no componente
// ADOConnection e mude sua propriedade ConnectionString de
// acordo com as informações do seu SQL Server.
// Não se esqueça de executar o código tabela.sql em seu
// Server antes de rodar o programa.
unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    qry_pesq_contato: TADOQuery;
    qry_pesq_contatoid: TAutoIncField;
    qry_pesq_contatonome: TStringField;
    qry_pesq_contatotelefone: TStringField;
    qry_pesq_contatoemail: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
