unit UContractsFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, DB, ADODB, bsSkinCtrls, bsSkinGrids, bsDBGrids,
  StdCtrls;

type
  TContractsFile = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskndbgrd1: TbsSkinDBGrid;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    tbl1: TADOTable;
    ds1: TDataSource;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsSkinStdLabel1: TbsSkinStdLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContractsFile: TContractsFile;

implementation
   uses UHDHouseDataModule,ShellAPI;
{$R *.dfm}

procedure TContractsFile.btn1Click(Sender: TObject);
 var filename:string;
begin
   if self.tbl1.IsEmpty then
   begin
      filename:= self.tbl1.fieldbyname('ht_path').AsString;
      ShellExecute(handle, 'Open', PChar(filename), nil, nil, SW_NORMAL);
   end;
end;

procedure TContractsFile.btn2Click(Sender: TObject);
begin
    Close;
end;
 //显示数据
procedure TContractsFile.FormShow(Sender: TObject);
begin
  self.bsSkinStdLabel1.Caption :='注：签约后的合同文件保存在'+ GetCurrentDir +'\Contract\目录下，\n 才便于在成交记录中打开相应签约记录的合同文件';
end;

end.
