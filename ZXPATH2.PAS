Program zxpath;
Uses Crt,Dos;
Var
   Arq1                    : file of Byte;
   Arq3                    : text;
   Nome1                   : String;
   Var1,B1,B2              : Byte;
   NN                      : Word;
   pvideo                  : CHAR;
   compr1,       n         : Longint;

Begin
     Clrscr;
     Writeln('ZX-snapshot alterador - 1997');
     writeln('Ricardo L. Gon‡alves (ricleite@montealto.net)');
     Writeln;
     Write('Digite o nome do arquivo :'); readln(nome1);
     Write('Valor (NN):'); readln(nn);
     write('1-Pula mem¢ria de v¡deo:');readln(pvideo);

     B1 := Lo(NN);
     B2 := Hi(NN);
     Assign(Arq3,'zxpath.log');
     rewrite(Arq3);

     Writeln('Abrindo Arquivo: ',nome1,'...');
     Writeln(Arq3,'Abrindo Arquivo: ',nome1,'...');

     Assign( Arq1, Nome1 );
     Reset( Arq1 );
     compr1 := Filesize( Arq1);

     Writeln('Comprimento:',compr1 );
     Writeln(Arq3,'Comprimento:',compr1 );


     Seek( arq1,0 );

     n:=0;
     if pvideo = '1' then begin
       n:= (23295 - 16357);
     end;


     repeat
     Seek(arq1,n);
     read(Arq1,var1);

     If var1 = b1  then begin
        Seek(arq1,n+1);
        read(Arq1,var1);
        if var1 = b2 then begin
           write('Achou n:',n,' m:');
           Writeln( n+16357 );
           write(arq3,'Achou n:',n,' m:');
           Writeln( arq3,n+16357 );
        end;
      end;

     inc( n );
     Until Eof(Arq1);

     Writeln('OK..');
     Writeln(Arq3,'OK..');
     Close(Arq1); Close(Arq3);

End.
