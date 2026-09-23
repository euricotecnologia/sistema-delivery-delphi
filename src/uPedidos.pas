unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmPedidos = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses uBotDAO, uItemPedido;

procedure TfrmPedidos.DBGrid1DblClick(Sender: TObject);
begin
  frmItemPedido.Memo1.Clear;
  frmItemPedido.Memo2.Clear;
  frmItemPedido.Memo1.Lines.Add('Pedido: '        + DBGrid1.Columns[0].field.asString);
  frmItemPedido.Memo1.Lines.Add('Cliente: '       + DBGrid1.Columns[1].field.asString);
  frmItemPedido.Memo1.Lines.Add('Forma Pgt: '     + DBGrid1.Columns[3].field.asString);
  frmItemPedido.Memo1.Lines.Add('Pedido obs: '    + DBGrid1.Columns[6].field.asString);
  frmItemPedido.Memo1.Lines.Add('Local entrega: ' + DBGrid1.Columns[7].field.asString);
  frmItemPedido.memo2.Lines.Add(stringReplace(BotDAO.revisarPedido(strToInt(DBGrid1.Columns[0].field.asString), date,
      DBGrid1.Columns[1].field.asString),'\n', ' | ', [rfReplaceAll, rfIgnoreCase]));
  frmItemPedido.showModal;
end;

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BotDAO.qry_pedidos.close;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  BotDAO.qry_pedidos.Open;
end;

end.
