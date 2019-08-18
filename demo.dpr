program demo;

uses
  Forms, {$IFDEF FPC}indylaz,{$endif}
  ufrmdemo in 'ufrmdemo.pas' {Form1},
  libzip in 'libzip.pas'{$IFDEF FPC}, Interfaces{$endif};

{$R *.res}

begin
  {$IFDEF FPC}Application.Scaled:=True;{$endif}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
