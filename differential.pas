program differential;

uses math;

const
    h = 0.01;

var
    x, diffForw, diffBack, diffMid : double;
    space : integer;

function func(a : double) : double;
begin
    func := sin(a) - a;
end;

begin
    space := 9;
    x := 0;

    writeln('x':space, 'f(x)':space, 'f''(x)F':space, 'f''(x)B':space, 'f''(x)M':space);
    writeln('----------------------------------------------------------------------');

    while x <= 10 do
    begin
        diffForw := (func(x+h) - func(x))/h;
        diffBack := (func(x) - func(x-h))/h;
        diffMid := (func(x+h) - func(x-h))/(2*h);
        writeln(x:space:2, func(x):space:2, diffForw:space:2, diffBack:space:2, diffMid:space:2);
        x := x + 0.01;
    end;

    readln();

end.
