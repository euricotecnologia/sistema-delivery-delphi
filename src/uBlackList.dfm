object frmBlackList: TfrmBlackList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Blacklist Ex.: 558199999999'
  ClientHeight = 385
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 247
    Height = 379
    Align = alClient
    DataSource = BotDAO.ds_blackList
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'listaNegra_fone'
        Title.Caption = 'Contatos bloqueados'
        Visible = True
      end>
  end
end
