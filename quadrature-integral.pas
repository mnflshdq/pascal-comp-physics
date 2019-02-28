program quadratureintegral;

uses math;

const
    h = 0.00001;

var
    a, b, j, n, intQuad: double;
    space : integer;

function func(x : double) : double;
begin
    func := x*x;
end;

begin
    space := 7;
    a := 0;

    writeln('x':space, 'f(x)':space, 'int f(x)':space);

    b := 0;
    while b <= 10 do
    begin
        n := (b-a) / h;
        //writeln(n:3:2);
        j := 0;
        intQuad := 0;
        while j <= n do
        begin
            intQuad := intQuad + (h * func(a+(((2*j-1)*h)/2)));
            j := j + 1;
        end;
        writeln(b:space:2, func(b):space:2, intQuad:space:2);
        b := b + 0.01;
    end;

    readln();
end.
