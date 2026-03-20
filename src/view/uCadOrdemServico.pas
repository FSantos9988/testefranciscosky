unit uCadOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase,
  Data.DB, frxExportPDF, FireDAC.Comp.Client, frxClass, frxExportBaseDialog,
  frxExportCSV, frCoreClasses, Vcl.Buttons, uOrdemServicoController, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
  uOrdemServico, uCliente, Vcl.Mask, uClienteController, Vcl.NumberBox,
  System.Generics.Collections, frxDBSet, uItemOrdemController, uItemOrdem,
  Firedac.Stan.Param;

type
  TFormCadOrdemServico = class(TFormCadBase)
    dbgItemOrdem: TDBGrid;
    btnIncluirItem: TSpeedButton;
    btnEditarItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    lkpCliente: TDBLookupComboBox;
    lblCliente: TLabel;
    lblDataAbertura: TLabel;
    dtpDataAbertura: TDateTimePicker;
    lblDataPrevista: TLabel;
    dtpDataPrevista: TDateTimePicker;
    lblDataFechamento: TLabel;
    dtpDataFechamento: TDateTimePicker;
    lblStatus: TLabel;
    cbbStatus: TComboBox;
    lblValorTotal: TLabel;
    lblDescricaoProblema: TLabel;
    mmoDescricaoProblema: TMemo;
    edtTotalAbertas: TEdit;
    edtTotalEmAndamento: TEdit;
    edtTotalConcluidas: TEdit;
    edtTotalAtrasados: TEdit;
    lblCliente1: TLabel;
    lblDataAbertura1: TLabel;
    dtpDataAberturaInicioFiltro: TDateTimePicker;
    lblDataPrevista1: TLabel;
    dtpDataAberturaFimFiltro: TDateTimePicker;
    lblStatus1: TLabel;
    cbbStatusFiltro: TComboBox;
    lblValorTotal1: TLabel;
    lblDataPrevista2: TLabel;
    lblValorTotal2: TLabel;
    lblValorTotal3: TLabel;
    nmbValorTotal: TNumberBox;
    edtTotalCanceladas: TEdit;
    lblTituloItemOrdem: TLabel;
    frxdsOrdemServico: TfrxDBDataset;
    frxdsItemOrdem: TfrxDBDataset;
    grpFiltro: TGroupBox;
    grpOrdenacao: TGroupBox;
    lblOrdenacao1: TLabel;
    cbbOrdenacao1: TComboBox;
    lblOrdenacao2: TLabel;
    cbbOrdenacao2: TComboBox;
    lblOrdenacao3: TLabel;
    cbbOrdenacao3: TComboBox;
    edtClienteFiltro: TEdit;
    nmbValorTotalInicioFiltro: TNumberBox;
    nmbValorTotalFimFiltro: TNumberBox;
    lblCliente11: TLabel;
    edtClienteRelatorio: TEdit;
    lblDataAbertura11: TLabel;
    lblDataPrevista21: TLabel;
    dtpDataAberturaInicioRelatorio: TDateTimePicker;
    lblDataPrevista11: TLabel;
    dtpDataAberturaFimRelatorio: TDateTimePicker;
    lblStatus11: TLabel;
    cbbStatusRelatorio: TComboBox;
    lblValorTotal11: TLabel;
    lblValorTotal21: TLabel;
    nmbValorTotalInicialRelatorio: TNumberBox;
    lblValorTotal31: TLabel;
    nmbValorTotalFimRelatorio: TNumberBox;
    btnRecalculaTotalOrdem: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbgListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnRecalculaTotalOrdemClick(Sender: TObject);
    procedure btnPrevisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExportarPDFClick(Sender: TObject);
    procedure btnExportarCSVClick(Sender: TObject);
  private
    { Private declarations }
    FDataSourceOS: TDataSource;
    FDataSourceCliente: TDataSource;
    FDataSourceItens: TDataSource;

    FMemTableOS: TFDMemTable;
    FMemTableCliente: TFDMemTable;
    FMemTableItens: TFDMemTable;

    FOrdemServicoController: TOrdemServicoController;
    FItemOrdemController: TItemOrdemController;
    FClienteController: TClienteController;

    procedure ConfiguraTabelaOS;
    procedure AtualizaOS;

    procedure ConfiguraTabelaCliente;
    procedure AtualizaCliente;

    procedure ConfiguraTabelaItem;
    procedure AtualizaItem(const AID: Integer);

    function CalcularTotalGeral(const AID: Integer): Currency;

    procedure CarregarDadosRelatorio;
    procedure AplicarOrdenacaoRelatorio;
    function ConstruirParamsFiltroRelatorio: TFDParams;
    function MapearCampoOrdenacao(const ACampo: string): string;
  public
    { Public declarations }
  end;

