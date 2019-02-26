program euler;

function pangkat(a: real; b: integer): real;
    var
        i: integer;
begin
    pangkat := 1;
    for i := 1 to b do
    begin
        pangkat := pangkat * a;
    end;
end;

function faktorial(n: integer): longint;
begin
    faktorial := 1;
    if n = 0 then
        faktorial := 1
    else
        while n >= 1 do
            begin
                faktorial := faktorial * n;
                n := n - 1;
            end;
end;

function euler(x: real; i: integer): real;
var
    n: integer;
begin
    euler := 0;
    for n:=0 to i do
    begin
        euler := euler + (pangkat(x,n)/faktorial(n));
    end;
end;

begin
    writeln(euler(3, 15));
    readln;
end.
