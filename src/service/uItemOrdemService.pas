unit uItemOrdemService;

interface

uses
  uItemOrdem, System.SysUtils;

type
  TItemOrdemService = class
  public
    procedure Validar(const AItemOrdem: TItemOrdem);
  end;

implementation

{ TItemOrdemService }

procedure TItemOrdemService.Validar(const AItemOrdem: TItemOrdem);
begin
  if AItemOrdem.OrdemID = 0 then
    raise Exception.Create('Escolha uma Ordem de Serviço!');

  if AItemOrdem.Descricao.Trim.IsEmpty then
    raise Exception.Create('Descrição do item não pode ser vazia!');

  if AItemOrdem.Quantidade <= 0.0 then
    raise Exception.Create('Quantidade de itens não pode ser igual ou menor que zero!');

  if AItemOrdem.ValorUnitario <= 0.0 then
    raise Exception.Create('Valor unitário do item não pode ser menor ou igula a zero!');
end;

end.
