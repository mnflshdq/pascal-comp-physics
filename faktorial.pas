program faktorial;

function faktorial(n: integer): integer;
var
    i: integer;
begin
    faktorial := 1;
    if n = 0 then
        faktorial := 1
    else
        for i := 1 to n do
            begin
                faktorial := faktorial * i;
            end;
end;

var
    a: integer;
begin
    write('Masukkan angka untuk difaktorialkan: ');
    readln(a);
    write(a);
    write('! = ');
    writeln(faktorial(a));
    readln;
end.
