unit PasswordGen_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg, Clipbrd,
  Vcl.ExtCtrls, Vcl.Samples.Spin;

type
  TfrmPasswordGen = class(TForm)
    imgBackGround: TImage;
    lblHeading: TLabel;
    edtValue1: TEdit;
    btnGenerate: TButton;
    spinCharLength: TSpinEdit;
    lblPasswordLength: TLabel;
    chkUpperCase: TCheckBox;
    chkLowerCase: TCheckBox;
    chkNumbers: TCheckBox;
    lblUppercase: TLabel;
    lblSpecialChar: TLabel;
    lblNum: TLabel;
    lblLowerCase: TLabel;
    chkSpecialChar: TCheckBox;
    edtDidgetPin: TEdit;
    btnCopyPin: TButton;
    btnCopyPassword: TButton;
    btnChangeBackground: TButton;
    OpenDialog: TOpenDialog;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnCopyPasswordClick(Sender: TObject);
    procedure btnCopyPinClick(Sender: TObject);
    procedure btnChangeBackgroundClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPasswordGen: TfrmPasswordGen;

implementation

{$R *.dfm}

procedure TfrmPasswordGen.btnCopyPasswordClick(Sender: TObject);
begin

 Clipboard.AsText := edtValue1.Text;
 ShowMessage('Password Copied To Clipboard!');

end;

procedure TfrmPasswordGen.btnCopyPinClick(Sender: TObject);
begin

  Clipboard.AsText := edtDidgetPin.Text;
  ShowMessage('PIN Copied To Clipboard!');

end;

procedure TfrmPasswordGen.btnGenerateClick(Sender: TObject);
const
UppercaseChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
LowercaseChar = 'abcdefghijklmnopqrstuvwxyz';
Numbers = '0123456789';
SpeacialChar = '!@#$%^&*()-_=+[]{}|;:,.<>?`~';
var
AllChars, Password, Pin: string;
i, PasswordLength, Didget: Integer;
begin

  Allchars := '';

  if chkUpperCase.Checked then
    AllChars := AllChars + UppercaseChar;
  if chkLowerCase.Checked then
    AllChars := AllChars + LowercaseChar;
  if chkNumbers.Checked then
    AllChars := AllChars + Numbers;
  if chkSpecialChar.Checked then
    AllChars := AllChars + SpeacialChar;

  if AllChars = ''  then
  begin
    ShowMessage('Please Select at least ONE character type.');
    Exit
  end;

  PasswordLength := spinCharLength.Value;
  Password := '';

  Randomize;
  for I := 1 to PasswordLength do
  begin
    Password := Password + AllChars[Random(Length(AllChars)) + 1];
  end;

  edtValue1.text := Password;

  Pin := '';
  for I := 1 to 5 do
  begin

    Pin := Pin + Numbers[random(10) + 1];

  end;

  edtDidgetPin.Text := Pin;


end;

procedure TfrmPasswordGen.btnChangeBackgroundClick(Sender: TObject);
begin
    if OpenDialog.Execute then
    begin
      imgBackGround.Picture.LoadFromFile(OpenDialog.FileName);
    end;
end;

end.
