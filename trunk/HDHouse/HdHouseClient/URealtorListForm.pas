unit URealtorListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinExCtrls, bsSkinGrids, bsDBGrids, StdCtrls,
  bsSkinData, BusinessSkinForm;

type
  TRealtorListForm = class(TForm)
    grp1: TGroupBox;
    bsSkinDBGrid1: TbsSkinDBGrid;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bskndt1: TbsSkinData;
    procedure bsSkinDBGrid1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    ygbh:string;
    ygxm:string;
  end;

var
  RealtorListForm: TRealtorListForm;

implementation
     uses UHDHouseDataModule,UHouseDetailsForm;
{$R *.dfm}
    //Ա����Ϣ
procedure TRealtorListForm.bsSkinDBGrid1DblClick(Sender: TObject);
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
  //ȷ����Ť
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
//ȡ��
procedure TRealtorListForm.btn3Click(Sender: TObject);
begin
  Close;
end;

end.
