unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinData, StdCtrls, bsSkinCtrls,
  ImgList, bsPngImageList, ComCtrls, bsSkinTabs, bsColorCtrls, bsDialogs,
  bsMessages, HouseListFrame, DB, ADODB, UCustomerAutoMatchView,
  UTrackInfoView, UDataOperateBarView, UDetailRequirementInfoView,
  UTrackRecordView, Menus, frxClass, frxDBSet, ExtCtrls;

type
  TformMain = class(TForm)
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht4: TbsSkinTabSheet;
    bskntbsht5: TbsSkinTabSheet;
    bsknmsg1: TbsSkinMessage;
    btnxtsz1: TbsSkinButton;
    btnxtsz4: TbsSkinButton;
    btnxtsz7: TbsSkinButton;
    btnxtsz5: TbsSkinButton;
    btnxtsz2: TbsSkinButton;
    btnxtsz6: TbsSkinButton;
    btnxtsz3: TbsSkinButton;
    btnxtsz8: TbsSkinButton;
    btnxtsz9: TbsSkinButton;
    btn17: TbsSkinButton;
    btnkhgl1: TbsSkinButton;
    btnkhgl3: TbsSkinButton;
    btnkhgl2: TbsSkinButton;
    btnkhgl4: TbsSkinButton;
    btnfygl1: TbsSkinButton;
    btnfygl3: TbsSkinButton;
    btnfygl4: TbsSkinButton;
    btnfygl2: TbsSkinButton;
    bskntbsht3: TbsSkinTabSheet;
    btnnbgl3: TbsSkinButton;
    btnnbgl2: TbsSkinButton;
    btnnbgl1: TbsSkinButton;
    btnnbgl5: TbsSkinButton;
    btnnbgl4: TbsSkinButton;
    btnnbgl6: TbsSkinButton;
    frmhslst1: TframeHouseList;
    frxDBDatasetfczy: TfrxDBDataset;
    frxReportfczy: TfrxReport;
    tmr1: TTimer;
    qrytx: TADOQuery;
    bsSkinFrame1: TbsSkinFrame;
    procedure btn7Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnxtsz7Click(Sender: TObject);
    procedure btnxtsz1Click(Sender: TObject);
    procedure btnxtsz2Click(Sender: TObject);
    procedure btnxtsz3Click(Sender: TObject);
    procedure btnxtsz9Click(Sender: TObject);
    procedure btnxtsz4Click(Sender: TObject);
    procedure btnxtsz5Click(Sender: TObject);
    procedure btnxtsz6Click(Sender: TObject);
    procedure btnxtsz8Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnfygl3Click(Sender: TObject);
    procedure btnfygl2Click(Sender: TObject);
    procedure btnfygl4Click(Sender: TObject);
    procedure btnfygl1Click(Sender: TObject);
    procedure btnkhgl3Click(Sender: TObject);
    procedure btnkhgl2Click(Sender: TObject);
    procedure btnkhgl4Click(Sender: TObject);
    procedure btnnbgl1Click(Sender: TObject);
    procedure btnnbgl5Click(Sender: TObject);
    procedure btnnbgl2Click(Sender: TObject);
    procedure btnnbgl3Click(Sender: TObject);
    procedure btnnbgl4Click(Sender: TObject);
    procedure btnnbgl6Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnkhgl1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure frmhslst1qryHouseListCalcFields(DataSet: TDataSet);
    procedure frmhslst1bsSkinButton3Click(Sender: TObject);
    procedure frmhslst1bsSkinButton1Click(Sender: TObject);
    procedure frmhslst1bsSkinButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frmhslst1MenuItem2Click(Sender: TObject);
    procedure frmhslst1bsSkinButton4Click(Sender: TObject);
    procedure frmhslst1MenuItem1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn32Click(Sender: TObject);
    procedure frmhslst1bsSkinButtonLabel2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure SetButtonState;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    state:string;
    //堤示
    sound,del:Boolean;
    close:string;
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation
 uses UHDHouseDataModule,ULoginForm,UAboutForm, UCompanyInfoSettingForm,IniFiles,
  UOperatePermissionSettingForm, UChangePasswordForm,MMSystem,DateUtils,UformLock,
  UContractSampleSettingForm, UDatabaseMantainForm, UDatabaseInitialForm,UParameterSettingForm,
  USystemOperationLogForm, UParametersSettingForm,UEmployeeManageForm,
  UHouseStatisticQueryForm, UNotificationManageForm,
  USalesCommissionDetailsForm, UStatisticForm, USalesCommissionSumForm,UCustomerManageForm,
  UCustomerTrackForm, UContactRecordForm,UTrackQueryForm,
  UCustomerDetailsForm, UHouseManageForm,UHouseDealManageForm, Common,
  UHousePosterForm,UHouseTrackForm, UHouseDetailsForm,UHouseQueryForm,UContractQueryForm,
  UOperatorInfoForm, UEmployeeInfoForm, UPermissionGroupSettingForm,
  UAddContractSampleForm, UNotificationInfoForm, UContactRecordDetailsForm,
  UBaseFacilitiesForm, UOtherFacilitiesForm, URealtorListForm,
  UContractInfo, UDivideIntoInfo, UCustomerListForm, UHouseTrackInfoForm,
  UContractsFile, UCustomerQueryForm;
 {,UCompanyInfoSettingForm,UOperatePermissionSettingForm
 ,UEmployeeManageForm,UChangePasswordForm,UContractSampleSettingForm,UDatabaseMantainForm
 ,UDatabaseInitialForm,UParametersSettingForm,USystemOperationLogForm,UHouseDetailsForm
 ,UHouseDealManageForm,UHouseTrackForm,UHousePosterForm,UHouseManageForm,UContractQueryForm
 ,UCustomerTrackForm,UContactRecordForm,UCustomeStatisticrQueryForm,UNotificationManageForm
 ,USalesCommissionDetailsForm,USalesCommissionSumForm,UStatisticForm,UTrackQueryForm;
 }
{$R *.dfm}

