unit UOperatePermissionSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, BusinessSkinForm,
  bsMessages, ImgList, DB, ADODB;

type
  TOperatePermissionSettingForm = class(TForm)
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    btn4: TbsSkinButton;
    btn5: TbsSkinButton;
    btn6: TbsSkinButton;
    bsknpnl1: TbsSkinPanel;
    bskndbgrd2: TbsSkinDBGrid;
    bsknscrlbr3: TbsSkinScrollBar;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknpnl2: TbsSkinPanel;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsknscrlbr4: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure btn6Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure bskndbgrd2DblClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure bskndbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  OperatePermissionSettingForm: TOperatePermissionSettingForm;

implementation
     uses UHDHouseDataModule,UPermissionGroupSettingForm,UOperatorInfoForm;
{$R *.dfm}
    


procedure TOperatePermissionSettingForm.btn6Click(Sender: TObject);
begin
  inherited;
       OperatorInfoForm.ParmEditorMode := 'ADD';
       OperatorInfoForm.ShowModal;
        with HDHouseDataModule.qry_users do
      begin
        Close;
        Open;
      end;
end;

procedure TOperatePermissionSettingForm.btn1Click(Sender: TObject);
begin
inherited;
//
    PermissionGroupSettingForm.ParmEditorMode := 'ADD';
    PermissionGroupSettingForm.ShowModal;
      with HDHouseDataModule.qry_qx do
      begin
        Close;
        Open;
      end;
end;

procedure TOperatePermissionSettingForm.btn2Click(Sender: TObject);
begin
    inherited;
//
          if not HDHouseDataModule.qry_qx.IsEmpty THEN
  Begin
     if HDHouseDataModule.qry_qx.FieldByName('qx_bh').AsString<>'001' then
       begin
        Try
            PermissionGroupSettingForm.ParmEditorMode := 'EDIT';
            PermissionGroupSettingForm.ParmId := HDHouseDataModule.qry_Qx.fieldbyname('qx_bh').AsString;
            PermissionGroupSettingForm.ShowModal;
          Finally

          End;
       end
       else
       begin
           HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ϵͳ����Ȩ�����޷��޸ģ�', '��ʾ', nil, -1, [mbOk], 0);
       end;
  end;
  with HDHouseDataModule.qry_qx do
      begin
        Close;
        Open;
      end; 
end;

procedure TOperatePermissionSettingForm.btn5Click(Sender: TObject);
begin
   inherited;
//
     if not HDHouseDataModule.qry_users.IsEmpty  then
     begin
       if HDHouseDataModule.qry_users.FieldByName('user_qxbh').AsString<>'001' then
       begin
           Try
      OperatorInfoForm.ParmEditorMode := 'EDIT';
      OperatorInfoForm.ParmId := HDHouseDataModule.qry_users.fieldbyname('user_bh').AsString;
      OperatorInfoForm.ShowModal;
    Finally

    End;
       end
       else
       begin
           HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ϵͳ�������Ա����ɾ����', '��ʾ', nil, -1, [mbOk], 0);
       end;
     end;
     with HDHouseDataModule.qry_users do
      begin
        Close;
        Open;
      end;   
end;

procedure TOperatePermissionSettingForm.bskndbgrd2DblClick(
  Sender: TObject);
begin
     inherited;
      //
    if not HDHouseDataModule.qry_users.IsEmpty  then
     begin
        if HDHouseDataModule.qry_users.FieldByName('user_qxbh').AsString<>'001'  then
     begin
       Try
      OperatorInfoForm.ParmEditorMode := 'EDIT';
      OperatorInfoForm.ParmId := HDHouseDataModule.qry_users.fieldbyname('user_bh').AsString;
      OperatorInfoForm.ShowModal;
    Finally

    End;
       end
    else
       begin
           HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ϵͳ�������Ա����ɾ����', '��ʾ', nil, -1, [mbOk], 0);
       end;
     end;
     with HDHouseDataModule.qry_users do
      begin
        Close;
        Open;
      end;
end;

procedure TOperatePermissionSettingForm.btn4Click(Sender: TObject);
begin
     inherited;
      //
      if not HDHouseDataModule.qry_users.IsEmpty then
   begin
            if HDHouseDataModule.qry_users.fieldbyname('cs_qxbh').AsString='001'  then
      begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ϵͳ������Ա����ɾ����', '��ʾ', nil, -1, [mbOk], 0);
       Exit;
      end;
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ɾ�����ָܻ���', '��ʾ', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
          Close;
      end;
               HDHouseDataModule.qry_users.Delete;
   end;
   with HDHouseDataModule.qry_users do
      begin
        Close;
        Open;
      end;

end;

procedure TOperatePermissionSettingForm.btn3Click(Sender: TObject);
begin
      inherited;
      //
       if not HDHouseDataModule.qry_qx.IsEmpty then
   begin
            if HDHouseDataModule.qry_qx.fieldbyname('qx_bh').AsString='001'  then
      begin
       HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ϵͳ��Ȩ���鲻��ɾ����', '��ʾ', nil, -1, [mbOk], 0);
       Exit;
      end;
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('ɾ�����ָܻ���', '��ʾ', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
      end;
               HDHouseDataModule.qry_qx.Delete;
   end;

    
end;

procedure TOperatePermissionSettingForm.bskndbgrd1DblClick(
  Sender: TObject);
begin
      inherited;
      //
        if not HDHouseDataModule.qry_qx.IsEmpty THEN
  Begin
    Try
      PermissionGroupSettingForm.ParmEditorMode := 'EDIT';
      PermissionGroupSettingForm.ParmId := HDHouseDataModule.qry_qx.fieldbyname('qx_bh').AsString;
      PermissionGroupSettingForm.ShowModal;
    Finally

    End;
    
  end;
  with HDHouseDataModule.qry_qx do
      begin
        Close;
        Open;
      end;
end;

end.
