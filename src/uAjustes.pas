unit uAjustes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvOfficeStatusBar, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TfrmAjustes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtIp: TDBEdit;
    edtBanco: TDBEdit;
    edtLogin: TDBEdit;
    edtSenha: TDBEdit;
    DBEdit5: TDBEdit;
    ActionList1: TActionList;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    status: TAdvOfficeStatusBar;
    Image1: TImage;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtMostrar: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjustes: TfrmAjustes;

implementation

{$R *.dfm}

uses u_principal, uBotDAO, fsplash;

procedure TfrmAjustes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        botdao.config.Close;
        botdao.config.Open();
        botdao.conecta;
        frmAjustes:=nil;
        splash.Timer1.Enabled:=True;
end;

procedure TfrmAjustes.FormCreate(Sender: TObject);
begin
   botdao.config.Edit;
   splash.Timer1.Enabled:=False;
end;

procedure TfrmAjustes.SpeedButton1Click(Sender: TObject);
begin

        Close;
end;

procedure TfrmAjustes.SpeedButton2Click(Sender: TObject);
begin
   if (edtIp.Text<>'') and (edtBanco.Text<>'') and (edtLogin.Text<>'') then
   begin
        botdao.config.Post;
        botdao.config.Close;
        botdao.config.Open();
        botdao.conecta;
        ShowMessage('Configurações salvas com sucesso !');
        Close;
   end
   else
   begin
     ShowMessage('Preencha todos os campos por favor !');
   end;

end;

end.
