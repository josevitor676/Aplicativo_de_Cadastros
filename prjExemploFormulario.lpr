program prjExemploFormulario;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uCadModelo, uMainMenu, uCategoria, uDataModule, uCliente,
  uProdutos, uUsuarios, uSobre, uOrcamento, uPesquisarCliente, uAdicionarItem,
  uPesquisarProduto, uRelClientes, uRelProduto, uRelUsuarios, uLogin, 
uAlterarSenha;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TLoginF, LoginF);
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TDataModuleF, DataModuleF);
  Application.CreateForm(TSobreF, SobreF);
  Application.CreateForm(TPesquisarClinteF, PesquisarClinteF);
  Application.CreateForm(TAddItemF, AddItemF);
  Application.CreateForm(TPesquisarProdutoF, PesquisarProdutoF);
  Application.CreateForm(TRelClienteF, RelClienteF);
  Application.CreateForm(TRelProdutoF, RelProdutoF);
  Application.CreateForm(TRelUsuarioF, RelUsuarioF);
  Application.CreateForm(TAlterarSenhaF, AlterarSenhaF);
  Application.Run;
end.

