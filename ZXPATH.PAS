Program zxpath;
Uses Crt,Dos;
Var
   Arq1,Arq2               : file of Byte;
   Arq3                    : text;
   Nome1,Nome2             : String;
   Var1,Var2,nn1,nn2       : Byte;
   Difer,pvideo            : CHAR;
   compr1,compr2,n         : Longint;


1Begin
     Clrscr;
     Writeln('ZX-snapshot alterador - 1997');
     writeln('Ricardo L. Gon‡alves (ricleite@intercanalum.com.br)');
     Writeln;
     Write('Digite o nome do arquivo 1:'); readln(nome1);
     Write('Digite o nome do arquivo 2:'); readln(nome2);
     Write('Valor 1:'); readln(nn1);
     Write('Valor 2:'); readln(nn2);
     Write('1-aparece todas as diferen‡as:');readln(Difer);
     write('1-Pula mem¢ria de v¡deo:');readln(pvideo);

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


     Writeln('Abrindo Arquivo: ',Nome2,'...');
     Writeln(Arq3,'Abrindo Arquivo: ',Nome2,'...');


     Assign( Arq2, Nome2 );
     reset( Arq2 );
     compr2 := Filesize( Arq2 );

     Writeln('Comprimento:',compr2 );
     Writeln(Arq3,'Comprimento:',compr2 );
     Seek( arq2,0 );
     n:=0;
     if pvideo = '1' then begin
       n:= (23295 - 16357);
     end;
     repeat


     Seek(arq1,n); read(Arq1,var1);
     Seek(arq2,n); read(Arq2,var2);

     If (var1 <> var2) and (DIFER = '1') then begin

        Write('N: ',n);
        Writeln(' | mem:',n+16357);
        Writeln( 'Arqivo 1: ',Var1 );
        Writeln( 'Arqivo 2: ',Var2 );

        Write(Arq3,'N: ',n);
        Writeln(Arq3,' | mem:',n+16357);
        Writeln(Arq3, 'Arqivo 1: ',Var1 );
        Writeln(Arq3, 'Arqivo 2: ',Var2 );

     End;

     If (var1 = nn1) and (var2 = nn2) then begin

        Writeln('ACHADO!:');
        Write('N: ',n);
        Writeln(' | mem:',n+16357);
        Writeln( 'Arqivo 1: ',Var1 );
        Writeln( 'Arqivo 2: ',Var2 );

        Writeln(Arq3,'ACHADO!:');
        Write(Arq3,'N: ',n);
        Writeln(Arq3,' | mem:',n+16357);
        Writeln(Arq3, 'Arqivo 1: ',Var1 );
        Writeln(Arq3, 'Arqivo 2: ',Var2 );

     End;
     inc( n );
     Until Eof(Arq1) and Eof(Arq2);
     Writeln('OK..');
     Writeln(Arq3,'OK..');
     Close(Arq1); Close(Arq2); Close(Arq3);

End.