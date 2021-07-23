Program zxbat;
Uses Crt,Dos;
Var
   Arq1,Arq2               : file of Byte;
   Arq3,Arq4               : text;
   Nome1,Nome2             : String;
   Var1,Var2               : Byte;
   compr1,compr2,n         : Longint;
   vv                      : Integer;


Begin
     vv:=1;
     Clrscr;
     Writeln('ZX-snapshot alterador - 1997');
     writeln('Ricardo L. Gon‡alves (ricleite@montealto.net)');
     Writeln;
{     if ParamCount then begin}
       Write('Digite o nome do arquivo 1:'); readln(nome1);
       Write('Digite o nome do arquivo 2:'); readln(nome2);
{       end;} 
{     else  begin
           Val(ParamStr(1),nome1,vv);
           writeln( Nome1 );

           Val(ParamStr(2),nome2,vv);
           writeln( Nome2 );}
{     end;}
     Assign(Arq3,'on.bat');
     rewrite(Arq3);

     Assign(Arq4,'off.bat');
     rewrite(Arq4);

     Writeln('Abrindo Arquivo: ',nome1,'...');

     Assign( Arq1, Nome1 );
     Reset( Arq1 );
     compr1 := Filesize( Arq1);

     Writeln('rem Comprimento:',compr1 );
     Writeln(Arq3,'rem Comprimento:',compr1 );


     Seek( arq1,0 );


     Writeln('rem Abrindo Arquivo: ',Nome2,'...');
     Writeln(Arq3,'rem Abrindo Arquivo: ',Nome2,'...');


     Assign( Arq2, Nome2 );
     reset( Arq2 );
     compr2 := Filesize( Arq2 );

     Writeln('rem Comprimento:',compr2 );
     Writeln(Arq3,'rem Comprimento:',compr2 );
     Seek( arq2,0 );
     n:=0;
     repeat

     Seek(arq1,n); read(Arq1,var1);
     Seek(arq2,n); read(Arq2,var2);

     If (var1 <> var2) then begin

        Write('N: ',n);
        Writeln(' | mem:',n+16357);
        Writeln( 'Arqivo 1: ',Var1 );
        Writeln( 'Arqivo 2: ',Var2 );

        Write(Arq3,'zxset ',nome2,' N ',n);
        Writeln(Arq3, ' ',Var1 );

        Write(Arq4,'zxset ',nome2,' N ',n);
        Writeln(Arq4, ' ',Var2 );

     End;

     inc( n );
     Until Eof(Arq1) and Eof(Arq2);
     Writeln('OK..');
     Writeln(Arq3,'rem Ok.');
     Writeln(Arq4,'rem Ok.');

     Close(Arq1); Close(Arq2); Close(Arq3); Close(Arq4)

End.
