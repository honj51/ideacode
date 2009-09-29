unit USystemOperationLogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, Mask, bsSkinBoxCtrls, bsSkinGrids,
  bsDBGrids, BusinessSkinForm;

type
  TSystemOperationLogForm = class(TForm)
    bskndbgrd1: TbsSkinDBGrid;
    bsknpnl1: TbsSkinPanel;
    edt1: TbsSkinDateEdit;
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinStdLabel;
    edt2: TbsSkinDateEdit;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemOperationLogForm: TSystemOperationLogForm;

implementation
      uses UHDHouseDataModule,UDeletelogForm;
{$R *.dfm}

procedure TSystemOperationLogForm.btn1Click(Sender: TObject);
begin
        inherited;
    //

     with HDHouseDataModule.qry_dayjob do
    begin
         Close;
            Parameters.ParamByName('BeginDate').Value:=edt1.Text;
            Parameters.ParamByName('EndDate').Value:=edt2.Text;
         Open;

    end;
         bskndbgrd1.DataSource:=HDHouseDataModule.ds_dayjob;
end;

procedure TSystemOperationLogForm.btn2Click(Sender: TObject);
begin
         inherited;
        //
          DeletelogForm.ShowModal;
                   HDHouseDataModule.qry_dayjob.Close;
                    HDHouseDataModule.qry_dayjob.Open;
end;

procedure TSystemOperationLogForm.FormShow(Sender: TObject);
begin
    inherited;

    with HDHouseDataModule.qry_dayjob do
    begin
         Close;
            Parameters.ParamByName('BeginDate').Value:=edt1.Text;
            Parameters.ParamByName('EndDate').Value:=edt2.Text;
         Open;
    end;
    bskndbgrd1.DataSource:=HDHouseDataModule.ds_dayjob;
end;

end.
