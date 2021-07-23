Program zxLD;
Uses Crt,Dos;
Var
    Arqe        : File Of Byte;
    Arqs        : Text;
    Nome1       : string;
    I,IX        : LongInt;
    car,B1,B2   : Byte;
    NouM        : String;


Begin
     Clrscr;
     Writeln('ZX-LD alterador - 1998 V 0.1');
     writeln('Ricardo L. Gon‡alves (ricleite@intercanalum.com.br)');
     Writeln;
     Write('Digite o nome do arquivo :'); readln(nome1);

     Write('N-n£mero de arquivo M-Posi‡Æo de mem¢ria : '); readln(NouM);
     If (NouM='N') or (NouM='n') then begin
         Write('Digite a Localiza‡Æo N:');readln(IX);
         IX:=IX+16357;
         writeln('m=',IX);
         writeln('n=',IX-16357);

        end
     else
        begin
           Write('Digite a Localiza‡Æo de Mem¢ria:');readln(IX);
           writeln('m=',IX);
           writeln('n=',IX-15357);
     end;
     B1 := Lo(IX);
     B2 := Hi(IX);


     Assign(Arqe,Nome1);
     Reset(Arqe);

     Assign(Arqs,'ON.BAT');
     ReWrite(Arqs);
     I:=0;

     Writeln(Arqs,'REM ZX-LD alterador - 1998 V 0.1');
     writeln(Arqs,'REM Ricardo L. Gon‡alves (ricleite@intercanalum.com.br)');
     Writeln(Arqs,'');


     Repeat
       Seek(Arqe,I);
       Read(Arqe,car);
       if car = $32 then begin
         Seek(Arqe,I+1);
         Read(Arqe,car);
         If car = B1 then begin
           Seek(Arqe,I+2);
           Read(Arqe,car);
             If car = B2 then begin
              Writeln( Arqs,'REM ',I,': LD (',IX,'),A : 32 ',B1,'d ',B2,'d' );
              Writeln(Arqs,'zxsetn ',nome1,' N ',I,' 0 3');
             End;
         End;
       End;
       Inc(I);
     Until Eof(Arqe);
     Writeln(Arqs,'rem EOF -- UFA!!');


End.
