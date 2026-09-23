unit uGraficoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvOfficeStatusBar,
  VclTee.TeeGDIPlus, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.ComCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList;

type
  TfrmGraficoVendas = class(TForm)
    status: TAdvOfficeStatusBar;
    GroupBox1: TGroupBox;
    grafico: TDBChart;
    uCadastros: TFDQuery;
    DataSource1: TDataSource;
    GroupBox2: TGroupBox;
    data1: TDateTimePicker;
    data2: TDateTimePicker;
    Label1: TLabel;
    btnBuscar: TSpeedButton;
    ImageList1: TImageList;
    Series1: TBarSeries;
    uCadastrostotal: TFloatField;
    uCadastrospedido_data: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure statusPanelClick(Sender: TObject; PanelIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure busca;
  end;

var
  frmGraficoVendas: TfrmGraficoVendas;

implementation

{$R *.dfm}

uses u_principal, uBotDAO;

procedure TfrmGraficoVendas.btnBuscarClick(Sender: TObject);
begin
busca;
end;

procedure TfrmGraficoVendas.busca;
begin

            with uCadastros do
            begin
              Close;
              ParamByName('data1').AsDate:=data1.Date;
              ParamByName('data2').AsDate:=data2.Date;
              Open();

              if RecordCount =0 then
              begin
                ShowMessage('Nenhum registro encontrado !');
              end;
            end;

end;

procedure TfrmGraficoVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmGraficoVendas:=nil;
uCadastros.Close;
end;

procedure TfrmGraficoVendas.FormCreate(Sender: TObject);
begin
data1.Date:=Date;
data2.Date:=Date;
busca;
end;

procedure TfrmGraficoVendas.statusPanelClick(Sender: TObject;
  PanelIndex: Integer);
begin
     if PanelIndex=0 then
     begin
        grafico.PrintProportional:=True;
         grafico.PrintLandscape;
     end
     else if PanelIndex=1 then
     begin
        grafico.SaveToBitmapFile(botdao.dir+'img/graficoVendasPeriodo.bmp');
        ShowMessage('Imagem Salva com sucesso !');
     end
end;

end.
