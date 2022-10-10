unit uAdicionarItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, uPesquisarProduto, uDataModule, DB;

type

  { TAddItemF }

  TAddItemF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEQtd: TDBEdit;
    ValorUnitario: TDBEdit;
    DBETotal: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  AddItemF: TAddItemF;


implementation

{$R *.lfm}

{ TAddItemF }

procedure TAddItemF.Button1Click(Sender: TObject);
begin
   PesquisarProdutoF.ShowModal;
end;





procedure TAddItemF.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TAddItemF.BitBtn1Click(Sender: TObject);
begin
if DataModuleF.QRYOrcamentoItemqt_produto.AsFloat = 0 then
begin
     ShowMessage('Por favor digite a quantidade do produto');
     DBEQtd.SetFocus;
     Exit;
end;
if DataModuleF.QRYOrcamentoItem.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYOrcamentoItem.Post;
       DataModuleF.QRYOrcamentoItem.ApplyUpdates;
       DataModuleF.SomaItems;
  end;
Close;
end;

end.

