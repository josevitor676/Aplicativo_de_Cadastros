unit uProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  uCadModelo, DB, uDataModule;

type

  { TProdutosF }

  TProdutosF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBENomeProduto: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DSProduto: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  ProdutosF: TProdutosF;

implementation

{$R *.lfm}

{ TProdutosF }

procedure TProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DSProduto.DataSet.Close;
  CloseAction:= caFree;
end;

procedure TProdutosF.FormShow(Sender: TObject);
begin
  ProdutosF.PageControl1.ActivePageIndex:= 0;
  DSProduto.DataSet.Open;
end;

procedure TProdutosF.btnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  DSProduto.DataSet.Insert;
  DBEdit2.SetFocus;
end;

procedure TProdutosF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  DataModuleF.QRYProduto.Cancel;
end;

procedure TProdutosF.btnBuscaClick(Sender: TObject);
var
  AuxWhere : String;
begin
   if Edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'PRODUTOID = '+Edit1.Text;

  DataModuleF.QRYProduto.Close;
  DataModuleF.QRYProduto.SQL.Text :=
            'SELECT '+
            'PRODUTOID, '+
            'CATEGORIAPRODUTOID, '+
            'DS_PRODUTO, '+
            'OBS_PRODUTO, '+
            'VL_VENDA_PRODUTO, '+
            'DT_CADASTRO_PRODUTO, '+
            'STATUS_PRODUTO '+
            'FROM PRODUTO '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY PRODUTOID';
  DataModuleF.QRYProduto.Open;
end;

procedure TProdutosF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSProduto.DataSet.Delete;
  end;
end;

procedure TProdutosF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TProdutosF.BitBtn4Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  if DataModuleF.QRYProduto.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYProduto.Post;
       DataModuleF.QRYProduto.ApplyUpdates;
       btnNovo.Enabled:=True;
  end;
end;

end.

