unit HouseListFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, bsSkinCtrls, bsSkinExCtrls, ImgList, bsPngImageList,
  IWControl, IWHTMLControls, IdBaseComponent, IdThreadComponent, ExtCtrls,
  bsdbctrls, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinTabs, bsSkinBoxCtrls,
  bsSkinData, BusinessSkinForm, Mask, ADODB, DB, Menus, frxClass, frxDBSet;

type
  TframeHouseList = class(TFrame)
    bsknpgcntrl1: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinTabSheet2: TbsSkinTabSheet;
    bskntbsht1: TbsSkinTabSheet;
    bskntbsht2: TbsSkinTabSheet;
    mmoHouseDetailInfo: TbsSkinDBMemo;
    mmoHouseSecrecyInfo: TbsSkinDBMemo;
    bskndbgrd2: TbsSkinDBGrid;
    bskndbgrd1: TbsSkinDBGrid;
    bsSkinPanel1: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    bsSkinButtonLabel2: TbsSkinButtonLabel;
    bsSkinButton2: TbsSkinButton;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton3: TbsSkinButton;
    bsSkinButton4: TbsSkinButton;
    bvl1: TBevel;
    bsSkinCheckRadioBox1: TbsSkinCheckRadioBox;
    bsSkinCheckRadioBox2: TbsSkinCheckRadioBox;
    bsSkinCheckRadioBox3: TbsSkinCheckRadioBox;
    bsSkinPanel2: TbsSkinPanel;
    bsSkinDBGrid1: TbsSkinDBGrid;
    bsknscrlbrHouseListDown: TbsSkinScrollBar;
    bsknscrlbrHouseRight: TbsSkinScrollBar;
    bsknscrlbrAutoDown: TbsSkinScrollBar;
    bsknscrlbrAutoRight: TbsSkinScrollBar;
    bsknscrlbrFollowDown: TbsSkinScrollBar;
    bsknscrlbrFollowRight: TbsSkinScrollBar;
    Edit1: TEdit;
    dsHouseList: TDataSource;
    tblHouseTrack: TADOTable;
    dsHouseTrack: TDataSource;
    qryCustomerTrack: TADOQuery;
    dsCustomerTrack: TDataSource;
    pmAutoCustomer: TPopupMenu;
    MenuItem1: TMenuItem;
    pmHouse: TPopupMenu;
    MenuItem2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    edtDate: TbsSkinNumericEdit;
    bsSkinStdLabel1: TbsSkinStdLabel;
    qryHouseList: TADOQuery;
    qryHouseListfczy_bh: TWideStringField;
    qryHouseListfczy_yn: TBooleanField;
    qryHouseListfczy_htbh: TWideStringField;
    qryHouseListfczy_djrq: TDateTimeField;
    qryHouseListfczy_sxrq: TDateTimeField;
    qryHouseListfczy_zhrq: TDateTimeField;
    qryHouseListfczy_fwly: TWideStringField;
    qryHouseListfczy_dqzt: TWideStringField;
    qryHouseListfczy_wymc: TWideStringField;
    qryHouseListfczy_wyyt: TWideStringField;
    qryHouseListfczy_wylb: TWideStringField;
    qryHouseListfczy_zxcd: TWideStringField;
    qryHouseListfczy_jtdz: TWideStringField;
    qryHouseListfczy_qy: TWideStringField;
    qryHouseListfczy_jcnf: TWideStringField;
    qryHouseListfczy_ws: TIntegerField;
    qryHouseListfczy_kt: TIntegerField;
    qryHouseListfczy_wc: TIntegerField;
    qryHouseListfczy_yt: TIntegerField;
    qryHouseListfczy_hxjg: TWideStringField;
    qryHouseListfczy_jzmj: TFloatField;
    qryHouseListfczy_fx: TWideStringField;
    qryHouseListfczy_lczs: TIntegerField;
    qryHouseListfczy_lc: TIntegerField;
    qryHouseListfczy_lccg: TWideStringField;
    qryHouseListfczy_ptss1: TWideStringField;
    qryHouseListfczy_ptss2: TWideStringField;
    qryHouseListfczy_cz: TBooleanField;
    qryHouseListfczy_zj: TFloatField;
    qryHouseListfczy_czsm: TWideStringField;
    qryHouseListfczy_cs: TBooleanField;
    qryHouseListfczy_sj: TFloatField;
    qryHouseListfczy_cssm: TWideStringField;
    qryHouseListfczy_yzxm: TWideStringField;
    qryHouseListfczy_dh: TWideStringField;
    qryHouseListfczy_tel: TWideStringField;
    qryHouseListfczy_jtwz: TWideStringField;
    qryHouseListfczy_bmbz: TWideStringField;
    qryHouseListfczy_xxbz: TMemoField;
    qryHouseListfczy_czy: TWideStringField;
    qryHouseListfczy_ly: TWideStringField;
    qryHouseListfczy_zs: TWideStringField;
    qryHouseListfczy_ygbh: TWideStringField;
    qryHouseListfczy_sby: TWideStringField;
    qryHouseListHouseDetailInfo: TStringField;
    qryHouseListHouseSecrecyInfo: TStringField;
    bsSkinFrame1: TbsSkinFrame;
    procedure bsSkinCheckRadioBox1Click(Sender: TObject);
    procedure bsSkinCheckRadioBox2Click(Sender: TObject);
    procedure bsSkinButtonLabel2Click(Sender: TObject);
    procedure qryHouseListCalcFields(DataSet: TDataSet);
    procedure qryHouseListAfterScroll(DataSet: TDataSet);
    procedure bskndbgrd1DblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure bsSkinCheckRadioBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses UHDHouseDataModule,UHouseQueryForm,UCustomerDetailsForm,Common;
{$R *.dfm}

