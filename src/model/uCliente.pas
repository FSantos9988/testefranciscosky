unit uCliente;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FId: Integer;
    FNome: string;
    FDocumento: string;
    FEmail: string;
    FTelefone: string;
    FDataCadastro: TDateTime;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Documento: string read FDocumento write FDocumento;
    property Email: string read FEmail write FEmail;
    property Telefone: string read FTelefone write FTelefone;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;

    constructor Create;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FId           := 0;
  FNome         := '';
  FDocumento    := '';
  FEmail        := '';
  FTelefone     := '';
  FDataCadastro := Now;
end;

end.
