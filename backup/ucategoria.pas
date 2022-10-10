unit uCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls, uDataModule,
  uCadModelo, DB;

type

  { TCategoriaF }

  TCategoriaF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    DBDesc: TDBEdit;
    DSCategoria: TDataSource;
    Label2: TLabel;
    LabelId: TLabel;
    procedure btnBuscaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  private

  public

  end;

var
  CategoriaF: TCategoriaF;

implementation

{$R *.lfm}

{ TCategoriaF }



procedure TCategoriaF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DSCategoria.DataSet.Close;
  CloseAction:= caFree;
end;

procedure TCategoriaF.FormShow(Sender: TObject);
begin
  CategoriaF.PageControl1.ActivePageIndex:= 0;
  DSCategoria.DataSet.Open;
end;

procedure TCategoriaF.TabSheet1Show(Sender: TObject);
begin

end;

procedure TCategoriaF.btnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  DSCategoria.DataSet.Insert;
  DBDesc.SetFocus;
end;

procedure TCategoriaF.btnBuscaClick(Sender: TObject);
var
  AuxWhere : String;
begin
  if Edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CATEGORIAPRODUTOID = '+Edit1.Text;

  DataModuleF.QRYCategoria.Close;
  DataModuleF.QRYCategoria.SQL.Text :=
            'SELECT '+
            'CATEGORIAPRODUTOID, '+
            'DS_CATEGORIA_PRODUTO '+
            'FROM CATEGORIA_PRODUTO '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY CATEGORIAPRODUTOID';
  DataModuleF.QRYCategoria.Open;
end;

procedure TCategoriaF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TCategoriaF.BitBtn4Click(Sender: TObject);
begin
  if DataModuleF.QRYCategoria.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYCategoria.Post;
       DataModuleF.QRYCategoria.ApplyUpdates;
       btnNovo.Enabled:=True;
  end;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TCategoriaF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSCategoria.DataSet.Delete;
  end;
end;

procedure TCategoriaF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  DataModuleF.QRYCategoria.Cancel;
end;



end.

