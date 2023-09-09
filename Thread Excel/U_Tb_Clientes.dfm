object Frm_Tb_Clientes: TFrm_Tb_Clientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 304
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 652
    object Button1: TButton
      Left = 8
      Top = 11
      Width = 121
      Height = 41
      Caption = 'Exportar'
      Style = bsCommandLink
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 656
    Height = 222
    Align = alClient
    DataSource = Dados.Source_Clientes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
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
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 200
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 287
    Width = 656
    Height = 17
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 256
    ExplicitTop = 160
    ExplicitWidth = 150
  end
end
