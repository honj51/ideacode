unit UformLock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinBoxCtrls, StdCtrls, bsSkinCtrls, DB,
  ADODB;

type
  TformLock = class(TForm)
    btn1: TbsSkinButton;
    lbl1: TbsSkinStdLabel;
    bsknpswrdt1: TbsSkinPasswordEdit;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    procedure btn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLock: TformLock;

implementation
     uses UHDHouseDataModule,Common;
{$R *.dfm}

procedure TformLock.btn1Click(Sender: TObject);
begin
   if Trim(gs_login_password)=Trim(self.bsknpswrdt1.Text) then
   begin
     Close;
   end;
end;
procedure TformLock.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if Trim(gs_login_password)=Trim(self.bsknpswrdt1.Text) then
   begin
     Close;
   end
   else
   begin
    CanClose:=false;
   end;
end;

end.
