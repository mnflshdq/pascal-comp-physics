program tugas3;

var
    banyak_data_perhitungan, baris: array[0..100] of longint;
    a: array[0..100, 0..100] of longint;
    b, i, j, k, banyak_perhitungan, temp: integer;

begin
    write('Banyak perhitungan: ');
    readln(banyak_perhitungan);
    for i := 0 to banyak_perhitungan-1 do
    begin
        writeln();
        write('Banyak data perhitungan ke-', i+1, ': ');
        readln(banyak_data_perhitungan[i]);
        write('Banyak baris print: ');
        readln(baris[i]);
        writeln('Masukkan data perhitungan ke-', i+1, ': ');
        for j := 0 to banyak_data_perhitungan[i]-1 do
        begin
            read(a[i,j]);
        end;
    end;

    for i := 0 to banyak_perhitungan-1 do
    begin
        temp := 0;
        for j := 0 to banyak_data_perhitungan[i]-1 do
        begin
            temp := 0;
            for k := j+1 to banyak_data_perhitungan[i]-1 do
            begin
                if a[i,k] <= a[i,j] then
                begin
                    temp := a[i,k];
                    a[i,k] := a[i,j];
                    a[i,j] := temp;
                end;
            end;
        end;
    end;

    //for i := 0 to banyak_perhitungan-1 do
    //begin
    //    for j := 0 to banyak_data_perhitungan[i]-1 do
    //    begin
    //        write(a[i,j],' ');
    //    end;
    //    writeln();
    //end;

    for i := 0 to banyak_perhitungan-1 do
    begin
        writeln();
        writeln('Perhitungan ke-', i+1);
        for b := 0 to baris[i]-1 do
        begin
            j := b;
            while j <= banyak_data_perhitungan[i]-1 do
            begin
                write(a[i,j],' ');
                j := j + baris[i];
            end;
            writeln();
        end;
    end;

    readln();
    readln();

end.
