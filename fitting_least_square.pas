program fitting_least_square;

uses math,crt;

type
arr2dimreal = array[0..100,0..100] of real;
arr1dimreal = array[0..100] of real;

var 
//A,ID: arr2dimreal;
bb,theta,E,aa: arr1dimreal;
n,m,i,j,k,t: integer;
c: real;
cc: arr2dimreal;

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

function gauss_jordan(var A: arr2dimreal; var B: arr1dimreal; n: integer): arr1dimreal;
begin
	//printMatrix(A,n);
	
	if (isNotOkForGaussJordan(A,n) <> 0) then begin
		i:=isNotOkForGaussJordan(A,n);
		j:=isNotOkForGaussJordan(A,n)+1;
		if (j>n) then j:=j-n;
		pivotMatrixRow(A,n,i,j);
		c:=B[i];
		B[i]:=B[j];
		B[j]:=c;
	end;
	
	
	//printMatrix(A,n);
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
	
	gauss_jordan := B;
{
	writeln('A = ');
	printMatrix(A,n);
	
	writeln('B = ');
	for i:=1 to 3 do writeln(B[i]:0:2);
}
end;

begin
	n := 3;
	m := 2;
	t := 10;
	//for i:=1 to 10 do 
	//begin
	//theta[i] := t;
	//t := t + 5;
	//end;
	//
	//E[1]:=0.01794775;
	//E[2]:=0.03808997;
	//E[3]:=0.05516225;
	//E[4]:=0.05598281;
	//E[5]:=0.04795629;
	//E[6]:=0.04807485;
	//E[7]:=0.06273566;
	//E[8]:=0.07853982;
	//E[9]:=0.07395442;
	//E[10]:=0.04201338;
	
	for i:=1 to n do theta[i]:=i;
	E[1]:=30;
	E[2]:=70;
	E[3]:=120; 
	
	for k:=1 to m+1 do
		begin
		for j:=1 to m+1 do
			begin
			cc[k,j]:=0;
			for i:=1 to n do cc[k,j] := cc[k,j] + power(theta[i],j+k-2);
			end;
		bb[k] := 0;
		for i:=1 to n do bb[k] := bb[k] + E[i]*power(theta[i],k-1);
		end;
	
	aa := gauss_jordan(cc,bb,m+1);

	//printMatrix(cc,m+1);
	//for i:=1 to m+1 do writeln(bb[i]:0:10);
	write('p(x) = ');
	for i:=1 to m+1 do
	begin
	write(aa[i]:0:6);
	if i<>1 then write('*x^',i-1);
	if i<>m+1 then write(' + ');
	end;
end.
