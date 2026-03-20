inherited FormCadCliente: TFormCadCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 433
  ClientWidth = 784
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 800
  ExplicitHeight = 472
  TextHeight = 15
  object lblNome: TLabel [0]
    Left = 8
    Top = 58
    Width = 36
    Height = 15
    CustomHint = blhHint
    Caption = 'Nome:'
  end
  object lblDocumento: TLabel [1]
    Left = 8
    Top = 108
    Width = 66
    Height = 15
    Caption = 'Documento:'
  end
  object lblTelefone: TLabel [2]
    Left = 201
    Top = 108
    Width = 48
    Height = 15
    Caption = 'Telefone:'
  end
  object lblEmail: TLabel [3]
    Left = 8
    Top = 158
    Width = 37
    Height = 15
    Caption = 'E-Mail:'
  end
  inherited pnlBtnInf: TPanel
    Top = 403
    Width = 784
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 403
    ExplicitWidth = 784
    DesignSize = (
      784
      30)
    inherited btnLimpar: TBitBtn
      OnClick = btnLimparClick
    end
    inherited btnFechar: TBitBtn
      Left = 683
      TabOrder = 6
      ExplicitLeft = 683
    end
    object btnImportar: TBitBtn
      Left = 491
      Top = 2
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Importar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF6EBC4
        EBD9C4EBD9DFF5EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC9ECDC74D5A84DC78F4BCE924BCE924DC78F74D4A8CAEDDDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEE3CB4ECD9250D09446C48A52
        C69052C69046C48A50D0944ECD92AFE4CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CDEEDF4ECD924CC98F45C18847C289C2EBD8C2EBD846C28945C1884CC98F4ECD
        92CEEFE0FFFFFFFFFFFFFFFFFFFEFFFE6FCFA34FD09447C28946C188B2E6CEF7
        FDFAF7FDFAB2E6CE45C18848C2894FD09470CFA3FEFEFEFFFFFFFFFFFFDEF4EA
        4AC58C4AC58D44C18797DDBCECF9F3E9F8F1E9F8F1ECF9F396DDBC44C1874AC5
        8D4AC48CDFF4EAFFFFFFFFFFFFC4EBD94FCF944AC38B4BC38B56C7925FCA99E3
        F6EDE3F6ED5FCA9956C7924BC38B4AC38B4FCF94C5EBD9FFFFFFFFFFFFC4EBD9
        4FCF944AC38B4AC38B43C18650C58FE3F6EDE3F6ED50C58F43C1864AC38B4AC3
        8B4FCF94C5ECDAFFFFFFFFFFFFDEF4EA4BC58C4BC68D4AC38B46C28854C692E3
        F6EDE3F6ED54C69246C2884AC38B4BC68D4BC58CDFF4EBFFFFFFFFFFFFFEFFFE
        6FCFA34FD0944AC38B46C28854C692E7F7F0E7F7F054C69246C2884AC38B4FD0
        9470CFA3FEFEFEFFFFFFFFFFFFFFFFFFCBEDDE4ECE934CC88F46C28853C692D9
        F3E7D9F3E753C69246C2884CC88F4ECE93CCEEDFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFADE3CA4ECE924ED0944CC68D54C79254C7924CC68D4ED0944ECD92AEE3
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8ECDC74D5A84CC78E4A
        CD914ACD914CC78E74D4A8C9ECDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDEF5EAC5ECDAC5ECDADFF6EBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 4
      OnClick = btnImportarClick
    end
    object btnExportar: TBitBtn
      Left = 587
      Top = 2
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Exportar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D4FFBA
        B2FFBAB2FFD7D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFB8FF5944FF2A10FF2509FF2509FF2A10FF5944FFBEB7FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E93FF2A0FFF2A0EFF290FFF34
        1DFF341DFF290FFF2A0EFF2A0FFF9D92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C3BCFF2A0EFF290EFF2308FF341CFED5E0F3D5E0F3341CFE2308FF290EFF2A0E
        FFC2BBFFFFFFFFFFFFFFFFFFFFFDFDFF5540FF2B0FFF280EFF2308FF351DFEE6
        F5F2E6F5F2351DFE2308FF280EFF2B0FFF543FFFFDFDFFFFFFFFFFFFFFD9D4FF
        280EFF290EFF280EFF2308FF351DFEE1EFF2E1EFF2351DFE2308FF280EFF290E
        FF280EFFD8D3FFFFFFFFFFFFFFBAB1FF2A0FFF280EFF280EFF1F03FF3017FEE1
        EFF2E1EFF23017FE1F03FF280EFF280EFF2A0FFFB9B0FFFFFFFFFFFFFFBAB1FF
        2B0FFF280DFF2910FE3721FD422CFEE1EFF2E1EFF2422CFE3721FD2910FE280D
        FF2B0FFFB9B0FFFFFFFFFFFFFFD9D4FF280EFF270DFF2108FE898FEFEDF9EFE9
        F8F2E9F8F2EDF9EF8A8FEF2108FE270DFF280EFFD8D3FFFFFFFFFFFFFFFDFDFF
        5541FF2B0FFF240AFF230AFDA6ADF1FAFFF0FAFFF0A6AEF1240AFD240AFF2B0F
        FF5440FFFDFDFFFFFFFFFFFFFFFFFFFFC5BDFF2A0EFF2A0FFF2206FF2109FFB8
        C4F2B9C5F12109FF2206FF2A0FFF2A0EFFC4BDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA095FF2A0FFF2B10FF2206FF3220FC3220FC2206FF2B10FF2A0FFFA094
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0B9FF5844FF2B11FF26
        08FF2608FF2B11FF5844FFBFB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD8D4FFB9B0FFB9B0FFD8D3FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 5
      OnClick = btnExportarClick
    end
  end
  inherited pnlBtnSup: TPanel
    Width = 784
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 784
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
  inherited pnlCadastro: TPanel
    Width = 784
    Height = 373
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 784
    ExplicitHeight = 373
    inherited pgcCadastro: TPageControl
      Width = 782
      Height = 346
      ExplicitWidth = 782
      ExplicitHeight = 346
      inherited tsListagem: TTabSheet
        ExplicitWidth = 774
        ExplicitHeight = 316
        inherited dbgListagem: TDBGrid
          Width = 774
          Height = 316
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Title.Caption = 'Documento'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Caption = 'E-Mail'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATACADASTRO'
              Title.Caption = 'Data de Cadastro'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited tsCadastro: TTabSheet
        ExplicitWidth = 774
        ExplicitHeight = 316
        inherited lblCodigo: TLabel
          Left = 27
          Top = 26
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 27
          ExplicitTop = 26
        end
        object lblNomeCliente: TLabel [1]
          Left = 33
          Top = 55
          Width = 36
          Height = 15
          Caption = 'Nome:'
        end
        object lblDocumentoCliente: TLabel [2]
          Left = 3
          Top = 84
          Width = 66
          Height = 15
          Caption = 'Documento:'
        end
        object lblEmailCliente: TLabel [3]
          Left = 32
          Top = 113
          Width = 37
          Height = 15
          Caption = 'E-Mail:'
        end
        object lblTelefoneCliente: TLabel [4]
          Left = 21
          Top = 142
          Width = 48
          Height = 15
          Caption = 'Telefone:'
        end
        inherited edtCodigo: TEdit
          Left = 75
          Top = 23
          Hint = 'C'#243'digo do cliente'
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 75
          ExplicitTop = 23
        end
        object edtNome: TEdit
          Left = 75
          Top = 52
          Width = 300
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edtDocumento: TEdit
          Left = 75
          Top = 81
          Width = 120
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object edtEmail: TEdit
          Left = 75
          Top = 110
          Width = 300
          Height = 23
          CharCase = ecLowerCase
          TabOrder = 3
        end
        object edtTelefone: TEdit
          Left = 75
          Top = 139
          Width = 120
          Height = 23
          TabOrder = 4
        end
      end
      inherited tsFiltro: TTabSheet
        ExplicitWidth = 774
        ExplicitHeight = 316
        object lblNomeFiltro: TLabel [0]
          Left = 72
          Top = 25
          Width = 36
          Height = 15
          Caption = 'Nome:'
        end
        object lblDocumentoFiltro: TLabel [1]
          Left = 42
          Top = 54
          Width = 66
          Height = 15
          Caption = 'Documento:'
        end
        object lblEmailFiltro: TLabel [2]
          Left = 71
          Top = 83
          Width = 37
          Height = 15
          Caption = 'E-Mail:'
        end
        object lblTelefoneFiltro: TLabel [3]
          Left = 60
          Top = 112
          Width = 48
          Height = 15
          Caption = 'Telefone:'
        end
        object lblDataCadastroFiltro: TLabel [4]
          Left = 114
          Top = 138
          Width = 93
          Height = 15
          Caption = 'Data de Cadastro:'
        end
        object lblDataCadastroInicioFiltro: TLabel [5]
          Left = 76
          Top = 163
          Width = 32
          Height = 15
          Caption = 'In'#237'cio:'
        end
        object lblDataCadastroFimFiltro: TLabel [6]
          Left = 221
          Top = 163
          Width = 23
          Height = 15
          Caption = 'Fim:'
        end
        inherited btnFiltrar: TBitBtn
          Top = 288
          TabOrder = 7
          OnClick = btnFiltrarClick
          ExplicitTop = 288
        end
        inherited btnLimparFiltro: TBitBtn
          Top = 288
          TabOrder = 6
          OnClick = btnLimparFiltroClick
          ExplicitTop = 288
        end
        object edtNomeFiltro: TEdit
          Left = 114
          Top = 22
          Width = 300
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object edtDocumentoFiltro: TEdit
          Left = 114
          Top = 51
          Width = 120
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edtEmailFiltro: TEdit
          Left = 114
          Top = 80
          Width = 300
          Height = 23
          CharCase = ecLowerCase
          TabOrder = 2
        end
        object edtTelefoneFiltro: TEdit
          Left = 114
          Top = 109
          Width = 120
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object dtpDataCadastroInicioFiltro: TDateTimePicker
          Left = 114
          Top = 159
          Width = 90
          Height = 23
          Date = 46098.000000000000000000
          Time = 0.399298645832459400
          ShowCheckbox = True
          Checked = False
          TabOrder = 4
        end
        object dtpDataCadastroFimFiltro: TDateTimePicker
          Left = 250
          Top = 159
          Width = 90
          Height = 23
          Date = 46098.000000000000000000
          Time = 0.399298645832459400
          ShowCheckbox = True
          Checked = False
          TabOrder = 5
        end
      end
      inherited tsRelatorio: TTabSheet
        ExplicitWidth = 774
        ExplicitHeight = 316
        object lblOrdenacao: TLabel [0]
          Left = 64
          Top = 51
          Width = 67
          Height = 15
          Caption = 'Ordenar por:'
        end
        inherited btnExportarCSV: TBitBtn
          Top = 288
          TabOrder = 2
          OnClick = btnExportarCSVClick
          ExplicitTop = 288
        end
        inherited btnImprimir: TBitBtn
          Top = 288
          TabOrder = 4
          OnClick = btnImprimirClick
          ExplicitTop = 288
        end
        inherited btnPrevisualizar: TBitBtn
          Top = 288
          TabOrder = 1
          OnClick = btnPrevisualizarClick
          ExplicitTop = 288
        end
        inherited btnExportarPDF: TBitBtn
          Top = 288
          TabOrder = 3
          OnClick = btnExportarPDFClick
          ExplicitTop = 288
        end
        object cbbOrdenacao: TComboBox
          Left = 64
          Top = 72
          Width = 120
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = 'Nenhum'
          Items.Strings = (
            'Nenhum'
            'Nome'
            'Documento'
            'E-Mail'
            'Telefone'
            'Data de Cadastro')
        end
      end
    end
    inherited pnlNavegacao: TPanel
      Top = 347
      Width = 782
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 347
      ExplicitWidth = 782
      inherited dbnNavegacao: TDBNavigator
        Hints.Strings = ()
      end
      inherited edtTotalRegistros: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
  inherited blhHint: TBalloonHint
    Left = 512
    Top = 288
  end
  inherited fstReport: TfrxReport
    ReportOptions.CreateDate = 46098.580524872700000000
    ReportOptions.LastChange = 46101.221176064810000000
    Left = 571
    Top = 288
    Datasets = <
      item
        DataSet = frxdsCliente
        DataSetName = 'frxDBCliente'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300770000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000012310000000000
          Top = 0.000000820000000000
          Width = 1046.929810730000000000
          Height = 18.897647860000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TESTE DE FRANCISCO SANTOS - SKY INFORM'#193'TICA')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897649100000000000
          Width = 1046.929803100000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes Cadastrados')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000390000000000
          Width = 302.362396920000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina: [Page#] de [TotalPages#]')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 631.181519790000000000
          Top = -0.000001840000000003
          Width = 415.748300730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Data: [<Date>] [<Time>]')
          ParentFont = False
        end
      end
      object MDClientes: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 1046.929810000000000000
        DataSet = frxdsCliente
        DataSetName = 'frxDBCliente'
        RowCount = 0
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 0.000000650000000005
          Width = 75.590598830000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCliente."CODIGO"]')
          ParentFont = False
        end
        object frxDBClienteNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME'
          DataSet = frxdsCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCliente."NOME"]')
          ParentFont = False
        end
        object frxDBClienteDOCUMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DOCUMENTO'
          DataSet = frxdsCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCliente."DOCUMENTO"]')
          ParentFont = False
        end
        object frxDBClienteEMAIL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'EMAIL'
          DataSet = frxdsCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCliente."EMAIL"]')
          ParentFont = False
        end
        object frxDBClienteTELEFONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 782.362710000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TELEFONE'
          DataSet = frxdsCliente
          DataSetName = 'frxDBCliente'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCliente."TELEFONE"]')
        end
        object frxDBClienteDATACADASTRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 895.748610000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DATACADASTRO'
          DataSet = frxdsCliente
          DataSetName = 'frxDBCliente'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCliente."DATACADASTRO"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897651670000000000
        Top = 79.370130000000000000
        Width = 1046.929810000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000190000000000
          Width = 75.590598830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590599060000000000
          Top = 0.000002450000000001
          Width = 226.771808360000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362386860000000000
          Top = 0.000002450000000001
          Width = 113.385900730000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DOCUMETO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 366.614263540000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'E-MAIL')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Width = 113.385900730000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TELEFONE')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 895.748610000000000000
          Width = 151.181200730000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA DE CADASTRO')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000003300000000000
          Top = 0.000003100000000006
          Width = 1046.929803100000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total de clientes: [COUNT(MDClientes)]')
          ParentFont = False
        end
      end
    end
    object TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
  end
  inherited freCSV: TfrxCSVExport
    Left = 601
    Top = 288
  end
  inherited digpPrinter: TPrintDialog
    Left = 542
    Top = 288
  end
  inherited frePDF: TfrxPDFExport
    Left = 631
    Top = 288
  end
  object frxdsCliente: TfrxDBDataset
    UserName = 'frxDBCliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=CODIGO'
      'NOME=NOME'
      'DOCUMENTO=DOCUMENTO'
      'EMAIL=EMAIL'
      'TELEFONE=TELEFONE'
      'DATACADASTRO=DATACADASTRO')
    BCDToCurrency = False
    DataSetOptions = []
    Left = 573
    Top = 353
  end
end
