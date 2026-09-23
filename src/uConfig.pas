unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls,DB, Vcl.Buttons, Vcl.DBActns, System.Actions, Vcl.ActnList,
  AdvOfficeStatusBar,VCL.Printers;

type
  Tfconfig = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    status: TAdvOfficeStatusBar;
    tab: TPageControl;
    Conexão: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtIp: TDBEdit;
    edtBanco: TDBEdit;
    edtLogin: TDBEdit;
    edtSenha: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox3: TGroupBox;
    cbImpressora: TComboBox;
    edtImpressora: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    edtImp: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbImpressoraChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fconfig: Tfconfig;

implementation

{$R *.dfm}

uses u_principal, uBotDAO;

procedure Tfconfig.cbImpressoraChange(Sender: TObject);
begin
   if (cbImpressora.Items.Count > 0) and (cbImpressora.Text<>'') then
   begin
     BotDAO.configImpressora.AsString:=cbImpressora.Text;
   end;
end;

procedure Tfconfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if BotDAO.config.State in [dsEdit] then
begin
  BotDAO.config.Cancel;
end;
fconfig:=nil;
end;

procedure Tfconfig.FormCreate(Sender: TObject);
begin
BotDAO.config.Edit;
end;

procedure Tfconfig.FormShow(Sender: TObject);
var I:Integer;
begin

    //Lista as Impressoras Instaladas
    for I := 0 to Printer.Printers.Count-1 do
    begin
      if Pos('\\',Printer.Printers.Strings[I]) <> 0 then
      begin
        cbImpressora.Items.Add(Printer.Printers.Strings[I]);
      end
      else
      begin
        cbImpressora.Items.Add(Printer.Printers.Strings[I]);
      end;

    end;


end;

procedure Tfconfig.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure Tfconfig.SpeedButton2Click(Sender: TObject);
begin
  BotDAO.config.Post;
  ShowMessage('Configurações Salvas com sucesso ! Reinicie o sistema para aplicar as alterações !');
  Close;
  ExitProcess(0);
end;

end.
