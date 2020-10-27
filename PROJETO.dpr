program PROJETO;

uses
  Vcl.Forms,
  UInicio in 'UInicio.pas' {frm_inicio},
  Vcl.Themes,
  Vcl.Styles,
  UDM in 'UDM.pas' {DataModule1: TDataModule},
  UCadastro in 'UCadastro.pas' {frm_cadastro},
  UEditar in 'UEditar.pas' {frm_editar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(Tfrm_inicio, frm_inicio);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrm_cadastro, frm_cadastro);
  Application.CreateForm(Tfrm_editar, frm_editar);
  Application.Run;
end.
