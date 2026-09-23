unit uBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  Tfbackup = class(TForm)
    status: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtBackup: TDBEdit;
    SpeedButton1: TSpeedButton;
    edtLog: TMemo;
    SpeedButton2: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbackup: Tfbackup;

implementation

{$R *.dfm}

uses u_principal, uBotDAO;

end.
