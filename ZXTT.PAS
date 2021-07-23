Program zxtt;
Uses Crt,Dos;
Var
   Arq1,Arq2               : file of Byte;
   Nome1,Nome2             : String;
   I,n                     : longint;
   car                     : byte;


Begin
     Clrscr;
     Writeln('ZX-troca tela - 1997');
     writeln('Ricardo L. Gon‡alves (ricleite@intercanalum.com.br)');
     Writeln;
     Write('Digite o nome do arquivo 1:'); readln(nome1);
     Write('Digite o nome do arquivo 2:'); readln(nome2);

     Writeln('Abrindo Arquivo: ',nome1,'...');

     Assign( Arq1, Nome1 );
     Reset( Arq1 );

     Assign( Arq2, Nome2 );
     Reset( Arq2 );

     for i:=16384 to 23295 do begin
        n:=i-16357;
        Seek(Arq1,n); read(Arq1,car);
        Seek(Arq2,n); write(arq2,car);
     end;
     Close(Arq1); Close(Arq2);

End.
