program HDHouse;

uses
  Forms,
  MainForm in 'MainForm.pas' {TformMain},
  HouseListFrame in 'HouseListFrame.pas' {frameHouseList: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
