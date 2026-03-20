unit uOrdemServicoController;

interface

uses
  uDMMain, uOrdemServico, uOrdemServicoService, FireDAC.Stan.Param, Data.DB, System.Generics.Collections,
  FireDAC.Comp.Client, System.SysUtils;

type
  TOrdemServicoController = class
  private
    FService: TOrdemServicoService;
  public
    function ListarTodos: TObjectList<TOrdemServico>;
    function ListarFiltro(const AParams: TFDParams): TObjectList<TOrdemServico>;
    function ListarPorID(const AID: Integer): TOrdemServico;
    function ListarTotais: TOrdemServico;
    function RetornaChave: Integer;
    function Salvar(const AOrdemServico: TOrdemServico): Boolean;
    function Excluir(const AID: Integer): Boolean;

    constructor Create;
    destructor Destroy;
  end;

implementation

uses
  uItemOrdem, uItemOrdemController;

{ TOrdemServicoController }

constructor TOrdemServicoController.Create;
begin
  FService := TOrdemServicoService.Create;
end;

destructor TOrdemServicoController.Destroy;
begin
  FService.Free;
end;

function TOrdemServicoController.Excluir(const AID: Integer): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := False;
  vQuery := DMMain.GetQueryComando;

  vSQL := ' DELETE FROM ORDEM_SERVICO WHERE ID = :ID ';

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

function TOrdemServicoController.ListarFiltro(const AParams: TFDParams): TObjectList<TOrdemServico>;
var
  vQuery: TFDQuery;
  vOrdemServico: TOrdemServico;
  vSQL: string;
begin
  Result := TObjectList<TOrdemServico>.Create(True);
  vQuery := DMMain.GetQueryLeitura;

  vSQL := ' SELECT OS.ID, OS.CLIENTE_ID, C.NOME AS CLIENTE, ' +
          ' OS.DATA_ABERTURA, OS.DATA_PREVISTA, OS.DATA_FECHAMENTO, ' +
          ' OS.STATUS, OS.DESCRICAO_PROBLEMA, OS.VALOR_TOTAL ' +
          ' FROM ORDEM_SERVICO OS ' +
          ' LEFT JOIN CLIENTE C ON (C.ID = OS.CLIENTE_ID) ' +
          ' WHERE (1=1) ';

  if AParams.FindParam('NOME_CLIENTE') <> nil then
    vSQL := vSQL + ' AND (C.NOME LIKE :NOME_CLIENTE) ';

  if AParams.FindParam('DATA_ABERTURA_INI') <> nil then
    vSQL := vSQL + ' AND (CAST(OS.DATA_ABERTURA AS DATE) >= :DATA_ABERTURA_INI) ';
  if AParams.FindParam('DATA_ABERTURA_FIM') <> nil then
    vSQL := vSQL + ' AND (CAST(OS.DATA_ABERTURA AS DATE) <= :DATA_ABERTURA_FIM) ';

  if AParams.FindParam('STATUS') <> nil then
    vSQL := vSQL + ' AND (OS.STATUS = :STATUS) ';

  if AParams.FindParam('VALOR_TOTAL_INI') <> nil then
    vSQL := vSQL + ' AND (OS.VALOR_TOTAL >= :VALOR_TOTAL_INI) ';
  if AParams.FindParam('VALOR_TOTAL_FIM') <> nil then
    vSQL := vSQL + ' AND (OS.VALOR_TOTAL <= :VALOR_TOTAL_FIM) ';

  if AParams.FindParam('EM_ATRASO') <> nil then
    vSQL := vSQL + ' AND (OS.DATA_PREVISTA < CURRENT_DATE AND OS.STATUS NOT IN (''CONCLUIDO'',''CANCELADO'')) ';

  vSQL := vSQL + ' ORDER BY OS.DATA_ABERTURA ';

  try
    vQuery.SQL.Text := vSQL;
    vQuery.FetchOptions.Unidirectional := True;

    if vQuery.FindParam('NOME_CLIENTE') <> nil then
      vQuery.ParamByName('NOME_CLIENTE').AsString := AParams.ParamByName('NOME_CLIENTE').AsString;

    if vQuery.FindParam('DATA_ABERTURA_INI') <> nil then
      vQuery.ParamByName('DATA_ABERTURA_INI').AsDateTime := AParams.ParamByName('DATA_ABERTURA_INI').AsDateTime;
    if vQuery.FindParam('DATA_ABERTURA_FIM') <> nil then
      vQuery.ParamByName('DATA_ABERTURA_FIM').AsDateTime := AParams.ParamByName('DATA_ABERTURA_FIM').AsDateTime;

    if vQuery.FindParam('STATUS') <> nil then
      vQuery.ParamByName('STATUS').AsString := AParams.ParamByName('STATUS').AsString;

    if vQuery.FindParam('VALOR_TOTAL_INI') <> nil then
      vQuery.ParamByName('VALOR_TOTAL_INI').AsCurrency := AParams.ParamByName('VALOR_TOTAL_INI').AsCurrency;
    if vQuery.FindParam('VALOR_TOTAL_FIM') <> nil then
      vQuery.ParamByName('VALOR_TOTAL_FIM').AsCurrency := AParams.ParamByName('VALOR_TOTAL_FIM').AsCurrency;

    vQuery.Open;

    while not vQuery.Eof do
    begin
      vOrdemServico := TOrdemServico.Create;
      vOrdemServico.ID := vQuery.FieldByName('ID').AsInteger;
      vOrdemServico.ClienteID := vQuery.FieldByName('CLIENTE_ID').AsInteger;
      vOrdemServico.Cliente := vQuery.FieldByName('CLIENTE').AsString;
      vOrdemServico.DataAbertura := vQuery.FieldByName('DATA_ABERTURA').AsDateTime;
      vOrdemServico.DataPrevista := vQuery.FieldByName('DATA_PREVISTA').AsDateTime;
      vOrdemServico.DataFechamento := vQuery.FieldByName('DATA_FECHAMENTO').AsDateTime;
      vOrdemServico.Status := vQuery.FieldByName('STATUS').AsString;
      vOrdemServico.DescricaoProblema := vQuery.FieldByName('DESCRICAO_PROBLEMA').AsString;
      vOrdemServico.ValorTotal := vQuery.FieldByName('VALOR_TOTAL').AsCurrency;

      vOrdemServico.Itens.Clear;
      with TItemOrdemController.Create do
      try
        vOrdemServico.Itens.AddRange(ListarPorOS(vOrdemServico.ID));
      finally
        Free;
      end;

      Result.Add(vOrdemServico);
      vQuery.Next;
    end;
  finally
    vQuery.Free;
  end;
