unit uDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModuleF }

  TDataModuleF = class(TDataModule)
    QRYCategoriacategoriaprodutoid: TLongintField;
    QRYCategoriads_categoria_produto: TStringField;
    QRYClienteclienteid: TLongintField;
    QRYClientecpf_cnpj_cliente: TStringField;
    QRYClientenome_cliente: TStringField;
    QRYClientetipo_cliente: TStringField;
    QRYOrcamentoclienteid: TLongintField;
    QRYOrcamentodt_orcamento: TDateTimeField;
    QRYOrcamentodt_validade_orcamento: TDateTimeField;
    QRYOrcamentoItemdesc_prod: TStringField;
    QRYOrcamentoItemorcamentoid: TLongintField;
    QRYOrcamentoItemorcamentoitemid: TLongintField;
    QRYOrcamentoItemprodutoid: TLongintField;
    QRYOrcamentoItemqt_produto: TFloatField;
    QRYOrcamentoItemvl_total: TFloatField;
    QRYOrcamentoItemvl_unitario: TFloatField;
    QRYOrcamentoorcamentoid: TLongintField;
    QRYOrcamentovl_total_orcamento: TFloatField;
    QRYProdutocategoriaprodutoid: TLongintField;
    QRYProdutods_produto: TStringField;
    QRYProdutodt_cadastro_produto: TDateTimeField;
    QRYProdutoobs_produto: TStringField;
    QRYProdutoprodutoid: TLongintField;
    QRYProdutostatus_produto: TStringField;
    QRYProdutovl_venda_produto: TFloatField;
    QRYUsuariosid: TLongintField;
    QRYUsuariosnome_completo: TStringField;
    QRYUsuariossenha: TStringField;
    QRYUsuariosusuario: TStringField;
    ZConnection1: TZConnection;
    QRYCategoria: TZQuery;
    QRYCliente: TZQuery;
    QRYProduto: TZQuery;
    QRYUsuarios: TZQuery;
    qryGenerica: TZQuery;
    QRYOrcamento: TZQuery;
    QRYOrcamentoItem: TZQuery;
    ZUpdateCategoria: TZUpdateSQL;
    ZUpdateCliente: TZUpdateSQL;
    ZUpdateProduto: TZUpdateSQL;
    ZUpdateOrcamento: TZUpdateSQL;
    ZUpdateOrcamentoItem: TZUpdateSQL;
    ZUpdateUsuarios: TZUpdateSQL;
    procedure QRYCategoriaAfterInsert(DataSet: TDataSet);
    procedure QRYClienteAfterInsert(DataSet: TDataSet);
    procedure QRYOrcamentoAfterInsert(DataSet: TDataSet);
    procedure QRYOrcamentoItemqt_produtoChange(Sender: TField);
    procedure QRYProdutoAfterInsert(DataSet: TDataSet);
    procedure QRYUsuariosAfterInsert(DataSet: TDataSet);
    procedure SomaItems;
    procedure SubItems;
  private

  public
    function getSequence(const pNomeSequence: String): String;

  end;

var
  DataModuleF: TDataModuleF;
  qtd, res ,vl_unit : Double;

implementation

{$R *.lfm}

{ TDataModuleF }
function TDataModuleF.getSequence(const pNomeSequence: String): String;
begin
     Result := '';
 try
     qryGenerica.Close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     qryGenerica.Open;
     Result := qryGenerica.FieldByName('CODIGO').AsString;
 finally
   qryGenerica.Close;
 end;
end;



procedure TDataModuleF.QRYCategoriaAfterInsert(DataSet: TDataSet);
begin
  QRYCategoriacategoriaprodutoid.AsInteger:= StrToInt(getSequence('categoria_produto_categoriaprodutoid_seq'));
end;

procedure TDataModuleF.QRYClienteAfterInsert(DataSet: TDataSet);
begin
  QRYClienteclienteid.AsInteger:= StrToInt(getSequence('cliente_clienteid'));
end;

procedure TDataModuleF.QRYOrcamentoAfterInsert(DataSet: TDataSet);
begin
  QRYOrcamentoorcamentoid.AsInteger:= StrToInt(getSequence('orcamento_orcamentoid_seq'));
end;

procedure TDataModuleF.QRYOrcamentoItemqt_produtoChange(Sender: TField);
begin
  qtd := DataModuleF.QRYOrcamentoItemqt_produto.AsFloat;
  vl_unit := DataModuleF.QRYOrcamentoItemvl_unitario.AsFloat;
  res := vl_unit * qtd;
  DataModuleF.QRYOrcamentoItemvl_total.AsFloat:= res;
end;



procedure TDataModuleF.QRYProdutoAfterInsert(DataSet: TDataSet);
begin
  QRYProdutoprodutoid.AsInteger:= StrToInt(getSequence('produto_produtoid'));
end;

procedure TDataModuleF.QRYUsuariosAfterInsert(DataSet: TDataSet);
begin
 QRYUsuariosid.AsInteger:=  StrToInt(getSequence('usuarios_id_seq'));
end;

procedure TDataModuleF.SomaItems;
begin
 QRYOrcamentoItem.First;
 QRYOrcamentovl_total_orcamento.AsFloat := 0;
 while not (QRYOrcamentoItem.EOF) do
 begin
   QRYOrcamentovl_total_orcamento.AsFloat:= QRYOrcamentovl_total_orcamento.AsFloat + QRYOrcamentoItemvl_total.AsFloat;
   QRYOrcamentoItem.Next;
 end;
end;

procedure TDataModuleF.SubItems;
begin
 QRYOrcamentoItem.First;
 QRYOrcamentovl_total_orcamento.AsFloat := 0;
 while not (QRYOrcamentoItem.EOF) do
 begin
   QRYOrcamentovl_total_orcamento.AsFloat:= QRYOrcamentoItemvl_total.AsFloat - QRYOrcamentovl_total_orcamento.AsFloat;
   QRYOrcamentoItem.Next;
 end;
end;



end.

