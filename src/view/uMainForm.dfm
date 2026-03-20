object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'TESTE FRANCISCO SANTOS - SKY INFORM'#193'TICA'
  ClientHeight = 442
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = mmMenu
  TextHeight = 15
  object mmMenu: TMainMenu
    Left = 22
    Top = 4
    object mniCadastros: TMenuItem
      Caption = 'Cadastros'
      object mniCadastroClientes: TMenuItem
        Caption = 'Cadastro de Clientes'
        OnClick = mniCadastroClientesClick
      end
      object mniCadastroOrdemServico: TMenuItem
        Caption = 'Cadastro de Ordem de Servi'#231'o'
        OnClick = mniCadastroOrdemServicoClick
      end
    end
    object mniSair: TMenuItem
      Caption = 'Sair'
      OnClick = mniSairClick
    end
  end
end
