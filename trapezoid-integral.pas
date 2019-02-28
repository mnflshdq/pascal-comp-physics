program trapezoidintegral;

const
    h = 0.01;

var
    a, b, j, n, intTrap: double;
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
        intTrap := 0;
        while j <= n do
        begin
            intTrap := intTrap + ((h * (func(a+(j*h)) + func(a+((j+1)*h))))/2);
            j := j + 1;
        end;
        writeln(b:space:2, func(b):space:2, intTrap:space:2);
        b := b + 0.01;
    end;

    readln();
end.
