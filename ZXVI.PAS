Program zxvi;
Uses Crt,Dos;
Var
   Arq1               : file of Byte;
   Arq2               : Text;
    ca                : Byte;
    Nome1             : String;

Begin
     Clrscr;
     Writeln('ZXVI Visualiza Registros em um SnapShot - V0.1 - 1998');
     writeln('Ricardo L. Gon‡alves (ricleite@montealto.net)');
     Writeln;
     if ParamCount < 1 then Begin
        Write('Digite o nome do arquivo :'); readln(nome1);
        Writeln;
        end
     else begin
        nome1 := paramStr(1)
     End;

     Writeln('Abrindo Arquivo: ',nome1,'...');
     Assign( Arq1, Nome1 );
     Reset( Arq1 );

     Assign(Arq2,'ZXVI.LOG');
     Rewrite(Arq2);
     Seek( Arq1,0 );

     Read( arq1,ca ); Writeln(ca:3,': I   register');
     Read( arq1,ca ); Writeln(ca:3,': L'' register');
     Read( arq1,ca ); Writeln(ca:3,': H'' register');
     Read( arq1,ca ); Writeln(ca:3,': E'' register');
     Read( arq1,ca ); Writeln(ca:3,': D'' register');
     Read( arq1,ca ); Writeln(ca:3,': C'' register');
     Read( arq1,ca ); Writeln(ca:3,': B'' register');
     Read( arq1,ca ); Writeln(ca:3,': F'' register');
     Read( arq1,ca ); Writeln(ca:3,': A'' register');
     Read( arq1,ca ); Writeln(ca:3,': L  register');
     Read( arq1,ca ); Writeln(ca:3,': H  register');
     Read( arq1,ca ); Writeln(ca:3,': E  register');
     Read( arq1,ca ); Writeln(ca:3,': D  register');
     Read( arq1,ca ); Writeln(ca:3,': C  register');
     Read( arq1,ca ); Writeln(ca:3,': B  register');
     Read( arq1,ca ); Writeln(ca:3,': IY low register');
     Read( arq1,ca ); Writeln(ca:3,': IY high register');
     Read( arq1,ca ); Writeln(ca:3,': IX low register');
     Read( arq1,ca ); Writeln(ca:3,': IX high register');
     Read( arq1,ca ); Writeln(ca:3,': bit 2 contains iff2');
     Read( arq1,ca ); Writeln(ca:3,': R register');
     Read( arq1,ca ); Writeln(ca:3,': FLAGS register');
     Read( arq1,ca ); Writeln(ca:3,': A acumulator register');
     Read( arq1,ca ); Writeln(ca:3,': SP low register');
     Read( arq1,ca ); Writeln(ca:3,': SP high register');
     Read( arq1,ca ); Writeln(ca:3,': interrupt mode (0, 1 or 2)');
     Read( arq1,ca ); Writeln(ca:3,': Border colour (0..7).');

     Seek( Arq1,0 );

     Writeln( Arq2,'ZXVI Visualiza Registros em um SnapShot - V0.1 - 1998');
     writeln( Arq2,'Ricardo L. Gon‡alves (ricleite@montealto.net)');
     Writeln( Arq2,'');
     Writeln( Arq2,'File: ',Nome1);
     Writeln( Arq2,'');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': I   register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': L'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': H'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': E'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': D'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': C'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': B'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': F'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': A'' register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': L  register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': H  register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': E  register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': D  register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': C  register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': B  register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': IY low register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': IY high register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': IX low register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': IX high register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': bit 2 contains iff2');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': R register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': FLAGS register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': A acumulator register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': SP low register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': SP high register');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': interrupt mode (0, 1 or 2)');
     Read( arq1,ca ); Writeln( Arq2,ca:3,': Border colour (0..7).');
     Writeln(Arq2,'EOF -- UFFA!!');
 
     Close( Arq1 ); Close( Arq2 );
End.
