unit uOrdemServico;

interface

uses
  System.SysUtils, uItemOrdem, System.Generics.Collections;

type
  TOrdemServico = class
  private
    FID: Integer;
    FClienteID: Integer;
    FCliente: string;
    FDataAbertura: TDateTime;
    FDataPrevista: TDateTime;
    FDataFechamento: TDateTime;
    FStatus: string;
    FDescricaoProblema: string;
    FValorTotal: Currency;

    FItens: TObjectList<TItemOrdem>;

    FTotalAbertos: Integer;
    FTotalEmAndamento: Integer;
    FTotalAtrasados: Integer;
    FTotalConcluidos: Integer;
    FTotalCancelados: Integer;

    function GetItens: TObjectList<TItemOrdem>;
    procedure SetItens(const Value: TObjectList<TItemOrdem>);
  public
    property ID: Integer read FID write FID;
    property ClienteID: Integer read FClienteID write FClienteID;
    property Cliente: string read FCliente write FCliente;
    property DataAbertura: TDateTime read FDataAbertura write FDataAbertura;
    property DataPrevista: TDateTime read FDataPrevista write FDataPrevista;
    property DataFechamento: TDateTime read FDataFechamento write FDataFechamento;
    property Status: string read FStatus write FStatus;
    property DescricaoProblema: string read FDescricaoProblema write FDescricaoProblema;
    property ValorTotal: Currency read FValorTotal write FValorTotal;

    property Itens: TObjectList<TItemOrdem> read GetItens write SetItens;

    property TotalAbertos: Integer read FTotalAbertos write FTotalAbertos;
    property TotalEmAndamento: Integer read FTotalEmAndamento write FTotalEmAndamento;
    property TotalAtrasados: Integer read FTotalAtrasados write FTotalAtrasados;
    property TotalConcluidos: Integer read FTotalConcluidos write FTotalConcluidos;
    property TotalCancelados: Integer read FTotalCancelados write FTotalCancelados;

    constructor Create;
    destructor Destroy;
  end;

implementation

{ TOrdemServico }

constructor TOrdemServico.Create;
begin
  FID                := 0;
  FClienteID         := 0;
  FDataAbertura      := Now;
  FDataPrevista      := Now;
  FDataFechamento    := Now;
  FStatus            := '';
  FDescricaoProblema := '';
  FValorTotal        := 0.0;

  FItens             := TObjectList<TItemOrdem>.Create;

  FTotalAbertos     := 0;
  FTotalEmAndamento := 0;
  FTotalAtrasados   := 0;
  FTotalConcluidos  := 0;
  FTotalCancelados  := 0;
end;

destructor TOrdemServico.Destroy;
begin
  FItens.Free;
end;

function TOrdemServico.GetItens: TObjectList<TItemOrdem>;
begin
  Result := FItens;
end;

procedure TOrdemServico.SetItens(const Value: TObjectList<TItemOrdem>);
begin
  FItens := Value;
end;

end.