var
  FormCadOrdemServico: TFormCadOrdemServico;

implementation

{$R *.dfm}

{ TFormCadOrdemServico }

procedure TFormCadOrdemServico.AtualizaItem(const AID: Integer);
var
  vItemController: TItemOrdemController;
  vListaItens: TObjectList<TItemOrdem>;
  vItem: TItemOrdem;
begin
  vItemController := TItemOrdemController.Create;
  try
    vListaItens := vItemController.ListarPorOS(AID);

    FMemTableItens.DisableControls;
    try
      FMemTableItens.EmptyDataSet;

      for vItem in vListaItens do
      begin
        FMemTableItens.Append;
        FMemTableItens.FieldByName('ID').AsInteger := vItem.ID;
        FMemTableItens.FieldByName('ORDEM_ID').AsInteger := vItem.OrdemID;
        FMemTableItens.FieldByName('DESCRICAO').AsString := vItem.Descricao;
        FMemTableItens.FieldByName('QUANTIDADE').AsFloat := vItem.Quantidade;
        FMemTableItens.FieldByName('VALOR_UNITARIO').AsFloat := vItem.ValorUnitario;
        FMemTableItens.Post;
      end;
    finally
      FMemTableItens.EnableControls;
      vListaItens.Free;
    end;
  finally
    vItemController.Free;
  end;
end;

procedure TFormCadOrdemServico.AtualizaOS;
var
  vLista: TObjectList<TOrdemServico>;
  vOrdemServico: TOrdemServico;
begin
  if not FMemTableOS.Active then
    FMemTableOS.Open;

  vLista := FOrdemServicoController.ListarTodos;
  try
    FMemTableOS.DisableControls;
    try
      FMemTableOS.EmptyDataSet;

      for vOrdemServico in vLista do
      begin
        FMemTableOS.Append;
        FMemTableOS.FieldByName('ID').AsInteger := vOrdemServico.ID;
        FMemTableOS.FieldByName('CLIENTE').AsString := vOrdemServico.Cliente;
        FMemTableOS.FieldByName('DATA_ABERTURA').AsDateTime := vOrdemServico.DataAbertura;
        FMemTableOS.FieldByName('DATA_PREVISTA').AsDateTime := vOrdemServico.DataPrevista;
        FMemTableOS.FieldByName('DATA_FECHAMENTO').AsDateTime := vOrdemServico.DataFechamento;
        FMemTableOS.FieldByName('STATUS').AsString := vOrdemServico.Status;
        FMemTableOS.FieldByName('DESCRICAO_PROBLEMA').AsString := vOrdemServico.DescricaoProblema;
        FMemTableOS.FieldByName('VALOR_TOTAL').AsCurrency := vOrdemServico.ValorTotal;
        FMemTableOS.Post;
      end;

      // Atualiza Totais
      vOrdemServico := FOrdemServicoController.ListarTotais;

      edtTotalAbertas.Text     := 'Abertas: ' + IntToStr(vOrdemServico.TotalAbertos);
      edtTotalEmAndamento.Text := 'Em andamento: ' + IntToStr(vOrdemServico.TotalEmAndamento);
      edtTotalConcluidas.Text  := 'Concluídas: ' + IntToStr(vOrdemServico.TotalConcluidos);
      edtTotalAtrasados.Text   := 'Em Atraso: ' + IntToStr(vOrdemServico.TotalAtrasados);
      edtTotalCanceladas.Text  := 'Canceladas: ' + IntToStr(vOrdemServico.TotalCancelados);
    finally
      FMemTableOS.EnableControls;
      edtTotalRegistros.Text := IntToStr(FMemTableOS.RecordCount);
    end;
  finally
    vLista.Free;
  end;
