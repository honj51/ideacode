unit UContractInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, ExtCtrls, bsSkinCtrls,
  bsSkinGrids, bsDBGrids, bscalc, DB, ADODB, BusinessSkinForm, ImgList,
  bsPngImageList;

type
  TContractInfo = class(TForm)
    bvl1: TBevel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bskngrpbx1: TbsSkinGroupBox;
    bskngrpbx2: TbsSkinGroupBox;
    bskngrpbx3: TbsSkinGroupBox;
    bskndbgrd1: TbsSkinDBGrid;
    btn1: TbsSkinButton;
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinStdLabel6: TbsSkinStdLabel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    edtcjxx_lxsj: TbsSkinDBEdit;
    edtcjxx_lxdz: TbsSkinDBEdit;
    bsSkinStdLabel8: TbsSkinStdLabel;
    bsSkinStdLabel9: TbsSkinStdLabel;
    edtcjxx_khbh: TbsSkinDBEdit;
    edtcjxx_lxdh: TbsSkinDBEdit;
    edtcjxx_khxb: TbsSkinDBEdit;
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
    edtcjxx_htbh: TbsSkinDBEdit;
    edtcjxx_bz: TbsSkinDBEdit;
    bsSkinDBDateEdit1: TbsSkinDBDateEdit;
    edtcjxx_sfzh: TbsSkinDBEdit;
    bsSkinDBCurrencyEdit1: TbsSkinDBCurrencyEdit;
    bsSkinDBCurrencyEdit2: TbsSkinDBCurrencyEdit;
    bsSkinDBCurrencyEdit3: TbsSkinDBCurrencyEdit;
    bsSkinDBCurrencyEdit4: TbsSkinDBCurrencyEdit;
    bsSkinDBCurrencyEdit6: TbsSkinDBCurrencyEdit;
    bsSkinDBCurrencyEdit7: TbsSkinDBCurrencyEdit;
    btn4: TbsSkinButton;
    btn5: TbsSkinButton;
    bskndbtxtcjxx_bz1: TbsSkinDBText;
    bskndbtxtcjxx_yzxm: TbsSkinDBText;
    qry1: TADOQuery;
    ds1: TDataSource;
    bsknchckrdbx1: TbsSkinCheckRadioBox;
    bsknchckrdbx2: TbsSkinCheckRadioBox;
    qry2: TADOQuery;
    ds2: TDataSource;
    cbbcjxx_bz: TbsSkinDBComboBox;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    btnAddAdviser1: TbsSkinSpeedButton;
    bspngmglst1: TbsPngImageList;
    dskhzy: TDataSource;
    qrykhzy: TADOQuery;
    cbbcjxx_bz1: TbsSkinDBComboBox;
    bskndbtxtcjxx_fybh: TbsSkinDBText;
    procedure FormShow(Sender: TObject);
    procedure cbbcjxx_bzChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure  czorcs;
    procedure bsknchckrdbx2Click(Sender: TObject);
    procedure bsknchckrdbx1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnAddAdviser1Click(Sender: TObject);
  private
    { Private declarations }
  public
    ParmEditorMode:string;   //״̬
    ParmId,fczy_bh,fczy_ygxm,fczy_wymc,htbh:string;  //��Դ���
    isCreate:Boolean;
    { Public declarations }
  end;

var
  ContractInfo: TContractInfo;

implementation
   uses UHDHouseDataModule,UCustomerListForm,UDivideIntoInfo,Math;
{$R *.dfm}

