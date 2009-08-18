program HDHouse;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  Unit1 in 'Unit1.pas' {Frame1: TFrame},
  Unit2 in 'C:\Documents and Settings\Hello\×ÀÃæ\Unit2.pas' {HouseListForm: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