procedure TframeHouseList.bsSkinCheckRadioBox1Click(Sender: TObject);
begin
 Self.bsSkinButtonLabel2Click(Sender);
end;

procedure TframeHouseList.bsSkinCheckRadioBox2Click(Sender: TObject);
begin
 Self.bsSkinButtonLabel2Click(nil);
end;

procedure TframeHouseList.bsSkinButtonLabel2Click(Sender: TObject);
var sqlStr:string;
    param:Boolean;
begin
  sqlStr:='select * from fczy';
  param:=False;
  if Edit1.Text<> ''then
  begin
    if param = False then begin
      sqlStr:=sqlStr+ ' where ';
      param:=True;
    end else
    begin
      sqlStr:=sqlStr+ ' and ';
    end;
    sqlStr:=sqlStr+'fczy_bh like '+'''%'+Edit1.Text+'%'''+' or '+'fczy_wymc like '+'''%'+Edit1.Text+'%'''+' or '+'fczy_hxjg like '+'''%'+Edit1.Text+'%'''+' or '+'fczy_qy like '+'''%'+Edit1.Text+'%'''+' or '+'fczy_wyyt like '+'''%'+Edit1.Text+'%'''+' or '+'fczy_zxcd like '+'''%'+Edit1.Text+'%'''+' or '+'fczy_jtwz like '+'''%'+Edit1.Text+'%''';
  end;
  if bsSkinCheckRadioBox1.Checked =True then
  begin
     if param = False then begin
      sqlStr:=sqlStr+ ' where ';
      param:=True;
    end else
    begin
      sqlStr:=sqlStr+ ' and ';
    end;
    sqlStr:=sqlStr+'fczy_cz=true';
  end;
  if bsSkinCheckRadioBox2.Checked =True then
  begin
      if param = False then begin
      sqlStr:=sqlStr+ ' where ';
      param:=True;
    end else
    begin
      sqlStr:=sqlStr+ ' and ';
    end;
    sqlStr:=sqlStr+'fczy_cs=true';
  end;
  if bsSkinCheckRadioBox3.Checked =True then
  begin
    if param = False then
    begin
      sqlStr:=sqlStr+ ' where ';
      param:=True;
    end else
    begin
      sqlStr:=sqlStr+ ' and ';
    end;
    sqlStr:=sqlStr+'fczy_djrq >=#'+FormatDateTime('yyyy-mm-dd',Now-StrToInt(edtDate.text))+'#';
  end;
 qryHouseList.Close;
 qryHouseList.SQL.Clear;
 qryHouseList.SQL.Add(sqlStr);
 qryHouseList.Open;
 qryHouseList.Active:=True;
end;
//
procedure TframeHouseList.qryHouseListCalcFields(DataSet: TDataSet);
var
  detailStr:TStringList;
  secrecyStr:TStringList;
