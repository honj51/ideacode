unit UContractSampleSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, BusinessSkinForm;

type
  TContractSampleSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn1Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContractSampleSettingForm: TContractSampleSettingForm;

implementation
        uses UHDHouseDataModule,UAddContractSampleForm, ShellAPI;
{$R *.dfm}

procedure TContractSampleSettingForm.btn1Click(Sender: TObject);
begin
  inherited;
    //
    AddContractSampleForm.ParmEditorMode:='ADD';
    AddContractSampleForm.ShowModal;
     HDHouseDataModule.qry_ht.Close;
     HDHouseDataModule.qry_ht.Open;
end;

procedure TContractSampleSettingForm.bskndbgrd1DblClick(Sender: TObject);
begin
      inherited;
    //
     AddContractSampleForm.ParmEditorMode:='EDIT';
     AddContractSampleForm.ParmId:=HDHouseDataModule.qry_ht.fieldbyname('ht_bh').AsString;
      AddContractSampleForm.ShowModal;
      HDHouseDataModule.qry_ht.Close;
     HDHouseDataModule.qry_ht.Open;
end;

procedure TContractSampleSettingForm.btn2Click(Sender: TObject);
begin
       inherited;
    //
     AddContractSampleForm.ParmEditorMode:='EDIT';
     AddContractSampleForm.ParmId:=HDHouseDataModule.qry_ht.fieldbyname('ht_bh').AsString;
      AddContractSampleForm.ShowModal;
      HDHouseDataModule.qry_ht.Close;
     HDHouseDataModule.qry_ht.Open;
end;

procedure TContractSampleSettingForm.btn3Click(Sender: TObject);
//var id:string;
begin
      inherited;
    //
    if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后不能恢复！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;
      if not HDHouseDataModule.qry_ht.IsEmpty then
       HDHouseDataModule.qry_ht.Delete;
end;

procedure TContractSampleSettingForm.btn4Click(Sender: TObject);
var filename:string;
begin
        inherited;
        //
     filename:= HDHouseDataModule.qry_ht.fieldbyname('ht_path').AsString;
     ShellExecute(handle, 'Open', PChar(filename), nil, nil, SW_NORMAL);
 end;

procedure TContractSampleSettingForm.FormShow(Sender: TObject);
begin
    HDHouseDataModule.qry_ht.Active:=true;
end;

end.
