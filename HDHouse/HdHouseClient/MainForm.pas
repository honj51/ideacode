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
    btn8: TbsSkinButton;
    btn9: TbsSkinButton;
    btn10: TbsSkinButton;
    btn11: TbsSkinButton;
    btn12: TbsSkinButton;
    btn13: TbsSkinButton;
    btn14: TbsSkinButton;
    btn15: TbsSkinButton;
    btn16: TbsSkinButton;
    btn17: TbsSkinButton;
    btn18: TbsSkinButton;
    btn19: TbsSkinButton;
    btn20: TbsSkinButton;
    btn21: TbsSkinButton;
    btn22: TbsSkinButton;
    btn23: TbsSkinButton;
    btn24: TbsSkinButton;
    btn25: TbsSkinButton;
    bskntbsht3: TbsSkinTabSheet;
    btn26: TbsSkinButton;
    btn27: TbsSkinButton;
    btn28: TbsSkinButton;
    btn29: TbsSkinButton;
    btn30: TbsSkinButton;
    btn31: TbsSkinButton;
    frmhslst1: TframeHouseList;
    frxDBDatasetfczy: TfrxDBDataset;
    frxReportfczy: TfrxReport;
    tmr1: TTimer;
    qrytx: TADOQuery;
    bsSkinFrame1: TbsSkinFrame;
    procedure btn7Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn23Click(Sender: TObject);
    procedure btn25Click(Sender: TObject);
    procedure btn24Click(Sender: TObject);
    procedure btn22Click(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure btn28Click(Sender: TObject);
    procedure btn29Click(Sender: TObject);
    procedure btn27Click(Sender: TObject);
    procedure btn26Click(Sender: TObject);
    procedure btn30Click(Sender: TObject);
    procedure btn31Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn18Click(Sender: TObject);
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

procedure TformMain.btn10Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',6)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
         EmployeeManageForm.ShowModal;
    end;
    
end;

procedure TformMain.btn8Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       CompanyInfoSettingForm.ParmId:='001';
       CompanyInfoSettingForm.ShowModal;
    end;
end;

procedure TformMain.btn12Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',1)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
     OperatePermissionSettingForm.ShowModal;
    end;
end;

procedure TformMain.btn14Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',2)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       ChangePasswordForm.ShowModal;
    end;
    
end;

procedure TformMain.btn16Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',8)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        ContractSampleSettingForm.ShowModal;
    end;
 
end;

procedure TformMain.btn9Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',3)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        DatabaseMantainForm.ShowModal;
    end;
     
end;

procedure TformMain.btn11Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',4)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        DatabaseInitialForm.ShowModal;
    end;
 
end;

procedure TformMain.btn13Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',5)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
          ParametersSettingForm.ShowModal;
    end;
   
end;

procedure TformMain.btn15Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_xtsz',7)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       SystemOperationLogForm.ShowModal;
    end;
  
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

procedure TformMain.btn23Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sfgl',2)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
           HouseDealManageForm.ShowModal;
    end;

end;

procedure TformMain.btn25Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sfgl',1)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
      HouseTrackForm.ShowModal;
    end;
  
end;

procedure TformMain.btn24Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sfgl',3)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        HousePosterForm.ShowModal;
    end;
end;

procedure TformMain.btn22Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sfgl',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        HouseManageForm.ShowModal;
    end;
end;

procedure TformMain.btn19Click(Sender: TObject);
begin

    if not(CheckPermission('Qx_cx',2)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       ContractQueryForm.ShowModal;
    end;
end;

procedure TformMain.btn20Click(Sender: TObject);
begin
   CustomerTrackForm.ShowModal;
end;

procedure TformMain.btn21Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_cx',3)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       ContactRecordForm.ShowModal;
    end;
end;

procedure TformMain.btn28Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sqfw',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
      HouseStatisticQueryForm.ShowModal;
    end;
end;

procedure TformMain.btn29Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sqfw',4)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       CustomerManageForm.ShowModal;
    end;
end;

procedure TformMain.btn27Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sqfw',1)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
      NotificationManageForm.ShowModal;
    end;
  
end;

procedure TformMain.btn26Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sqfw',2)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       SalesCommissionDetailsForm.ShowModal;
    end;
end;

procedure TformMain.btn30Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sqfw',3)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       SalesCommissionSumForm.ShowModal;
    end;
end;

procedure TformMain.btn31Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_sqfw',5)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        StatisticForm.ShowModal;
    end;
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

procedure TformMain.btn18Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_cx',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        CustomerManageForm.ShowModal;
    end;
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
      Finally
          //HouseDetailsForm.Free;
      End;
    end;

end;

procedure TformMain.frmhslst1bsSkinButton1Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_rcgl',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        HouseQueryForm.hsqryfrm1.cbb5.ItemIndex:=0;
        HouseQueryForm.ShowModal;
        frmhslst1.qryHouseList.Close;
        frmhslst1.qryHouseList.SQL.Clear;
        frmhslst1.qryHouseList.SQL.Add(HouseQueryForm.strFilter) ;
        frmhslst1.qryHouseList.Open;
    end;

end;

procedure TformMain.frmhslst1bsSkinButton2Click(Sender: TObject);
begin
    if not(CheckPermission('Qx_rcgl',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        HouseQueryForm.hsqryfrm1.cbb5.ItemIndex:=1;
        HouseQueryForm.ShowModal;
        frmhslst1.qryHouseList.Close;
        frmhslst1.qryHouseList.SQL.Clear;
        frmhslst1.qryHouseList.SQL.Add(HouseQueryForm.strFilter) ;
        frmhslst1.qryHouseList.Open;
    end;

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
    if not(CheckPermission('Qx_rcgl',2)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
        if self.frxReportfczy.PrepareReport then
        begin
           self.frxReportfczy.ShowPreparedReport;
        end;
    end;

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
    if not(CheckPermission('Qx_rcgl',0)) then
    begin
     self.bsknmsg1.MessageDlg2('你没有权限访问','权限提示', mtConfirmation, [mbYes],0) ;
    end
    else
    begin
       frmhslst1.bsSkinButtonLabel2Click(Sender);
    end;
end;

procedure TformMain.btn5Click(Sender: TObject);
begin
 formLock.ShowModal;
end;

end.
