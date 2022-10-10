unit uRelProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet;

type

  { TRelProdutoF }

  TRelProdutoF = class(TForm)
    btnRelProduto: TBitBtn;
    frDBDataSetProdutos: TfrDBDataSet;
    frReportProdutos: TfrReport;
    procedure btnRelProdutoClick(Sender: TObject);
  private

  public

  end;

var
  RelProdutoF: TRelProdutoF;

implementation

{$R *.lfm}

{ TRelProdutoF }

procedure TRelProdutoF.btnRelProdutoClick(Sender: TObject);
begin
 frReportProdutos.LoadFromFile('RelProduto.lrf');
 frReportProdutos.PrepareReport;
 frReportProdutos.ShowReport;
end;

end.

