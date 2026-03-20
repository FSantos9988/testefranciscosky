unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uCadOrdemServico,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, System.UITypes, uCadCliente, uClienteController, uDMMain;

type
  TFormMain = class(TForm)
    mmMenu: TMainMenu;
    mniSair: TMenuItem;
    mniCadastros: TMenuItem;
    mniCadastroClientes: TMenuItem;
    mniCadastroOrdemServico: TMenuItem;
    procedure mniCadastroClientesClick(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
    procedure mniCadastroOrdemServicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FormChildClosed(AFormClass: TClass);
  end;

var
  FormMain: TFormMain;
  vCadCliente: TFormCadCliente = nil;
  vCadOrdemServico: TFormCadOrdemServico = nil;

implementation

{$R *.dfm}

procedure TFormMain.FormChildClosed(AFormClass: TClass);
begin
  if AFormClass = TFormCadCliente then
    vCadCliente := nil
  else if AFormClass = TFormCadOrdemServico then
    vCadOrdemServico := nil;
end;

procedure TFormMain.mniCadastroClientesClick(Sender: TObject);
begin
  if not Assigned(vCadCliente) then
    Application.CreateForm(TFormCadCliente, vCadCliente)
  else
  begin
    vCadCliente.Show;
    if vCadCliente.WindowState = wsMinimized then
      vCadCliente.WindowState := wsNormal;
    vCadCliente.BringToFront;
  end;
end;

procedure TFormMain.mniCadastroOrdemServicoClick(Sender: TObject);
begin
  if not Assigned(vCadOrdemServico) then
    Application.CreateForm(TFormCadOrdemServico, vCadOrdemServico)
  else
  begin
    vCadOrdemServico.Show;
    if vCadOrdemServico.WindowState = wsMinimized then
      vCadOrdemServico.WindowState := wsNormal;
    vCadOrdemServico.BringToFront;
  end;
end;

procedure TFormMain.mniSairClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente encerrar o programa?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    Application.Terminate;
  end;
end;

end.
