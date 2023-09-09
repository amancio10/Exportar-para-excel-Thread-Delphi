unit U_Thread_Excel;

interface

uses
  System.Classes, comobj;

type
  Carrega_Excel = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses U_Dados, U_Tb_Clientes;

procedure Carrega_Excel.Execute;
 var
  PLANILHA: Variant;
  LINHA,CONT: Integer;
begin

 CONT := Dados.Query_Clientes.RecordCount;

 TThread.Synchronize(nil, // Uso do Synchronize pôr usar a interface
   procedure
    begin
     Frm_Tb_Clientes.ProgressBar1.Max      := CONT;
     Frm_Tb_Clientes.ProgressBar1.Position := 0;
    end);

 Dados.Query_Clientes.Filtered         := False;
 LINHA:=2;

 PLANILHA:=CreateOleObject('Excel.Application');
 PLANILHA.caption:='';
 PLANILHA.visible:=false;
 PLANILHA.workbooks.add(1);

 PLANILHA.cells[1,1] := 'ID';
 PLANILHA.cells[1,2] := 'NOME';
 PLANILHA.cells[1,3] := 'TELEFONE';
 PLANILHA.cells[1,4] := 'ENDERECO';

  Dados.Query_Clientes.First;
  Dados.Query_Clientes.DisableControls;

  try
    while not Dados.Query_Clientes.Eof do
    begin
      PLANILHA.cells[LINHA, 1] := Dados.Query_Clientes.FieldByName('ID').AsString;
      PLANILHA.cells[LINHA, 2] := Dados.Query_Clientes.FieldByName('NOME').AsString;
      PLANILHA.cells[LINHA, 3] := Dados.Query_Clientes.FieldByName('TELEFONE').AsString;
      PLANILHA.cells[LINHA, 4] := Dados.Query_Clientes.FieldByName('ENDERECO').AsString;

      LINHA := LINHA + 1;
      Dados.Query_Clientes.Next;

      TThread.Synchronize(nil, // Uso do Synchronize pôr usar a interface
       procedure
        begin
          Frm_Tb_Clientes.ProgressBar1.Position := Frm_Tb_Clientes.ProgressBar1.Position + 1;
        end);

    end;
    PLANILHA.columns.autofit;
    PLANILHA.visible := true;
  finally
    Dados.Query_Clientes.EnableControls;
    PLANILHA.Quit;
 //   PLANILHA := Unassigned;

      TThread.Synchronize(nil, // Uso do Synchronize pôr usar a interface
       procedure
        begin
         Frm_Tb_Clientes.ProgressBar1.Position := 0;
       end);
  end;

end;

end.
