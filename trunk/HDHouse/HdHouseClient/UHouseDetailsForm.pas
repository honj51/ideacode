unit UHouseDetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, bsSkinExCtrls, StdCtrls, Mask, bsSkinBoxCtrls,
  ComCtrls, bsSkinTabs, BusinessSkinForm, bsdbctrls, bsSkinData, ImgList,
  bsPngImageList, DB, ADODB, UHouseSecureInfoView, DBCtrls;

type
  THouseDetailsForm = class(TForm)
    bsknpgcntrlPageC: TbsSkinPageControl;
    bskntbshttab1: TbsSkinTabSheet;
    bskntbshttab2: TbsSkinTabSheet;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    edtfczy_wylb: TbsSkinDBEdit;
    edtfczy_jtdz: TbsSkinDBEdit;
    edtfczy_ws: TbsSkinDBEdit;
    edtfczy_lc: TbsSkinDBEdit;
    edtfczy_lczs: TbsSkinDBEdit;
    edtfczy_ptss2: TbsSkinDBEdit;
    edtfczy_ptss1: TbsSkinDBEdit;
    btnAddAdviser1: TbsSkinSpeedButton;
    btnAddAdviser2: TbsSkinSpeedButton;
    edtfczy_mj: TbsSkinDBEdit;
    bsPngImageList1: TbsPngImageList;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    qry1: TADOQuery;
    dsfczyinfo: TDataSource;
    bskngrpbx1: TbsSkinGroupBox;
    bsSkinDBCheckRadioBox2: TbsSkinDBCheckRadioBox;
    bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox;
    edtfczy_sj: TbsSkinDBEdit;
    edtfczy_zj: TbsSkinDBEdit;
    edtfczy_cssm: TbsSkinDBEdit;
    edtfczy_czsm: TbsSkinDBEdit;
    bskngrpbx2: TbsSkinGroupBox;
    mmoHouseInfo: TbsSkinDBMemo;
    bsknpnl1: TbsSkinPanel;
    edtfczy_fwly: TbsSkinDBEdit;
    dblkcbbfczy_qy1: TDBLookupComboBox;
    dblkcbbfczy_fwlx: TDBLookupComboBox;
    dblkcbbfczy_qy3: TDBLookupComboBox;
    dblkcbbfczy_qy: TDBLookupComboBox;
    dblkcbbfczy_wyyt: TDBLookupComboBox;
    dblkcbbfczy_wylx: TDBLookupComboBox;
    dblkcbbfczy_zxcd: TDBLookupComboBox;
    edtfczy_jcnf: TbsSkinDBEdit;
    edtfczy_kt: TbsSkinDBEdit;
    edtfczy_wc: TbsSkinDBEdit;
    edtfczy_yt: TbsSkinDBEdit;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    dblkcbbfczy_dqzt: TDBLookupComboBox;
    edt1: TbsSkinMaskEdit;
    bsSkinStdLabel8: TbsSkinStdLabel;
    bsSkinStdLabel9: TbsSkinStdLabel;
    bsSkinStdLabel6: TbsSkinStdLabel;
    edtfczy_yzxm: TbsSkinDBEdit;
    edtfczy_jtwz: TbsSkinDBEdit;
    mmofczy_yzxm: TbsSkinDBMemo;
    edtfczy_yzxm1: TbsSkinDBEdit;
    bsSkinStdLabel7: TbsSkinStdLabel;
    edtfczy_tel: TbsSkinDBEdit;
    bsSkinStdLabel10: TbsSkinStdLabel;
    bsSkinStdLabel11: TbsSkinStdLabel;
    bsSkinStdLabel12: TbsSkinStdLabel;
    bsSkinStdLabel13: TbsSkinStdLabel;
    bsSkinStdLabel14: TbsSkinStdLabel;
    bsSkinStdLabel15: TbsSkinStdLabel;
    bsSkinStdLabel16: TbsSkinStdLabel;
    bsSkinStdLabel17: TbsSkinStdLabel;
    bsSkinStdLabel18: TbsSkinStdLabel;
    bsSkinStdLabel19: TbsSkinStdLabel;
    bsSkinStdLabel20: TbsSkinStdLabel;
    bsSkinStdLabel21: TbsSkinStdLabel;
    bsSkinStdLabel22: TbsSkinStdLabel;
    bsSkinStdLabel23: TbsSkinStdLabel;
    bsSkinStdLabel24: TbsSkinStdLabel;
    bsSkinStdLabel25: TbsSkinStdLabel;
    bsSkinStdLabel26: TbsSkinStdLabel;
    bsSkinStdLabel27: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinStdLabel28: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel29: TbsSkinStdLabel;
    bsSkinStdLabel30: TbsSkinStdLabel;
    bsSkinStdLabel31: TbsSkinStdLabel;
    bsSkinStdLabel32: TbsSkinStdLabel;
    bsSkinStdLabel33: TbsSkinStdLabel;
    bsSkinStdLabel34: TbsSkinStdLabel;
    bsSkinStdLabel35: TbsSkinStdLabel;
    bsSkinStdLabel36: TbsSkinStdLabel;
    bsSkinStdLabel37: TbsSkinStdLabel;
    btn1: TbsSkinSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnAddAdviser1Click(Sender: TObject);
    procedure btnAddAdviser2Click(Sender: TObject);
    procedure edtfczy_fwlyClick(Sender: TObject);
    function Validate():Boolean;
    procedure btn1Click(Sender: TObject);
    procedure edtfczy_ptss1Click(Sender: TObject);
    procedure edtfczy_ptss2Click(Sender: TObject);
  private
    { Private declarations }
  public
    ParmEditorMode:string;
    ParmId:string;
    ygbh:string;
    { Public declarations }
  end;

