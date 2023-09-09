unit U_Dados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDados = class(TDataModule)
    ADOConnection1: TADOConnection;
    Query_Clientes: TADOQuery;
    Source_Clientes: TDataSource;
    Query_ClientesID: TAutoIncField;
    Query_ClientesNOME: TWideStringField;
    Query_ClientesTELEFONE: TWideStringField;
    Query_ClientesENDERECO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
