unit uClienteService;

interface

uses
  uCliente, System.SysUtils, System.RegularExpressions;

type
  TClienteService = class
  public
    procedure Validar(const ACliente: TCliente);
  end;

implementation

{ TClienteService }

procedure TClienteService.Validar(const ACliente: TCliente);
begin
  if ACliente.Nome.Trim.IsEmpty then
    raise Exception.Create('O nome do cliente é obrigatório!');

  if ACliente.Documento.Trim.Length < 11 then
    raise Exception.Create('O documento está invalido ou incompleto!');

  if not ACliente.Email.Trim.IsEmpty then
  begin
    if not TRegEx.IsMatch(ACliente.Email, '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') then
      raise Exception.Create('O formato do e-mail é inválido.');
  end;
end;

end.
