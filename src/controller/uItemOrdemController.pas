unit uItemOrdemController;

interface

uses
  uDMMain, uItemOrdem, uItemOrdemService, FireDAC.Stan.Param, Data.DB,
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils;

type
  TItemOrdemController = class
  private
    FService: TItemOrdemService;
  public
    function ListarTodos: TObjectList<TItemOrdem>;
    function ListarPorOS(const AID: Integer): TObjectList<TItemOrdem>;
    function RetornaChave: Integer;
    function Salvar(const AItemOrdem: TItemOrdem): Boolean;
    function Excluir(const AID: Integer): Boolean;
    function ExcluirPorOS(const AID: Integer): Boolean;

    constructor Create;
    destructor Destry;
  end;

implementation

{ TItemOrdemController }

constructor TItemOrdemController.Create;
begin
  FService := TItemOrdemService.Create;
end;

destructor TItemOrdemController.Destry;
begin
  FService.Free;
end;

function TItemOrdemController.Excluir(const AID: Integer): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := False;
  vQuery := DMMain.GetQueryComando;

  vSQL := ' DELETE FROM ITEM_ORDEM WHERE ID = :ID ';

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

function TItemOrdemController.ExcluirPorOS(const AID: Integer): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := False;
  vQuery := DMMain.GetQueryComando;

  vSQL := ' DELETE FROM ITEM_ORDEM WHERE ORDEM_ID = :ORDEM_ID ';

  try
    DMMain.StartTransaction;
    vQuery.SQL.Clear;
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('ORDEM_ID').AsInteger := AID;

    vQuery.ExecSQL;

    DMMain.Commit;

    Result := True;
  except
    DMMain.Rollback;
    raise;
  end;
end;

function TItemOrdemController.ListarPorOS(const AID: Integer): TObjectList<TItemOrdem>;
var
  vQuery: TFDQuery;
  vItemOrdem: TItemOrdem;
  vSQL: string;
begin
  Result := TObjectList<TItemOrdem>.Create;
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT IO.ID, IO.ORDEM_ID, IO.DESCRICAO, ';
  vSQL := vSQL + ' IO.QUANTIDADE, IO.VALOR_UNITARIO ';
  vSQL := vSQL + ' FROM ITEM_ORDEM IO WHERE IO.ORDEM_ID = :OSID ';
  vSQL := vSQL + ' ORDER BY IO.ORDEM_ID ';

  try
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('OSID').AsInteger := AID;

    vQuery.Open(vSQL);

    while not vQuery.Eof do
    begin
      vItemOrdem               := TItemOrdem.Create;
      vItemOrdem.ID            := vQuery.FieldByName('ID').AsInteger;
      vItemOrdem.OrdemID       := vQuery.FieldByName('ORDEM_ID').AsInteger;
      vItemOrdem.Descricao     := vQuery.FieldByName('DESCRICAO').AsString;
      vItemOrdem.Quantidade    := vQuery.FieldByName('QUANTIDADE').AsFloat;
      vItemOrdem.ValorUnitario := vQuery.FieldByName('VALOR_UNITARIO').AsCurrency;

      Result.Add(vItemOrdem);

      vQuery.Next;
    end;
  finally
    vQuery.Free;
  end;
end;

function TItemOrdemController.ListarTodos: TObjectList<TItemOrdem>;
var
  vQuery: TFDQuery;
  vItemOrdem: TItemOrdem;
  vSQL: string;
begin
  Result := TObjectList<TItemOrdem>.Create(True);
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT IO.ID, IO.ORDEM_ID, IO.DESCRICAO, ';
  vSQL := vSQL + ' IO.QUANTIDADE, IO.VALOR_UNITARIO ';
  vSQL := vSQL + ' FROM ITEM_ORDEM IO ';
  vSQL := vSQL + ' ORDER BY IO.ORDEM_ID ';

  try
    vQuery.Open(vSQL);

    while not vQuery.Eof do
    begin
      vItemOrdem               := TItemOrdem.Create;
      vItemOrdem.ID            := vQuery.FieldByName('ID').AsInteger;
      vItemOrdem.OrdemID       := vQuery.FieldByName('ORDEM_ID').AsInteger;
      vItemOrdem.Descricao     := vQuery.FieldByName('DESCRICAO').AsString;
      vItemOrdem.Quantidade    := vQuery.FieldByName('QUANTIDADE').AsFloat;
      vItemOrdem.ValorUnitario := vQuery.FieldByName('VALOR_UNITARIO').AsCurrency;

      Result.Add(vItemOrdem);

      vQuery.Next;
    end;
  finally
    vQuery.Free;
  end;
end;

function TItemOrdemController.RetornaChave: Integer;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := 0;
  vQuery := DMMain.GetQueryLeitura;

  vSQL := ' SELECT NEXT VALUE FOR GEN_ITEM_ORDEM_ID AS CHAVE FROM RDB$DATABASE ';

  try
    vQuery.Open(vSQL);
    Result := vQuery.FieldByName('CHAVE').AsInteger;
  finally
    vQuery.Free;
  end;
end;

function TItemOrdemController.Salvar(const AItemOrdem: TItemOrdem): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := False;

  FService.Validar(AItemOrdem);

  vQuery := DMMain.GetQueryComando;

  vSQL :=        ' UPDATE OR INSERT INTO ITEM_ORDEM (ID, ORDEM_ID, ';
  vSQL := vSQL + ' DESCRICAO, QUANTIDADE, VALOR_UNITARIO) ';
  vSQL := vSQL + ' VALUES (:ID, :ORDEM_ID, :DESCRICAO, :QUANTIDADE, ';
  vSQL := vSQL + ' :VALOR_UNITARIO) ';

  try
    DMMain.StartTransaction;
    vQuery.SQL.Clear;
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('ID').AsInteger              := AItemOrdem.ID;
    vQuery.ParamByName('ORDEM_ID').AsInteger        := AItemOrdem.OrdemID;
    vQuery.ParamByName('DESCRICAO').AsString        := AItemOrdem.Descricao;
    vQuery.ParamByName('QUANTIDADE').AsFloat        := AItemOrdem.Quantidade;
    vQuery.ParamByName('VALOR_UNITARIO').AsCurrency := AItemOrdem.ValorUnitario;

    vQuery.ExecSQL;

    DMMain.Commit;

    Result := True;
  except
    DMMain.Rollback;
    raise;
  end;
end;

end.
