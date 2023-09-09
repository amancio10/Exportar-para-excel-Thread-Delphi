object Frm_Cad_Clientes: TFrm_Cad_Clientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 169
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 18
    Width = 11
    Height = 15
    Caption = 'ID'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 70
    Top = 18
    Width = 33
    Height = 15
    Caption = 'Nome'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 350
    Top = 18
    Width = 44
    Height = 15
    Caption = 'Telefone'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 16
    Top = 66
    Width = 49
    Height = 15
    Caption = 'Endere'#231'o'
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 34
    Width = 50
    Height = 23
    CharCase = ecUpperCase
    DataField = 'ID'
    DataSource = Dados.Source_Clientes
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 70
    Top = 34
    Width = 275
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = Dados.Source_Clientes
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 350
    Top = 34
    Width = 100
    Height = 23
    CharCase = ecUpperCase
    DataField = 'TELEFONE'
    DataSource = Dados.Source_Clientes
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 16
    Top = 82
    Width = 434
    Height = 23
    CharCase = ecUpperCase
    DataField = 'ENDERECO'
    DataSource = Dados.Source_Clientes
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 19
    Top = 121
    Width = 430
    Height = 33
    DataSource = Dados.Source_Clientes
    TabOrder = 4
  end
end
