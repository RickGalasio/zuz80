Program zxset;
Uses Crt,Dos;
Var
   Arq1               : file of Byte;
   Nome1              : String;
   nn1,I             : Byte;
   car                : string[1];
   vv                  : integer;
   compr1,n,ne      : Longint;


Begin
   vv:=1;

     Clrscr;
     Writeln('ZX-snapshot alterador - 1997');
     writeln('Ricardo L. Gon�alves (ricleite@intercanalum.com.br)');
     Writeln;
     if ParamCount < 1 then Begin
        Write('Digite o nome do arquivo :'); readln(nome1);
        Writeln;
        end
     else begin
        nome1 := paramStr(1)
     End;
     if ParamCount < 2 then Begin
        Write('N-n�mero de arquivo M-Posi��o de mem�ria: ');readln(car);
        end
     else begin
        car:=ParamStr(2);
     End;

     If (car='N') or (car='n') then begin

        If ParamCount < 3 then Begin
           Write('Digite a Localiza��o N:');readln(n);
           end
        Else begin
           Val(ParamStr(3),n,vv);
           writeln('Localiza��o N:',n);
        End;
         writeln('n=',n);

        end
     else
        begin
        If ParamCount < 3 then Begin
           Write('Digite a Localiza��o de Mem�ria:');readln(n);
           end
        Else begin
           Val(ParamStr(3),n,vv);
        Writeln('Localiza��o de Mem�ria:',n);
        End;
        n:=n-16357;
        writeln('m=',n);
     end;
     Writeln;
     If ParamCount < 4 then Begin
        Write('Digite o novo valor:'); readln(nn1);
        Writeln;
        End
     Else Begin
           Val(ParamStr(4),nn1,vv);
           writeln('Valor setado:',nn1);

     End;
     If ParamCount < 5 Then Begin
        Write('Digite o n. de enderecos'); readln(ne);
        end
     Else Begin
           Val(ParamStr(5),ne,vv);
           writeln('Ends:',ne);

     End;


     Writeln('Abrindo Arquivo: ',nome1,'...');
     Assign( Arq1, Nome1 );
     Reset( Arq1 );
     compr1 := Filesize( Arq1);
     Writeln('Comprimento:',compr1 );
     For I:=n to n+ne-1 do begin
       Seek( arq1,I );
       Write(Arq1,nn1);
       Writeln('N=',I,' M=',I+16357,' <= ',nn1);
     end;
     Writeln('Setado OK..');
     Close(Arq1);


End.
