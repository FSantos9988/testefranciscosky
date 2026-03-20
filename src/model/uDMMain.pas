unit uDMMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf, System.IniFiles,
  System.IOUtils,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.VCLUI.Wait,
  FireDAC.Comp.DataSet, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Pool, FireDAC.UI.Intf, FireDAC.Stan.Def;

type
  TDMMain = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FConnection: TFDConnection;
    FTransaction: TFDTRansaction;
    FIniFile: TIniFile;

    function GetConnection: TFDConnection;
    function GetTRansaction: TFDTransaction;
    procedure LoadConfigIni;
    function GetConfigPath: string;
  public
    { Public declarations }
    property Connection: TFDConnection read GetConnection;
    property Transaction: TFDTransaction read GetTRansaction;

    // Método para Queries de Leitura (Listagem/Grids)
    function GetQueryLeitura: TFDQuery;
    // Método para Comandos de Escrita (DML)
    function GetQueryComando: TFDQuery;

    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;

    function RetornaChave(const ATabela: string): Integer;

    procedure OpenConnection;
    function TestConnection: Boolean;
    procedure CloseConnection;
  end;

var
  DMMain: TDMMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMMain.CloseConnection;
begin
  FConnection.Connected := False;
end;

procedure TDMMain.Commit;
begin
  if FTransaction.Active then
    FTransaction.Commit;
end;

procedure TDMMain.DataModuleCreate(Sender: TObject);
begin
  FConnection  := TFDConnection.Create(nil);
  FTransaction := TFDTransaction.Create(nil);

  FTransaction.Connection := FConnection;

  LoadConfigIni;

  try
    OpenConnection;
  except
    on Ex: Exception do
    raise Exception.CreateFmt('Erro ao conectar com o banco:%s%sVerifique o arquivo config.ini no diretório do executável:%s%s- Firebird 5 está rodando?%s- Caminho do .fdb está correto?',
                              [sLineBreak, sLineBreak, GetConfigPath, sLineBreak, sLineBreak]);
  end;
end;

procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
  CloseConnection;
  FConnection.Free;
  FTransaction.Free;
end;

function TDMMain.GetConfigPath: string;
begin
  Result := TPath.Combine(ExtractFilePath(ParamStr(0)), 'config.ini');
end;

function TDMMain.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

function TDMMain.RetornaChave(const ATabela: string): Integer;
var
  vQuery: TFDQuery;
  vSQL: string;
begin
  Result := 0;
  vQuery := DMMain.GetQueryLeitura;

  vSQL := ' SELECT NEXT VALUE FOR GEN_' + ATabela + '_ID AS CHAVE FROM RDB$DATABASE ';

  try
    vQuery.Open(vSQL);

    Result := vQuery.FieldByName('CHAVE').AsInteger;
  finally
    vQuery.Free;
  end;
end;


function TDMMain.GetQueryComando: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
  Result.Transaction := FTransaction;
  Result.FetchOptions.Unidirectional := True;
  Result.UpdateOptions.ReadOnly := True;
end;

function TDMMain.GetQueryLeitura: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
  Result.UpdateOptions.ReadOnly := True;
  Result.FetchOptions.CursorKind := ckForwardOnly;
end;

function TDMMain.GetTRansaction: TFDTransaction;
begin
  Result := FTransaction;
end;

procedure TDMMain.LoadConfigIni;
var
  vIniFile: string;
begin
  vIniFile := GetConfigPath;

  if not FileExists(vIniFile) then
    raise Exception.CreateFmt('Arquivo de configuração (config.ini) não encontrado.%s%sCrie o arquivo com os dados de conexão no diretório %s e reinicie o sistema.', [sLineBreak, sLineBreak, vIniFile]);

  FIniFile := TIniFile.Create(vIniFile);

  try
    CloseConnection;
    FConnection.Params.Clear;

    FConnection.Params.Add('DriverID=' + FIniFile.ReadString('DATABASE', 'driverid', 'FB'));
    FConnection.Params.Add('Server=' + FIniFile.ReadString('DATABASE', 'server', '127.0.0.1'));
    FConnection.Params.Add('Port=' + IntToStr(FIniFile.ReadInteger('DATABASE', 'port', 3050)));
    FConnection.Params.Add('Database=' + FIniFile.ReadString('DATABASE', 'database', 'C:\database.fdb'));
    FConnection.Params.Add('User_Name=' + FIniFile.ReadString('DATABASE', 'username', 'SYSDBA'));
    FConnection.Params.Add('Password=' + FIniFile.ReadString('DATABASE', 'password', 'masterkey'));
  finally
    FIniFile.Free;
  end;
end;

procedure TDMMain.OpenConnection;
begin
  if not(FConnection.Connected) then
    FConnection.Connected := True;
end;

procedure TDMMain.Rollback;
begin
  if FTransaction.Active then
    FTransaction.Rollback;
end;

procedure TDMMain.StartTransaction;
begin
  FTransaction.StartTransaction;
end;

function TDMMain.TestConnection: Boolean;
begin
  Result := FConnection.Connected and (FConnection.InTransaction = False);
end;

end.