begin
  detailStr := TStringList.Create;
  secrecyStr:=TStringList.Create;
  detailStr.Clear;
  secrecyStr.Clear;
  //��ϸ��Ϣ
  if qryHouseList.FieldByName('fczy_cz').Value then
  begin
      detailStr.Add('�˷�����,����۸�:'+Trim(qryHouseList.FieldByName('fczy_zj').Text)+'Ԫ/��,����˵����'+qryHouseList.FieldByName('fczy_czsm').Text)
  end;
  if qryHouseList.FieldByName('fczy_cs').Value then
  begin
    detailStr.Add('�˷�����,���ۼ۸�:'+qryHouseList.FieldByName('fczy_sj').Text+'��Ԫ,����˵��:'+qryHouseList.FieldByName('fczy_cssm').Text);
  end;
  detailStr.Add('');
  detailStr.Add('������ʩ:'+qryHouseList.FieldByName('fczy_ptss1').Text);
  detailStr.Add('������ʩ:'+qryHouseList.FieldByName('fczy_ptss2').Text);
  detailStr.Add('');
  detailStr.Add('��ϸ��Ϣ:'+qryHouseList.FieldByName('fczy_xxbz').Text);

    //������Ϣ
    if not(CheckPermission('Qx_rcgl',4)) then
    begin
       secrecyStr.Add('����Ȩ�鿴������Ϣ���������Ա��ϵ');
    end
    else
    begin
        secrecyStr.Add('ҵ������:'+qryHouseList.FieldByName('fczy_yzxm').Text);
        secrecyStr.Add('��ϵ�绰:'+qryHouseList.FieldByName('fczy_dh').Text);
        secrecyStr.Add('��ϵ�ֻ�:'+qryHouseList.FieldByName('fczy_tel').Text);
        secrecyStr.Add('��ϵ��ַ:'+qryHouseList.FieldByName('fczy_jtwz').Text);
        secrecyStr.Add('��ע˵��:'+qryHouseList.FieldByName('fczy_bmbz').Text);
    end;

  //
  detailStr.Text;
  secrecyStr.Text;
  qryHouseList.FieldByName('HouseDetailInfo').Value:= detailStr.Text;
  qryHouseList.FieldByName('HouseSecrecyInfo').Value:= secrecyStr.Text;
 end;

//
procedure TframeHouseList.qryHouseListAfterScroll(DataSet: TDataSet);
var sql:string;
begin
   if qryHouseList.FieldByName('fczy_bh').Text <> '' then
   begin
    //�Զ��ͻ���Ϣ
     sql:='select * from khzy where ';
    //�������
      sql:=sql+'khzy_jzmj1 <='+qryHouseList.FieldByName('fczy_jzmj').Text+' and khzy_jzmj2>='+qryHouseList.FieldByName('fczy_jzmj').Text;
    //�������
      sql:=sql+' and khzy_jcnf1 <='''+qryHouseList.FieldByName('fczy_jcnf').Text+''' and khzy_jcnf2>='''+qryHouseList.FieldByName('fczy_jcnf').Text+'''';
      sql:=sql+' and (';
    //��ҵ����
      sql:=sql+'(khzy_wymc=''��'' or khzy_wymc=''����'' or khzy_wymc='''+qryHouseList.FieldByName('fczy_wymc').Text+''' ) and ';
    //��ҵ��;
      sql:=sql+'(khzy_wyyt=''��'' or khzy_wyyt=''����'' or khzy_wyyt='''+qryHouseList.FieldByName('fczy_wyyt').Text+''' ) and ';
    //��ҵ���
      sql:=sql+'(khzy_wylb=''��'' or khzy_wylb=''����'' or khzy_wylb='''+qryHouseList.FieldByName('fczy_wylb').Text+''' ) and ';
    //��������
      sql:=sql+'(khzy_qy=''��'' or khzy_qy=''����'' or khzy_qy='''+qryHouseList.FieldByName('fczy_qy').Text+''' ) and ';
    //װ�޳̶�
      sql:=sql+'(khzy_zxcd=''��'' or khzy_zxcd=''����'' or khzy_zxcd='''+qryHouseList.FieldByName('fczy_zxcd').Text+''' ) and ';
    //�����ַ
      sql:=sql+'(khzy_jtdz=''��'' or khzy_jtdz=''����'' or khzy_jtdz like ''%'+qryHouseList.FieldByName('fczy_jtdz').Text+'%'' )';
      sql:=sql+' )';
      qryCustomerTrack.Close;
      qryCustomerTrack.SQl.Clear;
      qryCustomerTrack.SQL.Add(sql);
      qryCustomerTrack.Open;
      qryCustomerTrack.Active:=True;
   end;
end;

//�鿴�ͻ���ϸ��Ϣ
procedure TframeHouseList.bskndbgrd1DblClick(Sender: TObject);
begin
 //
 if qryCustomerTrack.FieldByName('khzy_bh').Text <> '' then
 begin
   CustomerDetailsForm.ParmId:=qryCustomerTrack.FieldByName('khzy_bh').Text;
   CustomerDetailsForm.ParmMode:='view';
   CustomerDetailsForm.ShowModal;
 end;
end;

//��ʾ�ͻ���ϸ��Ϣ
procedure TframeHouseList.MenuItem1Click(Sender: TObject);
begin
  if qryCustomerTrack.FieldByName('khzy_bh').Text <> '' then
 begin
   CustomerDetailsForm.ParmId:=qryCustomerTrack.FieldByName('khzy_bh').Text;
   CustomerDetailsForm.ParmMode:='view';
   CustomerDetailsForm.ShowModal;
 end;
end;

procedure TframeHouseList.bsSkinCheckRadioBox3Click(Sender: TObject);
begin
 Self.bsSkinButtonLabel2Click(nil);
end;

end.
