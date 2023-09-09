program Thread_Excel;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {Frm_Principal},
  U_Dados in 'U_Dados.pas' {Dados: TDataModule},
  U_Cad_Clientes in 'U_Cad_Clientes.pas' {Frm_Cad_Clientes},
  U_Tb_Clientes in 'U_Tb_Clientes.pas' {Frm_Tb_Clientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
