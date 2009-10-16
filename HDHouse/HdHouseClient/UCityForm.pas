unit UCityForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinCtrls, BusinessSkinForm,
  ADODB, DB, Menus, bsSkinMenus;

type
  TCityForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bsknpnl1: TbsSkinPanel;
    tv1: TbsSkinTreeView;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    dsCity: TDataSource;
    qrycity: TADOQuery;
    dsDistrict: TDataSource;
    tblDistrict: TADOTable;
    qry1: TADOQuery;
    ds1: TDataSource;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    bsSkinPopupMenu2: TbsSkinPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CityForm: TCityForm;

implementation
            uses UHDHouseDataModule,UAreaForm,UUniteAreaForm,Math;
{$R *.dfm}

procedure TCityForm.FormShow(Sender: TObject);
 var aNode:TTreeNode;
     bNode:TTreeNode;
begin
     self.qrycity.Active:=true;
     self.tblDistrict.Active:=true;
     self.qry1.Active:=true;
     self.tv1.Items.Clear;
     aNode:=TTreeNode.Create(self.tv1.Items);
     aNode:=self.tv1.Items.Add(nil,'所有城市');
     with self.dsCity.DataSet do
     begin
      First;
      while not Eof do
      begin
        bNode:=self.tv1.Items.AddChild(aNode,VarToStr(FieldValues['CityName']));
        with self.dsDistrict.DataSet do
        begin
         First;
         while not Eof do
         begin
            self.tv1.Items.AddChild(bNode,VarToStr(FieldValues['DistrictName']));
            Next;
          end;
        end;
        Next;
      end;
     end;
     tv1.Items[0].Expanded:=True;
     tv1.Items[0].Item[0].Expanded:=True;
end;

procedure TCityForm.btn1Click(Sender: TObject);
var CityName:string;
    DistrictName:string;
begin
  inherited;
  if (tv1.Selected.Level=0) or (tv1.Selected.Level=1) then
  begin
     Application.MessageBox('请选择片区', '', MB_OK);
     Exit;
  end;
  if tv1.Selected.Level=2 then
  begin
     CityName:=tv1.Selected.Parent.Text;
     DistrictName:=tv1.Selected.Text;
  end
  else if tv1.Selected.Level=3 then
  begin
     CityName:=tv1.Selected.Parent.Parent.Text;
     DistrictName:=tv1.Selected.Parent.Text;
  end;
  Begin
    Try
      if AreaForm=nil then
      begin
         AreaForm:=TAreaForm.Create(Self);
      end;
     Randomize;//初始
     AreaForm.ParmEditorMode:='ADD';
     AreaForm.ParmId:=FormatDateTime('yyyymmdd',Now)+IntToStr(RandomRange(10000000,99999999));
     AreaForm.CityName:=CityName;
     AreaForm.DistrictName:= DistrictName;
     AreaForm.ShowModal;
     self.qry1.Close;
     self.qry1.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TCityForm.btn4Click(Sender: TObject);
begin
       if UniteAreaForm= nil  then
      begin
           UniteAreaForm:=TUniteAreaForm.Create(Self);
      end;
      UniteAreaForm.Visible:=False;
     UniteAreaForm.ShowModal;
end;

procedure TCityForm.btn7Click(Sender: TObject);
begin
Close;
end;

procedure TCityForm.btn6Click(Sender: TObject);
begin
     tv1.Items[0].Expanded:=false;
     tv1.Items[0].Item[0].Expanded:=false;
end;

procedure TCityForm.btn5Click(Sender: TObject);
begin
     tv1.Items[0].Expanded:=True;
     tv1.Items[0].Item[0].Expanded:=True;
end;

procedure TCityForm.btn3Click(Sender: TObject);
begin
 if not self.qry1.Eof then
  begin
  qry1.Edit;
  qry1.FieldByName('FlagDeleted').Value:=1;
  qry1.Post;
  qry1.Close;
  qry1.Open;
  end;
end;
 //改变
procedure TCityForm.tv1Change(Sender: TObject; Node: TTreeNode);
  var sql:string;
begin
  if (Node.Level=0) or (Node.Level=1) then
  begin
    Exit;
  end;
  if Node.Level=2 then
  begin
     sql:='DistrictName='+QuotedStr(Node.Text) ;
  end;
  qry1.Filter:=sql;
  qry1.Filtered:=true;
end;

procedure TCityForm.btn2Click(Sender: TObject);
begin
  inherited;
  Begin
    Try
      if AreaForm=nil then
      begin
         AreaForm:=TAreaForm.Create(Self);
      end;
     AreaForm.ParmEditorMode:='EDIT';
     AreaForm.ParmId:=self.qry1.FieldByName('AreaId').AsString;
     AreaForm.ShowModal;
     self.qry1.Close;
     self.qry1.Open;
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TCityForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
     CityForm:=nil;
end;

end.
