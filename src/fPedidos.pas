unit fPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxGridLevel, dxLayoutContainer, cxGridInplaceEditForm,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  frxClass, frxDBSet, AdvOfficeStatusBar, frxExportBaseDialog, frxExportPDF;

type
  TformPedidos = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dgPedidos: TcxGrid;
    dgPedidosDBTableView1: TcxGridDBTableView;
    dgPedidosDBTableView1pedido_id: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_data: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_cliente: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_cliente_fone: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_valor_total: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_forma_pgt: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_localEntrega: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_obs: TcxGridDBColumn;
    dgPedidosDBTableView2: TcxGridDBTableView;
    dgPedidosDBTableView2itemPedido_item_tipo: TcxGridDBColumn;
    dgPedidosDBTableView2itemPedido_doisSabores: TcxGridDBColumn;
    dgPedidosDBTableView2itemPedido_concatenado: TcxGridDBColumn;
    dgPedidosDBTableView2itemPedido_maiorValor: TcxGridDBColumn;
    dgPedidosDBTableView2RootGroup: TcxGridInplaceEditFormGroup;
    uPed: TFDQuery;
    ds_uPed: TDataSource;
    uItem: TFDQuery;
    ds_uItem: TDataSource;
    uPedpedido_id: TFDAutoIncField;
    uPedpedido_cliente: TStringField;
    uPedpedido_cliente_fone: TStringField;
    uPedpedido_status: TStringField;
    uPedpedido_forma_pgt: TStringField;
    uPedpedido_valor_total: TSingleField;
    uPedpedido_data: TDateTimeField;
    uPedpedido_obs: TStringField;
    uPedpedido_localEntrega: TStringField;
    uItemitemPedido_id: TFDAutoIncField;
    uItemitemPedido_pedido_id: TIntegerField;
    uItemitemPedido_item_id: TIntegerField;
    uItemitemPedido_item_tipo: TStringField;
    uItemitemPedido_concatenado: TStringField;
    dgPedidosLevel1: TcxGridLevel;
    dgPedidosLevel2: TcxGridLevel;
    dgPedidosDBTableView3: TcxGridDBTableView;
    dgPedidosDBTableView4: TcxGridDBTableView;
    edtFiltro: TRadioGroup;
    data1: TDateTimePicker;
    data2: TDateTimePicker;
    Label1: TLabel;
    edtBusca: TSearchBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    report: TfrxReport;
    frxPedido: TfrxDBDataset;
    frxItens: TfrxDBDataset;
    status: TAdvOfficeStatusBar;
    SpeedButton3: TSpeedButton;
    exp: TfrxPDFExport;
    uItemitemPedido_qtde: TIntegerField;
    uItemitemPedido_valor: TSingleField;
    uItemitemPedido_total: TFloatField;
    dgPedidosDBTableView4itemPedido_concatenado: TcxGridDBColumn;
    dgPedidosDBTableView4itemPedido_qtde: TcxGridDBColumn;
    dgPedidosDBTableView4itemPedido_valor: TcxGridDBColumn;
    dgPedidosDBTableView4itemPedido_total: TcxGridDBColumn;
    uAdicionais: TFDQuery;
    uAdicionaisPedido: TIntegerField;
    uAdicionaisidItem: TIntegerField;
    uAdicionaisidAdicional: TIntegerField;
    uAdicionaisAdicional: TStringField;
    uAdicionaisValor: TFloatField;
    ds_uAdicionais: TDataSource;
    uPedpedido_subtotal: TFloatField;
    uPedpedido_adicionais: TFloatField;
    uPedpedido_taxa: TFloatField;
    uPedpedido_imp: TIntegerField;
    frxAdicionais: TfrxDBDataset;
    dgPedidosLevel3: TcxGridLevel;
    dgPedidosDBTableView5: TcxGridDBTableView;
    dgPedidosDBTableView5Adicional: TcxGridDBColumn;
    dgPedidosDBTableView5Valor: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_data: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_cliente: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_cliente_fone: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_forma_pgt: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_valor_total: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_subtotal: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_adicionais: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_taxa: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFiltroClick(Sender: TObject);
    procedure edtBuscaEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }

    procedure busca;

  public
    { Public declarations }
  end;

var
  formPedidos: TformPedidos;

implementation

{$R *.dfm}

uses u_principal, uBotDAO;

procedure TformPedidos.busca;
begin

    if edtFiltro.ItemIndex=0 then
    begin

        with uPed do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from tbl_pedido where pedido_data between :data1 and :data2 order by pedido_data asc');
          ParamByName('data1').AsDate:=data1.Date;
          ParamByName('data2').AsDate:=data2.Date;
          Open();
        end;

    end
    else if edtFiltro.ItemIndex=1 then
    begin

        with uPed do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from tbl_pedido where pedido_cliente_fone = :busca order by pedido_cliente asc');
          ParamByName('busca').AsString:=edtBusca.Text;
          Open();
        end;

    end
    else if edtFiltro.ItemIndex=2 then
    begin

        with uPed do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from tbl_pedido where pedido_cliente  like  :busca order by pedido_cliente asc');
          ParamByName('busca').AsString:=edtBusca.Text+'%';
          Open();
        end;

    end;

       with uItem do
        begin
          Close;
          Open();
        end;

          with uAdicionais do
        begin
          Close;
          Open();
        end;


        status.Panels[0].Text:='  Registros encontrados: '+uPed.RecordCount.ToString;


end;

procedure TformPedidos.edtBuscaEnter(Sender: TObject);
begin
edtBusca.Text:='';
end;

procedure TformPedidos.edtFiltroClick(Sender: TObject);
begin
  if edtFiltro.ItemIndex > 0 then
  edtBusca.SetFocus;
end;

procedure TformPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  uPed.Close;
  uItem.Close;
  formPedidos:=nil;
end;

procedure TformPedidos.FormCreate(Sender: TObject);
begin
  data1.Date:=Date-7;
  data2.Date:=Date;
  busca;
end;

procedure TformPedidos.SpeedButton1Click(Sender: TObject);
begin
busca;
end;

procedure TformPedidos.SpeedButton2Click(Sender: TObject);
var report:TfrxReport;
begin

      if uPed.RecordCount > 0 then
      begin
          report:= TfrxReport.Create(Self);
        report.LoadFromFile(BotDAO.dir+'listaPedidos.fr3');
        report.Variables['data1']:=''''+DateToStr(data1.Date)+'''';
        report.Variables['data2']:=''''+DateToStr(data2.Date)+'''';
        report.PrepareReport(True);
        report.ShowReport(True);
      end
      else
      ShowMessage('Nenhum Registro para impressão !');


end;

procedure TformPedidos.SpeedButton3Click(Sender: TObject);
var report:TfrxReport;
begin
 if uPed.RecordCount > 0 then
      begin
        report:= TfrxReport.Create(Self);
        report.LoadFromFile(BotDAO.dir+'listaPedidos.fr3');
        report.Variables['data1']:=''''+DateToStr(data1.Date)+'''';
        report.Variables['data2']:=''''+DateToStr(data2.Date)+'''';
        report.PrepareReport(True);
        report.Export(exp);
      end
      else
      ShowMessage('Nenhum Registro para exportação!');
end;

end.
