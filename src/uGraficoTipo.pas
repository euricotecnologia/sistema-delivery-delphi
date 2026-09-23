unit uGraficoTipo;

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
  TfrmGraficoTipos = class(TForm)
    status: TAdvOfficeStatusBar;
    GroupBox1: TGroupBox;
    grafico: TDBChart;
    Series1: TPieSeries;
    uCadastros: TFDQuery;
    DataSource1: TDataSource;
    GroupBox2: TGroupBox;
    data1: TDateTimePicker;
    data2: TDateTimePicker;
    Label1: TLabel;
    btnBuscar: TSpeedButton;
    ImageList1: TImageList;
    uCadastrostotal: TFloatField;
    uCadastrositemPedido_item_tipo: TStringField;
    uCadastrositemPedido_concatenado: TStringField;
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
  frmGraficoTipos: TfrmGraficoTipos;

implementation

{$R *.dfm}

uses u_principal, uBotDAO;

procedure TfrmGraficoTipos.btnBuscarClick(Sender: TObject);
begin
busca;
end;

procedure TfrmGraficoTipos.busca;
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

procedure TfrmGraficoTipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmGraficoTipos:=nil;
uCadastros.Close;
end;

procedure TfrmGraficoTipos.FormCreate(Sender: TObject);
begin
data1.Date:=Date;
data2.Date:=Date;
busca;
end;

procedure TfrmGraficoTipos.statusPanelClick(Sender: TObject;
  PanelIndex: Integer);
begin
     if PanelIndex=0 then
     begin
        grafico.PrintProportional:=True;
         grafico.PrintLandscape;
     end
     else if PanelIndex=1 then
     begin
        grafico.SaveToBitmapFile(botdao.dir+'img/graficoProdsPeriodo.bmp');
        ShowMessage('Imagem Salva com sucesso !');
     end
end;

end.
