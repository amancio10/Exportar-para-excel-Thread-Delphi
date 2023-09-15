# Exportar-para-excel-Thread-Delphi
 Exportando tabela para excel usando thread com Delphi

* ### Botão para abrir um novo Form
 ```delphi
  TThread.CreateAnonymousThread(
  procedure
   begin
    try
     TThread.Synchronize(nil, // Thread para abrir o form cadastro de clientes
     procedure
     begin
       Application.CreateForm(TFrm_Cad_Clientes, Frm_Cad_Clientes); // Cria o form
     end);
     // Carregue suas ações aqui, antes de mostrar o form
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
```

* ### Botão para chamar a Thread
```delphi
var
 ThreadExcel : Carrega_Excel; // Busca minha class-thread na 'Unit' U_Thread_Excel
begin
 ThreadExcel := Carrega_Excel.Create(True);
 ThreadExcel.FreeOnTerminate := True;
 ThreadExcel.Resume;

 MessageDlg('Concluído! =D', mtInformation, [mbOK], 0);
```

* ### Uses na Thread
```delphi
uses
  Comobj;
```

* ### Procedure na Thread
```delphi
procedure Carrega_Excel.Execute;
 var
  PLANILHA    : Variant;
  LINHA, CONT : Integer;
begin

 CONT := Dados.Query_Clientes.RecordCount;

 TThread.Synchronize(nil, // Uso do Synchronize por usar a interface
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

      TThread.Synchronize(nil, // Uso do Synchronize pôr usar a interface
       procedure
        begin
         Frm_Tb_Clientes.ProgressBar1.Position := 0;
       end);
  end;

   OnTerminate := Frm_Tb_Clientes.ThreadFim; // Execulta meu tratamento de erros
end;
```

* ### Tratamento de erros
```delphi
procedure TFrm_Tb_Clientes.ThreadFim(Sender: TObject);
begin
 if Assigned(Carrega_Excel(Sender).FatalException) then                 // Verifica de há erro
  ShowMessage(Exception(Carrega_Excel(Sender).FatalException).Message); // Se haver, exime erro para o usuário
end;
```
