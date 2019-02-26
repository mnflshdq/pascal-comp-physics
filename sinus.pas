program sinus;

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

function sinus(x: real; i: integer): real;
var
    n: integer;
begin
    sinus := 0;
    for n:=0 to i do
    begin
        sinus := sinus + (pangkat(-1,n)*pangkat(x,(2*n+1)))/faktorial(2*n+1);
        //writeln(sinus);
    end;
end;

begin
    writeln(sinus(Pi/6, 7));
    readln;
end.
