program testefranciscoskyinformatica;

uses
  Vcl.Forms,
  uMainForm in 'src\view\uMainForm.pas' {FormMain},
  uCadBase in 'src\view\uCadBase.pas' {FormCadBase},
  uDMMain in 'src\model\uDMMain.pas' {DMMain: TDataModule},
  uCliente in 'src\model\uCliente.pas',
  uClienteController in 'src\controller\uClienteController.pas',
  uCadCliente in 'src\view\uCadCliente.pas' {FormCadCliente},
  uClienteService in 'src\service\uClienteService.pas',
  uCadOrdemServico in 'src\view\uCadOrdemServico.pas' {FormCadOrdemServico},
  uOrdemServico in 'src\model\uOrdemServico.pas',
  uOrdemServicoController in 'src\controller\uOrdemServicoController.pas',
  uOrdemServicoService in 'src\service\uOrdemServicoService.pas',
  uItemOrdem in 'src\model\uItemOrdem.pas',
  uItemOrdemController in 'src\controller\uItemOrdemController.pas',
  uItemOrdemService in 'src\service\uItemOrdemService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
