Program zxlook;
Uses Crt,Dos;
Var
   Arq1               : file of Byte;
   Nome1              : String;
   nn1                : Byte;
   car                : string[1];
   vv                  : integer;
   compr1,n      : Longint;
   b2,b1        :byte;
   nn           :Word;

Procedure calbyte;
Begin
  b2:=int(nn/256);
  b1:=nn-(256*b2)
End

Begin
   vv:=1;

     Clrscr;
     Writeln('ZX-snapshot alterador - 1997');
     writeln('Ricardo L. Gon�alves (ricleite@montealto.net)');
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

     Writeln('Abrindo Arquivo: ',nome1,'...');
     Assign( Arq1, Nome1 );
     Reset( Arq1 );
     compr1 := Filesize( Arq1);
     Writeln('Comprimento:',compr1 );
     Seek( arq1,n );
     Read(Arq1,nn1);
     Writeln('O valor:',nn1);
     Close(Arq1);


End.

