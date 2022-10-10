unit uOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids, DBCtrls, Buttons, LR_Class, LR_DBSet, uCadModelo, DB, uDataModule,
  uPesquisarCliente, uAdicionarItem;

type

  { TOrcamentoF }

  TOrcamentoF = class(TCadModeloF)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnRelOrcItems: TBitBtn;
    btnRelOrcamento: TBitBtn;
    Button1: TButton;
    DSOrcamentoItem: TDataSource;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid2: TDBGrid;
    DSOrcamento: TDataSource;
    frDBDataSetOrcamentoItens: TfrDBDataSet;
    frDBDataSetOrcamento: TfrDBDataSet;
    frReportOrcamentoItens: TfrReport;
    frReportOrcamento: TfrReport;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel8: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btnRelOrcamentoClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnRelOrcItemsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private

  public

  end;

var
  OrcamentoF: TOrcamentoF;

implementation

{$R *.lfm}

{ TOrcamentoF }

procedure TOrcamentoF.btnBuscaClick(Sender: TObject);
var
  AuxWhere : String;
begin
  if Edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'ORCAMENTOID = '+Edit1.Text;

  DataModuleF.QRYOrcamento.Close;
  DataModuleF.QRYOrcamento.SQL.Text :=
            'SELECT '+
            'ORCAMENTOID, '+
            'CLIENTEID, '+
            'DT_ORCAMENTO, '+
            'DT_VALIDADE_ORCAMENTO, '+
            'VL_TOTAL_ORCAMENTO '+
            'FROM ORCAMENTO '+
           	 'WHERE '+AuxWhere+' '+
            'ORDER BY ORCAMENTOID';
  DataModuleF.QRYOrcamento.Open;
end;

procedure TOrcamentoF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  DataModuleF.QRYOrcamento.Cancel;

end;

procedure TOrcamentoF.btnRelOrcamentoClick(Sender: TObject);
begin
  frReportOrcamento.LoadFromFile('RelOrcamento.lrf');
  frReportOrcamento.PrepareReport;
  frReportOrcamento.ShowReport;
end;

procedure TOrcamentoF.BitBtn4Click(Sender: TObject);
begin
if DataModuleF.QRYOrcamento.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYOrcamento.Post;
       DataModuleF.QRYOrcamento.ApplyUpdates;
       btnNovo.Enabled:=True;
  end;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TOrcamentoF.BitBtn1Click(Sender: TObject);
var id:String;
begin
  DSOrcamentoItem.DataSet.Insert;
    DataModuleF.qryGenerica.close;
    DataModuleF.qryGenerica.SQL.Clear;
    DataModuleF.qryGenerica.SQL.Add('SELECT MAX(orcamentoitemid) + 1 PROXCODIGO '+
                                    'FROM orcamento_item' +
                                    ' WHERE ORCAMENTOID = ' + IntToStr(DataModuleF.QRYOrcamentoorcamentoid.AsInteger));
    DataModuleF.qryGenerica.Open;

    id := DataModuleF.qryGenerica.FieldByName('PROXCODIGO').AsString;

    if id = '' then
       DataModuleF.QRYOrcamentoItemorcamentoitemid.AsInteger := 1
    else
       DataModuleF.QRYOrcamentoItemorcamentoitemid.AsInteger := StrToInt(id);
    DataModuleF.QRYOrcamentoItemorcamentoid.AsInteger := DataModuleF.QRYOrcamentoorcamentoid.AsInteger;
    AddItemF.ShowModal;
end;

procedure TOrcamentoF.BitBtn2Click(Sender: TObject);
begin
   if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSOrcamentoItem.DataSet.Delete;
    DataModuleF.SubItems;
  end;
end;

procedure TOrcamentoF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSOrcamento.DataSet.Delete;
  end;
end;

procedure TOrcamentoF.btnNovoClick(Sender: TObject);
begin
  inherited;
  DSOrcamento.DataSet.Insert;
  DataModuleF.QRYOrcamentodt_orcamento.AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', now));
  DataModuleF.QRYOrcamentodt_validade_orcamento.AsDateTime := StrtoDate(FormatDateTime('dd/mm/yyyy', now + 15));
end;

procedure TOrcamentoF.btnRelOrcItemsClick(Sender: TObject);
begin
  frReportOrcamentoItens.LoadFromFile('RelOrcamentoItens.lrf');
  frReportOrcamentoItens.PrepareReport;
  frReportOrcamentoItens.ShowReport;
end;

procedure TOrcamentoF.Button1Click(Sender: TObject);
begin
  PesquisarClinteF.ShowModal;
end;

procedure TOrcamentoF.DBGrid1DblClick(Sender: TObject);
begin
  DataModuleF.QRYOrcamentoItem.Close;
  DataModuleF.QRYOrcamentoItem.Params.ParamByName('ORCAMENTOID').AsString := IntToStr(DataModuleF.QRYOrcamentoorcamentoid.AsInteger);
  DataModuleF.QRYOrcamentoItem.Open;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TOrcamentoF.FormShow(Sender: TObject);
begin
  OrcamentoF.PageControl1.ActivePageIndex:= 0;
  DSOrcamento.DataSet.Open;
end;

procedure TOrcamentoF.PageControl1Change(Sender: TObject);
begin
  DataModuleF.QRYOrcamentoItem.Close;
  DataModuleF.QRYOrcamentoItem.Params.ParamByName('ORCAMENTOID').AsString := IntToStr(DataModuleF.QRYOrcamentoorcamentoid.AsInteger);
  DataModuleF.QRYOrcamentoItem.Open;
end;

end.

