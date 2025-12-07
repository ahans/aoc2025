program day05;

var
  f: Text;
  line: string;
  beams: array[0..255] of extended;
  p1, p2: extended;
  i: word;

begin
  Assign(f, 'day07.txt');
  Reset(f);
  ReadLn(f, line);
  for i := 0 to Length(line) - 1 do
    if line[i + 1] = 'S' then beams[i] := 1
    else                      beams[i] := 0;
  WriteLn(line);
  p1 := 0;
  while not eof(f) do begin
    ReadLn(f, line);
    for i := 0 to Length(line) - 1 do
      if (beams[i] > 0) and (line[i + 1] = '^') then begin
        beams[i - 1] := beams[i - 1] + beams[i];
        beams[i + 1] := beams[i + 1] + beams[i];
        beams[i] := 0;
        p1 := p1 + 1;
      end;
  end;
  p2 := beams[0];
  for i := 1 to Length(line) - 1 do p2 := p2 + beams[i];
  WriteLn('Part 1: ', p1:0:0);
  WriteLn('Part 2: ', p2:0:0);
  ReadLn;
end.