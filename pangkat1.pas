program pangkat1;

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

function len(x: real; i: integer): real;
var
    n: integer;
begin
    len := 0;
    for n := 0 to i do
    begin
        len := len + (2/(2*n+1))*pangkat(((x-1)/(x+1)),2*n+1);
    end;
end;

function pangkat1(a, b: real): real;
begin
    pangkat1 := euler(b*len(a,15),15);
end;

begin
    writeln(pangkat1(4,0.5));
    readln;
end.
