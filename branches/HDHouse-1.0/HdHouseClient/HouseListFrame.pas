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
uses UHDHouseDataModule, UHouseQueryForm, UCustomerDetailsForm, Common;
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
var
  sqlStr: string;
  param: Boolean;
begin
  sqlStr := 'select * from fczy';
  param := False;
  if Edit1.Text <> '' then
  begin
    if param = False then
    begin
      sqlStr := sqlStr + ' where ';
      param := True;
    end
    else
    begin
      sqlStr := sqlStr + ' and ';
    end;
    sqlStr := sqlStr + 'fczy_bh like ' + '''%' + Edit1.Text + '%''' + ' or ' +
      'fczy_wymc like ' + '''%' + Edit1.Text + '%''' + ' or ' + 'fczy_hxjg like ' +
      '''%' + Edit1.Text + '%''' + ' or ' + 'fczy_qy like ' + '''%' + Edit1.Text +
      '%''' + ' or ' + 'fczy_wyyt like ' + '''%' + Edit1.Text + '%''' + ' or ' +
      'fczy_zxcd like ' + '''%' + Edit1.Text + '%''' + ' or ' + 'fczy_jtwz like ' +
      '''%' + Edit1.Text + '%''';
  end;
  if bsSkinCheckRadioBox1.Checked = True then
  begin
    if param = False then
    begin
      sqlStr := sqlStr + ' where ';
      param := True;
    end
    else
    begin
      sqlStr := sqlStr + ' and ';
    end;
    sqlStr := sqlStr + 'fczy_cz=true';
  end;
  if bsSkinCheckRadioBox2.Checked = True then
  begin
    if param = False then
    begin
      sqlStr := sqlStr + ' where ';
      param := True;
    end
    else
    begin
      sqlStr := sqlStr + ' and ';
    end;
    sqlStr := sqlStr + 'fczy_cs=true';
  end;
  if bsSkinCheckRadioBox3.Checked = True then
  begin
    if param = False then
    begin
      sqlStr := sqlStr + ' where ';
      param := True;
    end
    else
    begin
      sqlStr := sqlStr + ' and ';
    end;

    if IsUsingAccess then
    begin
    sqlStr := sqlStr + 'fczy_djrq >=#' + FormatDateTime('yyyy-mm-dd',
      Now - StrToInt(edtDate.text))+'#';
      end
      else
      begin
    sqlStr := sqlStr + 'fczy_djrq >=' + QuotedStr(FormatDateTime('yyyy-mm-dd',
      Now - StrToInt(edtDate.text)));

      end;
  end;
  qryHouseList.Close;
  qryHouseList.SQL.Clear;
  qryHouseList.SQL.Add(sqlStr);
  qryHouseList.Open;
  qryHouseList.Active := True;
end;
//

procedure TframeHouseList.qryHouseListCalcFields(DataSet: TDataSet);
var
  detailStr: TStringList;
  secrecyStr: TStringList;
begin
  detailStr := TStringList.Create;
  secrecyStr := TStringList.Create;
  detailStr.Clear;
  secrecyStr.Clear;
  //详细信息
  if qryHouseList.FieldByName('fczy_cz').Value then
  begin
    detailStr.Add('此房出租,出租价格:' +
      Trim(qryHouseList.FieldByName('fczy_zj').Text) + '元/月,出租说明：' +
      qryHouseList.FieldByName('fczy_czsm').Text)
  end;
  if qryHouseList.FieldByName('fczy_cs').Value then
  begin
    detailStr.Add('此房出售,出售价格:' + qryHouseList.FieldByName('fczy_sj').Text
      + '万元,出售说明:' + qryHouseList.FieldByName('fczy_cssm').Text);
  end;
  detailStr.Add('');
  detailStr.Add('基础设施:' + qryHouseList.FieldByName('fczy_ptss1').Text);
  detailStr.Add('配套设施:' + qryHouseList.FieldByName('fczy_ptss2').Text);
  detailStr.Add('');
  detailStr.Add('详细信息:' + qryHouseList.FieldByName('fczy_xxbz').Text);

  //保密信息
  if not (CheckPermission('Qx_rcgl', 4)) then
  begin
    secrecyStr.Add('你无权查看保密信息！请跟管理员联系');
  end
  else
  begin
    secrecyStr.Add('业主姓名:' + qryHouseList.FieldByName('fczy_yzxm').Text);
    secrecyStr.Add('联系电话:' + qryHouseList.FieldByName('fczy_dh').Text);
    secrecyStr.Add('联系手机:' + qryHouseList.FieldByName('fczy_tel').Text);
    secrecyStr.Add('联系地址:' + qryHouseList.FieldByName('fczy_jtwz').Text);
    secrecyStr.Add('备注说明:' + qryHouseList.FieldByName('fczy_bmbz').Text);
  end;

  //
  detailStr.Text;
  secrecyStr.Text;
  qryHouseList.FieldByName('HouseDetailInfo').Value := detailStr.Text;
  qryHouseList.FieldByName('HouseSecrecyInfo').Value := secrecyStr.Text;
