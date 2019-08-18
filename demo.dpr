program demo;

uses
  Forms, indylaz,
  ufrmdemo in 'ufrmdemo.pas' {Form1},
  libzip in 'libzip.pas', Interfaces;

{$R *.res}

begin
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