end;

function TOrdemServicoController.ListarPorID(const AID: Integer): TOrdemServico;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := TOrdemServico.Create;
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT OS.ID, OS.CLIENTE_ID, ';
  vSQL := vSQL + ' C.ID || '' - '' || C.NOME AS CLIENTE, ';
  vSQL := vSQL + ' OS.DATA_ABERTURA, OS.DATA_PREVISTA, ';
  vSQL := vSQL + ' OS.DATA_FECHAMENTO, OS.STATUS, ';
  vSQL := vSQL + ' OS.DESCRICAO_PROBLEMA, OS.VALOR_TOTAL ';
  vSQL := vSQL + ' FROM ORDEM_SERVICO OS ';
  vSQL := vSQL + ' LEFT JOIN CLIENTE C ON(C.ID = OS.CLIENTE_ID) ';
  vSQL := vSQL + ' WHERE OS.ID = :ID ';
  vSQL := vSQL + ' ORDER BY C.ID ';

  try
    vQuery.SQL.Text := vSQL;

    vQuery.ParamByName('ID').AsInteger := AID;

    vQuery.Open(vSQL);

    Result.ID                := vQuery.FieldByName('ID').AsInteger;
    Result.ClienteID         := vQuery.FieldByName('CLIENTE_ID').AsInteger;
    Result.Cliente           := vQuery.FieldByName('CLIENTE').AsString;
    Result.DataAbertura      := vQuery.FieldByName('DATA_ABERTURA').AsDateTime;
    Result.DataPrevista      := vQuery.FieldByName('DATA_PREVISTA').AsDateTime;
    Result.DataFechamento    := vQuery.FieldByName('DATA_FECHAMENTO').AsDateTime;
    Result.Status            := vQuery.FieldByName('STATUS').AsString;
    Result.DescricaoProblema := vQuery.FieldByName('DESCRICAO_PROBLEMA').AsString;
    Result.ValorTotal        := vQuery.FieldByName('VALOR_TOTAL').AsCurrency;
  finally
    vQuery.Free;
  end;