procedure TformMain.btn7Click(Sender: TObject);
var i:Integer;
begin
  i := Self.bsknmsg1.MessageDlg2('真的要退出本系统吗？','提示信息', mtConfirmation, [mbYes,mbNo],0);
  if i = 6 then
    Application.Terminate;
end;

procedure TformMain.btn4Click(Sender: TObject);
begin
  inherited;
     LoginForm.CloseState:=False;
     LoginForm.Show;
end;

procedure TformMain.btnxtsz7Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',6)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
         EmployeeManageForm.ShowModal;
//    end;
end;

procedure TformMain.btnxtsz1Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       CompanyInfoSettingForm.ParmId:='001';
       CompanyInfoSettingForm.ShowModal;
//    end;
end;

procedure TformMain.btnxtsz2Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',1)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
     OperatePermissionSettingForm.ShowModal;
     self.SetButtonState;
//     end;
end;

procedure TformMain.btnxtsz3Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',2)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       ChangePasswordForm.ShowModal;
//    end;

end;

procedure TformMain.btnxtsz9Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',8)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        ContractSampleSettingForm.ShowModal;
//    end;

end;

procedure TformMain.btnxtsz4Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',3)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        DatabaseMantainForm.ShowModal;
//    end;

end;

procedure TformMain.btnxtsz5Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',4)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        DatabaseInitialForm.ShowModal;
//    end;

end;

procedure TformMain.btnxtsz6Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',5)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
          ParametersSettingForm.ShowModal;
//    end;

end;

procedure TformMain.btnxtsz8Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_xtsz',7)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       SystemOperationLogForm.ShowModal;
//    end;

end;

procedure TformMain.btn17Click(Sender: TObject);
begin
    AboutForm.ShowModal;
end;

