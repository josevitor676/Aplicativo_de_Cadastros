unit uAlterarSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uDataModule;

type

  { TAlterarSenhaF }

  TAlterarSenhaF = class(TForm)
    Button1: TButton;
    btnFechar: TButton;
    EdtConfirmarSenha: TEdit;
    EdtSenhaNova: TEdit;
    EdtNomeUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  AlterarSenhaF: TAlterarSenhaF;

implementation
uses uLogin;
{$R *.lfm}

{ TAlterarSenhaF }

procedure TAlterarSenhaF.Button1Click(Sender: TObject);
begin
  if (EdtSenhaNova.Text <> '') and (EdtConfirmarSenha.Text <> '') and (EdtSenhaNova.Text = EdtConfirmarSenha.Text) then
  begin
    DataModuleF.QRYUsuarios.SQL.Clear;
    DataModuleF.QRYUsuarios.SQL.Add('UPDATE USUARIOS SET ' + 'SENHA = '+ QuotedStr(EdtSenhaNova.Text)
    +' '+ 'WHERE USUARIO = ' + QuotedStr(EdtNomeUsuario.Text));
    DataModuleF.QRYUsuarios.ExecSQL;
    Close;
    ShowMessage('Nova senha criada com sucesso');
    LoginF.EdtUsuario.SetFocus;
  end
  else
  begin
    ShowMessage('Erro ao criar uma nova senha, Por favor verifique se os campos estão corretos');
    EdtNomeUsuario.SetFocus;
  end;

end;

procedure TAlterarSenhaF.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

