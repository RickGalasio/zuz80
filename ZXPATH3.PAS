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

Procedure traduz;
var VARZ : BYTE;
Begin
        Seek(arq1,n-1);
        read(Arq1,var1);
        Case var1 of
         $01 : Writeln( Arq3,n-1,'|2 >: LD BC,',NN,'                ; 01 ',B1,' ',B2 );
         $11 : Writeln( Arq3,n-1,'|2 >: LD DE,',nn,'                ; 11 ',B1,' ',B2 );

         $21 : Begin
          if n >= 3 then begin
             Seek(arq1,n-2);
             read(Arq1,Varz);
             Case Varz of
                $DD: Writeln( Arq3,n-2,'|2 >: LD IX,',nn,'                ; DD 21 ',B1,' ',B2 );
                $FD: Writeln( Arq3,n-2,'|2 >: LD IY,',nn,'                ; FD 21 ',B1,' ',B2 );
                else Writeln( Arq3,n-2,'|2 >: LD HL,',nn,'                ; 21 ',B1,' ',B2 );
             end; { case }
          end
          Else Begin
              Writeln( n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;
         END;
        

         $22 : Begin
          if n >= 3 then begin
              Seek(arq1,n-2);
              read(Arq1,Varz);
              Case Varz of
               $DD: Writeln( Arq3,n-2,'|2 >: LD (',nn,'),IX              ; DD 22 ',B1,' ',B2 );
               $FD: Writeln( Arq3,n-2,'|2 >: LD (',nn,'),IY              ; FD 22 ',B1,' ',B2 );
               else Writeln( Arq3,n-2,'|2 >: LD (',nn,'),HL              ; 22 ',B1,' ',B2 );
              end;{ case }
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $2A : Begin
          if n >= 3 then begin
             Seek(arq1,n-2);
             read(Arq1,Varz);
             Case Varz of
               $DD: Writeln( Arq3,n-2,'|2 >: LD IX,(',nn,')              ; DD 2A ',B1,' ',B2 );
               $FD: Writeln( Arq3,n-2,'|2 >: LD IY,(',nn,')              ; FD 2A ',B1,' ',B2 );
               else Writeln( Arq3,n-2,'|2 >: LD HL,(',nn,')              ; 2A ',B1,' ',B2 );
             end; { case }
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $31 : Writeln( Arq3,n-1,'|2 >: LD SP,',nn,'                ; 31 ',B1,' ',B2 );

         $32 : Writeln( Arq3,n-1,'|3 >: LD (',nn,'),A               ; 32 ',B1,' ',B2 );

         $3A : Writeln( Arq3,n-1,'|3 >: LD A,(',nn,')               ; 3A ',B1,' ',B2 );

         $C4 : Writeln( Arq3,n-1,'|1 >: CALL NZ,',nn,'              ; C4 ',B1,' ',B2 );

         $CC : Writeln( Arq3,n-1,'|1 >: CALL Z,',nn,'               ; CC ',B1,' ',B2 );

         $CD : Writeln( Arq3,n-1,'|1 >: CALL ',nn,'                 ; CD ',B1,' ',B2 );

         $D4 : Writeln( Arq3,n-1,'|1 >: CALL NC,',nn,'              ; D4 ',B1,' ',B2 );

         $DC : Writeln( Arq3,n-1,'|1 >: CALL C,',nn,'               ; DC ',B1,' ',B2 );

         $E4 : Writeln( Arq3,n-1,'|1 >: CALL PO,',nn,'              ; E4 ',B1,' ',B2 );

         $EC : Writeln( Arq3,n-1,'|1 >: CALL PE,',nn,'              ; EC ',B1,' ',B2 );

         $43 : Begin
          if n >= 3 then begin
             Seek(arq1,n-2);
             read(Arq1,Varz);
             IF Varz = $ED THEN
               Writeln( Arq3,n-2,'|2 >: LD (',nn,'),BC              ; ED 43 ',B1,' ',B2 )
             else
               Writeln( n-2,'|0 >: ',var1,'d ',B1,' ',B2 );
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $4B : Begin
          if n >= 3 then begin
             Seek(arq1,n-2);
             read(Arq1,Varz);
             IF VARZ = $ED THEN
              Writeln( Arq3,n-2,'|2 >: LD BC,(',nn,')              ; ED 4B ',B1,' ',B2 )
             else
              Writeln( n-2,'|0 >: ',var1,'d ',B1,' ',B2 );
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $53 : Begin
          if n >= 3 then begin
             Seek(arq1,n-2);
             read(Arq1,Varz);
             IF VARZ = $ED THEN
              Writeln( Arq3,n-2,'|2 >: LD (',nn,'),DE              ; ED 53 ',B1,' ',B2 )
             else
              Writeln( n-2,'|0 >: ',var1,'d ',B1,' ',B2 );
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $5B : Begin
          if n >= 3 then begin
              Seek(arq1,n-2);
              read(Arq1,Varz);
              IF VARZ = $ED Then
               Writeln( Arq3,n-2,'|2 >: LD DE,(',nn,')              ; ED 5B ',B1,' ',B2 )
              else
               Writeln( n-2,'|0 >: ',var1,'d ',B1,' ',B2 );
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $73 : Begin
          if n >= 3 then begin
             Seek(arq1,n-2);
             read(Arq1,Varz);
             IF VARZ = $ED Then
               Writeln( Arq3,n-2,'|2 >: LD (',nn,'),SP              ; ED 73 ',B1,' ',B2 )
             else
               Writeln( n-2,'|0 >: ',var1,'d ',B1,' ',B2 );
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $7B : Begin
          if n >= 3 then begin
              Seek(arq1,n-2);
              read(Arq1,Varz);
              IF VARZ = $ED Then
               Writeln( Arq3,n-2,'|2 >: LD SP,(',nn,')              ; ED 7B ',B1,' ',B2 )
              else
               Writeln( n-2,'|0 >: ',var1,'d ',B1,' ',B2 );
          end
          Else Begin
              Writeln( Arq3,n-1,'|Err >: ',var1,'d ',B1,' ',B2 );
          End;

         END;

         $F4: Writeln( Arq3,n-1,'|1 >: CALL P,',nn,'               ; F4 ',B1,' ',B2 );
         $FC: Writeln( Arq3,n-1,'|1 >: CALL M,',nn,'               ; FC ',B1,' ',B2 );
         else Writeln( Arq3,n-1,'|0 >: ',var1,'d ',B1,' ',B2 );
        end; { Case Principal }
End;

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
           traduz;
        end;

      end;
     Seek(arq1,n);
     inc( n );
     Until Eof(Arq1);

     Writeln('OK..');
     Writeln(Arq3,'OK..');
     Close(Arq1); Close(Arq3);

End.

