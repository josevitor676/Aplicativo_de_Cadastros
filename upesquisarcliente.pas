unit uPesquisarCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, uDataModule;

type

  { TPesquisarClinteF }

  TPesquisarClinteF = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DSCliente2: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure GridClienteDblClick(Sender: TObject);
  private

  public

  end;

var
  PesquisarClinteF: TPesquisarClinteF;

implementation
uses uOrcamento;

{$R *.lfm}

{ TPesquisarClinteF }

procedure TPesquisarClinteF.BitBtn1Click(Sender: TObject);
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

procedure TPesquisarClinteF.DBGrid1DblClick(Sender: TObject);
begin
  PesquisarClinteF.Close;
  DataModuleF.QRYOrcamentoclienteid.AsInteger:= DataModuleF.QRYClienteclienteid.AsInteger;
  OrcamentoF.Label7.Caption := DataModuleF.QRYClientenome_cliente.AsString;
  DataModuleF.QRYOrcamentoItem.ParamByName('orcamentoid').AsString := DataModuleF.QRYOrcamentoorcamentoid.AsString;
  DataModuleF.QRYOrcamentoItem.Open;
end;

procedure TPesquisarClinteF.GridClienteDblClick(Sender: TObject);
begin
  PesquisarClinteF.Close;
  DataModuleF.QRYOrcamentoclienteid.AsInteger:= DataModuleF.QRYClienteclienteid.AsInteger;
  OrcamentoF.Label7.Caption := DataModuleF.QRYClientenome_cliente.AsString;
  DataModuleF.QRYOrcamentoItem.ParamByName('orcamentoid').AsString := DataModuleF.QRYOrcamentoorcamentoid.AsString;
  DataModuleF.QRYOrcamentoItem.Open;
end;

end.

