unit uBlackList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBlackList = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlackList: TfrmBlackList;

implementation

{$R *.dfm}

uses uBotDAO;

procedure TfrmBlackList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BotDAO.qry_blackList.close;
end;

procedure TfrmBlackList.FormShow(Sender: TObject);
begin
  BotDAO.qry_blackList.Open;
end;

end.
