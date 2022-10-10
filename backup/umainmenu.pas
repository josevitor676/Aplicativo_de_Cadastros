unit uMainMenu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, uCategoria, uCliente,
  uProdutos, uUsuarios, uSobre, uOrcamento, uRelClientes, uRelProduto;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.MenuItem5Click(Sender: TObject);
begin
   CategoriaF := TCategoriaF.Create(Self);
   CategoriaF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMenuPrincipalF.MenuItem3Click(Sender: TObject);
begin
  SobreF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem10Click(Sender: TObject);
begin
  OrcamentoF := TOrcamentoF.Create(Self);
  OrcamentoF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem11Click(Sender: TObject);
begin
  RelClienteF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem12Click(Sender: TObject);
begin
  RelProdutoF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem2Click(Sender: TObject);
begin

end;

procedure TMenuPrincipalF.MenuItem6Click(Sender: TObject);
begin
  ClienteF := TClienteF.Create(Self);
  ClienteF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem7Click(Sender: TObject);
begin
  ProdutosF := TProdutosF.Create(Self);
  ProdutosF.ShowModal;
end;

procedure TMenuPrincipalF.MenuItem8Click(Sender: TObject);
begin
  UsuariosF := TUsuariosF.Create(Self);
  UsuariosF.ShowModal;
end;

end.

