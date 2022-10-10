unit uRelUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet;

type

  { TRelUsuarioF }

  TRelUsuarioF = class(TForm)
    btnRelUsuarios: TBitBtn;
    frDBDataSetUsuarios: TfrDBDataSet;
    frReportUsuarios: TfrReport;
    procedure btnRelUsuariosClick(Sender: TObject);
  private

  public

  end;

var
  RelUsuarioF: TRelUsuarioF;

implementation

{$R *.lfm}

{ TRelUsuarioF }

procedure TRelUsuarioF.btnRelUsuariosClick(Sender: TObject);
begin
 frReportUsuarios.LoadFromFile('RelUsuarios.lrf');
 frReportUsuarios.PrepareReport;
 frReportUsuarios.ShowReport;
end;

end.