procedure TformMain.btn1Click(Sender: TObject);
begin
   inherited;
    if not(CheckPermission('Qx_rcgl',1)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
          Try
              HouseDetailsForm.ParmId :='';
              HouseDetailsForm.ParmEditorMode:= 'ADD';
              HouseDetailsForm.ShowModal;
              self.frmhslst1.qryHouseList.Close;
              self.frmhslst1.qryHouseList.Open;
          Finally
              //HouseDetailsForm.Free;
          End;
    end;

end;

procedure TformMain.btnfygl3Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sfgl',2)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
           HouseDealManageForm.ShowModal;
//    end;

end;

procedure TformMain.btnfygl2Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sfgl',1)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
      HouseTrackForm.ShowModal;
//    end;

end;

procedure TformMain.btnfygl4Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sfgl',3)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        HousePosterForm.ShowModal;
//    end;
end;

procedure TformMain.btnfygl1Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sfgl',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        HouseManageForm.ShowModal;
 //   end;
end;

procedure TformMain.btnkhgl3Click(Sender: TObject);
begin

//    if not(CheckPermission('Qx_cx',2)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       ContractQueryForm.ShowModal;
//    end;
end;

procedure TformMain.btnkhgl2Click(Sender: TObject);
begin
   CustomerTrackForm.ShowModal;
end;

procedure TformMain.btnkhgl4Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_cx',3)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       ContactRecordForm.ShowModal;
//    end;
end;

procedure TformMain.btnnbgl1Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sqfw',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
      HouseStatisticQueryForm.ShowModal;
//    end;
end;

procedure TformMain.btnnbgl5Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sqfw',4)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       CustomerManageForm.ShowModal;
//    end;
end;

procedure TformMain.btnnbgl2Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sqfw',1)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
      NotificationManageForm.ShowModal;
//    end;

end;

procedure TformMain.btnnbgl3Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sqfw',2)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       SalesCommissionDetailsForm.ShowModal;
//    end;
end;

procedure TformMain.btnnbgl4Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sqfw',3)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       SalesCommissionSumForm.ShowModal;
//    end;
end;

procedure TformMain.btnnbgl6Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_sqfw',5)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        StatisticForm.ShowModal;
//    end;
end;

procedure TformMain.btn3Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_rcgl',3)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       TrackQueryForm.ShowModal;
    end;

end;


procedure TformMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      inherited;
      //
     if LoginForm.Visible then
     begin
         Action:=caNone;
     end;
     Application.Terminate;
end;

procedure TformMain.btnkhgl1Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_cx',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        CustomerManageForm.ShowModal;
//    end;
end;

procedure TformMain.btn2Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_rcgl',5)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
      CustomerDetailsForm.ParmMode:='add';
      CustomerDetailsForm.ShowModal;
    end;

end;

procedure TformMain.frmhslst1qryHouseListCalcFields(DataSet: TDataSet);
begin
  frmhslst1.qryHouseListCalcFields(DataSet);
end;

procedure TformMain.frmhslst1bsSkinButton3Click(Sender: TObject);
begin
 inherited;
//    if not(CheckPermission('Qx_rcgl',1)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
      Try
          HouseDetailsForm.ParmId :='';
          HouseDetailsForm.ParmEditorMode:= 'ADD';
          HouseDetailsForm.ShowModal;
      Finally
          //HouseDetailsForm.Free;
      End;
//    end;

end;

procedure TformMain.frmhslst1bsSkinButton1Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_rcgl',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        HouseQueryForm.hsqryfrm1.cbb5.ItemIndex:=0;
        HouseQueryForm.ShowModal;
        frmhslst1.qryHouseList.Close;
        frmhslst1.qryHouseList.SQL.Clear;
        frmhslst1.qryHouseList.SQL.Add(HouseQueryForm.strFilter) ;
        frmhslst1.qryHouseList.Open;
//    end;

end;

procedure TformMain.frmhslst1bsSkinButton2Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_rcgl',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        HouseQueryForm.hsqryfrm1.cbb5.ItemIndex:=1;
        HouseQueryForm.ShowModal;
        frmhslst1.qryHouseList.Close;
        frmhslst1.qryHouseList.SQL.Clear;
        frmhslst1.qryHouseList.SQL.Add(HouseQueryForm.strFilter) ;
        frmhslst1.qryHouseList.Open;
//    end;

end;

procedure TformMain.FormShow(Sender: TObject);
var myinifile:Tinifile;  //定放类
var inifile:string;
begin
  //起动数据控件
  self.frmhslst1.tblHouseTrack.Active:=true;
  self.frmhslst1.qryHouseList.Active:=true;
  self.frmhslst1.qryCustomerTrack.Active:=true;
  self.qrytx.Active:=true;
  //取配置文件
  inifile:=ExtractFilePath(Paramstr (0))+'weekup.ini';
  myinifile:=Tinifile.Create(inifile); //打开INI文件
  self.del:=myinifile.ReadBool('clock','del',false);
  self.close:=myinifile.ReadString ('clock','close','0');
  self.sound:=myinifile.ReadBool('clock','sound',false);
  myinifile.Destroy;
  self.SetButtonState;
end;
//房源详细信息
procedure TformMain.frmhslst1MenuItem2Click(Sender: TObject);
begin
 inherited;
    Try
        HouseDetailsForm.ParmEditorMode:= 'EDIT';
        HouseDetailsForm.ParmId :=self.frmhslst1.qryHouseList.fieldbyname('fczy_bh').AsString;
        HouseDetailsForm.btn2.Visible:=false; //bsknpgcntrlPageC   bskntbshttab1
        HouseDetailsForm.ShowModal;
        HouseDetailsForm.btn2.Visible:=true;
        self.frmhslst1.qryHouseList.Close;
        self.frmhslst1.qryHouseList.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
end;
 //打印房源
procedure TformMain.frmhslst1bsSkinButton4Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_rcgl',2)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
        if self.frxReportfczy.PrepareReport then
        begin
           self.frxReportfczy.ShowPreparedReport;
        end;
//    end;

end;

procedure TformMain.frmhslst1MenuItem1Click(Sender: TObject);
begin
  frmhslst1.MenuItem1Click(Sender);
end;
  //时间
procedure TformMain.tmr1Timer(Sender: TObject);
var messages:string;
var title:string;
begin
    if self.sound then
    begin
      self.tmr1.Enabled := false;
      self.qrytx.Close;
      self.qrytx.Open;
      self.qrytx.Filter:='zdtx_dby='+QuotedStr(FormatdateTime('c',Now));
      self.qrytx.Filtered:=true;
      if not self.qrytx.Eof then
      begin
         sndPlaySound(PChar(ExtractFilePath(Paramstr (0))+'Global.wav'),  SND_ASYNC);
         messages:=self.qrytx.FieldByName('zdtx_xm').Value +'你好'+#13+self.qrytx.FieldByName('zdtx_nr').Value;
         if self.del then
         begin
           self.qrytx.Delete;
         end;
         title :='提醒'+FormatdateTime('c',Now);
        Application.MessageBox(PAnsiChar(messages),PAnsiChar(title), MB_OK + MB_ICONINFORMATION);

      end;
//      if (self.qrytx.FieldByName('zdtx_dby').Value<=IncMinute(Now,3))and (self.qrytx.FieldByName('zdtx_dby').Value >=IncMinute(Now,-3)) then
//      begin
//         Application.MessageBox('a', 'a', MB_OK);
//         // sndPlaySound(ExtractFilePath(Paramstr (0))+'Global.wav',  SND_ASYNC);
//         sndPlaySound('C:\Global.wav',   SND_ASYNC);
//      end;
      self.tmr1.Enabled := true;
    end;
end;
procedure TformMain.btn32Click(Sender: TObject);
begin
   self.sound := true;
end;

procedure TformMain.frmhslst1bsSkinButtonLabel2Click(Sender: TObject);
begin
//    if not(CheckPermission('Qx_rcgl',0)) then
//    begin
//     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
//    end
//    else
//    begin
       frmhslst1.bsSkinButtonLabel2Click(Sender);
//    end;
end;

procedure TformMain.btn5Click(Sender: TObject);
begin
 formLock.ShowModal;
end;

procedure TformMain.SetButtonState();
var fygls,khgls,nbgls,xtszs,rcgls:string;
begin
     HDHouseDataModule.qry_Qx.Active := True;
     HDHouseDataModule.qry_Qx.Filter:= ' Qx_bh ='+''+gs_login_qxid+'';
     HDHouseDataModule.qry_Qx.Filtered:=true;
     fygls:=HDHouseDataModule.qry_Qx.FieldByName('Qx_sfgl').AsString;
     khgls:=HDHouseDataModule.qry_Qx.FieldByName('Qx_cx').AsString;
     nbgls:=HDHouseDataModule.qry_Qx.FieldByName('Qx_sqfw').AsString;
     xtszs:=HDHouseDataModule.qry_Qx.FieldByName('Qx_xtsz').AsString;
     rcgls:=HDHouseDataModule.qry_Qx.FieldByName('Qx_rcgl').AsString;
     //日常管理
     self.frmhslst1.bsSkinButton1.Enabled:=CheckFatherPermission(rcgls,1);
     self.frmhslst1.bsSkinButton2.Enabled:=CheckFatherPermission(rcgls,1);
     self.frmhslst1.bsSkinButton3.Enabled:=CheckFatherPermission(rcgls,2);
     self.frmhslst1.bsSkinButton4.Enabled:=CheckFatherPermission(rcgls,3);
     self.frmhslst1.bsSkinButtonLabel2.Enabled:=CheckFatherPermission(rcgls,1);
     //房源管理
     self.btnfygl1.Enabled:=CheckFatherPermission(fygls,1);
     self.btnfygl2.Enabled:=CheckFatherPermission(fygls,2);
     self.btnfygl2.Enabled:=CheckFatherPermission(fygls,3);
     self.btnfygl4.Enabled:=CheckFatherPermission(fygls,4);
     //客户管理
     self.btnkhgl1.Enabled:=CheckFatherPermission(khgls,1);
     self.btnkhgl2.Enabled:=CheckFatherPermission(khgls,2);
     self.btnkhgl3.Enabled:=CheckFatherPermission(khgls,3);
     self.btnkhgl4.Enabled:=CheckFatherPermission(khgls,4);
     //内部管理
     self.btnnbgl1.Enabled:=CheckFatherPermission(nbgls,1);
     self.btnnbgl2.Enabled:=CheckFatherPermission(nbgls,2);
     self.btnnbgl3.Enabled:=CheckFatherPermission(nbgls,3);
     self.btnnbgl4.Enabled:=CheckFatherPermission(nbgls,4);
     self.btnnbgl5.Enabled:=CheckFatherPermission(nbgls,5);
     self.btnnbgl6.Enabled:=CheckFatherPermission(nbgls,6);
     //系统设置
     self.btnxtsz1.Enabled:=CheckFatherPermission(xtszs,1);
     self.btnxtsz2.Enabled:=CheckFatherPermission(xtszs,2);
     self.btnxtsz3.Enabled:=CheckFatherPermission(xtszs,3);
     self.btnxtsz4.Enabled:=CheckFatherPermission(xtszs,4);
     self.btnxtsz5.Enabled:=CheckFatherPermission(xtszs,5);
     self.btnxtsz6.Enabled:=CheckFatherPermission(xtszs,6);
     self.btnxtsz7.Enabled:=CheckFatherPermission(xtszs,7);
     self.btnxtsz8.Enabled:=CheckFatherPermission(xtszs,8);
     self.btnxtsz9.Enabled:=CheckFatherPermission(xtszs,9);

end;
procedure TformMain.FormCreate(Sender: TObject);
begin
   self.Position:= poScreenCenter  ;
end;

end.
