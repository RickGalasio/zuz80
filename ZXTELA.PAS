Program zxtela;

Uses Crt,
     Graph,
     dos;

Var Gra,Dri             : Integer;
  a                     : char;
  Hor,xend,Xind         : longint;
  car                   : byte;
  Arqe                  : File of byte;
  Xplo,Yplo             : Integer;
  xcol                  : Byte;
  part                  : Byte;

Procedure Mbyte(zend:longint);
var lin : LongInt;
begin
        for lin:=1 to 8 do begin
              Seek(Arqe, zend);
              Read(Arqe,car );
              if (car AND 128)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 064)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 032)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 016)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 008)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 004)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 002)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Xplo:=Xplo+2;
              if (car AND 001)<>0 then Bar(Xplo,Yplo,Xplo+1,Yplo+1);
              Yplo:=Yplo+2;
              Xplo:=Xplo-14;

              zend:=zend+256;
        end; { While }

End;

Begin
  gra:=9; Dri:=2;
  hor:=0;
  Xplo:=0; Yplo:=0;
  Xcol:=0;
  InitGraph(Gra,Dri,'');
  SetFillStyle(1,15);
  Assign(Arqe,'saida.sna');
  reset(Arqe);

  xend:=27;  { 16384-16357 - Inicio da memoria de video }
  Seek(Arqe,Xend);
      Xind:=Xend;
      For part:=0 to 2 do begin
          Xind:=Xend;

             For Hor:=0 to 255 do begin
                mbyte(xind);
                Inc(xind);
                inc(xcol);

                if xcol = 32 then begin
                   xcol:=0;
                   Xplo:=Xplo-(496);
                   Yplo:=Yplo-2;
                   end
                Else begin
                   Xplo:=Xplo+16;
                   Yplo:=Yplo-16;
                end;
             end; {For HOR}

          Xend:=Xend+2048;
      end; {FOR PART}
     a:=readkey;
  CloseGraph;
end.

