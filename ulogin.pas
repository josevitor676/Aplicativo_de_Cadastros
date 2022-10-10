unit uLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, uMainMenu, uDataModule, uAlterarSenha;

type

  { TLoginF }

  TLoginF = class(TForm)
    btnMudarSenha: TBitBtn;
    btnEntrar: TBitBtn;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnMudarSenhaClick(Sender: TObject);
  private

  public

  end;

var
  LoginF: TLoginF;


implementation

{$R *.lfm}

{ TLoginF }





procedure TLoginF.btnEntrarClick(Sender: TObject);
begin
  DataModuleF.QRYUsuarios.Close;
  DataModuleF.QRYUsuarios.SQL.Text :=
              'SELECT ' +
              'ID, ' +
              'USUARIO, ' +
              'NOME_COMPLETO,  ' +
              'SENHA ' +
              'FROM USUARIOS ' +
              'WHERE USUARIO = '+ QuotedStr(EdtUsuario.Text)+' '+
              'AND SENHA = ' + QuotedStr(EdtSenha.Text);

  DataModuleF.QRYUsuarios.Open;

  if DataModuleF.QRYUsuarios.IsEmpty then
  begin
    ShowMessage('Login ou senha não conferem!');
    EdtUsuario.SetFocus;
    abort;
  end
  else
  begin
      MenuPrincipalF := TMenuPrincipalF.create(Self);
      MenuPrincipalF.Show;
      Hide;
  end;

end;

procedure TLoginF.btnMudarSenhaClick(Sender: TObject);
begin
  AlterarSenhaF := TAlterarSenhaF.Create(Self);
  AlterarSenhaF.ShowModal;
end;

end.

