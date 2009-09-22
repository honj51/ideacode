unit URealtorListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinExCtrls, bsSkinGrids, bsDBGrids, StdCtrls,
  bsSkinData, BusinessSkinForm;

type
  TRealtorListForm = class(TForm)
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bskngrpbx1: TbsSkinGroupBox;
    bskndbgrd1: TbsSkinDBGrid;
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    ygbh:string;
    ygxm:string;
  end;

var
  RealtorListForm: TRealtorListForm;

implementation
     uses UHDHouseDataModule,UHouseDetailsForm,UEmployeeInfoForm;
{$R *.dfm}
    //员工信息
procedure TRealtorListForm.bskndbgrd1DblClick(Sender: TObject);
begin
   inherited;
 if not HDHouseDataModule.qryygxx.IsEmpty THEN
  Begin
    Try
      ygbh:= HDHouseDataModule.qryygxx.fieldbyname('ygxx_bh').AsString;
      ygxm:= HDHouseDataModule.qryygxx.fieldbyname('ygxx_xm').AsString;
    Finally
    End;
    Close;
  end;
end;
  //确定按扭
procedure TRealtorListForm.btn2Click(Sender: TObject);
begin
  inherited;
 if not HDHouseDataModule.qryygxx.IsEmpty THEN
  Begin
    Try
      ygbh:= HDHouseDataModule.qryygxx.fieldbyname('ygxx_bh').AsString;
      ygxm:= HDHouseDataModule.qryygxx.fieldbyname('ygxx_xm').AsString;
    Finally
    End;
    Close;
  end;
end;
//取消
procedure TRealtorListForm.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TRealtorListForm.btn1Click(Sender: TObject);
begin
    inherited;
    Try
      EmployeeInfoForm.ParmEditorMode := 'ADD';
      EmployeeInfoForm.ShowModal;
    Finally

    End;
    HDHouseDataModule.qryygxx.Close;
    HDHouseDataModule.qryygxx.Open;
end;

procedure TRealtorListForm.FormShow(Sender: TObject);
begin
HDHouseDataModule.qryygxx.Active:=true;//起动数据控件
end;

end.