end;

procedure TFormCadOrdemServico.AplicarOrdenacaoRelatorio;
var
  vOrderFields: TStringList;
begin
  vOrderFields := TStringList.Create;
  try
    if cbbOrdenacao1.ItemIndex > 0 then
      vOrderFields.Add(MapearCampoOrdenacao(cbbOrdenacao1.Text));
    if cbbOrdenacao2.ItemIndex > 0 then
      vOrderFields.Add(MapearCampoOrdenacao(cbbOrdenacao2.Text));
    if cbbOrdenacao3.ItemIndex > 0 then
      vOrderFields.Add(MapearCampoOrdenacao(cbbOrdenacao3.Text));

    if vOrderFields.Count > 0 then
      FMemTableOS.IndexFieldNames := vOrderFields.CommaText
    else
      FMemTableOS.IndexFieldNames := '';
  finally
    vOrderFields.Free;
  end;
  FMemTableOS.First;
end;

procedure TFormCadOrdemServico.AtualizaCliente;
var
  vLista: TObjectList<TCliente>;
  vCliente: TCliente;
begin
  if not FMemTableCliente.Active then
    FMemTableCliente.Open;

  vLista := FClienteController.ListarTodos;
  try
    FMemTableCliente.DisableControls;
    try
      FMemTableCliente.EmptyDataSet;

      for vCliente in vLista do
      begin
        FMemTableCliente.Append;
        FMemTableCliente.FieldByName('ID').AsInteger := vCliente.ID;
        FMemTableCliente.FieldByName('NOME').AsString := Format('%d - %s', [vCliente.ID, vCliente.Nome]);
        FMemTableCliente.Post;
      end;
    finally
      FMemTableCliente.EnableControls;
    end;
  finally
    vLista.Free;
  end;
end;

procedure TFormCadOrdemServico.btnEditarClick(Sender: TObject);
var
  vOrdemServico: TOrdemServico;
  vID: Integer;
begin
  if FMemTableOS.IsEmpty then
  begin
    ShowMessage('Não há registros para editar.');
    btnCancelar.Click;
    Exit;
  end;

  inherited;

  vID := dbgListagem.DataSource.DataSet.FieldByName('ID').AsInteger;
  vOrdemServico := FOrdemServicoController.ListarPorID(vID);

  try
    edtCodigo.Text := IntToStr(vOrdemServico.ID);
    lkpCliente.KeyValue := vOrdemServico.ClienteID;
    dtpDataAbertura.Date := vOrdemServico.DataAbertura;
    dtpDataPrevista.Date := vOrdemServico.DataPrevista;
    dtpDataFechamento.Date := vOrdemServico.DataFechamento;
    cbbStatus.Text := vOrdemServico.Status;
    mmoDescricaoProblema.Lines.Text := vOrdemServico.DescricaoProblema;
    nmbValorTotal.Value := CalcularTotalGeral(vOrdemServico.ID);

    AtualizaItem(vID);
  finally
    vOrdemServico.Free;
  end;
end;

procedure TFormCadOrdemServico.btnEditarItemClick(Sender: TObject);
begin
  inherited;

  if FMemTableItens.IsEmpty then
  begin
    ShowMessage('Não há itens para editar.');
    Exit;
  end;

  FMemTableItens.Edit;

  dbgItemOrdem.SetFocus;
end;

