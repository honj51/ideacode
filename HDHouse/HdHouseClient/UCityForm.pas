unit UCityForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinCtrls, BusinessSkinForm;

type
  TCityForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bsknpnl1: TbsSkinPanel;
    tv1: TbsSkinTreeView;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr1: TbsSkinScrollBar;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CityForm: TCityForm;

implementation
            uses UHDHouseDataModule,UAreaForm,UUniteAreaForm;
{$R *.dfm}

procedure TCityForm.FormShow(Sender: TObject);
begin
       tv1.Items[0].Expanded:=True;
       tv1.Items[0].Item[0].Expanded:=True;
end;

procedure TCityForm.btn1Click(Sender: TObject);
begin
        if AreaForm= nil  then
      begin
           AreaForm:=TAreaForm.Create(Self);
      end;
      AreaForm.Visible:=False;
     AreaForm.ShowModal;
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

end.