end;

function TOrdemServicoController.ListarTodos: TObjectList<TOrdemServico>;
var
  vQuery: TFDQuery;
  vOrdemServico: TOrdemServico;
  vSQL: string;
begin
  Result := TObjectList<TOrdemServico>.Create(True);
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT OS.ID, OS.CLIENTE_ID, ';
  vSQL := vSQL + ' C.ID || '' - '' || C.NOME AS CLIENTE, ';
  vSQL := vSQL + ' OS.DATA_ABERTURA, OS.DATA_PREVISTA, ';
  vSQL := vSQL + ' OS.DATA_FECHAMENTO, OS.STATUS, ';
  vSQL := vSQL + ' OS.DESCRICAO_PROBLEMA, OS.VALOR_TOTAL ';
  vSQL := vSQL + ' FROM ORDEM_SERVICO OS ';
  vSQL := vSQL + ' LEFT JOIN CLIENTE C ON(C.ID = OS.CLIENTE_ID) ';
  vSQL := vSQL + ' ORDER BY C.ID ';

  try
    vQuery.Open(vSQL);

    while not vQuery.Eof do
    begin
      vOrdemServico                   := TOrdemServico.Create;
      vOrdemServico.ID                := vQuery.FieldByName('ID').AsInteger;
      vOrdemServico.ClienteID         := vQuery.FieldByName('CLIENTE_ID').AsInteger;
      vOrdemServico.Cliente           := vQuery.FieldByName('CLIENTE').AsString;
      vOrdemServico.DataAbertura      := vQuery.FieldByName('DATA_ABERTURA').AsDateTime;
      vOrdemServico.DataPrevista      := vQuery.FieldByName('DATA_PREVISTA').AsDateTime;
      vOrdemServico.DataFechamento    := vQuery.FieldByName('DATA_FECHAMENTO').AsDateTime;
      vOrdemServico.Status            := vQuery.FieldByName('STATUS').AsString;
      vOrdemServico.DescricaoProblema := vQuery.FieldByName('DESCRICAO_PROBLEMA').AsString;
      vOrdemServico.ValorTotal        := vQuery.FieldByName('VALOR_TOTAL').AsCurrency;

      Result.Add(vOrdemServico);

      vQuery.Next;
    end;
  finally
    vQuery.Free;
  end;
end;

function TOrdemServicoController.ListarTotais: TOrdemServico;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := TOrdemServico.Create;
  vQuery := DMMain.GetQueryLeitura;

  vSQL :=        ' SELECT ';
  vSQL := vSQL + ' SUM(CASE WHEN STATUS = ''ABERTO'' THEN 1 ELSE 0 END) AS ABERTOS, ';
  vSQL := vSQL + ' SUM(CASE WHEN STATUS = ''EM ANDAMENTO'' THEN 1 ELSE 0 END) AS EM_ANDAMENTO, ';
  vSQL := vSQL + ' SUM(CASE WHEN STATUS = ''CONCLUIDO'' THEN 1 ELSE 0 END) AS CONCLUIDOS, ';
  vSQL := vSQL + ' SUM(CASE WHEN STATUS = ''CANCELADO'' THEN 1 ELSE 0 END) AS CANCELADOS, ';
  vSQL := vSQL + ' SUM(CASE WHEN DATA_PREVISTA < CURRENT_DATE AND DATA_FECHAMENTO IS NULL ';
  vSQL := vSQL + '          AND STATUS <> ''CANCELADO'' THEN 1 ELSE 0 END) AS ATRASADOS ';
  vSQL := vSQL + ' FROM ORDEM_SERVICO ';

  try
    vQuery.SQL.Text := vSQL;
    vQuery.Open(vSQL);

    Result.TotalAbertos     := vQuery.FieldByName('ABERTOS').AsInteger;
    Result.TotalEmAndamento := vQuery.FieldByName('EM_ANDAMENTO').AsInteger;
    Result.TotalAtrasados   := vQuery.FieldByName('ATRASADOS').AsInteger;
    Result.TotalConcluidos  := vQuery.FieldByName('CONCLUIDOS').AsInteger;
    Result.TotalCancelados  := vQuery.FieldByName('CANCELADOS').AsInteger;
  finally
    vQuery.Free;
  end;
