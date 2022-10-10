unit uCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  uCadModelo, DB, uDataModule;

type

  { TClienteF }

  TClienteF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    DBEType: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DSCliente: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnBuscaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  ClienteF: TClienteF;

implementation

{$R *.lfm}

{ TClienteF }



procedure TClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DSCliente.DataSet.Close;
  CloseAction:= caFree;
end;

procedure TClienteF.FormShow(Sender: TObject);
begin
  ClienteF.PageControl1.ActivePageIndex:= 0;
  DSCliente.DataSet.Open;
end;

procedure TClienteF.btnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  DSCliente.DataSet.Insert;
  DBEType.SetFocus;
end;

procedure TClienteF.btnBuscaClick(Sender: TObject);
var
  AuxWhere : String;
begin
  if Edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CLIENTEID = '+Edit1.Text;

  DataModuleF.QRYCliente.Close;
  DataModuleF.QRYCliente.SQL.Text :=
            'SELECT '+
            'CLIENTEID, '+
            'TIPO_CLIENTE, '+
            'CPF_CNPJ_CLIENTE, '+
            'NOME_CLIENTE '+
            'FROM CLIENTE '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY CLIENTEID';
  DataModuleF.QRYCliente.Open;
end;

procedure TClienteF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TClienteF.BitBtn4Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  if DataModuleF.QRYCliente.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYCliente.Post;
       DataModuleF.QRYCliente.ApplyUpdates;
       btnNovo.Enabled:=True;
  end;
end;

procedure TClienteF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSCliente.DataSet.Delete;
  end;
end;

procedure TClienteF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  DataModuleF.QRYCliente.Cancel;
end;

end.

