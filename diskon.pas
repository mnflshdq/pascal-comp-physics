program diskon;

var
    s: array[0..100, 0..100] of char;
    c: array[0..100, 0..100] of integer;
    barang: array[0..100] of integer;
    i, j, k, belanja, disc: integer;
begin
    disc := 0;
    write('Banyak belanja: ');
    readln(belanja);
    for i := 0 to belanja-1 do
    begin
        writeln();
        write('Banyak barang belanjaan ke ', i+1, ': ');
        readln(barang[i]);
        for j := 0 to barang[i]-1 do
        begin
            write('Belanja ke ', i+1, ' barang ke ', j+1, ': ');
            read(s[i,j]);
            readln(c[i,j]);
        end;
    end;

    for k := 0 to belanja-1 do
    begin
        for i := 0 to barang[k]-1 do
        begin
            for j := i+1 to barang[k]-1 do
            begin
                if (s[k,i] <> '0') and (c[k,i] <> 0) then
                begin
                    if (s[k,i] = s[k,j]) and (c[k,i] = c[k,j]) then
                    begin
                        disc := disc + 10;
                        //writeln(i,' ', j);
                        //writeln(s[k,i], ' ', s[k,j]);
                        //writeln(c[k,i], ' ', c[k,j]);
                        s[k,i] := '0';
                        c[k,i] := 0;
                        s[k,j] := '0';
                        c[k,j] := 0;
                    end;
                end;
            end;
        end;
        writeln('Diskon= ', disc);
        disc := 0;
    end;

    readln();
end.