end;

function TOrdemServicoController.RetornaChave: Integer;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := 0;
  vQuery := DMMain.GetQueryLeitura;

  vSQL := ' SELECT NEXT VALUE FOR GEN_ORDEM_SERVICO_ID AS CHAVE FROM RDB$DATABASE ';

  try
    vQuery.Open(vSQL);
    Result := vQuery.FieldByName('CHAVE').AsInteger;
  finally
    vQuery.Free;
  end;
end;

function TOrdemServicoController.Salvar(const AOrdemServico: TOrdemServico): Boolean;
var
  vQuery: TFDQuery;
  vSQL: string;
  vItemOrdem: TItemOrdem;
  vItemOrdemController: TItemOrdemController;
  vStatusAnterior: string;
begin
  Result := False;
  FService.Validar(AOrdemServico);

  // Buscar status anterior se for atualização
  if AOrdemServico.ID > 0 then
  begin
    vQuery := DMMain.GetQueryLeitura;
    try
      vQuery.SQL.Text := 'SELECT STATUS FROM ORDEM_SERVICO WHERE ID = :ID';
      vQuery.ParamByName('ID').AsInteger := AOrdemServico.ID;
      vQuery.Open;
      if not vQuery.IsEmpty then
        vStatusAnterior := vQuery.FieldByName('STATUS').AsString;
    finally
      vQuery.Free;
    end;
  end;

  vQuery := DMMain.GetQueryComando;
  vSQL := 'UPDATE OR INSERT INTO ORDEM_SERVICO (ID, CLIENTE_ID, DATA_ABERTURA, DATA_PREVISTA, ' +
          'DATA_FECHAMENTO, STATUS, DESCRICAO_PROBLEMA, VALOR_TOTAL) ' +
          'VALUES (:ID, :CLIENTE_ID, :DATA_ABERTURA, :DATA_PREVISTA, :DATA_FECHAMENTO, ' +
          ':STATUS, :DESCRICAO_PROBLEMA, :VALOR_TOTAL) ';

  vItemOrdemController := TItemOrdemController.Create;

  try
    try
      DMMain.StartTransaction;
      vQuery.SQL.Clear;
      vQuery.SQL.Text := vSQL;
      vQuery.ParamByName('ID').AsInteger := AOrdemServico.ID;
      vQuery.ParamByName('CLIENTE_ID').AsInteger := AOrdemServico.ClienteID;
      vQuery.ParamByName('DATA_ABERTURA').AsDateTime := AOrdemServico.DataAbertura;
      vQuery.ParamByName('DATA_PREVISTA').AsDateTime := AOrdemServico.DataPrevista;
      vQuery.ParamByName('DATA_FECHAMENTO').ASDateTime := AOrdemServico.DataFechamento;
      vQuery.ParamByName('STATUS').AsString := AOrdemServico.Status;
      vQuery.ParamByName('DESCRICAO_PROBLEMA').AsString := AOrdemServico.DescricaoProblema;
      vQuery.ParamByName('VALOR_TOTAL').AsCurrency := AOrdemServico.ValorTotal;
      vQuery.ExecSQL;

      // Excluir itens existentes e reinserir
      vItemOrdemController.ExcluirPorOS(AOrdemServico.ID);
      for vItemOrdem in AOrdemServico.Itens do
      begin
        vItemOrdem.OrdemID := AOrdemServico.ID;
        vItemOrdemController.Salvar(vItemOrdem);
      end;

      DMMain.Commit;
      Result := True;
    except
      DMMain.Rollback;
      raise;
    end;
  finally
    vQuery.Free;
    vItemOrdemController.Free;
  end;
end;

end.
