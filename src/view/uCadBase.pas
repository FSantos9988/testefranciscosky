unit uCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.UITypes,
  Vcl.ComCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, frCoreClasses,
  frxClass, frxExportBaseDialog, frxExportCSV, frxExportPDF;

type
  TStatusCadastro = (scNavegacao, scInsercao, scEdicao, scFiltro, scRelatorio);

  TFormCadBase = class(TForm)
    pnlBtnInf: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvarNovo: TBitBtn;
    btnLimpar: TBitBtn;
    btnFechar: TBitBtn;
    blhHint: TBalloonHint;
    pgcCadastro: TPageControl;
    btnNovo: TBitBtn;
    pnlBtnSup: TPanel;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFiltro: TBitBtn;
    tsListagem: TTabSheet;
    tsCadastro: TTabSheet;
    tsFiltro: TTabSheet;
    tsRelatorio: TTabSheet;
    pnlCadastro: TPanel;
    pnlNavegacao: TPanel;
    dbnNavegacao: TDBNavigator;
    edtTotalRegistros: TEdit;
    dbgListagem: TDBGrid;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    btnFiltrar: TBitBtn;
    btnLimparFiltro: TBitBtn;
    btnExportarCSV: TBitBtn;
    btnImprimir: TBitBtn;
    btnRelatorio: TBitBtn;
    btnPrevisualizar: TBitBtn;
    fstReport: TfrxReport;
    freCSV: TfrxCSVExport;
    btnExportarPDF: TBitBtn;
    digpPrinter: TPrintDialog;
    frePDF: TfrxPDFExport;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgListagemDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnSalvarNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure PreparaComponentes(const AStatusCadastro: TStatusCadastro);
  end;

var
  FormCadBase: TFormCadBase;

implementation

{$R *.dfm}

procedure TFormCadBase.btnCancelarClick(Sender: TObject);
begin
  btnLimpar.Click;
  PreparaComponentes(scNavegacao);
end;

procedure TFormCadBase.btnEditarClick(Sender: TObject);
begin
  PreparaComponentes(scEdicao);
  btnLimpar.Click;
end;

procedure TFormCadBase.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadBase.btnFiltroClick(Sender: TObject);
begin
  PreparaComponentes(scFiltro);
end;

procedure TFormCadBase.btnNovoClick(Sender: TObject);
begin
  PreparaComponentes(scInsercao);
  btnLimpar.Click;
end;

procedure TFormCadBase.btnRelatorioClick(Sender: TObject);
begin
  PreparaComponentes(scRelatorio);
end;

procedure TFormCadBase.btnSalvarClick(Sender: TObject);
begin
  PreparaComponentes(scNavegacao);
end;

procedure TFormCadBase.btnSalvarNovoClick(Sender: TObject);
begin
  btnSalvar.Click;
  btnNovo.Click;
end;

procedure TFormCadBase.dbgListagemDblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

procedure TFormCadBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFormCadBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1) then
    btnNovo.Click
  else if (Key = VK_F2) then
    btnEditar.Click
  else if (Key = VK_F3) then
    btnExcluir.Click
  else if (Key = VK_F4) then
    btnFiltro.Click
  else if (Key = VK_F5) then
    btnRelatorio.Click
  else if (Key = VK_F6) then
    btnSalvar.Click
  else if (Key = VK_F7) then
    btnSalvarNovo.Click
  else if (Key = VK_F8) then
    btnLimpar.Click
  else if (Key = VK_F9) then
    btnCancelar.Click
  else if (Key = VK_F10) then
    btnFechar.Click;
end;

procedure TFormCadBase.FormShow(Sender: TObject);
begin
  PreparaComponentes(scNavegacao);
end;

procedure TFormCadBase.PreparaComponentes(const AStatusCadastro: TStatusCadastro);
begin
  if AStatusCadastro in [scInsercao, scEdicao] then
  begin
    pgcCadastro.ActivePageIndex     := 1;
    pgcCadastro.Pages[0].TabVisible := False;
    pgcCadastro.Pages[1].TabVisible := True;
    pgcCadastro.Pages[2].TabVisible := False;
    pgcCadastro.Pages[3].TabVisible := False;
    dbgListagem.Enabled             := False;
    dbnNavegacao.Enabled            := False;

    btnNovo.Enabled      := False;
    btnEditar.Enabled    := False;
    btnExcluir.Enabled   := False;
    btnFiltro.Enabled    := False;
    btnRelatorio.Enabled := False;
  end
  else if AStatusCadastro = scFiltro then
  begin
    pgcCadastro.ActivePageIndex := 2;
    pgcCadastro.Pages[0].TabVisible := False;
    pgcCadastro.Pages[1].TabVisible := False;
    pgcCadastro.Pages[2].TabVisible := True;
    pgcCadastro.Pages[3].TabVisible := False;
    dbgListagem.Enabled             := False;
    dbnNavegacao.Enabled            := False;

    btnNovo.Enabled      := False;
    btnEditar.Enabled    := False;
    btnExcluir.Enabled   := False;
    btnFiltro.Enabled    := False;
    btnRelatorio.Enabled := False;
  end
  else if AStatusCadastro = scRelatorio then
  begin
    pgcCadastro.ActivePageIndex := 3;
    pgcCadastro.Pages[0].TabVisible := False;
    pgcCadastro.Pages[1].TabVisible := False;
    pgcCadastro.Pages[2].TabVisible := False;
    pgcCadastro.Pages[3].TabVisible := True;
    dbgListagem.Enabled             := False;
    dbnNavegacao.Enabled            := False;

    btnNovo.Enabled      := False;
    btnEditar.Enabled    := False;
    btnExcluir.Enabled   := False;
    btnFiltro.Enabled    := False;
    btnRelatorio.Enabled := False;
  end else
  begin
    pgcCadastro.ActivePageIndex := 0;
    pgcCadastro.Pages[0].TabVisible := True;
    pgcCadastro.Pages[1].TabVisible := False;
    pgcCadastro.Pages[2].TabVisible := False;
    pgcCadastro.Pages[3].TabVisible := False;
    dbgListagem.Enabled             := True;
    dbnNavegacao.Enabled            := True;

    btnNovo.Enabled      := True;
    btnEditar.Enabled    := True;
    btnExcluir.Enabled   := True;
    btnFiltro.Enabled    := True;
    btnRelatorio.Enabled := True;
  end;

  btnSalvar.Enabled     := AStatusCadastro in [scInsercao, scEdicao];
  btnSalvarNovo.Enabled := AStatusCadastro in [scInsercao, scEdicao];
  btnLimpar.Enabled     := AStatusCadastro in [scInsercao, scEdicao];
end;

end.
