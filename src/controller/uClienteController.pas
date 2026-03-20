unit uClienteController;

interface

uses
  uDMMain, uCliente, uClienteService, FireDAC.Stan.Param, Data.DB, System.Generics.Collections,
  FireDAC.Comp.Client, System.SysUtils;

type
  TClienteController = class
  private
    FService: TClienteService;
  public
    function ListarTodos: TObjectList<TCliente>;
    function ListarFiltro(const AParams: TFDParams): TObjectList<TCliente>;
    function ListarPorID(const AID: Integer): TCliente;
    function RetornaChave: Integer;
    function Salvar(const ACliente: TCliente): Boolean;
    function Excluir(const AID: Integer): Boolean;

    constructor Create;
    destructor Destry;
  end;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  FService := TClienteService.Create;
end;

destructor TClienteController.Destry;
begin
  FService.Free;
end;

function TClienteController.Excluir(const AID: Integer): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := False;
  vQuery := DMMain.GetQueryComando;

  vSQL := ' DELETE FROM CLIENTE WHERE ID = :ID ';

  try
    DMMain.StartTransaction;
    vQuery.SQL.Clear;
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('ID').AsInteger := AID;

    vQuery.ExecSQL;

    DMMain.Commit;

    Result := True;
  except
    DMMain.Rollback;
    raise;
  end;
end;

function TClienteController.ListarTodos: TObjectList<TCliente>;
var
  vQuery: TFDQuery;
  vCliente: TCliente;
  vSQL: string;
begin
  Result := TObjectList<TCliente>.Create(True);
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT C.ID, C.NOME, C.DOCUMENTO, ';
  vSQL := vSQL + ' C.EMAIL, C.TELEFONE, C.DATACADASTRO ';
  vSQL := vSQL + ' FROM CLIENTE C ORDER BY C.NOME ';

  try
    vQuery.Open(vSQL);

    while not vQuery.Eof do
    begin
      vCliente              := TCliente.Create;
      vCliente.ID           := vQuery.FieldByName('ID').AsInteger;
      vCliente.Nome         := vQuery.FieldByName('NOME').AsString;
      vCliente.Documento    := vQuery.FieldByName('DOCUMENTO').AsString;
      vCliente.Email        := vQuery.FieldByName('EMAIL').AsString;
      vCliente.Telefone     := vQuery.FieldByName('TELEFONE').AsString;
      vCliente.DataCadastro := vQuery.FieldByName('DATACADASTRO').AsDateTime;

      Result.Add(vCliente);

      vQuery.Next;
    end;
  finally
    vQuery.Free;
  end;
end;

function TClienteController.RetornaChave: Integer;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := 0;
  vQuery := DMMain.GetQueryLeitura;

  vSQL := ' SELECT NEXT VALUE FOR GEN_CLIENTE_ID AS CHAVE FROM RDB$DATABASE ';

  try
    vQuery.Open(vSQL);
    Result := vQuery.FieldByName('CHAVE').AsInteger;
  finally
    vQuery.Free;
  end;
end;

function TClienteController.ListarPorID(const AID: Integer): TCliente;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := TCliente.Create;
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT C.ID, C.NOME, C.DOCUMENTO, ';
  vSQL := vSQL + ' C.EMAIL, C.TELEFONE, C.DATACADASTRO ';
  vSQL := vSQL + ' FROM CLIENTE C WHERE C.ID = :ID ';

  try
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('ID').AsInteger := AID;

    vQuery.Open(vSQL);

    Result.ID           := vQuery.FieldByName('ID').AsInteger;
    Result.Nome         := vQuery.FieldByName('NOME').AsString;
    Result.Documento    := vQuery.FieldByName('DOCUMENTO').AsString;
    Result.Email        := vQuery.FieldByName('EMAIL').AsString;
    Result.Telefone     := vQuery.FieldByName('TELEFONE').AsString;
    Result.DataCadastro := vQuery.FieldByName('DATACADASTRO').AsDateTime;
  finally
    vQuery.Free;
  end;
end;

function TClienteController.ListarFiltro(const AParams: TFDParams): TObjectList<TCliente>;
var
  vQuery: TFDQuery;
  vCliente: TCliente;
  vSQL: string;
