program gauss_jordan;

uses crt;

type
arr2dimreal = array[1..3,1..3] of real;

var 
A,ID: arr2dimreal;
B: array[1..3] of real;
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

procedure pivotMatrixRow(var b: arr2dimreal; dimensi,n,m: integer);
var
backup: array[1..3] of real;
begin
	for i:=1 to dimensi do
	begin
		backup[i] := B[n,i];
		b[n,i] := b[m,i];
		b[m,i] := backup[i];
	end;
end;

function isNotOkForGaussJordan(B: arr2dimreal; dimensi: integer): integer;
begin
	for i:=1 to dimensi do
		if (B[i,i]=0) then
		begin
			isNotOkForGaussJordan:=i;
			break;
		end
		else isNotOkForGaussJordan:=0;
end;

begin
	
	n := 3;
	
	A[1,1] := 0;
	A[1,2] := 1;
	A[1,3] := -1;
	//A[1,4] := 3;
	A[2,1] := -3;
	A[2,2] := 1;
	A[2,3] := 2;
	//A[2,4] := -1;
	A[3,1] := -2;
	A[3,2] := 1;
	A[3,3] := 2;
	//A[3,4] := 1;
	//A[4,1] := 0;
	//A[4,2] := -3;
	//A[4,3] := 1;
	//A[4,4] := 2;
	B[1] := 8;
	B[2] := -11;
	B[3] := -3;
	
	writeln('A = ');
	printMatrix(A,n);
	
	if (isNotOkForGaussJordan(A,n) <> 0) then begin
		i:=isNotOkForGaussJordan(A,n);
		j:=isNotOkForGaussJordan(A,n)+1;
		if (j>n) then j:=j-n;
		pivotMatrixRow(A,n,i,j);
		c:=B[i];
		B[i]:=B[j];
		B[j]:=c;
	end;
	
	
	printMatrix(A,n);
	//deklarasi matriks identitas
	//for i:=1 to n do
	//	for j:=1 to n do
	//		begin
	//			if i=j then ID[i,j] := 1
	//			else ID[i,j] := 0;
	//		end;
	
	//membuat matrix segitiga atas
	for j:=1 to n-1 do
	begin
		for i:=j+1 to n do
		begin
			c := A[i,j]/A[j,j];
			B[i] := B[i] - c*B[j];
			for k:=1 to n do
			begin
				A[i,k] := A[i,k] - c*A[j,k];
				//ID[i,k] := ID[i,k] - c*ID[j,k];
			end;
		end;
	end;
	
	for j:=n downto 2 do
	begin
		for i:=j-1 downto 1 do
		begin
			c := A[i,j]/A[j,j];
			B[i] := B[i] - c*B[j];
			for k:=1 to n do
			begin
				A[i,k] := A[i,k] - c*A[j,k];
				//ID[i,k] := ID[i,k] - c*ID[j,k];
			end;
		end;
	end;
	
	for i:=1 to n do
	begin
		if (A[i,i] <> 1) then
		begin
			c := A[i,i];
			B[i] := B[i]/c;
			for j:=1 to n do
			begin
				A[i,j] := A[i,j]/c;
				//ID[i,j] := ID[i,j]/c;
			end;
		end;
	end;
	
	writeln('A = ');
	printMatrix(A,n);
	
	writeln('B = ');
	for i:=1 to 3 do writeln(B[i]:0:2);
end.
