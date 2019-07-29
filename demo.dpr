program demo;

uses
  Forms,
  ufrmdemo in 'ufrmdemo.pas' {Form1},
  libzip in 'libzip.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