begin
  Result := TObjectList<TCliente>.Create(True);
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT C.ID, C.NOME, C.DOCUMENTO, C.EMAIL, C.TELEFONE, ';
  vSQL := vSQL + ' C.DATACADASTRO FROM CLIENTE C ';
  vSQL := vSQL + ' WHERE (1=1) ';

  if AParams.FindParam('NOME') <> nil then
    vSQL := vSQL + ' AND (C.NOME LIKE ''%'' || :NOME || ''%'') ';

  if AParams.FindParam('DOCUMENTO') <> nil then
    vSQL := vSQL + ' AND (C.DOCUMENTO LIKE ''%'' || :DOCUMENTO || ''%'') ';

  if AParams.FindParam('EMAIL') <> nil then
    vSQL := vSQL + ' AND (C.EMAIL LIKE ''%'' || :EMAIL || ''%'') ';

  if AParams.FindParam('TELEFONE') <> nil then
    vSQL := vSQL + ' AND (C.TELEFONE LIKE ''%'' || :TELEFONE || ''%'') ';

  if (AParams.FindParam('DATACADINI') <> nil) and (AParams.FindParam('DATACADFIM') = nil) then
    vSQL := vSQL + ' AND (CAST(C.DATACADASTRO AS DATE) >= :DATACADINI) '
  else if (AParams.FindParam('DATACADINI') = nil) and (AParams.FindParam('DATACADFIM') <> nil) then
    vSQL := vSQL + ' AND (CAST(C.DATACADASTRO AS DATE) >= :DATACADFIM) '
  else if (AParams.FindParam('DATACADINI') <> nil) and (AParams.FindParam('DATACADFIM') <> nil) then
    vSQL := vSQL + ' AND (CAST(C.DATACADASTRO AS DATE) BETWEEN :DATACADINI AND :DATACADFIM) ';

  vSQL := vSQL + ' ORDER BY C.NOME ';

  try
    vQuery.FetchOptions.Unidirectional := True;

    vQuery.SQL.Text := vSQL;

    if vQuery.FindParam('ID') <> nil then
      vQuery.ParamByName('ID').AsInteger := AParams.ParamByName('ID').AsInteger;

    if vQuery.FindParam('NOME') <> nil then
      vQuery.ParamByName('NOME').AsString := AParams.ParamByName('NOME').AsString;

    if vQuery.FindParam('DOCUMENTO') <> nil then
      vQuery.ParamByName('DOCUMENTO').AsString := AParams.ParamByName('DOCUMENTO').AsString;

    if vQuery.FindParam('EMAIL') <> nil then
      vQuery.ParamByName('EMAIL').AsString := AParams.ParamByName('EMAIL').AsString;

    if vQuery.FindParam('EMAIL') <> nil then
      vQuery.ParamByName('EMAIL').AsString := AParams.ParamByName('EMAIL').AsString;

    if vQuery.FindParam('TELEFONE') <> nil then
      vQuery.ParamByName('TELEFONE').AsString := AParams.ParamByName('TELEFONE').AsString;

    if (AParams.FindParam('DATACADINI') <> nil) and (AParams.FindParam('DATACADFIM') = nil) then

    if (vQuery.FindParam('DATACADINI') <> nil) then
      vQuery.ParamByName('DATACADINI').AsDateTime := AParams.ParamByName('DATACADINI').AsDateTime;

    if (vQuery.FindParam('DATACADFIM') <> nil) then
      vQuery.ParamByName('DATACADFIM').AsDateTime := AParams.ParamByName('DATACADFIM').AsDateTime;

    vQuery.Open(vSQL);

    while not vQuery.Eof do
    begin
      vCliente              := TCliente.Create;
      vCliente.ID           := vQuery.FieldByName('ID').AsInteger;
      vCliente.Nome         := vQuery.FieldByName('NOME').AsString;
      vCliente.Documento    := vQuery.FieldByName('DOCUMENTO').AsString;
      vCliente.Email        := vQuery.FieldByName('EMAIL').AsString;
      vCliente.Telefone     := vQuery.FieldByName('TELEFONE').AsString;
      vCliente.DataCadastro := vQuery.FieldByName('DATACADASTRO').AsDateTime;

      Result.Add(vCliente);
      vQuery.Next;
    end;
  finally
    vQuery.Free;
  end;
end;

function TClienteController.Salvar(const ACliente: TCliente): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := False;

  FService.Validar(ACliente);

  vQuery := DMMain.GetQueryComando;

  vSQL :=        ' UPDATE OR INSERT INTO CLIENTE (ID, NOME, DOCUMENTO, EMAIL, TELEFONE, DATACADASTRO) ';
  vSQL := vSQL + ' VALUES (:ID, :NOME, :DOCUMENTO, :EMAIL, :TELEFONE, :DATACADASTRO) ';

  try
    DMMain.StartTransaction;
    vQuery.SQL.Clear;
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('ID').AsInteger  := ACliente.ID;
    vQuery.ParamByName('NOME').AsString := ACliente.Nome;
    vQuery.ParamByName('DOCUMENTO').AsString := ACliente.Documento;
    vQuery.ParamByName('EMAIL').AsString := ACliente.Email;
    vQuery.ParamByName('TELEFONE').AsString := ACliente.Telefone;
    vQuery.ParamByName('DATACADASTRO').AsDateTime := ACliente.DataCadastro;

    vQuery.ExecSQL;

    DMMain.Commit;

    Result := True;
  except
    DMMain.Rollback;
    raise;
  end;
end;

end.