var



    HouseDetailsForm: THouseDetailsForm;

implementation
  uses UHDHouseDataModule,UParametersDataModule,URealtorListForm,UHouseManageForm,UBaseFacilitiesForm,UOtherFacilitiesForm,Common;
{$R *.dfm}
 //��ʾ
procedure THouseDetailsForm.FormShow(Sender: TObject);
var pream:string;
var datecount:Integer;
begin
   HDHouseDataModule.qryfczy.Active:=true;  //�𶯿ؼ�
    self.edt1.ReadOnly:=true;
    with self.qry1 do
    begin
      close;
      Parameters.ParamByName('id').Value := ParmId;
      self.edt1.Text :=ParmId;
      open;
      if( ParmEditorMode = 'ADD') then
      begin
           pream:='FC'+FormatDateTime('yyyymmdd',Now);
           HDHouseDataModule.qryfczy.Filter:='(fczy_bh like '+'''%'+pream+'%'')';
           HDHouseDataModule.qryfczy.Filtered:=true;
           datecount:= HDHouseDataModule.qryfczy.Recordset.RecordCount+1;
            with HDHouseDataModule.dsfczy.DataSet do
            begin
              First;
              while not Eof do
              begin
                if Trim(VarToStr(FieldValues['fczy_bh']))= Trim(pream + Format('%.4d', [datecount] )) then
                begin
                  datecount:=datecount+1;
                end;
                Next;
                end;
              end;
           HDHouseDataModule.qryfczy.Filtered :=false;
           self.edt1.Text:=pream + Format('%.4d', [datecount] );
           //��Ĭ��ֵ self.qry1.FieldByName('').Value:=
           self.qry1.Edit;
           self.qry1.FieldByName('fczy_ws').Value:=0;
           self.qry1.FieldByName('fczy_kt').Value:=0;
           self.qry1.FieldByName('fczy_wc').Value:=0;
           self.qry1.FieldByName('fczy_yt').Value:=0;
           self.qry1.FieldByName('fczy_jzmj').Value:=0;
           self.qry1.FieldByName('fczy_lczs').Value:=0;
           self.qry1.FieldByName('fczy_lc').Value:=0;
           self.qry1.FieldByName('fczy_ptss1').Value:='��';
           self.qry1.FieldByName('fczy_ptss2').Value:='��';
           self.qry1.FieldByName('fczy_zj').Value:=0;
           self.qry1.FieldByName('fczy_sj').Value:=0;
           self.dblkcbbfczy_qy.ListFieldIndex:=1;
      end;

    end;
end;
  //���� ����
procedure THouseDetailsForm.btn2Click(Sender: TObject);
var zs:string;
var checks:Boolean;
begin
  inherited;
  checks:=Validate();
  if not checks then
  begin
       Exit;
  end
  else
  begin
    if not qry1.IsEmpty then
    begin
      qry1.Edit;
      HDHouseDataModule.con1.BeginTrans;
      try
        self.qry1.FindField('fczy_hxjg').Value :=self.edtfczy_ws.Text+'��'+self.edtfczy_kt.Text+'��'+self.edtfczy_wc.Text+'��'+self.edtfczy_yt.Text+'��';
        self.qry1.FindField('fczy_lccg').Value :=self.edtfczy_lczs.Text+'/'+self.edtfczy_lc.Text;
        self.qry1.FindField('fczy_zhrq').Value :=FormatDateTime('yyyy-mm-dd',Now);
        self.qry1.FindField('fczy_bh').Value := self.edt1.Text;
        if( ParmEditorMode = 'ADD') then
        begin
           self.qry1.FindField('fczy_djrq').Value := FormatDateTime('yyyy-mm-dd',Now);
           self.qry1.FindField('fczy_yn').Value := false;
           self.qry1.FindField('fczy_czy').Value :=gs_login_username;
           if (self.bsSkinDBCheckRadioBox1.Checked and self.bsSkinDBCheckRadioBox2.Checked=false) then
           begin
               zs:='����';
           end
           else if (self.bsSkinDBCheckRadioBox2.Checked and self.bsSkinDBCheckRadioBox1.Checked=false) then
           begin
               zs:='����'
           end
           else if(self.bsSkinDBCheckRadioBox2.Checked and self.bsSkinDBCheckRadioBox1.Checked)  then
           begin
               zs:='����'
           end;
            self.qry1.FindField('fczy_zs').Value :=zs;

           end;
        self.qry1.UpdateBatch;
        HDHouseDataMOdule.con1.CommitTrans;
      except
        HDHouseDataMOdule.con1.RollbackTrans;
        MessageBox(handle,'���ݱ���ʧ�ܣ�','����',MB_OK);
        exit;
      end;
      end;
      MessageBox(handle,'���ݱ���ɹ���','��ʾ',MB_OK+MB_ICONINFORMATION);
       close;
   end;
end;

procedure THouseDetailsForm.btn3Click(Sender: TObject);
begin
  close;
end;

  //������ʩ
procedure THouseDetailsForm.btnAddAdviser1Click(Sender: TObject);
begin
   BaseFacilitiesForm.SelectItems:=self.edtfczy_ptss1.Text;
   BaseFacilitiesForm.ShowModal;
   self.qry1.Edit;
   self.qry1.FieldByName('fczy_ptss1').Value:=BaseFacilitiesForm.SelectItems;
end;
 //������ʩ
procedure THouseDetailsForm.btnAddAdviser2Click(Sender: TObject);
begin
   OtherFacilitiesForm.SelectItems:=self.edtfczy_ptss2.Text;
   OtherFacilitiesForm.ShowModal;
   self.qry1.Edit;
   self.qry1.FieldByName('fczy_ptss2').Value:=OtherFacilitiesForm.SelectItems;
end;
procedure THouseDetailsForm.edtfczy_fwlyClick(Sender: TObject);
var ygxm:string;
begin
   RealtorListForm.ygxm := self.edtfczy_fwly.Text;
   RealtorListForm.ShowModal;
   self.qry1.Edit;
   self.qry1.FieldByName('fczy_fwly').Value:=RealtorListForm.ygxm;
   if RealtorListForm.ygbh<>''then
   self.qry1.FieldByName('fczy_ygbh').Value:=RealtorListForm.ygbh
end;
function THouseDetailsForm.Validate():Boolean;
begin
    if dblkcbbfczy_qy.Text='' then
    begin
      MessageBox(handle,'��ѡ�񷿲���Դ','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_qy.SetFocus;
      Result:=False;
      Exit;
    end;
    if dblkcbbfczy_dqzt.Text='' then
    begin
      MessageBox(handle,'��ѡ��ǰ״̬','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_dqzt.SetFocus;
      Result :=False;
      Exit;
    end;
    if edtfczy_fwly.Text='' then
    begin
      MessageBox(handle,'��ҵ���ʲ���Ϊ��','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      edtfczy_fwly.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_wyyt.Text='' then
    begin
      MessageBox(handle,'��ѡ����ҵ��;','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_wyyt.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_wylx.Text='' then
    begin
      MessageBox(handle,'��ѡ����ҵ����','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_wylx.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_zxcd.Text='' then
    begin
      MessageBox(handle,'��ѡ��װ�޳ɶ�','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_zxcd.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_qy1.Text='' then
    begin
      MessageBox(handle,'��ѡ����������','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_qy1.SetFocus;
      Result :=False;
      Exit;
    end;
    if dblkcbbfczy_fwlx.Text='' then
    begin
      MessageBox(handle,'��ѡ����','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      dblkcbbfczy_fwlx.SetFocus;
      Result :=False;
      Exit;
    end;
    if edtfczy_jcnf.Text='' then
    begin
      MessageBox(handle,'��ݲ���Ϊ��','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=0;
      edtfczy_jcnf.SetFocus;
      Result :=False;
      Exit;
    end;
    if (bsSkinDBCheckRadioBox1.Checked<>true) and ( bsSkinDBCheckRadioBox2.Checked<>true) then
    begin
      MessageBox(handle,'����ѡ������������','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsSkinDBCheckRadioBox1.SetFocus;
      Result :=False;
      Exit;
    end;
    if self.edtfczy_yzxm.Text='' then
    begin
      MessageBox(handle,'ҵ����������Ϊ��','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=1;
      edtfczy_yzxm.SetFocus;
      Result :=False;
      Exit;
    end;
    if (self.edtfczy_yzxm1.Text='') and (self.edtfczy_tel.Text='') then
    begin
      MessageBox(handle,'������д��ϵ�绰','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=1;
      edtfczy_yzxm1.SetFocus;
      Result :=False;
      Exit;
    end;
    if self.edtfczy_jtwz.Text='' then
    begin
      MessageBox(handle,'����λ�ò���Ϊ��','��ʾ',MB_OK+MB_ICONINFORMATION);
      bsknpgcntrlPageC.TabIndex:=1;
      edtfczy_jtwz.SetFocus;
      Result :=False;
      Exit;
    end;
     result:=True;
end;
//
procedure THouseDetailsForm.btn1Click(Sender: TObject);
begin
   edtfczy_fwlyClick(Sender);
end;

procedure THouseDetailsForm.edtfczy_ptss1Click(Sender: TObject);
begin
btnAddAdviser1Click(Sender);
end;

procedure THouseDetailsForm.edtfczy_ptss2Click(Sender: TObject);
begin
btnAddAdviser2Click(Sender);
end;

end.
