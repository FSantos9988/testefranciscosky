unit uOrdemServicoService;

interface

uses
  uOrdemServico, System.SysUtils, System.RegularExpressions;

type
  TOrdemServicoService = class
  public
    procedure Validar(const AOrdemServico: TOrdemServico);
  end;

implementation

{ TOrdemServicoService }

procedure TOrdemServicoService.Validar(const AOrdemServico: TOrdemServico);
begin
  if AOrdemServico.ClienteID <= 0 then
    raise Exception.Create('É preciso indicar um cliente!');

  if AOrdemServico.Status.Trim.IsEmpty then
    raise Exception.Create('É preciso informar o status!');
end;

end.
