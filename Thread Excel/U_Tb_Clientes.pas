unit U_Tb_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrm_Tb_Clientes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    procedure ThreadFim(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Tb_Clientes: TFrm_Tb_Clientes;

implementation

{$R *.dfm}

uses U_Dados, U_Thread_Excel;

procedure TFrm_Tb_Clientes.ThreadFim(Sender: TObject);
begin
 if Assigned(Carrega_Excel(Sender).FatalException) then                 // Verifica de h� erro
  ShowMessage(Exception(Carrega_Excel(Sender).FatalException).Message); // Se haver, exime erro para o usu�rio
end;

procedure TFrm_Tb_Clientes.Button1Click(Sender: TObject);
var
 ThreadExcel : Carrega_Excel; // Busca minha class-thread na 'Unit' U_Thread_Excel
begin

 ThreadExcel := Carrega_Excel.Create(True);
 ThreadExcel.FreeOnTerminate := True;
 ThreadExcel.Resume;

 MessageDlg('Conclu�do! =D', mtInformation, [mbOK], 0);
end;

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
