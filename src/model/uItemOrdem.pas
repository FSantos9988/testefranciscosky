unit uItemOrdem;

interface

uses
  System.SysUtils;

type
  TItemOrdem = class
  private
    FID: Integer;
    FOrdemID: Integer;
    FDescricao: string;
    FQuantidade: Double;
    FValorUnitario: Currency;
  public
    property ID: Integer read FID write FID;
    property OrdemID: Integer read FOrdemID write FOrdemID;
    property Descricao: string read FDescricao write FDescricao;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;

    constructor Create;
  end;

implementation

{ TItemOrdem }

constructor TItemOrdem.Create;
begin
  FID            := 0;
  FOrdemID       := 0;
  FDescricao     := '';
  FQuantidade    := 0.0;
  FValorUnitario := 0.0;
end;

end.
