unit uUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ExtCtrls, uCadModelo, DB, uDataModule;

type

  { TUsuariosF }

  TUsuariosF = class(TCadModeloF)
    Novo: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DSUsuarios: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure NovoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  UsuariosF: TUsuariosF;

implementation

{$R *.lfm}

{ TUsuariosF }



procedure TUsuariosF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DSUsuarios.DataSet.Close;
  CloseAction:= caFree;
end;

procedure TUsuariosF.FormShow(Sender: TObject);
begin
  UsuariosF.PageControl1.ActivePageIndex:= 0;
  DSUsuarios.DataSet.Open;
end;



procedure TUsuariosF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TUsuariosF.NovoClick(Sender: TObject);
begin
  DSUsuarios.DataSet.Insert;
  PageControl1.ActivePage := TabSheet2;
  DBEdit2.SetFocus;
end;

procedure TUsuariosF.BitBtn4Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  if DataModuleF.QRYUsuarios.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYUsuarios.Post;
       DataModuleF.QRYUsuarios.ApplyUpdates;
       btnNovo.Enabled:=True;
  end;
end;

procedure TUsuariosF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSUsuarios.DataSet.Delete;
  end;
end;

procedure TUsuariosF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  DataModuleF.QRYUsuarios.Cancel;
end;

procedure TUsuariosF.btnBuscaClick(Sender: TObject);
var
  AuxWhere : String;
begin
  if Edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'ID = '+Edit1.Text;

  DataModuleF.QRYUsuarios.Close;
  DataModuleF.QRYUsuarios.SQL.Text :=
            'SELECT '+
            'ID, '+
            'USUARIO, '+
            'NOME_COMPLETO, '+
            'SENHA '+
            'FROM USUARIOS '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY ID';
  DataModuleF.QRYUsuarios.Open;
end;



end.

