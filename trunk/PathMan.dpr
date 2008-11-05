program PathMan;

uses
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PathMan';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