procedure TContractInfo.FormShow(Sender: TObject);
begin
  self.qry1.Active:=true;
  self.qry2.Active:=true;
  self.qrykhzy.Active:=true;
    with self.qry1 do
    begin
      close;
      Parameters.ParamByName('id').Value := ParmId;
      open;
      Edit;
      if( ParmEditorMode = 'ADD') then
      begin
         self.bsSkinDBDateEdit1.Date:=Now;
         self.cbbcjxx_bz.ItemIndex:=0;
         self.cbbcjxx_bz1.ItemIndex:=0;
         self.qry1.FieldByName('cjxx_fybh').Value:=fczy_bh; //��Դ���
         self.qry1.FieldByName('cjxx_yzxm').Value:=fczy_ygxm; //ҵ������
         self.qry1.FieldByName('cjxx_wymc').Value:=fczy_wymc;//��������
         self.qry1.FieldByName('cjxx_khbh').Value:=htbh;//  �ͻ����
         self.qry1.FieldByName('cjxx_htbh').Value:=htbh;//��ͬ���
      end;
      self.czorcs;
    end;
    with self.qry2  do
    begin
      close;
      Parameters.ParamByName('id').Value := ParmId;
      open;
      if( ParmEditorMode = 'ADD') then
      begin
          Append;
          Randomize;//��ʼ
          FieldByName('tcxx_bh').Value:=IntToStr(RandomRange(10000000,99999999));  //���
          FieldByName('tcxx_tcsm').Value:='ǩԼ�ֳ�';   // ���˵��
          if self.bsknchckrdbx1.Checked then
          begin
            FieldByName('tcxx_jylx').Value := '����';
          end
          else
          begin
            FieldByName('tcxx_jylx').Value := '����';
          end;
          FieldByName('tcxx_fybh').Value:=self.qry1.FieldByName('cjxx_htbh').Value;  //��Դ���
          FieldByName('tcxx_cjsl').Value := '1'; // TODO: ��ֵ����ȷ
          FieldByName('tcxx_htbh').Value :=self.edtcjxx_htbh.Text;
          FieldByName('tcxx_yj').Value := qry1.FieldByName('cjxx_yjze').Value;
          FieldByName('tcxx_ztc').Value := '0'; // TODO: ��ֵ����ȷ qry1.FieldByName('cjxx_tcje').Value;;
          //FieldByName('tcxx_tcbl').Value := '';
          FieldByName('tcxx_tcje').Value := qry1.FieldByName('cjxx_tcje').Value;;
          FieldByName('tcxx_tcdate').Value := Now;
          FieldByName('tcxx_htbh').Value := qry1.FieldByName('cjxx_htbh').Value;
          //FieldByName('tcxx_tcsm').Value := '';
          FieldByName('tcxx_czy').Value := 'admin'; // TODO: Ҫ�����ʵ����Ա
          FieldByName('tcxx_fybh').Value := qry1.FieldByName('cjxx_fybh').Value;
          FieldByName('tcxx_tcje').Value := '100';
          FieldByName('tcxx_blmc').Value :='100%';
          FieldByName('tcxx_tcbl').Value := 1;
          FieldByName('tcxx_zygw').Value:=HDHouseDataModule.qryfczy.FieldByName('fczy_fwly').AsString;
          FieldByName('tcxx_ygbh').Value:=HDHouseDataModule.qryfczy.FieldByName('fczy_ygbh').AsString;
      end;
    end;
    if Trim(qry1.FindField('cjxx_czxs').AsString)='Z' then
    begin
          self.bsknchckrdbx1.Checked:=true;
    end
    else
    begin
          self.bsknchckrdbx2.Checked:=true;
    end;
end;
 //�ͻ����͸ı�ʱ
procedure TContractInfo.cbbcjxx_bzChange(Sender: TObject);
begin
  if (Trim(self.cbbcjxx_bz.Text)<>'�¿ͻ�') then
  begin
     btnAddAdviser1Click(Sender);
  end;
end;
 //��ӷֳɳ�Ա
procedure TContractInfo.btn1Click(Sender: TObject);
begin
  with qry2 do
  begin
    Append;
    Randomize;//��ʼ
    FieldByName('tcxx_bh').Value:=IntToStr(RandomRange(10000000,99999999));  //���
    FieldByName('tcxx_tcsm').Value:='ǩԼ�ֳ�';   // ���˵��
    if self.bsknchckrdbx1.Checked then
    begin
      FieldByName('tcxx_jylx').Value := '����';
    end
    else
    begin
      FieldByName('tcxx_jylx').Value := '����';
    end;
    FieldByName('tcxx_fybh').Value:=self.qry1.FieldByName('cjxx_htbh').Value;  //��Դ���
    FieldByName('tcxx_cjsl').Value := '1'; // TODO: ��ֵ����ȷ
    FieldByName('tcxx_htbh').Value :=self.edtcjxx_htbh.Text;
    FieldByName('tcxx_yj').Value := qry1.FieldByName('cjxx_yjze').Value;
    FieldByName('tcxx_ztc').Value := '0'; // TODO: ��ֵ����ȷ qry1.FieldByName('cjxx_tcje').Value;;
    //FieldByName('tcxx_tcbl').Value := '';
    FieldByName('tcxx_tcje').Value := qry1.FieldByName('cjxx_tcje').Value;;
    FieldByName('tcxx_tcdate').Value := Now;
    FieldByName('tcxx_htbh').Value := qry1.FieldByName('cjxx_htbh').Value;
    //FieldByName('tcxx_tcsm').Value := '';
    FieldByName('tcxx_czy').Value := 'admin'; // TODO: Ҫ�����ʵ����Ա
    FieldByName('tcxx_fybh').Value := qry1.FieldByName('cjxx_fybh').Value;
    FieldByName('tcxx_tcbl').Value :=1;
    DivideIntoInfo.ShowModal;
  end;
