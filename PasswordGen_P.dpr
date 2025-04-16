program PasswordGen_P;

uses
  Vcl.Forms,
  PasswordGen_U in 'PasswordGen_U.pas' {frmPasswordGen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPasswordGen, frmPasswordGen);
  Application.Run;
end.
