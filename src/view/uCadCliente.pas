unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uClienteController,
  System.Generics.Collections, System.UITypes, frxClass, frxExportBaseDialog,
  frxExportCSV, frCoreClasses, frxExportPDF, frxDBSet, Firedac.Stan.Param, uCliente,
  System.Win.ComObj, Winapi.ActiveX;

type
  TFormCadCliente = class(TFormCadBase)
    edtNome: TEdit;
    lblNomeCliente: TLabel;
    edtDocumento: TEdit;
    lblDocumentoCliente: TLabel;
    lblEmailCliente: TLabel;
    edtEmail: TEdit;
    lblTelefoneCliente: TLabel;
    edtTelefone: TEdit;
    lblNomeFiltro: TLabel;
    edtNomeFiltro: TEdit;
    edtDocumentoFiltro: TEdit;
    lblDocumentoFiltro: TLabel;
    lblEmailFiltro: TLabel;
    edtEmailFiltro: TEdit;
    lblTelefoneFiltro: TLabel;
    edtTelefoneFiltro: TEdit;
    lblDataCadastroFiltro: TLabel;
    dtpDataCadastroInicioFiltro: TDateTimePicker;
    lblDataCadastroInicioFiltro: TLabel;
    lblDataCadastroFimFiltro: TLabel;
    dtpDataCadastroFimFiltro: TDateTimePicker;
    lblOrdenacao: TLabel;
    cbbOrdenacao: TComboBox;
    frxdsCliente: TfrxDBDataset;
    btnImportar: TBitBtn;
    btnExportar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnPrevisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExportarPDFClick(Sender: TObject);
    procedure btnExportarCSVClick(Sender: TObject);
  private
    { Private declarations }
    FDataSourceCliente: TDataSource;
    FMemTableCliente: TFDMemTable;
    FClienteController: TClienteController;

    procedure ConfiguraGridCliente;
    procedure AtualizaGridCliente;
    procedure PrepararRelatorio;
  public
    { Public declarations }
  end;

var
  FormCadCliente: TFormCadCliente;

implementation

uses
  uDMMain;

{$R *.dfm}

procedure TFormCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FClienteController := TClienteController.Create;
  FMemTableCliente   := TFDMemTable.Create(Self);
  FDataSourceCliente := TDataSource.Create(Self);
  ConfiguraGridCliente;
  AtualizaGridCliente;

  frxdsCliente.DataSet := FMemTableCliente;
end;

procedure TFormCadCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  FClienteController.Free;
  FMemTableCliente.Free;
  FDataSourceCliente.Free;
end;

procedure TFormCadCliente.PrepararRelatorio;
begin
  case cbbOrdenacao.ItemIndex of
    1: FMemTableCliente.IndexFieldNames := 'NOME';
    2: FMemTableCliente.IndexFieldNames := 'DOCUMENTO';
    3: FMemTableCliente.IndexFieldNames := 'EMAIL';
    4: FMemTableCliente.IndexFieldNames := 'TELEFONE';
    5: FMemTableCliente.IndexFieldNames := 'DATACADASTRO';
  else
    FMemTableCliente.IndexFieldNames := '';
  end;

  FMemTableCliente.First;
end;

procedure TFormCadCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  AtualizaGridCliente;
end;

procedure TFormCadCliente.btnEditarClick(Sender: TObject);
var
  vCliente: TCliente;
  vID: Integer;
begin
  if FMemTableCliente.IsEmpty then
  begin
    ShowMessage('Não há registros para editar.');
    btnCancelar.Click;
    Exit;
  end;

  inherited;

  vID      := dbgListagem.DataSource.DataSet.FieldByName('ID').AsInteger;
  vCliente := FClienteController.ListarPorID(vID);

  try
    edtCodigo.Text    := IntToStr(vCliente.Id);
    edtNome.Text      := vCliente.Nome;
    edtDocumento.Text := vCliente.Documento;
    edtEmail.Text     := vCliente.Email;
    edtTelefone.Text  := vCliente.Telefone;
  finally
    vCliente.Free;
  end;
