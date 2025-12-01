unit timer;

interface

function RDTSC: longint;

implementation

function RDTSC: longint;
var
  hi: longint;
begin;
asm
  db 0fh, 31h
  db 66h
  mov word ptr hi, ax
end;
  RDTSC := hi;
end;

end.