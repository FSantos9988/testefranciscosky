inherited FormCadOrdemServico: TFormCadOrdemServico
  Caption = 'Cadastro de Ordem de Servi'#231'o'
  ClientHeight = 461
  ClientWidth = 754
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 770
  ExplicitHeight = 500
  TextHeight = 15
  inherited pnlBtnInf: TPanel
    Top = 431
    Width = 754
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 431
    ExplicitWidth = 754
    inherited btnSalvar: TBitBtn
      Left = 3
      ExplicitLeft = 3
    end
    inherited btnCancelar: TBitBtn
      Left = 331
      ExplicitLeft = 331
    end
    inherited btnSalvarNovo: TBitBtn
      Left = 99
      ExplicitLeft = 99
    end
    inherited btnLimpar: TBitBtn
      Left = 235
      ExplicitLeft = 235
    end
    inherited btnFechar: TBitBtn
      Left = 651
      ExplicitLeft = 651
    end
  end
  inherited pnlBtnSup: TPanel
    Width = 754
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 754
  end
  inherited pnlCadastro: TPanel
    Width = 754
    Height = 401
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 754
    ExplicitHeight = 401
    inherited pgcCadastro: TPageControl
      Width = 752
      Height = 374
      ActivePage = tsRelatorio
      ExplicitWidth = 752
      ExplicitHeight = 374
      inherited tsListagem: TTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 344
        inherited dbgListagem: TDBGrid
          Top = 22
          Width = 744
          Height = 322
          Align = alBottom
          TabOrder = 5
          OnDrawColumnCell = dbgListagemDrawColumnCell
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
              FieldName = 'CLIENTE'
              Title.Caption = 'Cliente'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ABERTURA'
              Title.Caption = 'Data de Abertura'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PREVISTA'
              Title.Caption = 'Data Prevista'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_FECHAMENTO'
              Title.Caption = 'Data de Fechamento'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valor Total (R$)'
              Width = 100
              Visible = True
            end>
        end
        object edtTotalAbertas: TEdit
          Left = 0
          Top = 0
          Width = 145
          Height = 23
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Abertas: 0'
        end
        object edtTotalEmAndamento: TEdit
          Left = 151
          Top = 0
          Width = 145
          Height = 23
          Color = clPurple
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'Em Andamento: 0'
        end
        object edtTotalConcluidas: TEdit
          Left = 302
          Top = 0
          Width = 145
          Height = 23
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = 'Conclu'#237'das: 0'
        end
        object edtTotalAtrasados: TEdit
          Left = 453
          Top = 0
          Width = 145
          Height = 23
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = 'Em Atraso: 0'
        end
        object edtTotalCanceladas: TEdit
          Left = 604
          Top = 0
          Width = 145
          Height = 23
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = 'Canceladas: 0'
        end
      end
      inherited tsCadastro: TTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 344
        inherited lblCodigo: TLabel
          Left = 87
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 87
        end
        object btnIncluirItem: TSpeedButton [1]
          Left = 0
          Top = 179
          Width = 23
          Height = 23
          Anchors = [akLeft, akRight, akBottom]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FCF9F9FCF9FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F4E8A5D8A377C3745D
            B5595DB55977C373A5D7A2E9F5E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC1E2C060BB5C57BE5254B85052B44E52B44E54B85057BE5260BB5CC2E2
            C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0E2BF55B95053B74F50AF4C4FAF4B44
            A94044A9404FAF4B50AF4C53B74F54B850C1E2BFFFFFFFFFFFFFFFFFFFEAF6EA
            5AB65654B64F50AF4C4FAE4A54B15088C98688C98654B1504FAE4A50AF4C54B7
            4F59B556EBF6EBFFFFFFFFFFFFA2D5A057BE5350AF4C4EAE4A47AB4258B255FF
            FFFFFFFFFF58B25547AB424EAE4A50AF4C57BE53A3D5A1FFFFFFFFFFFF71BE6E
            54B8504FAF4B54B15058B25366B963F9FCF9F9FCF966B96358B25354B1504FAF
            4B54B85072BE6EFFFFFFF9FDF95DB45952B44E44A94089C986F8FCF8F8FCF8FF
            FFFFFFFFFFF8FCF8F8FCF889C98644A94052B44E5EB55AF9FCF9F9FDF95DB459
            52B44E44A94089C986F8FCF8F8FCF8FFFFFFFFFFFFF8FCF8F8FCF889C98644A9
            4052B44E5EB55AFAFCF9FEFEFE70BD6D54B8504FAF4B54B15058B25366B963F9
            FCF9F9FCF966B96358B25354B1504FAF4B54B85071BD6DFFFFFFFFFFFFA1D49E
            57BE5350AF4C4EAE4A47AB4258B255FFFFFFFFFFFF58B25547AB424EAE4A50AF
            4C57BE52A2D5A1FFFFFFFFFFFFEAF6EA59B55554B64F50AF4C4FAE4A54B15088
            C98688C98654B1504FAE4A50AF4C54B64F59B555EAF5EAFFFFFFFFFFFFFFFFFF
            C0E2BE55BA5053B64F50AF4C4FAF4B44A94044A9404FAF4B50AF4C53B64F55B9
            50BFE1BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDE0BC5FBA5A57BF5354B85052
            B44E52B44E54B85057BF525FBB5BBEE0BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE7F4E7A4D8A277C3745FB55B5EB65B77C374A5D8A3E8F4E8FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
            FDFAFAFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnIncluirItemClick
        end
        object btnEditarItem: TSpeedButton [2]
          Left = 24
          Top = 179
          Width = 23
          Height = 23
          Anchors = [akLeft, akRight, akBottom]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFE7E9E9D5D8D7FBFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D5D4
            2797B32DCAFFA5DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFF2BC8FF01ACFF009EFF9AD6FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            A0D9FF009FFF00A0FF009FFF99D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93D3FF00A0FF00A0FF009FFF9A
            D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF93D3FF00A0FF00A0FF009FFF9AD6FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93D3FF00A0FF00
            A0FF009FFF9AD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF93D3FF00A0FF00A0FF009FFF9AD6FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93
            D3FF00A0FF00A0FF009FFF9AD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94D3FF009FFF00A0FF009DFFA6D9
            FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF93D3FE009FFF22A0F3B4C1BCE7E3E2FEFEFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D7FAB2BFBAC4B5
            B88080EBDDDDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFE9E3E17F7FEA9C9DF2F6F6FDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDE
            FBFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnEditarItemClick
        end
        object btnExcluirItem: TSpeedButton [3]
          Left = 48
          Top = 179
          Width = 23
          Height = 23
          Anchors = [akLeft, akRight, akBottom]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FFF8F8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E7FD979EFD626CFB45
            51F64551F6626CFA979EFCE6E8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB8BCFA4754FC3B49FF3947FF3745FB3745FB3947FF3A49FF4753FCB8BD
            FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7BCFA3947FF3846FE3643F33643F436
            43F43643F43643F43643F33846FE3947FEB8BCFBFFFFFFFFFFFFFFFFFFE7E9FE
            414DF83846FD3743F32E3BF42B39F33542F43542F42B39F32E3BF43743F33846
            FD414EF7E8EAFEFFFFFFFFFFFF959CFA3B49FF3643F32E3BF37E86F89299F927
            35F32735F39299F97E86F82E3BF33643F33B49FF959CF9FFFFFFFFFFFF5C67F6
            3946FF3643F42B39F3979EF9FFFFFF8990F88990F8FFFFFF979DF92B39F33643
            F43946FF5D67F6FFFFFFF9F9FF4551F43845FB3643F43542F42836F38F96F9FF
            FFFFFFFFFF8F96F92836F33542F43643F43845FB4652F5F9F9FFF9F9FF4551F4
            3845FB3643F43542F42634F38A92F9FFFFFFFFFFFF8A92F92634F33542F43643
            F43845FB4652F5F9F9FFFEFEFF5B65F63946FF3643F42B39F4949BF9FFFFFF8E
            95F98E95F9FFFFFF949AF92B39F43643F43946FF5C66F5FFFFFFFFFFFF939AF9
            3B49FF3643F32E3BF38189F8979DF92735F32735F3979DF98189F82E3BF33643
            F33B49FF959CF9FFFFFFFFFFFFE7E9FE404DF83846FD3743F32E3BF32B39F335
            42F43542F42B39F32E3BF33743F33846FD404DF7E7E9FDFFFFFFFFFFFFFFFFFF
            B6BBFB3947FF3846FE3643F33643F43643F43643F43643F43643F33846FE3947
            FFB6BBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B8FA4552FC3B49FF3946FF38
            45FB3845FB3947FF3B49FF4652FCB4B9FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE4E5FD969DFD626CFB4653F64653F6626CFB979EFDE5E6FDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
            F9FFF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnExcluirItemClick
        end
        object lblCliente: TLabel [4]
          Left = 89
          Top = 46
          Width = 40
          Height = 15
          Caption = 'Cliente:'
        end
        object lblDataAbertura: TLabel [5]
          Left = 37
          Top = 75
          Width = 92
          Height = 15
          Caption = 'Data de Abertura:'
        end
        object lblDataPrevista: TLabel [6]
          Left = 251
          Top = 75
          Width = 71
          Height = 15
          Caption = 'Data Prevista:'
        end
        object lblDataFechamento: TLabel [7]
          Left = 17
          Top = 104
          Width = 112
          Height = 15
          Caption = 'Data de Fechamento:'
        end
        object lblStatus: TLabel [8]
          Left = 287
          Top = 103
          Width = 35
          Height = 15
          Caption = 'Status:'
        end
        object lblValorTotal: TLabel [9]
          Left = 73
          Top = 132
          Width = 56
          Height = 15
          Caption = 'Valor total:'
        end
        object lblDescricaoProblema: TLabel [10]
          Left = 464
          Top = 21
          Width = 125
          Height = 15
          Caption = 'Descri'#231#227'o do problema:'
        end
        object lblTituloItemOrdem: TLabel [11]
          Left = 3
          Top = 158
          Width = 138
          Height = 15
          Caption = 'Itens da Ordem de Servi'#231'o'
        end
        inherited edtCodigo: TEdit
          Left = 135
          Top = 13
          Width = 60
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 135
          ExplicitTop = 13
          ExplicitWidth = 60
        end
        object dbgItemOrdem: TDBGrid
          Left = 0
          Top = 208
          Width = 744
          Height = 136
          Align = alBottom
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Title.Caption = 'C'#243'digo'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o do Item'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Caption = 'Quantidade do Item'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNITARIO'
              Title.Caption = 'Valor Unit'#225'rio (R$)'
              Width = 120
              Visible = True
            end>
        end
        object lkpCliente: TDBLookupComboBox
          Left = 135
          Top = 42
          Width = 303
          Height = 23
          TabOrder = 1
        end
        object dtpDataAbertura: TDateTimePicker
          Left = 135
          Top = 71
          Width = 110
          Height = 23
          Date = 36526.000000000000000000
          Time = 0.655593344905355500
          ShowCheckbox = True
          Checked = False
          TabOrder = 3
        end
        object dtpDataPrevista: TDateTimePicker
          Left = 328
          Top = 71
          Width = 110
          Height = 23
          Date = 36526.000000000000000000
          Time = 0.655593344905355500
          ShowCheckbox = True
          Checked = False
          TabOrder = 4
        end
        object dtpDataFechamento: TDateTimePicker
          Left = 135
          Top = 100
          Width = 110
          Height = 23
          Date = 36526.000000000000000000
          Time = 0.655593344905355500
          ShowCheckbox = True
          Checked = False
          TabOrder = 5
        end
        object cbbStatus: TComboBox
          Left = 328
          Top = 100
          Width = 110
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 6
          Text = 'ABERTO'
          Items.Strings = (
            'ABERTO'
            'EM ANDAMENTO'
            'CONCLUIDO'
            'CANCELADO')
        end
        object mmoDescricaoProblema: TMemo
          Left = 464
          Top = 42
          Width = 277
          Height = 110
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object nmbValorTotal: TNumberBox
          Left = 135
          Top = 129
          Width = 110
          Height = 23
          Enabled = False
          Mode = nbmCurrency
          ReadOnly = True
          TabOrder = 7
        end
        object btnRecalculaTotalOrdem: TBitBtn
          Left = 77
          Top = 179
          Width = 180
          Height = 23
          Caption = 'Recalcular total da ordem'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFFFFFFD3
            F0E2BFECD7DDF5EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF90DBB8C9ECDC90DBB850D3964DCB916BD3A3C9EDDCFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFE5CCC7ECDBD5F1E4D9F2E7FF
            FFFFF6FFFDCBEDDD7CD8AD51D899ADE3CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC6ECDAB3E6CEFFFFFFFFFFFFC9DBC7CBDCC8FFFFFFFFFFFFA3E2C552D8
            9ACCEEDFFFFFFFFFFFFFFFFFFFFDFEFE8AD8B4D4F0E3FFFFFFFFFFFFB3CEB14A
            8E464E924BACCAABFFFFFFFFFFFF78D4A965CC9CFDFEFEFFFFFFFFFFFFFFFFFF
            D1EFE1DBF3E8FFFFFFF8FBF74B8C47C2D9C1BED6BE337E2EF3F8F3FFFFFFCEEF
            E04DCB91DDF4E9FFFFFFFFFFFFD9F3E7A8E2C7FFFFFFFFFFFFFEFEFDF3F7F3BE
            D7BC5B995879AA77FDFEFDFFFFFFF0FAF54AC58CC1EBD7FFFFFFFFFFFFE1F6EC
            B1E5CDFAFEFCFFFFFFFFFFFF94BB924D9249B2CFB1F0F5EFFDFEFDFFFFFFF1FB
            F64BC58CBFEAD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54935189
            B587BDD6BB4D8E4AF7FAF7FFFFFFCEEFDF4DCC91DDF4EAFFFFFFFFFFFFFFFFFF
            C1EBD8B7EAD2E5F6EEF9FDFBCFE0CE52934F4C9148B7D2B6FFFFFFFFFFFF77D4
            A964CC9CFDFFFEFFFFFFFFFFFFFFFFFFB6E7D154DD9E52CE95A6E1C6FFFFFFD2
            E0CFCFDECCFFFFFFFFFFFFA4E2C652D89ACCEEDEFFFFFFFFFFFFFFFFFFFFFFFF
            EAF8F14AC38B53DB9C71D2A5CBEDDDF4FEFBF5FEFBCBEDDE7CD8AD51D79AACE3
            C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFEFDA6E1C6BFEAD66DD0A24DCB904A
            C48C4AC48C4CCA906AD2A2C9ECDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFDEF5EAC3EBD9C2EBD8DFF5EBFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 8
          OnClick = btnRecalculaTotalOrdemClick
        end
      end
      inherited tsFiltro: TTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 344
        object lblCliente1: TLabel [0]
          Left = 65
          Top = 29
          Width = 40
          Height = 15
          Caption = 'Cliente:'
        end
        object lblDataAbertura1: TLabel [1]
          Left = 65
          Top = 79
          Width = 92
          Height = 15
          Caption = 'Data de Abertura:'
        end
        object lblDataPrevista1: TLabel [2]
          Left = 181
          Top = 104
          Width = 23
          Height = 15
          Caption = 'Fim:'
        end
        object lblStatus1: TLabel [3]
          Left = 65
          Top = 129
          Width = 35
          Height = 15
          Caption = 'Status:'
        end
        object lblValorTotal1: TLabel [4]
          Left = 65
          Top = 178
          Width = 56
          Height = 15
          Caption = 'Valor total:'
        end
        object lblDataPrevista2: TLabel [5]
          Left = 27
          Top = 104
          Width = 32
          Height = 15
          Caption = 'In'#237'cio:'
        end
        object lblValorTotal2: TLabel [6]
          Left = 42
          Top = 202
          Width = 17
          Height = 15
          Caption = 'De:'
        end
        object lblValorTotal3: TLabel [7]
          Left = 185
          Top = 202
          Width = 19
          Height = 15
          Caption = 'at'#233':'
        end
        inherited btnFiltrar: TBitBtn
          Top = 317
          TabOrder = 7
          ExplicitTop = 317
        end
        inherited btnLimparFiltro: TBitBtn
          Top = 317
          TabOrder = 6
          OnClick = btnLimparFiltroClick
          ExplicitTop = 317
        end
        object dtpDataAberturaInicioFiltro: TDateTimePicker
          Left = 65
          Top = 100
          Width = 110
          Height = 23
          Date = 46098.000000000000000000
          Time = 0.655593344905355500
          ShowCheckbox = True
          Checked = False
          TabOrder = 1
        end
        object dtpDataAberturaFimFiltro: TDateTimePicker
          Left = 210
          Top = 100
          Width = 110
          Height = 23
          Date = 46098.000000000000000000
          Time = 0.655593344905355500
          ShowCheckbox = True
          Checked = False
          TabOrder = 2
        end
        object cbbStatusFiltro: TComboBox
          Left = 65
          Top = 150
          Width = 110
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 3
          Text = 'TODOS'
          Items.Strings = (
            'TODOS'
            'ABERTOS'
            'EM ANDAMENTO'
            'CONCLU'#205'DOS'
            'EM ATRASO'
            'CANCELADOS')
        end
        object edtClienteFiltro: TEdit
          Left = 65
          Top = 50
          Width = 255
          Height = 23
          TabOrder = 0
        end
        object nmbValorTotalInicioFiltro: TNumberBox
          Left = 65
          Top = 199
          Width = 110
          Height = 23
          Mode = nbmCurrency
          TabOrder = 4
        end
        object nmbValorTotalFimFiltro: TNumberBox
          Left = 210
          Top = 199
          Width = 110
          Height = 23
          Mode = nbmCurrency
          TabOrder = 5
        end
      end
      inherited tsRelatorio: TTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 344
        inherited btnExportarCSV: TBitBtn
          Top = 317
          TabOrder = 3
          OnClick = btnExportarCSVClick
          ExplicitTop = 317
        end
        inherited btnImprimir: TBitBtn
          Top = 317
          TabOrder = 5
          OnClick = btnImprimirClick
          ExplicitTop = 317
        end
        inherited btnPrevisualizar: TBitBtn
          Top = 317
          TabOrder = 2
          OnClick = btnPrevisualizarClick
          ExplicitTop = 317
        end
        inherited btnExportarPDF: TBitBtn
          Top = 317
          TabOrder = 4
          OnClick = btnExportarPDFClick
          ExplicitTop = 317
        end
        object grpFiltro: TGroupBox
          Left = 3
          Top = 3
          Width = 438
          Height = 223
          Caption = ' Filtro '
          TabOrder = 0
          object lblCliente11: TLabel
            Left = 60
            Top = 13
            Width = 40
            Height = 15
            Caption = 'Cliente:'
          end
          object lblDataAbertura11: TLabel
            Left = 60
            Top = 63
            Width = 92
            Height = 15
            Caption = 'Data de Abertura:'
          end
          object lblDataPrevista21: TLabel
            Left = 22
            Top = 88
            Width = 32
            Height = 15
            Caption = 'In'#237'cio:'
          end
          object lblDataPrevista11: TLabel
            Left = 176
            Top = 88
            Width = 23
            Height = 15
            Caption = 'Fim:'
          end
          object lblStatus11: TLabel
            Left = 60
            Top = 113
            Width = 35
            Height = 15
            Caption = 'Status:'
          end
          object lblValorTotal11: TLabel
            Left = 64
            Top = 162
            Width = 56
            Height = 15
            Caption = 'Valor total:'
          end
          object lblValorTotal21: TLabel
            Left = 37
            Top = 186
            Width = 17
            Height = 15
            Caption = 'De:'
          end
          object lblValorTotal31: TLabel
            Left = 176
            Top = 186
            Width = 19
            Height = 15
            Caption = 'at'#233':'
          end
          object edtClienteRelatorio: TEdit
            Left = 60
            Top = 34
            Width = 255
            Height = 23
            TabOrder = 0
          end
          object dtpDataAberturaInicioRelatorio: TDateTimePicker
            Left = 60
            Top = 84
            Width = 110
            Height = 23
            Date = 46098.000000000000000000
            Time = 0.655593344905355500
            ShowCheckbox = True
            Checked = False
            TabOrder = 1
          end
          object dtpDataAberturaFimRelatorio: TDateTimePicker
            Left = 205
            Top = 84
            Width = 110
            Height = 23
            Date = 46098.000000000000000000
            Time = 0.655593344905355500
            ShowCheckbox = True
            Checked = False
            TabOrder = 2
          end
          object cbbStatusRelatorio: TComboBox
            Left = 60
            Top = 134
            Width = 110
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 3
            Text = 'TODOS'
            Items.Strings = (
              'TODOS'
              'ABERTOS'
              'EM ANDAMENTO'
              'CONCLU'#205'DOS'
              'EM ATRASO'
              'CANCELADOS')
          end
          object nmbValorTotalInicialRelatorio: TNumberBox
            Left = 60
            Top = 183
            Width = 110
            Height = 23
            Mode = nbmCurrency
            TabOrder = 4
          end
          object nmbValorTotalFimRelatorio: TNumberBox
            Left = 201
            Top = 183
            Width = 110
            Height = 23
            Mode = nbmCurrency
            TabOrder = 5
          end
        end
        object grpOrdenacao: TGroupBox
          Left = 3
          Top = 232
          Width = 438
          Height = 79
          Caption = ' Ordena'#231#227'o '
          TabOrder = 1
          object lblOrdenacao1: TLabel
            Left = 37
            Top = 22
            Width = 70
            Height = 15
            Caption = 'Ordena'#231#227'o 1:'
          end
          object lblOrdenacao2: TLabel
            Left = 158
            Top = 22
            Width = 70
            Height = 15
            Caption = 'Ordena'#231#227'o 2:'
          end
          object lblOrdenacao3: TLabel
            Left = 279
            Top = 22
            Width = 70
            Height = 15
            Caption = 'Ordena'#231#227'o 3:'
          end
          object cbbOrdenacao1: TComboBox
            Left = 37
            Top = 43
            Width = 115
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 0
            Text = 'Nenhum'
            Items.Strings = (
              'Nenhum'
              'Cliente'
              'Data de Abertura'
              'Data Prevista'
              'Data de Fechamento'
              'Status'
              'Valo total')
          end
          object cbbOrdenacao2: TComboBox
            Left = 158
            Top = 43
            Width = 115
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 1
            Text = 'Nenhum'
            Items.Strings = (
              'Nenhum'
              'Cliente'
              'Data de Abertura'
              'Data Prevista'
              'Data de Fechamento'
              'Status'
              'Valo total')
          end
          object cbbOrdenacao3: TComboBox
            Left = 279
            Top = 43
            Width = 115
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 2
            Text = 'Nenhum'
            Items.Strings = (
              'Nenhum'
              'Cliente'
              'Data de Abertura'
              'Data Prevista'
              'Data de Fechamento'
              'Status'
              'Valo total')
          end
        end
      end
    end
    inherited pnlNavegacao: TPanel
      Top = 375
      Width = 752
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 375
      ExplicitWidth = 752
      inherited dbnNavegacao: TDBNavigator
        Hints.Strings = ()
      end
      inherited edtTotalRegistros: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
  inherited blhHint: TBalloonHint
    Left = 504
  end
  inherited fstReport: TfrxReport
    ReportOptions.CreateDate = 46098.389162372700000000
    ReportOptions.LastChange = 46101.388697986110000000
    Left = 562
    Datasets = <
      item
        DataSet = frxdsOrdemServico
        DataSetName = 'frxDBDatasetOrdemServico'
      end
      item
        DataSet = frxdsItemOrdem
        DataSetName = 'frxDBDatasetItemOrdem'
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
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.220470000000000000
          Width = 1046.929133858270000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TESTE DE FRANCISCO SANTOS - SKY INFORM'#193'TICA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000002280000000000
          Top = 18.897648280000000000
          Width = 1046.929795470000000000
          Height = 18.897651670000000000
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
            'Relat'#243'rio de Ordens de Servi'#231'o')
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
        Height = 19.897662310000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338905860000000000
          Top = 0.000002930000000012
          Width = 555.590880210000000000
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
            'Total de Ordens de Servi'#231'o: [COUNT(MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590609300000000000
        Top = 117.165430000000000000
        Width = 1046.929810000000000000
        DataSet = frxdsOrdemServico
        DataSetName = 'frxDBDatasetOrdemServico'
        RowCount = 0
        object frxDBDatasetOrdemServicoCODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CODIGO'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."CODIGO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692944690000000000
          Width = 75.590598830000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ITEM C'#211'D.')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoCLIENTE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 264.566929130000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CLIENTE'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."CLIENTE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 56.692950000000000000
          Width = 706.772108830000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoDATA_ABERTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 18.897650000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DATA_ABERTURA'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."DATA_ABERTURA"]')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoDATA_PREVISTA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DATA_PREVISTA'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."DATA_PREVISTA"]')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoDATA_FECHAMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 18.897650000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DATA_FECHAMENTO'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."DATA_FECHAMENTO"]')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoDESCRICAO_PROBLEMA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 1046.929810000000000000
          Height = 37.795275590000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DESCRICAO_PROBLEMA'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."DESCRICAO_PROBLEMA"]')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoSTATUS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 774.803650000000000000
          Top = 18.897650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'STATUS'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."STATUS"]')
          ParentFont = False
        end
        object frxDBDatasetOrdemServicoVALOR_TOTAL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 907.087200000000000000
          Top = 18.897650000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'VALOR_TOTAL'
          DataSet = frxdsOrdemServico
          DataSetName = 'frxDBDatasetOrdemServico'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = 'R$ %2,2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetOrdemServico."VALOR_TOTAL"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 56.692950000000000000
          Width = 113.385826770000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 895.748610000000000000
          Top = 56.692950000000000000
          Width = 151.181102360000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR UNIT'#193'RIO (R$)')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 0.000002450000000001
          Width = 75.590599780000000000
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
            'C'#211'DIGO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590602350000000000
          Top = 0.000002450000000001
          Width = 264.566929130000000000
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
            'NOME DO CLIENTE')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157699900000000000
          Width = 151.181126770000000000
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
            'DATA DE ABERTURA')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338899900000000000
          Width = 113.385826770000000000
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
            'DATA PREVISTA')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724799900000000000
          Width = 170.078776770000000000
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
            'DATA DE FECHAMENTO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803649900000000000
          Width = 132.283476770000000000
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
            'STATUS')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 907.087199900000000000
          Width = 139.842536770000000000
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
            'VALOR (R$)')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 75.590603990000000000
          Width = 1054.488877240000000000
          Color = clBlack
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 215.433210000000000000
        Width = 1046.929810000000000000
        DataSet = frxdsItemOrdem
        DataSetName = 'frxDBDatasetItemOrdem'
        Filter = 
          '<frxDBDatasetItemOrdem."ORDEM_ID"> = <frxDBDatasetOrdemServico."' +
          'CODIGO">'
        RowCount = 0
        object frxDBDatasetItemOrdemCODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CODIGO'
          DataSet = frxdsItemOrdem
          DataSetName = 'frxDBDatasetItemOrdem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetItemOrdem."CODIGO"]')
          ParentFont = False
        end
        object frxDBDatasetItemOrdemDESCRICAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DESCRICAO'
          DataSet = frxdsItemOrdem
          DataSetName = 'frxDBDatasetItemOrdem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetItemOrdem."DESCRICAO"]')
          ParentFont = False
        end
        object frxDBDatasetItemOrdemQUANTIDADE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 782.362710000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'QUANTIDADE'
          DataSet = frxdsItemOrdem
          DataSetName = 'frxDBDatasetItemOrdem'
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetItemOrdem."QUANTIDADE"]')
          ParentFont = False
        end
        object frxDBDatasetItemOrdemVALOR_UNITARIO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 895.748610000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'VALOR_UNITARIO'
          DataSet = frxdsItemOrdem
          DataSetName = 'frxDBDatasetItemOrdem'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = 'R$ %2,2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetItemOrdem."VALOR_UNITARIO"]')
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
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000770000000000
          Top = 0.000003830000000010
          Width = 491.338893100000000000
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
            'P'#225'gina: [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338925200000000000
          Top = 0.000014839999999988
          Width = 555.590880210000000000
          Height = 18.897644040000000000
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
            'Data: [Date] [Time]')
          ParentFont = False
        end
      end
    end
  end
  inherited freCSV: TfrxCSVExport
    Left = 592
  end
  inherited digpPrinter: TPrintDialog
    Left = 533
  end
  inherited frePDF: TfrxPDFExport
    Left = 621
  end
  object frxdsOrdemServico: TfrxDBDataset
    UserName = 'frxDBDatasetOrdemServico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=CODIGO'
      'CLIENTE_ID=CLIENTE_ID'
      'CLIENTE=CLIENTE'
      'DATA_ABERTURA=DATA_ABERTURA'
      'DATA_PREVISTA=DATA_PREVISTA'
      'DATA_FECHAMENTO=DATA_FECHAMENTO'
      'STATUS=STATUS'
      'DESCRICAO_PROBLEMA=DESCRICAO_PROBLEMA'
      'VALOR_TOTAL=VALOR_TOTAL')
    BCDToCurrency = False
    DataSetOptions = []
    Left = 653
    Top = 313
  end
  object frxdsItemOrdem: TfrxDBDataset
    UserName = 'frxDBDatasetItemOrdem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=CODIGO'
      'ORDEM_ID=ORDEM_ID'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO')
    BCDToCurrency = False
    DataSetOptions = []
    Left = 685
    Top = 313
  end
end
