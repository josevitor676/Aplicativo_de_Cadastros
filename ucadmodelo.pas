unit uCadModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  DBGrids, DBCtrls, Buttons, StdCtrls, uDataModule;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    btnNovo: TBitBtn;
    btnBusca: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btnNovoClick(Sender: TObject);
    //procedure btnNovoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }



procedure TCadModeloF.btnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
end;



procedure TCadModeloF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TCadModeloF.BitBtn5Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TCadModeloF.BitBtn6Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TCadModeloF.TabSheet1Show(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

end.

