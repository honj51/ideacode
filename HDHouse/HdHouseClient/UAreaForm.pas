unit UAreaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinCtrls, Mask, bsSkinBoxCtrls, bsdbctrls,
  BusinessSkinForm, DB, ADODB;

type
  TAreaForm = class(TForm)
    grp1: TGroupBox;
    bsknpnl1: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lbl4: TbsSkinStdLabel;
    edt1: TbsSkinDBEdit;
    edt2: TbsSkinDBEdit;
    edt3: TbsSkinDBEdit;
    edt4: TbsSkinDBEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    ds1: TDataSource;
    qry1: TADOQuery;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    CityName:string;
    DistrictName:string;
    { Public declarations }
  end;

var
  AreaForm: TAreaForm;

implementation
             uses UHDHouseDataModule;
{$R *.dfm}

procedure TAreaForm.btn1Click(Sender: TObject);
begin
 self.qry1.FieldByName('AreaId').Value:=ParmId;
 self.qry1.FieldByName('ModDate').Value:=Now;
 self.qry1.Post;
 Close;
end;

procedure TAreaForm.FormShow(Sender: TObject);
begin
    qry1.Active:=true;
    qry1.Close;
    qry1.Parameters.ParamByName('ID').Value := ParmId;
    qry1.Open;
    qry1.Edit;
    if( ParmEditorMode = 'ADD') then
    begin
      qry1.FieldByName('CityName').Value:=CityName;
      qry1.FieldByName('DistrictName').Value:=DistrictName;
      qry1.FieldByName('ExDate').Value:=Now;
    end;
    if( ParmEditorMode = 'EDIT') then
    begin

    end;
    edt3.Enabled:=false;
    edt2.Enabled:=false;
end;

procedure TAreaForm.btn2Click(Sender: TObject);
begin
Close;
end;

end.
