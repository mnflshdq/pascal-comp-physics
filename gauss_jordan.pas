program gauss_jordan;

uses crt;

type
arr2dimreal = array[1..4,1..4] of real;

var 
A,ID: arr2dimreal;
n,i,j,k: integer;
c: real;

procedure printMatrix(B: arr2dimreal; dimensi: integer);
begin
	for i:=1 to dimensi do
		begin
		for j:=1 to dimensi do
			begin
				write(B[i,j]:0:2,' ');
			end;
		writeln();
		end;
end;

procedure pivotMatrixRow(B: arr2dimreal; dimensi,n,m: integer);
var
backup: array[1..4] of real;
begin
	for i:=1 to dimensi do
	begin
		backup[i] := B[n,i];
		b[n,i] := b[m,i];
		b[m,i] := backup[i];
	end;
end;

begin
	
	n := 4;
	
	A[1,1] := 1;
	A[1,2] := -2;
	A[1,3] := 1;
	A[1,4] := 3;
	A[2,1] := 2;
	A[2,2] := -3;
	A[2,3] := 2;
	A[2,4] := -1;
	A[3,1] := 0;
	A[3,2] := -5;
	A[3,3] := 1;
	A[3,4] := 1;
	A[4,1] := 0;
	A[4,2] := -3;
	A[4,3] := 1;
	A[4,4] := 2;
	
	writeln('A = ');
	printMatrix(A,n);
	
	//deklarasi matriks identitas
	for i:=1 to n do
		for j:=1 to n do
			begin
				if i=j then ID[i,j] := 1
				else ID[i,j] := 0;
			end;
	
	//membuat matrix segitiga atas
	for j:=1 to n-1 do
	begin
		for i:=j+1 to n do
		begin
			c := A[i,j]/A[j,j];
			for k:=1 to n do
			begin
				A[i,k] := A[i,k] - c*A[j,k];
				ID[i,k] := ID[i,k] - c*ID[j,k];
			end;
		end;
	end;
	
	for j:=n downto 2 do
	begin
		for i:=j-1 downto 1 do
		begin
			c := A[i,j]/A[j,j];
			for k:=1 to n do
			begin
				A[i,k] := A[i,k] - c*A[j,k];
				ID[i,k] := ID[i,k] - c*ID[j,k];
			end;
		end;
	end;
	
	for i:=1 to n do
	begin
		if (A[i,i] <> 1) then
		begin
			c := A[i,i];
			for j:=1 to n do
			begin
				A[i,j] := A[i,j]/c;
				ID[i,j] := ID[i,j]/c;
			end;
		end;
	end;
	
	writeln('invers A = ');
	printMatrix(ID,n);
	
end.
