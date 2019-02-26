program pangkat;

function pangkat(a, b: integer): integer;
    var
        i: integer;
begin
    pangkat := 1;
    for i := 1 to b do
    begin
        pangkat := pangkat * a;
    end;
end;

begin
    writeln(pangkat(-2,0)); 
    readln();
end.
