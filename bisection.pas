program bisection;

function func(const x: real): real;
begin
    func := x*x - 7*x - 6;
end;

var
    a, b, c: real;

begin
    write('Masukkan tebakan batas awal: ');
    readln(a);
    write('Masukkan tebakan baras akhir: ');
    readln(b);

    if (func(a) * func(b) >= 0) then
        writeln('asumsi a dan b anda salah');

    c := a;
    while ((b-a) >= 0.0000000001) do
        begin
            if func(a)*func(b) < 0 then
                c := (a+b)/2;
            if func(a)*func(c) < 0 then
                b := c
            else
                a := c;
        end;
    write('x = ');
    writeln(c:4:7);
    readln;
end.
