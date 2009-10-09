unit UParametersSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinGrids, bsDBGrids, ComCtrls, BusinessSkinForm;

type
  TParametersSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    tv1: TbsSkinTreeView;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn1Click(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParametersSettingForm: TParametersSettingForm;

implementation
    uses UHDHouseDataModule,UParameterSettingForm;
{$R *.dfm}

procedure TParametersSettingForm.btn1Click(Sender: TObject);
begin
  inherited;
  //
      if not HDHouseDataModule.qry_cs.IsEmpty then
       begin
          ParameterSettingForm.ParmEditorMode:='ADD';
         ParameterSettingForm.lxbh:= HDHouseDataModule.qry_cs.fieldbyname('cs_lxbh').AsString;
          ParameterSettingForm.bh:= HDHouseDataModule.qry_cs.fieldbyname('cs_bh').AsString;
          ParameterSettingForm.lxmc:= HDHouseDataModule.qry_cs.fieldbyname('cs_lxmc').AsString;
        ParameterSettingForm.ShowModal;
   end;
end;



procedure TParametersSettingForm.tv1Change(Sender: TObject;
  Node: TTreeNode);
begin
   inherited;
  //
            HDHouseDataModule.qry_cs.Filter:='cs_lxmc = '''+node.Text+'''';
            HDHouseDataModule.qry_cs.Filtered:=True;
end;

procedure TParametersSettingForm.bskndbgrd1DblClick(Sender: TObject);
begin
      inherited;
  //
       if not HDHouseDataModule.qry_cs.IsEmpty then 
       begin
         ParameterSettingForm.ParmEditorMode:='EDIT';
        ParameterSettingForm.bh:=HDHouseDataModule.qry_cs.fieldbyname('cs_bh').AsString;
        ParameterSettingForm.lxbh:= HDHouseDataModule.qry_cs.fieldbyname('cs_lxbh').AsString;
       ParameterSettingForm.ShowModal;
       end;

end;

procedure TParametersSettingForm.btn2Click(Sender: TObject);
begin
      inherited;
  //
       if not HDHouseDataModule.qry_cs.IsEmpty then
       begin
         ParameterSettingForm.ParmEditorMode:='EDIT';
            ParameterSettingForm.bh:=HDHouseDataModule.qry_cs.fieldbyname('cs_bh').AsString;
        ParameterSettingForm.lxbh:= HDHouseDataModule.qry_cs.fieldbyname('cs_lxbh').AsString;
       ParameterSettingForm.ShowModal;
       end;
end;

procedure TParametersSettingForm.btn3Click(Sender: TObject);
//var bh:string;
//var lxbh:string;
begin
 inherited;
  //
   if not HDHouseDataModule.qry_cs.IsEmpty then
   begin
            if HDHouseDataModule.qry_cs.fieldbyname('cs_yhlx').AsString='Y'  then
      begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('系统参数不能删除！', '提示', nil, -1, [mbOk], 0);
       Exit;
      end;
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后不能恢复！', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;
               HDHouseDataModule.qry_cs.Delete;
   end;  


end;

procedure TParametersSettingForm.FormShow(Sender: TObject);
begin
  //
  HDHouseDataModule.qry_cs.Active := True;
end;

end.
