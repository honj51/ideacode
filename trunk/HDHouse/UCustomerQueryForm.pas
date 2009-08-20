unit UCustomerQueryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UHouseQueryFrame;

type
  TCustomerQueryForm = class(TForm)
    hsqryfrm1: THouseQueryFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerQueryForm: TCustomerQueryForm;

implementation

{$R *.dfm}

end.
