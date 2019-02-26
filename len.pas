program len;

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

begin
    writeln(len(4,500));
    readln();
end.
