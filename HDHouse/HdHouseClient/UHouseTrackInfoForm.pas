unit UHouseTrackInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTrackInfoView, DB, ADODB;

type
  THouseTrackInfoForm = class(TForm)
    trcknfvw1: TTrackInfoView;
    qryfcgj: TADOQuery;
    dsfcgj: TDataSource;
    procedure trcknfvw1edt3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trcknfvw1btnAddAdviser1Click(Sender: TObject);
    procedure trcknfvw1btn2Click(Sender: TObject);
    procedure trcknfvw1btn1Click(Sender: TObject);
    function Validate():Boolean;
  private
    { Private declarations }
  public
    ygbh:string;
    fybh:string;
    ParmId:string;
    ParmEditorMode:string;
    { Public declarations }
  end;

var
  HouseTrackInfoForm: THouseTrackInfoForm;

implementation
   uses URealtorListForm,UHDHouseDataModule,UParametersDataModule;
{$R *.dfm}

procedure THouseTrackInfoForm.trcknfvw1edt3Click(Sender: TObject);
begin
     self.trcknfvw1btnAddAdviser1Click(Sender);
end;
  //显示窗体
procedure THouseTrackInfoForm.FormShow(Sender: TObject);
begin
    self.trcknfvw1.edt2.ReadOnly:=true;
    with self.qryfcgj do
    begin
      close;
      Parameters.ParamByName('id').Value := ParmId;
      self.trcknfvw1.edt2.Text :=ParmId;
      open;
      if(ParmEditorMode = 'EDIT') then
      begin
      self.trcknfvw1.edt6.Date:=StrToDateTime(HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_date').AsString);
      self.trcknfvw1.edt5.Time:=FormatDateTime('hh:mm:ss', StrToDateTime(HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_date').AsString));
      self.trcknfvw1.edt1.Date:=StrToDateTime(HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_datetx').AsString);
      self.trcknfvw1.edt4.Time:=FormatDateTime('hh:mm:ss', StrToDateTime(HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_datetx').AsString));
      ygbh:=HDHouseDataModule.tblTrackRecords.fieldbyname('fcgj_ygbh').AsString;
      end;
      if(ParmEditorMode = 'ADD') then
      begin
         self.qryfcgj.Edit;
         self.trcknfvw1.edt6.Date:=Now;
         self.trcknfvw1.edt1.Date:=Now;
         self.trcknfvw1.edt5.Time:='00:00:00';
         self.trcknfvw1.edt4.Time:='00:00:00';
         self.trcknfvw1.cbb1.ItemIndex:=0;
         self.trcknfvw1.dblkcbbgxfs.ListFieldIndex:=0;
      end;

      
    end;
end;

procedure THouseTrackInfoForm.trcknfvw1btnAddAdviser1Click(
  Sender: TObject);
begin
   RealtorListForm.ygxm:=self.trcknfvw1.edt3.Text;
   RealtorListForm.ShowModal;
   self.trcknfvw1.edt3.Text:= RealtorListForm.ygxm;
   ygbh:=RealtorListForm.ygbh;
end;
  //关闭
procedure THouseTrackInfoForm.trcknfvw1btn2Click(Sender: TObject);
begin
 Close;
end;
  //保存
procedure THouseTrackInfoForm.trcknfvw1btn1Click(Sender: TObject);
var checks:Boolean;
begin
  checks:=Validate();
  if not checks then
  begin
       Exit;
  end
  else
  begin
    if not self.qryfcgj.IsEmpty then
    begin
      HDHouseDataModule.con1.BeginTrans;
      self.qryfcgj.Edit;
      try
        self.qryfcgj.FindField('fcgj_date').Value := self.trcknfvw1.edt6.Text+' '+self.trcknfvw1.edt5.Text;
        self.qryfcgj.FindField('fcgj_datetx').Value:=self.trcknfvw1.edt1.Text+' '+self.trcknfvw1.edt4.Text;
        self.qryfcgj.FindField('fcgj_ygbh').Value:=ygbh;
        self.qryfcgj.FindField('fcgj_bh').Value:=self.trcknfvw1.edt2.Text;
        if( ParmEditorMode = 'ADD') then
        begin
          self.qryfcgj.FindField('fcgj_fybh').Value := fybh;
        end;
        self.qryfcgj.Post;
        HDHouseDataMOdule.con1.CommitTrans;
        HDHouseDataMOdule.tblTrackRecords.Close;
      except
        HDHouseDataMOdule.con1.RollbackTrans;
        MessageBox(handle,'数据保存失败！','警告',MB_OK);
        exit;
      end;
      end;

      MessageBox(handle,'数据保存成功！','提示',MB_OK+MB_ICONINFORMATION);
      HDHouseDataModule.tblTrackRecords.Open;
      close;
   end;
end;
function THouseTrackInfoForm.Validate():Boolean;
begin
    if self.trcknfvw1.edt2.Text='' then
    begin
      MessageBox(handle,'编号不能为空','提示',MB_OK+MB_ICONINFORMATION);
      self.trcknfvw1.edt2.SetFocus;
      Result :=False;
      Exit;
    end;
    if( self.trcknfvw1.edt6.Text='')then
    begin
      MessageBox(handle,'日期不能为空','提示',MB_OK+MB_ICONINFORMATION);
      self.trcknfvw1.edt6.SetFocus;
      Result :=False;
      Exit;
    end;
    if( self.trcknfvw1.edt1.Text='')then
    begin
      MessageBox(handle,'日期不能为空','提示',MB_OK+MB_ICONINFORMATION);
      self.trcknfvw1.edt1.SetFocus;
      Result :=False;
      Exit;
    end;
    if( self.trcknfvw1.dblkcbbgxfs.Text='')then
    begin
      MessageBox(handle,'跟进方式不能为空','提示',MB_OK+MB_ICONINFORMATION);
      self.trcknfvw1.dblkcbbgxfs.SetFocus;
      Result :=False;
      Exit;
    end;
    if( self.trcknfvw1.edt3.Text='')then
    begin
      MessageBox(handle,'跟进员工不能为空','提示',MB_OK+MB_ICONINFORMATION);
      self.trcknfvw1.edt3.SetFocus;
      Result :=False;
      Exit;
    end;
    if( self.trcknfvw1.cbb1.Text='')then
    begin
      MessageBox(handle,'跟进方式不能为空','提示',MB_OK+MB_ICONINFORMATION);
      self.trcknfvw1.cbb1.SetFocus;
      Result :=False;
      Exit;
    end;
    result:=True;
end;
end.
