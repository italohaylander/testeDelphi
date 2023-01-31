program TesteWK;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadastrarCliente in 'view\uFrmCadastrarCliente.pas' {FrmCadastrarCliente},
  uClienteModel in 'model\uClienteModel.pas',
  uClienteController in 'controller\uClienteController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DMConexao: TDataModule},
  uDmCliente in 'dao\uDmCliente.pas' {DmCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
