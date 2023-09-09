unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFrm_Principal = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses U_Tb_Clientes, U_Cad_Clientes, U_Dados;

procedure TFrm_Principal.Button1Click(Sender: TObject);
begin
 TThread.CreateAnonymousThread(
  procedure
   begin

    try
     // Thread para abrir o form cadastro de clientes

     TThread.Synchronize(nil,
     procedure
     begin
       Application.CreateForm(TFrm_Cad_Clientes, Frm_Cad_Clientes); // Cria o form
     end);

     // Carregue suas ações aqui (Ex: Querys), antes de mostrar o form
     Dados.Query_Clientes.Close;
     Dados.Query_Clientes.SQL.Clear;
     Dados.Query_Clientes.SQL.Add('Select * From Clientes');
     Dados.Query_Clientes.Open;

     TThread.Synchronize(nil,
     procedure
     begin
       Frm_Cad_Clientes.ShowModal; //Mostra o form
     end);

    finally

      TThread.Synchronize(nil,
      Procedure
      begin
       Frm_Cad_Clientes.Free; // Limpa o form da memoria
      End);

    end;

   end).Start;
end;

procedure TFrm_Principal.Button2Click(Sender: TObject);
begin
 TThread.CreateAnonymousThread(
 procedure
 begin

   try
     // Thread para abrir o form tabela de clientes
     TThread.Synchronize(nil,
     procedure
     begin
       Application.CreateForm(TFrm_Tb_Clientes, Frm_Tb_Clientes); // Cria o form
     end);

     // Carregue suas ações aqui, antes de mostrar o form


     TThread.Synchronize(nil,
     procedure
     begin
       Frm_Tb_Clientes.ShowModal; // Mostra o form
     end);


   finally

    TThread.Synchronize(nil,
    procedure
    begin
      Frm_Tb_Clientes.Free; // Limpa o form da memoria
    end);
   end;

 end).Start;
end;

end.