end;

procedure TContractInfo.btn2Click(Sender: TObject);
begin
    self.qry2.Edit;
    //DivideIntoInfo.ParmEditorMode:='EDIT';
    DivideIntoInfo.ShowModal;
end;

procedure TContractInfo.btn3Click(Sender: TObject);
begin
    if not qry2.IsEmpty then
    begin
      qry2.Delete;
    end;
end;
procedure TContractInfo.czorcs;
begin
  if(self.bsknchckrdbx1.Checked )then
  begin
    self.bsSkinStdLabel21.Visible:=true;
    self.bsSkinDBDateEdit1.Visible:=true;
  end
  else
  begin
     self.bsSkinStdLabel21.Visible:=false;
    self.bsSkinDBDateEdit1.Visible:=false;
  end;
end;
procedure TContractInfo.bsknchckrdbx2Click(Sender: TObject);
begin
 self.czorcs;
end;

procedure TContractInfo.bsknchckrdbx1Click(Sender: TObject);
begin
 self.czorcs;
end;
 //����
procedure TContractInfo.btn4Click(Sender: TObject);
begin
   with qry1 do
   begin
       if self.bsknchckrdbx1.Checked then
       begin
            FieldByName('cjxx_czssqk').Value := '����';
            FieldByName('cjxx_czxs').Value := 'Z';
       end
       else
       begin
            FieldByName('cjxx_czssqk').Value := '����';
          FieldByName('cjxx_czxs').Value := 'S';
       end;
       if( ParmEditorMode = 'ADD') then
       begin
         FieldByName('cjxx_khxb').Value:='��';//TOOD���Ҳ����ֶ�
         FieldByName('cjxx_zygw').Value:=HDHouseDataModule.qryfczy.FieldByName('fczy_fwly').Value;
         FieldByName('cjxx_fcyt').Value:=HDHouseDataModule.qryfczy.FieldByName('fczy_wyyt').Value;
         FieldByName('cjxx_date').Value:=Now;
         FieldByName('cjxx_ygbh').Value:=HDHouseDataModule.qryfczy.FieldByName('fczy_ygbh').Value;
       end;
       Post;
   end;
   if (qry2.State = dsEdit)	or (qry2.State = dsInsert) then
    qry2.Post;
    Close;
 //
end;
  //ȡ��
procedure TContractInfo.btn5Click(Sender: TObject);
begin
 qry2.Cancel;
 self.ds1.DataSet.Cancel;
 if( ParmEditorMode = 'ADD') then
 begin
    // qry2.DeleteRecords(arAll);  //TOOD:��һ�����ݽ�ȥ
 end;
 Close;
end;

procedure TContractInfo.btnAddAdviser1Click(Sender: TObject);
begin

  case CustomerListForm.ShowModal of
      mrOK:
      begin
        qry1.Edit;
        qry1.FieldByName('cjxx_khxm').Value := qrykhzy.FieldByName('khzy_yzxm').Value; //����
        qry1.FieldByName('cjxx_khbh').Value := qrykhzy.FieldByName('khzy_bh').Value;
        qry1.FieldByName('cjxx_lxsj').Value := qrykhzy.FieldByName('khzy_tel').Value;
        qry1.FieldByName('cjxx_lxdh').Value := qrykhzy.FieldByName('khzy_dh').Value;
        qry1.FieldByName('cjxx_sfzh').Value := '��';
        qry1.FieldByName('cjxx_lxdz').Value := qrykhzy.FieldByName('khzy_jtwz').Value;
      end;
      mrCancel:
      begin

      end;

  end;
    end;
end.
