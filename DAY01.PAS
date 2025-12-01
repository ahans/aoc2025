program day01;

uses
  Timer;

var
  f: Text;
  line: String;
  p1, p2, pos, prev, dist, code: Integer;
  startTime, endTime: LongInt;
  i: word;

begin
  startTime := RDTSC;
  Assign(f, 'INPUTS\day01.txt');
  Reset(f);
  p1 := 0;
  p2 := 0;
  pos := 50;
  while not Eof(f) do
  begin
    ReadLn(f, line);
    dist := 0;
    for i := 2 to Length(line) do
      dist := 10 * dist + ord(line[i]) - ord('0');

    prev := pos;
    inc(p2, dist div 100);
    if line[1] = 'R' then inc(pos, dist mod 100)
    else                  dec(pos, dist mod 100);
    if (pos <= 0) and (prev <> 0) or (pos >= 100) then inc(p2);
    pos := (pos + 100) mod 100;
    if pos = 0 then inc(p1);
  end;

  endTime := RDTSC;

  WriteLn('Part 1: ', p1);
  WriteLn('Part 2: ', p2);

  WriteLn((endTime - startTime) div 450000, ' ms');

  ReadLn;
end.