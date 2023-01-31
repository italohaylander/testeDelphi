unit uClienteController;

interface
uses
  uClienteModel,uDmCliente,System.SysUtils;
type
   TClienteControler = class
   public
   constructor Create;
   destructor Destroy; override;
    procedure pesquisarCliente(sNome:String);
    procedure carregarCliente(oCliente:TCliente;iCodigo:Integer);
    function inserir(oCliente: TCliente; var sErro: String): Boolean;
    function alterar(oCliente: TCliente; var sErro: String): Boolean;
    function excluir(iCodigo:integer;var sErro: String): Boolean;
   end;

implementation

{ TClienteControler }

function TClienteControler.alterar(oCliente: TCliente;
  var sErro: String): Boolean;
begin
  Result := DmCliente.alterarCliente(oCliente,sErro)
end;

procedure TClienteControler.carregarCliente(oCliente: TCliente;
  iCodigo: Integer);
begin
  DmCliente.carregarCliente(oCliente,iCodigo);
end;

constructor TClienteControler.Create;
begin
  //DmCliente:= TDmCliente.Create(nil);
end;

destructor TClienteControler.Destroy;
begin
  //FreeAndNil(DmCliente);
  inherited;
end;

function TClienteControler.excluir(iCodigo: integer;
  var sErro: String): Boolean;
begin
  Result := DmCliente.excluirCliente(iCodigo,sErro);
end;

function TClienteControler.inserir(oCliente: TCliente;
  var sErro: String): Boolean;
begin
   Result :=  DmCliente.inserirCliente(oCliente,sErro);
end;

procedure TClienteControler.pesquisarCliente(sNome: String);
begin
  DmCliente.pesquisar(sNome);
end;

end.
