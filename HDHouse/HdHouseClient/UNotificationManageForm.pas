unit UNotificationManageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, bsSkinGrids, bsDBGrids,
  bsSkinCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, UDataOperateBarView, DB,
  ADODB, DBCtrls, BusinessSkinForm, frxClass, frxDBSet, frxExportXML, Menus;

type
  TNotificationManageForm = class(TForm)
    bvl1: TBevel;
    dtprtbrvw1: TDataOperateBarView;
    btn4: TbsSkinButton;
    btn3: TbsSkinButtonLabel;
    lbl4: TbsSkinStdLabel;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    lbl2: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    edt2: TbsSkinEdit;
    bskndbgrd1: TbsSkinDBGrid;
    ds1: TDataSource;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    frxXMLExport1: TfrxXMLExport;
    frxrprt1: TfrxReport;
    frxDBDatasetddd: TfrxDBDataset;
    cbb1: TbsSkinComboBox;
    qry1: TADOQuery;
    pm1: TPopupMenu;
    V1: TMenuItem;
    X1: TMenuItem;
    Y1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure dtprtbrvw1btn2Click(Sender: TObject);
    procedure dtprtbrvw1btn1Click(Sender: TObject);
    procedure dtprtbrvw1btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure tbl1CalcFields(DataSet: TDataSet);
    procedure btn3Click(Sender: TObject);
    procedure dtprtbrvw1btn5Click(Sender: TObject);
    procedure dtprtbrvw1btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clock();
    procedure cbb1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificationManageForm: TNotificationManageForm;

implementation
uses
  UHDHouseDataModule, UNotificationInfoForm,Math,URealtorListForm,Common,IniFiles,MainForm;
{$R *.dfm}

procedure TNotificationManageForm.dtprtbrvw1btn2Click(Sender: TObject);
begin
    NotificationInfoForm.ParmId:=self.qry1.FieldByName('zdtx_bh').AsString;
    NotificationInfoForm.ParmEditorMode:='EDIT';
    NotificationInfoForm.ShowModal;
    MainForm.formMain.qrytx.Close;
    MainForm.formMain.qrytx.Open;
    self.qry1.Close;
    self.qry1.Open;
end;

procedure TNotificationManageForm.dtprtbrvw1btn1Click(Sender: TObject);
begin
  with qry1 do
  begin
      NotificationInfoForm.ParmEditorMode:='ADD';
      NotificationInfoForm.ParmId:='';
      NotificationInfoForm.ShowModal;
      MainForm.formMain.qrytx.Close;
      MainForm.formMain.qrytx.Open;
      Close;
      Open;
  end;
end;

procedure TNotificationManageForm.dtprtbrvw1btn3Click(Sender: TObject);
begin
    Try
      if HDHouseDataModule.bsknmsg_msg.CustomMessageDlg('删除后无法恢复，确定删除吗？', '提示', nil, -1, [mbOK,mbCancel], 0)=2 then
      begin
          Exit;
      end;
      self.qry1.Delete;
    Finally
        //HouseDetailsForm.Free;
    End;

end;

procedure TNotificationManageForm.btn4Click(Sender: TObject);
begin
  qry1.Locate('zdtx_xm',edt1.Text, [loPartialKey]);
end;

procedure TNotificationManageForm.tbl1CalcFields(DataSet: TDataSet);
begin
  with qry1 do
  begin
    FieldByName('test').Value := FieldByName('zdtx_xm').Value + ' - '+ FieldByName('zdtx_dh').Value;
  end;  
end;

procedure TNotificationManageForm.btn3Click(Sender: TObject);
var ygxm:string;
begin
   RealtorListForm.ygxm :=self.edt1.Text;
   RealtorListForm.ShowModal;
   self.edt1.Text:=RealtorListForm.ygxm;
   self.qry1.Locate('zdtx_xm',edt1.Text, [loPartialKey]);
end;

procedure TNotificationManageForm.dtprtbrvw1btn5Click(Sender: TObject);
begin
 if self.frxrprt1.PrepareReport then
 begin
    self.frxrprt1.ShowPreparedReport;
 end;
end;

procedure TNotificationManageForm.dtprtbrvw1btn4Click(Sender: TObject);
begin
   if self.frxrprt1.PrepareReport then
   begin
     self.frxrprt1.Export(self.frxXMLExport1);
   end;
end;

procedure TNotificationManageForm.FormShow(Sender: TObject);
begin
  self.cbb1.ItemIndex:=0;
  self.qry1.Active:=true;
  self.bsknchckrdbx1.Checked:=MainForm.formMain.sound;
  self.bsknchckrdbx2.Checked:=MainForm.formMain.del;
  self.edt2.Text:=PAnsiChar(MainForm.formMain.close);
end;
procedure TNotificationManageForm.clock();
var myinifile:Tinifile;
var inifile:string;
begin
   //  取INI配置文件中的值！！
   inifile:=ExtractFilePath(Paramstr (0))+'weekup.ini';
   myinifile:=Tinifile.Create(inifile); //打开INI文件
   myinifile.WriteString('clock','close',self.edt2.Text);
   MainForm.formMain.close:= self.edt2.Text;
   myinifile.WriteBool('clock','sound',self.bsknchckrdbx1.Checked);
   MainForm.formMain.sound:=self.bsknchckrdbx1.Checked;
   myinifile.WriteBool('clock','del',self.bsknchckrdbx2.Checked);
   MainForm.formMain.del:=self.bsknchckrdbx2.Checked;
   myinifile.Destroy;
end;
  //
procedure TNotificationManageForm.cbb1Change(Sender: TObject);
var sql:string;
begin
  sql:='select * from zdtx ';
  if Trim(self.cbb1.Text)='已提醒' then
  begin
     sql:='select * from zdtx where zdtx_bj=''N''';
  end
  else if Trim(self.cbb1.Text)='未提醒'then
  begin
     sql:='select * from zdtx where zdtx_bj=''Y''';
  end;
  self.qry1.Close;
  self.qry1.SQL.Clear;
  self.qry1.SQL.Add(sql);
  self.qry1.Open;
end;

procedure TNotificationManageForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 self.clock;
end;

procedure TNotificationManageForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
   NotificationManageForm:=nil;
end;

end.
