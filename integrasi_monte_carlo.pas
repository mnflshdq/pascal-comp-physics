program integrasi_monte_carlo;

function f(a:real):real;
begin
	f := a*a;
end;

var
m,n,i: longint;
a,b,x,integral: real;

begin
	n := 100000;
	m := round(n/10);
	a := 0;
	b := 10;
	integral := 0;
	for i:=1 to n do
	begin
		x := a + ((b-a)*random(m+1)/m);
		integral := integral + f(x)
	end;
	integral := (b-a)*integral/n;
	writeln(integral:0:2);
end.