procedure TFormCadOrdemServico.btnExcluirItemClick(Sender: TObject);
begin
  inherited;

  if FMemTableItens.IsEmpty then
  begin
    ShowMessage('Não há itens para excluir.');
    Exit;
  end;

  if MessageDlg('Deseja excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FMemTableItens.Delete;
end;

procedure TFormCadOrdemServico.btnExportarCSVClick(Sender: TObject);
begin
  inherited;
  if FMemTableOS.IsEmpty then
  begin
    ShowMessage('Não há dados para exportar.');
    Exit;
  end;

  AplicarOrdenacaoRelatorio;
  fstReport.PrepareReport;
  fstReport.Export(freCSV);
end;

procedure TFormCadOrdemServico.btnExportarPDFClick(Sender: TObject);
begin
  inherited;
  if FMemTableOS.IsEmpty then
  begin
    ShowMessage('Não há dados para exportar.');
    Exit;
  end;

  AplicarOrdenacaoRelatorio;
  fstReport.PrepareReport;
  fstReport.Export(frePDF);
end;

procedure TFormCadOrdemServico.btnImprimirClick(Sender: TObject);
begin
  inherited;
  if FMemTableOS.IsEmpty then
  begin
    ShowMessage('Não há dados para imprimir.');
    Exit;
  end;

  AplicarOrdenacaoRelatorio;
  fstReport.Print;
end;

procedure TFormCadOrdemServico.btnIncluirItemClick(Sender: TObject);
begin
  if not FMemTableItens.Active then
    FMemTableItens.Open;

  FMemTableItens.Append;
  FMemTableItens.FieldByName('ID').AsInteger           := FItemOrdemController.RetornaChave;
  FMemTableItens.FieldByName('ORDEM_ID').AsInteger     := 0;
  FMemTableItens.FieldByName('DESCRICAO').Clear;
  FMemTableItens.FieldByName('QUANTIDADE').AsFloat     := 1;
  FMemTableItens.FieldByName('VALOR_UNITARIO').AsFloat := 0;
  FMemTableItens.Post;

  dbgItemOrdem.SetFocus;

  if dbgItemOrdem.Columns.Count > 0 then
    dbgItemOrdem.SelectedIndex := 1;
end;

procedure TFormCadOrdemServico.btnLimparFiltroClick(Sender: TObject);
begin
  inherited;
  edtClienteFiltro.Text := EmptyStr;
  dtpDataAberturaInicioFiltro.Checked := False;
  dtpDataAberturaFimFiltro.Checked := False;
  cbbStatusFiltro.ItemIndex := 0;
  nmbValorTotalInicioFiltro.Value := 0;
  nmbValorTotalFimFiltro.Value := 0;
end;

procedure TFormCadOrdemServico.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Text := IntToStr(FOrdemServicoController.RetornaChave);
  nmbValorTotal.Value := 0;
end;

procedure TFormCadOrdemServico.btnPrevisualizarClick(Sender: TObject);
begin
  inherited;
  if FMemTableOS.IsEmpty then
  begin
    ShowMessage('Não há dados para exibir no relatório.');
    Exit;
  end;
  CarregarDadosRelatorio;
  AplicarOrdenacaoRelatorio;
  fstReport.ShowReport;

  AtualizaOS;
  AtualizaItem(0);
end;

procedure TFormCadOrdemServico.btnRecalculaTotalOrdemClick(Sender: TObject);
begin
  inherited;
  CalcularTotalGeral(StrToInt(edtCodigo.Text));
end;

procedure TFormCadOrdemServico.btnSalvarClick(Sender: TObject);
var
  vOrdemServico: TOrdemServico;
  vItem: TItemOrdem;
begin
  inherited;
  vOrdemServico := TOrdemServico.Create;

  try
    vOrdemServico.ID := StrToIntDef(edtCodigo.Text, 0);
    vOrdemServico.ClienteID := lkpCliente.KeyValue;

    if dtpDataAbertura.Checked then
      vOrdemServico.DataAbertura := dtpDataAbertura.DateTime;

    if dtpDataPrevista.Checked then
      vOrdemServico.DataPrevista := dtpDataPrevista.DateTime;

    if dtpDataFechamento.Checked then
      vOrdemServico.DataFechamento := dtpDataFechamento.DateTime;

    case cbbStatus.ItemIndex of
      0:
        vOrdemServico.Status := 'ABERTO';
      1:
        vOrdemServico.Status := 'EM ANDAMENTO';
      2:
        vOrdemServico.Status := 'CONCLUIDO';
      3:
        vOrdemServico.Status := 'CANCELADO';
    end;

    vOrdemServico.DescricaoProblema := mmoDescricaoProblema.Lines.Text;
    vOrdemServico.ValorTotal := nmbValorTotal.Value;

    if FMemTableItens.RecordCount > 0 then
    begin
      FMemTableItens.First;
      while not FMemTableItens.Eof do
      begin
        vItem               := TItemOrdem.Create;
        vItem.ID            := FMemTableItens.FieldByName('ID').AsInteger;
        vItem.OrdemID       := vOrdemServico.ID;
        vItem.Descricao     := FMemTableItens.FieldByName('DESCRICAO').AsString;
        vItem.Quantidade    := FMemTableItens.FieldByName('QUANTIDADE').AsFloat;
        vItem.ValorUnitario := FMemTableItens.FieldByName('VALOR_UNITARIO').AsCurrency;
        vOrdemServico.Itens.Add(vItem);
        FMemTableItens.Next;
      end;
    end;

    try
      if FOrdemServicoController.Salvar(vOrdemServico) then
        ShowMessage('Cliente salvo com sucesso!');
    except
      on Ex: Exception do
      begin
        MessageDlg('Erro ao salvar: ' + Ex.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    vOrdemServico.Free;
    AtualizaOS;
  end;
end;

function TFormCadOrdemServico.CalcularTotalGeral(const AID: Integer): Currency;
var
  vItem: TItemOrdem;
  vItemList: TObjectList<TItemOrdem>;
  vTotal: Currency;
begin
  vItemList := FItemOrdemController.ListarPorOS(AID);
  vTotal    := 0;

  for vItem in vItemList do
  begin
    vTotal := vTotal + (vItem.ValorUnitario * vItem.Quantidade);
  end;
end;

procedure TFormCadOrdemServico.CarregarDadosRelatorio;
var
  vParams: TFDParams;
  vListaOS: TObjectList<TOrdemServico>;
  vOS: TOrdemServico;
  vItem: TItemOrdem;
begin
  vParams := ConstruirParamsFiltroRelatorio;
  try
    vListaOS := FOrdemServicoController.ListarFiltro(vParams);
  finally
    vParams.Free;
  end;

  if not FMemTableOS.Active then
    FMemTableOS.Open;
  FMemTableOS.DisableControls;
  try
    FMemTableOS.EmptyDataSet;
    for vOS in vListaOS do
    begin
      FMemTableOS.Append;
      FMemTableOS.FieldByName('ID').AsInteger := vOS.ID;
      FMemTableOS.FieldByName('CLIENTE').AsString := vOS.Cliente;
      FMemTableOS.FieldByName('DATA_ABERTURA').AsDateTime := vOS.DataAbertura;
      FMemTableOS.FieldByName('DATA_PREVISTA').AsDateTime := vOS.DataPrevista;
      FMemTableOS.FieldByName('DATA_FECHAMENTO').AsDateTime := vOS.DataFechamento;
      FMemTableOS.FieldByName('STATUS').AsString := vOS.Status;
      FMemTableOS.FieldByName('VALOR_TOTAL').AsCurrency := vOS.ValorTotal;
      FMemTableOS.Post;
    end;
  finally
    FMemTableOS.EnableControls;
  end;

  if not FMemTableItens.Active then
    FMemTableItens.Open;
  FMemTableItens.DisableControls;
  try
    FMemTableItens.EmptyDataSet;
    for vOS in vListaOS do
    begin
      for vItem in vOS.Itens do
      begin
        FMemTableItens.Append;
        FMemTableItens.FieldByName('ID').AsInteger := vItem.ID;
        FMemTableItens.FieldByName('ORDEM_ID').AsInteger := vItem.OrdemID;
        FMemTableItens.FieldByName('DESCRICAO').AsString := vItem.Descricao;
        FMemTableItens.FieldByName('QUANTIDADE').AsFloat := vItem.Quantidade;
        FMemTableItens.FieldByName('VALOR_UNITARIO').AsFloat := vItem.ValorUnitario;
        FMemTableItens.Post;
      end;
    end;
  finally
    FMemTableItens.EnableControls;
  end;

  vListaOS.Free;
end;

procedure TFormCadOrdemServico.ConfiguraTabelaOS;
begin
  if FMemTableOS.FieldDefs.Count = 0 then
  begin
    FMemTableOS.FieldDefs.Add('ID', ftInteger);
    FMemTableOS.FieldDefs.Add('CLIENTE', ftString, 200);
    FMemTableOS.FieldDefs.Add('DATA_ABERTURA', ftDateTime);
    FMemTableOS.FieldDefs.Add('DATA_PREVISTA', ftDateTime);
    FMemTableOS.FieldDefs.Add('DATA_FECHAMENTO', ftDateTime);
    FMemTableOS.FieldDefs.Add('STATUS', ftString, 15);
    FMemTableOS.FieldDefs.Add('DESCRICAO_PROBLEMA', ftString, 500);
    FMemTableOS.FieldDefs.Add('VALOR_TOTAL', ftCurrency);
    FMemTableOS.CreateDataSet;
  end;

  FDataSourceOS.DataSet := FMemTableOS;
  dbgListagem.DataSource := FDataSourceOS;
  dbnNavegacao.DataSource := FDataSourceOS;

  frxdsOrdemServico.DataSet := FMemTableOS;
end;

function TFormCadOrdemServico.ConstruirParamsFiltroRelatorio: TFDParams;
begin
  Result := TFDParams.Create;

  if Trim(edtClienteRelatorio.Text) <> '' then
    Result.Add('NOME_CLIENTE', ftString, ptInput).AsString := '%' + Trim(edtClienteRelatorio.Text) + '%';

  if dtpDataAberturaInicioRelatorio.Checked then
    Result.Add('DATA_ABERTURA_INI', ftDateTime, ptInput).AsDateTime := dtpDataAberturaInicioRelatorio.DateTime;
  if dtpDataAberturaFimRelatorio.Checked then
    Result.Add('DATA_ABERTURA_FIM', ftDateTime, ptInput).AsDateTime := dtpDataAberturaFimRelatorio.DateTime;

  case cbbStatusRelatorio.ItemIndex of
    1: Result.Add('STATUS', ftString, ptInput).AsString := 'ABERTO';
    2: Result.Add('STATUS', ftString, ptInput).AsString := 'EM ANDAMENTO';
    3: Result.Add('STATUS', ftString, ptInput).AsString := 'CONCLUIDO';
    4: Result.Add('EM_ATRASO', ftInteger, ptInput).AsInteger := 1;
    5: Result.Add('STATUS', ftString, ptInput).AsString := 'CANCELADO';
  end;

  if nmbValorTotalInicialRelatorio.Value > 0 then
    Result.Add('VALOR_TOTAL_INI', ftCurrency, ptInput).AsCurrency := nmbValorTotalInicialRelatorio.Value;
  if nmbValorTotalFimRelatorio.Value > 0 then
    Result.Add('VALOR_TOTAL_FIM', ftCurrency, ptInput).AsCurrency := nmbValorTotalFimRelatorio.Value;
end;

procedure TFormCadOrdemServico.ConfiguraTabelaItem;
var
  vCampoTotal: TFloatField;
begin
  if FMemTableItens.FieldDefs.Count = 0 then
  begin
    FMemTableItens.FieldDefs.Add('ID', ftInteger);
    FMemTableItens.FieldDefs.Add('ORDEM_ID', ftInteger);
    FMemTableItens.FieldDefs.Add('DESCRICAO', ftString, 200);
    FMemTableItens.FieldDefs.Add('QUANTIDADE', ftFloat);
    FMemTableItens.FieldDefs.Add('VALOR_UNITARIO', ftCurrency);
    FMemTableItens.FieldDefs.Add('VALOR_TOTAL_ITEM', ftCurrency);
    FMemTableItens.CreateDataSet;
  end;

  FDataSourceItens.DataSet := FMemTableItens;
  dbgItemOrdem.DataSource := FDataSourceItens;

  frxdsItemOrdem.DataSet := FMemTableItens;
end;

procedure TFormCadOrdemServico.ConfiguraTabelaCliente;
begin
  if FMemTableCliente.FieldDefs.Count = 0 then
  begin
    FMemTableCliente.FieldDefs.Add('ID', ftInteger);
    FMemTableCliente.FieldDefs.Add('NOME', ftString, 120);
    FMemTableCliente.CreateDataSet;
  end;

  FDataSourceCliente.DataSet := FMemTableCliente;
  lkpCliente.ListSource := FDataSourceCliente;
  lkpCliente.KeyField := 'ID';
  lkpCliente.ListField := 'NOME';
end;

procedure TFormCadOrdemServico.dbgListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field.DataSet.FieldByName('STATUS').AsString = 'ABERTO' then
    dbgListagem.Canvas.Brush.Color := clNavy
  else if Column.Field.DataSet.FieldByName('STATUS').AsString = 'EM ANDAMENTO' then
    dbgListagem.Canvas.Brush.Color := clPurple
  else if Column.Field.DataSet.FieldByName('STATUS').AsString = 'CONCLUIDO' then
    dbgListagem.Canvas.Brush.Color := clGreen
  else if Column.Field.DataSet.FieldByName('STATUS').AsString = 'CANCELADO' then
    dbgListagem.Canvas.Brush.Color := clGray;

  dbgListagem.Canvas.Font.Color := clWhite;

  if gdSelected in State then
  begin
    dbgListagem.Canvas.Brush.Color := clHighlight;
    dbgListagem.Canvas.Font.Color := clHighlightText;
  end;

  dbgListagem.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormCadOrdemServico.FormCreate(Sender: TObject);
begin
  inherited;
  FOrdemServicoController := TOrdemServicoController.Create;
  FClienteController      := TClienteController.Create;

  FDataSourceOS      := TDataSource.Create(Self);
  FDataSourceCliente := TDataSource.Create(Self);
  FDataSourceItens   := TDataSource.Create(Self);

  FMemTableOS        := TFDMemTable.Create(Self);
  FMemTableCliente   := TFDMemTable.Create(Self);
  FMemTableItens     := TFDMemTable.Create(Self);

  ConfiguraTabelaOS;
  ConfiguraTabelaCliente;
  ConfiguraTabelaItem;
end;

procedure TFormCadOrdemServico.FormDestroy(Sender: TObject);
begin
  inherited;
  FOrdemServicoController.Free;
  FClienteController.Free;
  FItemOrdemController.Free;

  FDataSourceOS.Free;
  FDataSourceCliente.Free;
  FDataSourceItens.Free;

  FMemTableOS.Free;
  FMemTableCliente.Free;
  FMemTableItens.Free;
end;

procedure TFormCadOrdemServico.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaOS;
  AtualizaCliente;
  AtualizaItem(0);
end;

function TFormCadOrdemServico.MapearCampoOrdenacao(const ACampo: string): string;
begin
  if ACampo = 'Cliente' then
    Result := 'CLIENTE'
  else if ACampo = 'Data de Abertura' then
    Result := 'DATA_ABERTURA'
  else if ACampo = 'Data Prevista' then
    Result := 'DATA_PREVISTA'
  else if ACampo = 'Data de Fechamento' then
    Result := 'DATA_FECHAMENTO'
  else if ACampo = 'Status' then
    Result := 'STATUS'
  else if ACampo = 'Valo total' then
    Result := 'VALOR_TOTAL'
  else
    Result := '';
end;

end.

