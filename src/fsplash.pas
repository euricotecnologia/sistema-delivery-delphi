unit fsplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxActivityIndicator;

type
  Tsplash = class(TForm)
    logo: TImage;
    Timer1: TTimer;
    pb: TdxActivityIndicator;
    efeito: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure efeitoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splash: Tsplash;

implementation

{$R *.dfm}

uses u_principal,uBotDao, uAjustes;

procedure Tsplash.efeitoTimer(Sender: TObject);
begin
  if splash.AlphaBlendValue < 255 then
  begin
    splash.AlphaBlendValue:= splash.AlphaBlendValue+15;
  end
  else
  begin
    efeito.Enabled:=False;
    splash.AlphaBlendValue:=255;
    splash.AlphaBlend:=False;
  end;
end;

procedure Tsplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
splash:=nil;
end;

procedure Tsplash.FormShow(Sender: TObject);
begin
Timer1.Enabled:=True;
end;

procedure Tsplash.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled:=False;
    frmPrincipal.AlphaBlend:=True;
    frmPrincipal.AlphaBlendValue:=255;
    frmPrincipal.BringToFront;
    Close;
end;

end.
