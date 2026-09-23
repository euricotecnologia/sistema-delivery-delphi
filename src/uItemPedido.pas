unit uItemPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmItemPedido = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemPedido: TfrmItemPedido;

implementation

{$R *.dfm}

uses uBotDAO;

end.
