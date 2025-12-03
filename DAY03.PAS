program day03;

uses
  timer;

function AddDecStr(const a, b: string): string;
var
  i, j, carry, sum: integer;
  r: string;
begin
  i := Length(a);
  j := Length(b);
  carry := 0;
  r := '';

  while (i > 0) or (j > 0) or (carry <> 0) do begin
    sum := carry;

    if i > 0 then begin
      Inc(sum, Ord(a[i]) - Ord('0'));
      Dec(i);
    end;

    if j > 0 then begin
      Inc(sum, Ord(b[j]) - Ord('0'));
      Dec(j);
    end;

    carry := sum div 10;
    sum := sum mod 10;

    r := Chr(Ord('0') + sum) + r;
  end;

  AddDecStr := r;
end;

function solve(var line: string; n: word): string;
var
  max: string;
  i, lastIdx, curMaxIdx: integer;
begin
  max := '';
  lastIdx := 0;
  for n := n downto 1 do begin
    curMaxIdx := lastIdx + 1;
    for i := curMaxIdx + 1 to (Length(line) - n + 1) do
      if line[i] > line[curMaxIdx] then curMaxIdx := i;
    max := max + line[curMaxIdx];
    lastIdx := curMaxIdx;
  end;
  solve := max;
end;

var
  f: Text;
  line: string;
  p1, p2: string;
  startTime, endTime: longint;

begin
  startTime := RDTSC;
  Assign(f, 'day03.txt');
  Reset(f);
  p1 := '0';
  p2 := '0';
  while not eof(f) do begin
    ReadLn(f, line);
    p1 := AddDecStr(p1, solve(line, 2));
    p2 := AddDecStr(p2, solve(line, 12));
  end;

  WriteLn('Part 1: ', p1);
  WriteLn('Part 2: ', p2);

  endTime := RDTSC;
  WriteLn((endTime - startTime) div 450000, ' ms');
end.
