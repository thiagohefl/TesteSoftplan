unit uspComponentesRegistro;

interface

uses System.Classes;

procedure Register;

implementation

procedure Register;
begin
   RegisterComponents('spComponentes', [TspQuery]);
end;


end.
