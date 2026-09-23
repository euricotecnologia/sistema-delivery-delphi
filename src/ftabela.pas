unit ftabela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvOfficeStatusBar, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls, Data.DB, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uImportExcel,
  FireDAC.Comp.Client, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  Ttabela = class(TForm)
    status: TAdvOfficeStatusBar;
    tab: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    listaArquivo: TStringGrid;
    ProgressBar1: TProgressBar;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    dgTabela: TDBGrid;
    SpeedButton1: TSpeedButton;
    btnBuscar: TSpeedButton;
    btnImp: TSpeedButton;
    SpeedButton4: TSpeedButton;
    imp: TImportExcel;
    dialogo: TOpenDialog;
    auxiliar: TFDQuery;
    listaBanco: TDBGrid;
    report: TfrxReport;
    fxTaxas: TfrxDBDataset;
    exp: TfrxPDFExport;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImpClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dgTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure listaBancoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tabela: Ttabela;

implementation

{$R *.dfm}

uses u_principal, uBotDAO;

procedure Ttabela.btnImpClick(Sender: TObject);
var I:Integer;
begin
  if listaArquivo.RowCount > 0 then
  begin
    btnBuscar.Enabled:=False;
    btnImp.Enabled:=False;
    with auxiliar do
    begin
      Close;
      sql.Clear;
      sql.Add('delete from tbl_taxas');
      ExecSQL;
    end;
    ProgressBar1.Position:=0;
    botdao.taxas.Close;
    botdao.taxas.Open();

      for I := 0 to listaArquivo.RowCount - 1 do
      begin
        with botdao do
        begin
          taxas.Insert;
          taxasbairro.AsString:=UpperCase(listaArquivo.Cells[0,I]);
          taxasvalor.AsCurrency:= StrToCurr(listaArquivo.Cells[1,I]);
          taxas.Post;
          ProgressBar1.Position:=ProgressBar1.Position+1;
        end;

      end;

    btnBuscar.Enabled:=True;
    btnImp.Enabled:=False;

    ShowMessage('Registros importados com sucesso !');
    botdao.taxas.Close;
    botdao.taxas.Open;


  end;
end;

procedure Ttabela.dgTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dgTabela do
          begin

             if Odd(DataSource.DataSet.RecNo) then
                  begin
                    Canvas.Brush.Color:=$00A8D3FF;
                    Canvas.Font.Color:=clBlack;
                  end
                  else
                  begin
                    Canvas.Brush.Color:=$000080FF;
                    Canvas.Font.Color:=clWhite;
                  end;
                  Canvas.FillRect(Rect);
                  DefaultDrawColumnCell(Rect,DataCol,Column,State);
                  if gdSelected in State then
                  begin
                     Canvas.Brush.Color:=clRed;
                     Canvas.Font.Color:=clWhite;
                     Canvas.FillRect(Rect);
                     DefaultDrawColumnCell(Rect,DataCol,Column,State);
                  end;





          end;
end;

procedure Ttabela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
auxiliar.Close;
tabela:=nil;
end;

procedure Ttabela.listaBancoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
          with listaBanco do
          begin

             if Odd(DataSource.DataSet.RecNo) then
                  begin
                    Canvas.Brush.Color:=$00A8D3FF;
                    Canvas.Font.Color:=clBlack;
                  end
                  else
                  begin
                    Canvas.Brush.Color:=$000080FF;
                    Canvas.Font.Color:=clWhite;
                  end;
                  Canvas.FillRect(Rect);
                  DefaultDrawColumnCell(Rect,DataCol,Column,State);
                  if gdSelected in State then
                  begin
                     Canvas.Brush.Color:=clRed;
                     Canvas.Font.Color:=clWhite;
                     Canvas.FillRect(Rect);
                     DefaultDrawColumnCell(Rect,DataCol,Column,State);
                  end;





          end;
end;

procedure Ttabela.SpeedButton1Click(Sender: TObject);
var report:TfrxReport;
begin

                 if botdao.taxas.RecordCount > 0 then
                    begin

                      report:=TfrxReport.Create(Self);
                      report.LoadFromFile(botdao.dir+'listaTaxas.fr3');
                      report.PrepareReport(True);
                      report.Export(exp);
                    end
                    else
                    begin
                      ShowMessage('Não há registros cadastrados !');
                    end;
end;

procedure Ttabela.SpeedButton4Click(Sender: TObject);
var report:TfrxReport;
begin
                    if botdao.taxas.RecordCount > 0 then
                    begin

                      report:=TfrxReport.Create(Self);
                      report.LoadFromFile(botdao.dir+'listaTaxas.fr3');
                      report.PrepareReport(True);
                      report.ShowReport(True);
                    end
                    else
                    begin
                      ShowMessage('Não há registros cadastrados !');
                    end;
end;

procedure Ttabela.btnBuscarClick(Sender: TObject);
begin
     if dialogo.Execute then
     begin
      if dialogo.FileName <> '' then
      begin
         btnImp.Enabled:=True;
         imp.ExcelFile:=dialogo.FileName;
         imp.ExcelParaStringGrid(listaArquivo,ProgressBar1);
      end
      else
      begin
        btnImp.Enabled:=False;
      end;
     end;
end;

end.