end;

//

procedure TframeHouseList.qryHouseListAfterScroll(DataSet: TDataSet);
var
  sql: string;
begin
  if qryHouseList.FieldByName('fczy_bh').Text <> '' then
  begin
    //自动客户信息
    sql := 'select * from khzy where ';
    //建筑面积
    sql := sql + 'khzy_jzmj1 <=' + qryHouseList.FieldByName('fczy_jzmj').Text +
      ' and khzy_jzmj2>=' + qryHouseList.FieldByName('fczy_jzmj').Text;
    //建成年份
    sql := sql + ' and khzy_jcnf1 <=''' +
      qryHouseList.FieldByName('fczy_jcnf').Text + ''' and khzy_jcnf2>=''' +
      qryHouseList.FieldByName('fczy_jcnf').Text + '''';
    sql := sql + ' and (';
    //物业名称
    sql := sql + '(khzy_wymc=''无'' or khzy_wymc=''不限'' or khzy_wymc=''' +
      qryHouseList.FieldByName('fczy_wymc').Text + ''' ) and ';
    //物业用途
    sql := sql + '(khzy_wyyt=''无'' or khzy_wyyt=''不限'' or khzy_wyyt=''' +
      qryHouseList.FieldByName('fczy_wyyt').Text + ''' ) and ';
    //物业类别
    sql := sql + '(khzy_wylb=''无'' or khzy_wylb=''不限'' or khzy_wylb=''' +
      qryHouseList.FieldByName('fczy_wylb').Text + ''' ) and ';
    //所属区域
    sql := sql + '(khzy_qy=''无'' or khzy_qy=''不限'' or khzy_qy=''' +
      qryHouseList.FieldByName('fczy_qy').Text + ''' ) and ';
    //装修程度
    sql := sql + '(khzy_zxcd=''无'' or khzy_zxcd=''不限'' or khzy_zxcd=''' +
      qryHouseList.FieldByName('fczy_zxcd').Text + ''' ) and ';
    //具体地址
    sql := sql + '(khzy_jtdz=''无'' or khzy_jtdz=''不限'' or khzy_jtdz like ''%'
      + qryHouseList.FieldByName('fczy_jtdz').Text + '%'' )';
    sql := sql + ' )';
    qryCustomerTrack.Close;
    qryCustomerTrack.SQl.Clear;
    qryCustomerTrack.SQL.Add(sql);
    qryCustomerTrack.Open;
    qryCustomerTrack.Active := True;
  end;
end;

//查看客户详细信息

procedure TframeHouseList.bskndbgrd1DblClick(Sender: TObject);
begin
  //
  if qryCustomerTrack.FieldByName('khzy_bh').Text <> '' then
  begin
    CustomerDetailsForm.ParmId := qryCustomerTrack.FieldByName('khzy_bh').Text;
    CustomerDetailsForm.ParmMode := 'view';
    CustomerDetailsForm.ShowModal;
  end;
end;

//显示客户详细信息

procedure TframeHouseList.MenuItem1Click(Sender: TObject);
begin
  if qryCustomerTrack.FieldByName('khzy_bh').Text <> '' then
  begin
    CustomerDetailsForm.ParmId := qryCustomerTrack.FieldByName('khzy_bh').Text;
    CustomerDetailsForm.ParmMode := 'view';
    CustomerDetailsForm.ShowModal;
  end;
end;

procedure TframeHouseList.bsSkinCheckRadioBox3Click(Sender: TObject);
begin
  Self.bsSkinButtonLabel2Click(nil);
end;

end.

