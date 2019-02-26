program gccd;

function gcd(a,b: integer): integer;
begin
    if a < b then
        gcd := gcd(b,a)
    else
        if (a>b) and (b<>0) then
            gcd := gcd(b, a mod b)
        else
            if (a>b) and (b=0) then
                gcd := a;
end;

var
    banyak_data_perhitungan, hasil: array[0..100] of longint;
    a: array[0..100, 0..100] of longint;
    i, j, k, banyak_perhitungan, hasil_temp: integer;

begin
    write('Banyak perhitungan: ');
    readln(banyak_perhitungan);
    for i := 0 to banyak_perhitungan-1 do
    begin
        writeln();
        write('Banyak data perhitungan ke-', i+1, ': ');
        readln(banyak_data_perhitungan[i]);
        writeln('Masukkan data perhitungan ke-', i+1, ': ');
        for j := 0 to banyak_data_perhitungan[i]-1 do
        begin
            read(a[i,j]);
        end;
    end;

    for i := 0 to banyak_perhitungan-1 do
    begin
        hasil_temp := 0;
        hasil[i] := 0;
        for j := 0 to banyak_data_perhitungan[i]-1 do
        begin
            for k := j+1 to banyak_data_perhitungan[i]-1 do
            begin
                hasil_temp := gcd(a[i,j],a[i,k]);
                if hasil[i] <= hasil_temp then
                    hasil[i] := hasil_temp;
                //write('a[', i, ',', j, ']= ');
                //write(a[i,j]);
                //write(' a[', i, ',', k, ']= ');
                //write(a[i,k]);
                //write(' FEB= ');
                //writeln(gcd(a[i,j],a[i,k]));
            end;
        end;
    end;

    writeln();
    for i := 0 to banyak_perhitungan-1 do
    begin
        writeln('GGCD dari perhitungan ke-', i+1, '= ', hasil[i]);
    end;

    readln();
    readln();
end.
