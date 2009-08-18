program HDHouse;

uses
  Forms,
  MainForm in 'MainForm.pas' {formMain},
  HouseListFrame in 'HouseListFrame.pas' {frameHouseList: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