end;

procedure TFormCadCliente.btnExcluirClick(Sender: TObject);
var
  vID: Integer;
begin
  inherited;

  vID := dbgListagem.DataSource.DataSet.FieldByName('ID').AsInteger;

  if MessageDlg('Deseja excluir este registro?', TMsgDlgType.mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FClienteController.Excluir(vID);
    ShowMessage('Cliente excluído com sucesso!');
    AtualizaGridCliente;
  end;
end;

procedure TFormCadCliente.btnExportarClick(Sender: TObject);
var
  vExcel, vPlanilha: Variant;
  vSaveDialog: TSaveDialog;
  vLinha, vColuna: Integer;
  vBookmark: TBookmark;
begin
  inherited;
  if FMemTableCliente.IsEmpty then
  begin
    ShowMessage('Não há dados para exportar.');
    Exit;
  end;

  vSaveDialog := TSaveDialog.Create(Self);
  try
    vSaveDialog.Filter := 'Arquivo Excel (*.xlsx)|*.xlsx';
    vSaveDialog.DefaultExt := 'xlsx';
    vSaveDialog.FileName := 'Relatorio_Clientes';

    if not vSaveDialog.Execute then
      Exit;

    try
      // Inicializa o Excel
      vExcel := CreateOleObject('Excel.Application');
      vExcel.Workbooks.Add;
      vPlanilha := vExcel.Workbooks[1].Sheets[1];
      vExcel.Visible := False; // Mantém oculto durante o processamento
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao iniciar o Excel: ' + E.Message);
        Exit;
      end;
    end;

    try
      // 1. Criar Cabeçalhos
      vPlanilha.Cells[1, 1].Value := 'ID';
      vPlanilha.Cells[1, 2].Value := 'NOME';
      vPlanilha.Cells[1, 3].Value := 'DOCUMENTO';
      vPlanilha.Cells[1, 4].Value := 'EMAIL';
      vPlanilha.Cells[1, 5].Value := 'TELEFONE';
      vPlanilha.Cells[1, 6].Value := 'DATA CADASTRO';

      // Estilizar cabeçalho (Opcional - Negrito)
      vPlanilha.Range['A1', 'F1'].Font.Bold := True;

      // 2. Exportar os Dados
      vLinha := 2;
      vBookmark := FMemTableCliente.GetBookmark; // Salva a posição atual do ponteiro
      FMemTableCliente.DisableControls;          // Ganho de performance
      try
        FMemTableCliente.First;
        while not FMemTableCliente.Eof do
        begin
          vPlanilha.Cells[vLinha, 1].Value := FMemTableCliente.FieldByName('ID').AsInteger;
          vPlanilha.Cells[vLinha, 2].Value := FMemTableCliente.FieldByName('NOME').AsString;
          vPlanilha.Cells[vLinha, 3].Value := FMemTableCliente.FieldByName('DOCUMENTO').AsString;
          vPlanilha.Cells[vLinha, 4].Value := FMemTableCliente.FieldByName('EMAIL').AsString;
          vPlanilha.Cells[vLinha, 5].Value := FMemTableCliente.FieldByName('TELEFONE').AsString;
          vPlanilha.Cells[vLinha, 6].Value := FMemTableCliente.FieldByName('DATACADASTRO').AsDateTime;

          Inc(vLinha);
          FMemTableCliente.Next;
        end;

        // Autoajuste das colunas
        vPlanilha.Columns.AutoFit;

        // Salvar o arquivo
        vPlanilha.SaveAs(vSaveDialog.FileName);
        ShowMessage('Arquivo exportado com sucesso em:' + sLineBreak + vSaveDialog.FileName);
      finally
        if FMemTableCliente.BookmarkValid(vBookmark) then
          FMemTableCliente.GotoBookmark(vBookmark);
        FMemTableCliente.FreeBookmark(vBookmark);
        FMemTableCliente.EnableControls;
      end;

    finally
      // Fecha o Excel e libera memória
      vExcel.Quit;
      vExcel := Unassigned;
    end;

  finally
    vSaveDialog.Free;
  end;
end;

procedure TFormCadCliente.btnExportarCSVClick(Sender: TObject);
begin
  inherited;
  if FMemTableCliente.IsEmpty then
  begin
    ShowMessage('Não há dados para exportar.');
    Exit;
  end;

  PrepararRelatorio;
  fstReport.PrepareReport;
  fstReport.Export(freCSV);
end;

procedure TFormCadCliente.btnExportarPDFClick(Sender: TObject);
begin
  inherited;
  if FMemTableCliente.IsEmpty then
  begin
    ShowMessage('Não há dados para exportar.');
    Exit;
  end;

  PrepararRelatorio;
  fstReport.PrepareReport;
  fstReport.Export(frePDF);
end;

procedure TFormCadCliente.btnFiltrarClick(Sender: TObject);
var
  vLista: TObjectList<TCliente>;
  vCliente: TCliente;
  vParametros: TFDParams;
begin
  vParametros := TFDParams.Create;

  if edtNomeFiltro.Text <> EmptyStr then
    vParametros.Add('NOME', ftString, ptInput).AsString := edtNomeFiltro.Text;

  if edtDocumentoFiltro.Text <> EmptyStr then
    vParametros.Add('DOCUMENTO', ftString, ptInput).AsString := edtDocumentoFiltro.Text;

  if edtEmailFiltro.Text <> EmptyStr then
    vParametros.Add('EMAIL', ftString, ptInput).AsString := edtEmailFiltro.Text;

  if edtTelefoneFiltro.Text <> EmptyStr then
    vParametros.Add('TELEFONE', ftString, ptInput).AsString := edtTelefoneFiltro.Text;

  if (dtpDataCadastroInicioFiltro.Checked) and (not dtpDataCadastroFimFiltro.Checked) then
    vParametros.Add('DATACADINI', ftDateTime, ptInput).AsDateTime := dtpDataCadastroInicioFiltro.DateTime
  else if (dtpDataCadastroFimFiltro.Checked) and (not dtpDataCadastroInicioFiltro.Checked) then
    vParametros.Add('DATACADFIM', ftDateTime, ptInput).AsDateTime := dtpDataCadastroFimFiltro.DateTime
  else if (dtpDataCadastroInicioFiltro.Checked) and (dtpDataCadastroFimFiltro.Checked)  then
  begin
    vParametros.Add('DATACADINI', ftDateTime, ptInput).AsDateTime := dtpDataCadastroInicioFiltro.DateTime;
    vParametros.Add('DATACADFIM', ftDateTime, ptInput).AsDateTime := dtpDataCadastroFimFiltro.DateTime;
  end;

  vLista := FClienteController.ListarFiltro(vParametros);
  try
    FMemTableCliente.DisableControls;
    try
      FMemTableCliente.EmptyDataSet;

      for vCliente in vLista do
      begin
        FMemTableCliente.Append;
        FMemTableCliente.FieldByName('ID').AsInteger := vCliente.Id;
        FMemTableCliente.FieldByName('NOME').AsString := vCliente.Nome;
        FMemTableCliente.FieldByName('DOCUMENTO').AsString := vCliente.Documento;
        FMemTableCliente.FieldByName('EMAIL').AsString := vCliente.Email;
        FMemTableCliente.FieldByName('TELEFONE').AsString := vCliente.Telefone;
        FMemTableCliente.FieldByName('DATACADASTRO').AsDateTime := vCliente.DataCadastro;
        FMemTableCliente.Post;
      end;

      edtTotalRegistros.Text := IntToStr(vLista.Count);
    finally
      FMemTableCliente.EnableControls;
    end;

    PreparaComponentes(scNavegacao);
  finally
    vLista.Free;
  end;
end;

procedure TFormCadCliente.btnImportarClick(Sender: TObject);
var
  vExcel, vPlanilha: Variant;
  vOpenDialog: TOpenDialog;
  vLinha: Integer;
  vCliente: TCliente;
  vQryExcluir: TFDQuery;
begin
  inherited;
  // 1. Confirmação do usuário
  if MessageDlg('Atenção: Esta operação apagará TODOS os clientes atuais e importará os novos do Excel.' +
     sLineBreak + 'Deseja continuar?', mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  ShowMessage('O arquivo .XLS ou .XLSX deve conter as colunas NOME, DOCUMENTO, EMAIL e TELEFONE nesta ordem com seus respectivos tipos de dados para que a importação tenha sucesso!!!');

  vOpenDialog := TOpenDialog.Create(Self);
  try
    vOpenDialog.Filter := 'Arquivos Excel (*.xlsx;*.xls)|*.xlsx;*.xls';
    if not vOpenDialog.Execute then
      Exit;

    try
      // Inicializa o Excel
      vExcel := CreateOleObject('Excel.Application');
      vExcel.Workbooks.Open(vOpenDialog.FileName);
      vPlanilha := vExcel.Workbooks[1].Sheets[1];
      vExcel.Visible := False;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao abrir o Excel. Verifique se ele está instalado: ' + E.Message);
        Exit;
      end;
    end;

    DMMain.StartTransaction;
    vQryExcluir := DMMain.GetQueryComando;
    try
      try
        // 2. Limpa a tabela de clientes
        vQryExcluir.ExecSQL('DELETE FROM CLIENTE');

        // 3. Itera sobre as linhas (Assumindo que a linha 1 é o cabeçalho)
        vLinha := 2;

        // Loop enquanto a primeira coluna (Nome) não estiver vazia
        while not VarIsEmpty(vPlanilha.Cells[vLinha, 1].Value) do
        begin
          vCliente := TCliente.Create;
          try
            // Mapeamento das colunas conforme sua tabela SQL:
            // Coluna 1: Nome | 2: Documento | 3: Email | 4: Telefone
            vCliente.Id           := DMMain.RetornaChave('CLIENTE');
            vCliente.Nome         := VarToStr(vPlanilha.Cells[vLinha, 1].Value);
            vCliente.Documento    := VarToStr(vPlanilha.Cells[vLinha, 2].Value);
            vCliente.Email        := VarToStr(vPlanilha.Cells[vLinha, 3].Value);
            vCliente.Telefone     := VarToStr(vPlanilha.Cells[vLinha, 4].Value);
            vCliente.DataCadastro := Now;

            // O Controller chamará o uClienteService.Validar internamente
            if not FClienteController.Salvar(vCliente) then
              raise Exception.CreateFmt('Erro ao salvar linha %d', [vLinha]);

          finally
            vCliente.Free;
          end;

          Inc(vLinha);
        end;

        DMMain.Commit;
        ShowMessage('Importação concluída com sucesso! ' + IntToStr(vLinha - 2) + ' registros importados.');
      except
        on E: Exception do
        begin
          DMMain.Rollback;
          ShowMessage('Erro durante a importação. Operação cancelada: ' + E.Message);
        end;
      end;
    finally
      vQryExcluir.Free;
      AtualizaGridCliente;
    end;

  finally
    // Fecha o Excel
    if not VarIsEmpty(vExcel) then
    begin
      vExcel.Quit;
      vExcel := Unassigned;
    end;
    vOpenDialog.Free;
  end;
end;

procedure TFormCadCliente.btnImprimirClick(Sender: TObject);
begin
  inherited;
  if FMemTableCliente.IsEmpty then
  begin
    ShowMessage('Não há dados para imprimir.');
    Exit;
  end;

  PrepararRelatorio;
  fstReport.Print;
end;

procedure TFormCadCliente.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := EmptyStr;
  edtDocumento.Text := EmptyStr;
  edtEmail.Text := EmptyStr;
  edtTelefone.Text := EmptyStr;
end;

procedure TFormCadCliente.btnLimparFiltroClick(Sender: TObject);
begin
  inherited;
  edtNomeFiltro.Text                   := EmptyStr;
  edtDocumentoFiltro.Text              := EmptyStr;
  edtEmailFiltro.Text                  := EmptyStr;
  edtTelefoneFiltro.Text               := EmptyStr;
  dtpDataCadastroInicioFiltro.DateTime := Now;
  dtpDataCadastroFimFiltro.DateTime    := Now;
end;

procedure TFormCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Text := IntToStr(FClienteController.RetornaChave);
end;

procedure TFormCadCliente.btnPrevisualizarClick(Sender: TObject);
begin
  inherited;
  if FMemTableCliente.IsEmpty then
  begin
    ShowMessage('Não há dados para exibir no relatório.');
    Exit;
  end;

  PrepararRelatorio;
  fstReport.ShowReport;
end;

procedure TFormCadCliente.btnSalvarClick(Sender: TObject);
var
  vCliente: TCliente;
begin
  inherited;
  vCliente := TCliente.Create;

  try
    vCliente.ID := StrToIntDef(edtCodigo.Text, 0);
    vCliente.Nome := edtNome.Text;
    vCliente.Documento := edtDocumento.Text;
    vCliente.Email := edtEmail.Text;
    vCliente.Telefone := edtTelefone.Text;
    vCliente.DataCadastro := Now;

    try
      if FClienteController.Salvar(vCliente) then
      begin
        ShowMessage('Cliente salvo com sucesso!');
        AtualizaGridCliente;
      end;
    except
      on Ex: Exception do
      begin
        MessageDlg('Erro ao salvar: ' + Ex.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    vCliente.Free;
  end;
end;

procedure TFormCadCliente.ConfiguraGridCliente;
begin
  FMemTableCliente.Close;
  FMemTableCliente.FieldDefs.Clear;
  FMemTableCliente.FieldDefs.Add('ID', ftInteger);
  FMemTableCliente.FieldDefs.Add('NOME', ftString, 120);
  FMemTableCliente.FieldDefs.Add('DOCUMENTO', ftString, 20);
  FMemTableCliente.FieldDefs.Add('EMAIL', ftString, 120);
  FMemTableCliente.FieldDefs.Add('TELEFONE', ftString, 30);
  FMemTableCliente.FieldDefs.Add('DATACADASTRO', ftDateTime);

  FDataSourceCliente.DataSet := FMemTableCliente;

  dbgListagem.DataSource := FDataSourceCliente;
  dbgListagem.Columns.Add;
  dbnNavegacao.DataSource := FDataSourceCliente;
end;

procedure TFormCadCliente.AtualizaGridCliente;
var
  vLista: TObjectList<TCliente>;
  vCliente: TCliente;
begin
  // Alimenta Lookup Cliente
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
        FMemTableCliente.FieldByName('ID').AsInteger            := vCliente.ID;
        FMemTableCliente.FieldByName('NOME').AsString           := vCliente.Nome;
        FMemTableCliente.FieldByName('DOCUMENTO').AsString      := vCliente.Documento;
        FMemTableCliente.FieldByName('EMAIL').AsString          := vCliente.Email;
        FMemTableCliente.FieldByName('TELEFONE').AsString       := vCliente.Telefone;
        FMemTableCliente.FieldByName('DATACADASTRO').AsDateTime := vCliente.DataCadastro;
        FMemTableCliente.Post;
      end;
    finally
      FMemTableCliente.EnableControls;
      FMemTableCliente.First;
      edtTotalRegistros.Text := IntToStr(FMemTableCliente.RecordCount);
    end;
  finally
    vLista.Free;
  end;
end;

end.
