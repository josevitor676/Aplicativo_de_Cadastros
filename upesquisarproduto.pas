unit uPesquisarProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, uDataModule;

type

  { TPesquisarProdutoF }

  TPesquisarProdutoF = class(TForm)
    BitBtn1: TBitBtn;
    DSProduto2: TDataSource;
    GridProduto: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure GridProdutoDblClick(Sender: TObject);
  private

  public

  end;

var
  PesquisarProdutoF: TPesquisarProdutoF;

implementation
uses uAdicionarItem;

{$R *.lfm}

{ TPesquisarProdutoF }

procedure TPesquisarProdutoF.BitBtn1Click(Sender: TObject);
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

procedure TPesquisarProdutoF.GridProdutoDblClick(Sender: TObject);
begin
  PesquisarProdutoF.Close;
  DataModuleF.QRYOrcamentoItemprodutoid.AsInteger := DataModuleF.QRYProdutocategoriaprodutoid.AsInteger;
  DataModuleF.QRYOrcamentoItemdesc_prod.AsString := DataModuleF.QRYProdutods_produto.AsString;
  DataModuleF.QRYOrcamentoItemvl_unitario.AsFloat := DataModuleF.QRYProdutovl_venda_produto.AsFloat;
  Close;
  AddItemF.DBEQtd.SetFocus;
end;

end.

