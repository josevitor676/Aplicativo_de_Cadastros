unit uRelClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet;

type

  { TRelClienteF }

  TRelClienteF = class(TForm)
    btnRelCliente: TBitBtn;
    frDBDataSetCliente: TfrDBDataSet;
    frReportClientes: TfrReport;
    procedure btnRelClienteClick(Sender: TObject);
  private

  public

  end;

var
  RelClienteF: TRelClienteF;

implementation

{$R *.lfm}

{ TRelClienteF }

procedure TRelClienteF.btnRelClienteClick(Sender: TObject);
begin
 frReportClientes.LoadFromFile('RelCliente.lrf');
 frReportClientes.PrepareReport;
 frReportClientes.ShowReport;
end;

end.

