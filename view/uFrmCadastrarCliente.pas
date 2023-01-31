unit uFrmCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,uClienteController,uClienteModel,uDmCliente,
  Vcl.Mask, Vcl.DBCtrls;

type
  TOperacao = (opNovo, opAlterar, opNavegar);
  TFrmCadastrarCliente = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TBitBtn;
    pgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    pnlFiltro: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TBitBtn;
    pnlBtnsPesq: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    dsPesq: TDataSource;
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSobrenome: TLabeledEdit;
    edtDocumento: TLabeledEdit;
    pDados: TPanel;
    edtCep: TLabeledEdit;
    btnAlterar: TButton;
    pBotoes: TPanel;
    btnGravar: TButton;
    btnListar: TButton;
    btnCancelar: TButton;
    edtDtRegistro: TLabeledEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    FOperacao:TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure Alterar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao:TOperacao);
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmCadastrarCliente: TFrmCadastrarCliente;

implementation

{$R *.dfm}



procedure TFrmCadastrarCliente.Alterar;
var oCliente:Tcliente;
    oClienteControler:TClienteControler;
    sErro:String;
begin
  oCliente := TCliente.Create;
  oClienteControler:= TClienteControler.Create;

  try
    with oCliente do
    begin
      ID := StrToInt(edtId.Text);
      Nome := edtNome.Text;
      Sobrenome := edtSobrenome.Text;
      Documento := edtDocumento.Text;

    end;
    if oClienteControler.alterar(oCliente,sErro) = False then
     raise Exception.Create(sErro);
  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteControler);
  end;
end;

procedure TFrmCadastrarCliente.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TFrmCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastrarCliente.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmCadastrarCliente.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrmCadastrarCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastrarCliente.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastrarCliente.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TFrmCadastrarCliente.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TFrmCadastrarCliente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFrmCadastrarCliente.CarregarCliente;
var
  oCliente : tCliente;
  oClienteController:TClienteControler;
begin
   oCliente:= TCliente.Create;
   oClienteController := TClienteControler.Create;
   try
     oClienteController.carregarCliente(oCliente,DmCliente.cdsPesquisar.FieldByName('idpessoa').AsInteger);
     with oCliente do
     begin
        edtID.Text := IntToStr(ID);
        edtNome.text := Nome;
        edtSobrenome.Text := Sobrenome;
        edtDocumento.Text := Documento;
        edtCep.Text  := Cep;
        edtDtRegistro.Text := DateToStr(DtRegistro);
     end;
   finally
     FreeAndNil(oCliente);
     FreeAndNil(oClienteController);
   end;
end;

procedure TFrmCadastrarCliente.Configuracoes;
begin
    tbPesq.TabVisible := false;
    tbdados.TabVisible := False;
    pgcPrincipal.ActivePage :=  tbPesq;
end;

procedure TFrmCadastrarCliente.DBGrid1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmCadastrarCliente.Detalhar;
begin
  CarregarCliente;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TFrmCadastrarCliente.Excluir;
var
  oClienteControler : TClienteControler;
  sErro : String;
begin
  oClienteControler := TClienteControler.Create;
  try
    if (DmCliente.cdsPesquisar.Active) and (DmCliente.cdsPesquisar.RecordCount> 0)  then
    begin
      if MessageDlg('Deseja Realmente excluir esse registro?',TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = IDYES then
      begin
        if not oClienteControler.excluir(DmCliente.cdsPesquisaridpessoa.AsInteger,sErro) then
          raise Exception.Create(sErro);
        oClienteControler.pesquisarCliente(edtPesquisar.text);
      end;

    end
    else
      raise Exception.Create('N�o h� registro para excluir');

  finally
    FreeAndNil(oClienteControler);
  end;
end;

procedure TFrmCadastrarCliente.FormCreate(Sender: TObject);
begin
  DmCliente:= TDmCliente.Create(nil);
end;

procedure TFrmCadastrarCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmCliente);
end;

procedure TFrmCadastrarCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFrmCadastrarCliente.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TFrmCadastrarCliente.Gravar;
var
  oClienteControler : TClienteControler;
begin
  oClienteControler := TClienteControler.Create;
  try
    case FOperacao    of
       opNovo : Inserir;
       opAlterar : Alterar;
    end;
    oClienteControler.pesquisarCliente(edtPesquisar.Text);
  Finally
    FreeAndNil(oClienteControler);
  End;
end;

procedure TFrmCadastrarCliente.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo,opAlterar :
    begin
      edtNome.Enabled := True;
      edtSobrenome.Enabled := True;
      edtDocumento.Enabled := True;
      edtCep.Enabled := True;
      edtDtRegistro.Enabled := True;
      btnListar.Enabled := False;
      btnFechar.Enabled := False;
      btnAlterar.Enabled := False;
      btnGravar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
    opNavegar:
    begin
      edtNome.Enabled := False;
      edtSobrenome.Enabled := False;
      edtDocumento.Enabled := False;
      edtCep.Enabled := False;
      edtDtRegistro.Enabled := False;
      btnListar.Enabled := True;
      btnFechar.Enabled := True;
      btnAlterar.Enabled := True;
      btnGravar.Enabled := False;
      btnCancelar.Enabled := False;
    end;

  end;

end;

procedure TFrmCadastrarCliente.Inserir;
var
  oCliente: TCliente;
  oClienteControler : TClienteControler;
  sErro : String;
begin
  oCliente := Tcliente.Create;
  oClienteControler := TClienteControler.Create;
  try
    with oCliente do
    begin
      ID := 0;
      Natureza := 0;
      Nome := edtNome.Text;
      Sobrenome := edtSobrenome.Text;
      Documento := edtDocumento.Text;
      Cep := edtCep.Text;
      DtRegistro := Now;
    end;
    if not oClienteControler.inserir(oCliente,sErro) then
       raise Exception.Create(sErro);
  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteControler);
  end;
end;

procedure TFrmCadastrarCliente.Listar;
begin
  pgcPrincipal.ActivePage := TbPesq;
end;

procedure TFrmCadastrarCliente.Novo;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TFrmCadastrarCliente.Pesquisar;
var
  oClienteController:TClienteControler;
begin
  oClienteController := TClienteControler.Create;
  try
    oClienteController.pesquisarCliente(edtPesquisar.text);
  finally
    FreeAndNil(oClienteController);
  end;



end;

end.
