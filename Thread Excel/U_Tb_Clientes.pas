unit U_Tb_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrm_Tb_Clientes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Tb_Clientes: TFrm_Tb_Clientes;

implementation

{$R *.dfm}

uses U_Dados;

procedure TFrm_Tb_Clientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(Dados.Query_Clientes.RecNo) then
    if not(gdSelected in State) then
    begin
      DBGrid1.Canvas.Brush.Color := clSkyBlue;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

end.
