unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons,



  //units adicionais obrigatórias -->
  uTInject.ConfigCEF, uTInject, uBotGestor, uBotConversa, uBotDAO, uTInject.Constant,  uTInject.JS,
  uTInject.Console,   uTInject.Diversos,  uTInject.AdjustNumber, uTInject.Config, uTInject.Classes,
  //<--

  System.StrUtils, DateUtils, Vcl.ExtDlgs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Imaging.jpeg, IPPeerClient,
  AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvPanel, Vcl.WinXCtrls,
  AdvOfficeStatusBar, AdvOfficeStatusBarStylers, Vcl.ComCtrls, Vcl.DBCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxActivityIndicator, AdvMenus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  dxLayoutContainer, cxGridInplaceEditForm, AdvShapeButton, AdvPreviewMenu,
  AdvPreviewMenuStylers, cxDBNavigator, frxClass, frxDBSet, Vcl.Mask,
  dxGDIPlusClasses, AdvEdit, DBAdvEd, Vcl.DBActns, System.Actions,
  Vcl.ActnList, cxContainer,Math ,cxLabel, cxDBLabel, frxBarcode, Vcl.AppEvnts,
  Vcl.DBCGrids, cxImage, cxDBEdit, AdvPicture, DBAdvPicture, AdvGDIPicture,
  DBAdvGDIPPicture, AdvSmoothImageListBox, DBAdvSmoothImageListBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxBlobEdit, EhLibVCL, DBCtrlsEh,
  AdvSmoothPageSlider, AdvDBFormLayouter, AdvDBFormPanel, AeroButtons;


type
  TfrmPrincipal = class(TForm)
    Inject1: TInject;
    dialogo: TOpenPictureDialog;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    menu: TAdvToolBarPager;
    AdvToolBarPager11: TAdvPage;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvPage1: TAdvPage;
    AdvToolBar7: TAdvToolBar;
    AdvGlowButton7: TAdvGlowButton;
    status: TAdvOfficeStatusBar;
    popCon: TAdvPopupMenu;
    ViaHTTP1: TMenuItem;
    ViaDesktop1: TMenuItem;
    PPEDIDOS: TPanel;
    tabMenu: TPageControl;
    ATENDIMENTO: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    PPizzas: TPanel;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    PBebidas: TPanel;
    DBGrid1: TDBGrid;
    uPedidos: TFDQuery;
    uItens: TFDQuery;
    ds_uPedidos: TDataSource;
    ds_uItens: TDataSource;
    uPedidospedido_id: TFDAutoIncField;
    uPedidospedido_cliente_fone: TStringField;
    uPedidospedido_status: TStringField;
    uPedidospedido_forma_pgt: TStringField;
    uPedidospedido_valor_total: TSingleField;
    uPedidospedido_data: TDateTimeField;
    uPedidospedido_obs: TStringField;
    uPedidospedido_localEntrega: TStringField;
    uPedidospedido_cliente: TStringField;
    uItensitemPedido_id: TFDAutoIncField;
    uItensitemPedido_item_tipo: TStringField;
    uItensitemPedido_concatenado: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    HPedido: TcxStyle;
    IPedidos: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    imgTabs: TImageList;
    atualiza: TTimer;
    AdvPage2: TAdvPage;
    AdvToolBar9: TAdvToolBar;
    EDTvENDAS: TAdvGlowButton;
    CARDÁPIO: TTabSheet;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    imgEnd: TImage;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    imgNavigator: TImageList;
    report: TfrxReport;
    fPedidos: TfrxDBDataset;
    fItens: TfrxDBDataset;
    uPedImp: TFDQuery;
    uItensImp: TFDQuery;
    ds_uPedImp: TDataSource;
    ds_uItensImp: TDataSource;
    uItensImpitemPedido_id: TFDAutoIncField;
    uItensImpitemPedido_item_tipo: TStringField;
    uItensImpitemPedido_concatenado: TStringField;
    uPedImppedido_id: TFDAutoIncField;
    uPedImppedido_cliente: TStringField;
    uPedImppedido_cliente_fone: TStringField;
    uPedImppedido_status: TStringField;
    uPedImppedido_forma_pgt: TStringField;
    uPedImppedido_valor_total: TSingleField;
    uPedImppedido_data: TDateTimeField;
    uPedImppedido_obs: TStringField;
    uPedImppedido_localEntrega: TStringField;
    impressao: TTimer;
    validaPizza: TFDQuery;
    uPedidospedido_imp: TIntegerField;
    uPedImppedido_imp: TIntegerField;
    grPizzas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDescP: TDBEdit;
    Label3: TLabel;
    edtValorP: TDBEdit;
    imgOn: TImage;
    imgOff: TImage;
    imgAddP: TImage;
    imgEditP: TImage;
    lbStatusP: TLabel;
    edtMenuP: TDBAdvEdit;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    validaBebida: TFDQuery;
    Panel5: TPanel;
    ActionList1: TActionList;
    Action1: TAction;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetInsert2: TDataSetInsert;
    DatasetDelete2: TDataSetDelete;
    DatasetEdit2: TDataSetEdit;
    DatasetPost2: TDataSetPost;
    DatasetCancel2: TDataSetCancel;
    btnAddP: TSpeedButton;
    btnEditP: TSpeedButton;
    btnCancelarP: TSpeedButton;
    btnDelP: TSpeedButton;
    btnSalvarP: TSpeedButton;
    grBebidas: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    imgOnB: TImage;
    imgOffB: TImage;
    imgAddB: TImage;
    imgEditB: TImage;
    lbStatusB: TLabel;
    Label9: TLabel;
    edtDescB: TDBEdit;
    edtValorB: TDBEdit;
    edtMenuB: TDBAdvEdit;
    DBEdit4: TDBEdit;
    Panel6: TPanel;
    btnaddB: TSpeedButton;
    btneditarB: TSpeedButton;
    btnCancelarB: TSpeedButton;
    btnExcluirB: TSpeedButton;
    btnSalvarB: TSpeedButton;
    lbDigitoP: TcxDBLabel;
    lbDigitoB: TcxDBLabel;
    Panel9: TPanel;
    Memo1: TMemo;
    Splitter2: TSplitter;
    listaLog: TListView;
    imgLista: TImageList;
    uBuscaPedido: TFDQuery;
    uBuscaPedidopedido_id: TFDAutoIncField;
    uBuscaPedidopedido_status: TStringField;
    uBuscaPedidopedido_imp: TIntegerField;
    frxBarCodeObject1: TfrxBarCodeObject;
    uBuscaPedidopedido_cliente: TStringField;
    uBuscaPedidopedido_cliente_fone: TStringField;
    uBuscaPedidopedido_forma_pgt: TStringField;
    uBuscaPedidopedido_valor_total: TSingleField;
    uBuscaPedidopedido_data: TDateTimeField;
    uBuscaPedidopedido_obs: TStringField;
    uBuscaPedidopedido_localEntrega: TStringField;
    uPedImpitemPedido_id: TIntegerField;
    uPedImpitemPedido_pedido_id: TIntegerField;
    uPedImpitemPedido_item_id: TIntegerField;
    uPedImpitemPedido_item_tipo: TStringField;
    uPedImpitemPedido_concatenado: TStringField;
    tabPedidos: TPageControl;
    TabSheet1: TTabSheet;
    uListaStatus: TFDQuery;
    uListaStatuspedido_id: TFDAutoIncField;
    uListaStatuspedido_cliente: TStringField;
    uListaStatuspedido_cliente_fone: TStringField;
    uListaStatuspedido_status: TStringField;
    uListaStatuspedido_forma_pgt: TStringField;
    uListaStatuspedido_valor_total: TSingleField;
    uListaStatuspedido_data: TDateTimeField;
    uListaStatuspedido_imp: TIntegerField;
    uListaStatuspedido_obs: TStringField;
    uListaStatuspedido_localEntrega: TStringField;
    auxiliar: TFDQuery;
    auxiliarpedido_status: TStringField;
    uItensitemPedido_pedido_id: TIntegerField;
    uItensImpitemPedido_pedido_id: TIntegerField;
    statusPedidos: TTimer;
    auxiliarpedido_id: TFDAutoIncField;
    auxiliarpedido_cliente: TStringField;
    auxiliarpedido_cliente_fone: TStringField;
    auxiliarpedido_forma_pgt: TStringField;
    auxiliarpedido_valor_total: TSingleField;
    auxiliarpedido_data: TDateTimeField;
    auxiliarpedido_imp: TIntegerField;
    auxiliarpedido_obs: TStringField;
    auxiliarpedido_localEntrega: TStringField;
    listaEntregues: TListView;
    listaEnviados: TListView;
    listaProd: TListView;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel10: TPanel;
    SpeedButton4: TSpeedButton;
    tray: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    BalloonHint1: TBalloonHint;
    AdvToolBar10: TAdvToolBar;
    AdvGlowButton4: TAdvGlowButton;
    AdvPage3: TAdvPage;
    AdvToolBar5: TAdvToolBar;
    btnPizzas: TAdvGlowButton;
    AdvToolBar1: TAdvToolBar;
    btnBebidas: TAdvGlowButton;
    AdvToolBar2: TAdvToolBar;
    btnCardapio: TAdvGlowButton;
    AdvToolBar8: TAdvToolBar;
    btnEndereco: TAdvGlowButton;
    AdvToolBar11: TAdvToolBar;
    edtLogo: TAdvGlowButton;
    dialogoLogo: TOpenPictureDialog;
    AdvToolBar6: TAdvToolBar;
    AdvGlowButton1: TAdvGlowButton;
    SpeedButton5: TSpeedButton;
    AdvToolBar13: TAdvToolBar;
    AdvGlowButton2: TAdvGlowButton;
    uItensImpitemPedido_qtde: TIntegerField;
    uItensImpitemPedido_valor: TSingleField;
    uItensImpitemPedido_total: TFloatField;
    uItensitemPedido_qtde: TIntegerField;
    uItensitemPedido_valor: TSingleField;
    uItensitemPedido_total: TFloatField;
    TabSheet6: TTabSheet;
    GroupBox3: TGroupBox;
    Panel15: TPanel;
    DBGrid3: TDBGrid;
    gr_adicionais: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ok3: TImage;
    erro3: TImage;
    add3: TImage;
    edit3: TImage;
    lbAdicional: TLabel;
    Label13: TLabel;
    edtDescAd: TDBEdit;
    edtValorAd: TDBEdit;
    edtMenuAd: TDBAdvEdit;
    DBEdit5: TDBEdit;
    cxDBLabel1: TcxDBLabel;
    Panel16: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    DatasetInsert3: TDataSetInsert;
    DatasetDelete3: TDataSetDelete;
    DatasetEdit3: TDataSetEdit;
    DatasetPost3: TDataSetPost;
    DatasetCancel3: TDataSetCancel;
    AdvToolBar14: TAdvToolBar;
    btnAd: TAdvGlowButton;
    validaAdicional: TFDQuery;
    uAdicionais: TFDQuery;
    ds_uAdicionais: TDataSource;
    uAdicionaisImp: TFDQuery;
    ds_uAdicionaisImp: TDataSource;
    fAdicionais: TfrxDBDataset;
    uAdicionaisImpidItemExtra: TFDAutoIncField;
    uAdicionaisImpPedido: TIntegerField;
    uAdicionaisImpidAdicional: TIntegerField;
    uAdicionaisImpAdicional: TStringField;
    uAdicionaisImpValor: TFloatField;
    uAdicionaisPedido: TIntegerField;
    uAdicionaisAdicional: TStringField;
    uAdicionaisValor: TFloatField;
    uPedImppedido_subtotal: TFloatField;
    uPedImppedido_adicionais: TFloatField;
    uPedImppedido_taxa: TFloatField;
    uPedImpitemPedido_qtde: TIntegerField;
    uPedImpitemPedido_valor: TSingleField;
    uPedImpitemPedido_total: TFloatField;
    uBuscaPedidopedido_subtotal: TFloatField;
    uBuscaPedidopedido_adicionais: TFloatField;
    uBuscaPedidopedido_taxa: TFloatField;
    dgPedidos: TcxGrid;
    dgPedidosDBTableView1: TcxGridDBTableView;
    dgPedidosDBTableView1pedido_id: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_data: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_cliente: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_cliente_fone: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_valor_total: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_forma_pgt: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_localEntrega: TcxGridDBColumn;
    dgPedidosDBTableView1pedido_obs: TcxGridDBColumn;
    dgPedidosDBTableView2: TcxGridDBTableView;
    dgPedidosDBTableView2itemPedido_item_tipo: TcxGridDBColumn;
    dgPedidosDBTableView2itemPedido_doisSabores: TcxGridDBColumn;
    dgPedidosDBTableView2itemPedido_concatenado: TcxGridDBColumn;
    dgPedidosDBTableView2itemPedido_maiorValor: TcxGridDBColumn;
    dgPedidosDBTableView2RootGroup: TcxGridInplaceEditFormGroup;
    dgPedidosDBTableView3: TcxGridDBTableView;
    dgPedidosDBTableView4: TcxGridDBTableView;
    dgPedidosDBTableView5: TcxGridDBTableView;
    dgPedidosDBTableView5Adicional: TcxGridDBColumn;
    dgPedidosDBTableView5Valor: TcxGridDBColumn;
    dgPedidosLevel1: TcxGridLevel;
    dgPedidosLevel2: TcxGridLevel;
    dgPedidosDBTableView4itemPedido_concatenado: TcxGridDBColumn;
    dgPedidosDBTableView4itemPedido_qtde: TcxGridDBColumn;
    dgPedidosDBTableView4itemPedido_valor: TcxGridDBColumn;
    dgPedidosDBTableView4itemPedido_total: TcxGridDBColumn;
    uPedidospedido_subtotal: TFloatField;
    uPedidospedido_adicionais: TFloatField;
    uPedidospedido_taxa: TFloatField;
    dgPedidosDBTableView3pedido_data: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_cliente: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_cliente_fone: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_forma_pgt: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_localEntrega: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_obs: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_subtotal: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_adicionais: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_taxa: TcxGridDBColumn;
    dgPedidosDBTableView3pedido_valor_total: TcxGridDBColumn;
    mm: TMemo;
    DatasetInsert4: TDataSetInsert;
    DatasetDelete4: TDataSetDelete;
    DatasetEdit4: TDataSetEdit;
    DatasetPost4: TDataSetPost;
    DatasetCancel4: TDataSetCancel;
    pb: TdxActivityIndicator;
    lblStatus: TLabel;
    cheCon: TCheckBox;
    sl: TAdvSmoothPageSlider;
    pg1: TAdvSmoothPage;
    pg2: TAdvSmoothPage;
    pg3: TAdvSmoothPage;
    pg4: TAdvSmoothPage;
    pg5: TAdvSmoothPage;
    img1: TImage;
    Panel14: TPanel;
    AeroSpeedButton1: TAeroSpeedButton;
    AeroSpeedButton2: TAeroSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Panel17: TPanel;
    AeroSpeedButton3: TAeroSpeedButton;
    AeroSpeedButton4: TAeroSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Panel18: TPanel;
    AeroSpeedButton5: TAeroSpeedButton;
    AeroSpeedButton6: TAeroSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    Panel19: TPanel;
    AeroSpeedButton7: TAeroSpeedButton;
    AeroSpeedButton8: TAeroSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    Panel20: TPanel;
    AeroSpeedButton9: TAeroSpeedButton;
    AeroSpeedButton10: TAeroSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    Panel21: TPanel;
    imgLogo: TImage;
    Image1: TImage;
    uAdicionaisidItemExtra: TFDAutoIncField;
    uAdicionaisidAdicional: TIntegerField;
    dgPedidosLevel3: TcxGridLevel;
    dgPedidosDBTableView6: TcxGridDBTableView;
    dgPedidosDBTableView6Adicional: TcxGridDBColumn;
    dgPedidosDBTableView6Valor: TcxGridDBColumn;
    uItensitemPedido_item_id: TIntegerField;
    uAdicionaisidItem: TIntegerField;
    pfuncoes: TPanel;
    btnCancelar: TSpeedButton;
    uPedidospedido_motivo: TStringField;
    uPedImppedido_motivo: TStringField;
    uItensImpitemPedido_item_id: TIntegerField;
    uAdicionaisImpidItem: TIntegerField;
    procedure Inject1GetUnReadMessages(const Chats: TChatList);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sai1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Inject1Connected(Sender: TObject);
    procedure Bloqueados1Click(Sender: TObject);
    procedure Pedidoswhatsapp1Click(Sender: TObject);
    procedure AdvGlowButton7Click(Sender: TObject);
    procedure btnPizzasClick(Sender: TObject);
    procedure btnBebidasClick(Sender: TObject);
    procedure Inject1Disconnected(Sender: TObject);
    procedure atualizaTimer(Sender: TObject);
    procedure dgPedidosDBTableView1DataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure dgPedidosDBTableView1DataControllerDetailCollapsed(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure Inject1DisconnectedBrute(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure edtMenuPExit(Sender: TObject);
    procedure edtMenuPButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure btnAddPClick(Sender: TObject);
    procedure btnEditPClick(Sender: TObject);
    procedure btnDelPClick(Sender: TObject);
    procedure btnCancelarPClick(Sender: TObject);
    procedure btnSalvarPClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure btnaddBClick(Sender: TObject);
    procedure btneditarBClick(Sender: TObject);
    procedure btnExcluirBClick(Sender: TObject);
    procedure btnCancelarBClick(Sender: TObject);
    procedure btnSalvarBClick(Sender: TObject);
    procedure edtMenuBExit(Sender: TObject);
    procedure tabMenuChange(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure impressaoTimer(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgPedidosDblClick(Sender: TObject);
    procedure tabPedidosChange(Sender: TObject);
    procedure Entrega1Click(Sender: TObject);
    procedure Entregue1Click(Sender: TObject);
    procedure Cancelado1Click(Sender: TObject);
    procedure statusPedidosTimer(Sender: TObject);
    procedure listaEnviadosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure listaEntreguesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure listaEnviadosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure listaEntreguesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure listaLogStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure listaProdStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure listaEnviadosStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure listaEntreguesStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure listaLogDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure listaLogDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure trayDblClick(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure edtGraficoClick(Sender: TObject);
    procedure edtLogoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure listaLogEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure EDTvENDASClick(Sender: TObject);
    procedure listaProdDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure listaProdDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnAdClick(Sender: TObject);
    procedure edtMenuAdExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure dgPedidosDBTableView3DataControllerDetailCollapsed(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure dgPedidosDBTableView3DataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Inject1GetStatus(Sender: TObject);
    procedure AeroSpeedButton2Click(Sender: TObject);
    procedure AeroSpeedButton1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure slPageChange(Sender: TObject);
    procedure dgPedidosDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure dgPedidosDBTableView3GroupRowExpanded(Sender: TcxGridTableView;
      AGroup: TcxGridGroupRow);
    procedure dgPedidosDBTableView3GroupRowCollapsed(Sender: TcxGridTableView;
      AGroup: TcxGridGroupRow);
////    procedure imgPictureSelect(Sender: TObject; FileName: string;
//      var Allow: Boolean);
//    procedure imgClick(Sender: TObject);
  private
    { Private declarations }

    //Curso
    gestor: TBotManager;
    conversaAtual: TBotConversa;
  public
    { Public declarations }

    var
    cardapio,endereco:string;
    cont:Integer;// Qtde de Pedidos do dia
    codPedido:Integer;

    procedure realizarDragAndDrop(Sender:TObject;Source:TObject);
    procedure EnviaCozinha(vFone,vCliente:string);
    procedure EnviaEntrega(vFone,vCliente:string);
    procedure ListaPedidos; //Lista os pedidos finalizados
    procedure imprime(vID: Integer);//Imprime o pedido
    function validaMenu(valor:Integer):Boolean;
    procedure GestorInteracao(conversa: TBotConversa);
    procedure EnviarMenu_Principal(AData: TDate; AIDCliente: string);
    procedure EnviarMenu_PrincipalADM;
    procedure EnviarMensagem_listaNegra;
    procedure EnviarMensagem(AEtapa: Integer; ATexto: String; AAnexo: String = ''; ATipo: integer = 0);
    procedure EnviarAvisoInativo(AIDPedido: integer);
    function  TextoOpcoesSeteDias: string;
    procedure Enviar_cardapio;
    procedure Enviar_endereco;
    procedure EnviarMenu_pizza(ATipo: string);
    procedure EnviarMenu_bebidas(ATipo: string);
    procedure EnviarMenu_PrincipalPedidoDUO(AItem: integer; AIDPedido: integer;
      ATipoItem: string = ''; ADoisSabores: string = '');
    procedure EnviarMenu_PrincipalPedido(AItem: integer; AIDPedido: integer;
      ATipoItem: string = ''; ADoisSabores: string = '');
    procedure EnviarAvisoOpcaoInvalida;
    procedure Enviar_revisaoPedido(AIDPedidoRev: integer; AData: TDate; AIDCliente: string);
    procedure Enviar_finalizarPedido(AIDPedido: integer; AData: TDate; AIDCliente: string);
    procedure EnviarMenu_removerItem(AIDPedidoRemove: integer; AData: TDate; AIDCliente: string);
    procedure EnviarMenu_confirmaExclusaoItem(AIDItem: string);
    procedure enviarEnderecoEntrega;
    procedure EnviarMenu_solicitaLocalizacao;
    procedure EnviarMenu_formaPagamento(AIDPedido: integer; AEndereco: string = '');
    procedure EnviarMenu_Observacoes(AFormaPgt: string = '');
    procedure EnviarMenu_etapaFinal(AObservacoes: string);
    procedure EnviarMenu_localizacao(vLat, vLng: string);
    procedure EnviarMenu_solicitarEndereco;
    procedure EnviarMenu_processaEndereco(AEndereco: string);
    procedure EnviarMenu_confirmaEndereco(AIDPedido: integer);
    procedure EnviarMenu_primeiroSabor;
    procedure EnviarMenu_segundoSabor(AItem: integer; AIDPedido: integer;
      ATipoItem: string = ''; ADoisSabores: string = '');

    function MontaAdicional:string;
    procedure EnviarMenu_PrincipalAdicional(AItem: integer; AIDPedido: integer;
      ATipoItem: string = '');

    procedure cardapios;
    function BuscaIDItem(vPedido,vIDMenu:Integer):Integer;
    var idPedido:Integer;
    var fone,nome:string;

  end;

var
  frmPrincipal: TfrmPrincipal;

const MENSAGEM_VOLTAR_INICIO = ' MENU INICIAL digite *#* \n';
const MENSAGEM_TEMPO_PEDIDO  = ' *ATENÇÃO*: ';

implementation

uses
  System.TypInfo, System.NetEncoding, System.JSON, uBlackList, uPedidos,
  uConfig, uBackup, fPedidos, fsplash, ftabela, uGraficoTipo, uGraficoVendas,
  uAjustes;

{$R *.dfm}

procedure TfrmPrincipal.EnviarMensagem(AEtapa: Integer; ATexto: String; AAnexo: String = ''; ATipo: integer = 0);
begin
  ConversaAtual.Etapa    := AEtapa;
  ConversaAtual.Pergunta := ATexto;
  ConversaAtual.Resposta := '';

  if AAnexo <> '' then
  begin
    Inject1.SendFile(ConversaAtual.ID, AAnexo, ConversaAtual.Pergunta);
  end
  else
  if AAnexo = '' then
    begin
      Inject1.send(ConversaAtual.ID, ConversaAtual.Pergunta);
    end;
end;

procedure TfrmPrincipal.EnviarMensagem_listaNegra;
var
  AText: String;
begin
  AText := AText + Inject1.Emoticons.AtendenteM + Inject1.Emoticons.Erro + 'Olá *' + ConversaAtual.Nome + '*! \n';
  AText := AText + Inject1.Emoticons.Hamburguer +' Você está no *NextBot Lanches* '+ ' \n\n';
  AText := AText + Inject1.Emoticons.Atencao +'Não é possível continuar. Seu número encontra-se bloqueado.\n\n';
  AText := AText + Inject1.Emoticons.Atencao +'Entre em contato com a nossa *central do cliente* e solicite o desbloqueio. Ligue: (35) 99730-6903\n\n';
  EnviarMensagem(0, AText);
end;

procedure TfrmPrincipal.Enviar_cardapio;
var
  AText: String;
  I:Integer;
begin



    with BotDAO.qry_mostrarCardapio do
    begin

            if (FieldByName('img1').IsNull = False) then
            begin
             AText := '';
             AText := AText + Inject1.Emoticons.AtendenteM + ' CONFIRA ACIMA O NOSSO CARDÁPIO ! \n\n';
             AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
             EnviarMensagem(1, AText, FieldByName('img1').AsString);
            end;

            if (FieldByName('img2').IsNull = False) then
            begin
                AText := '';
                AText := AText + Inject1.Emoticons.AtendenteM + ' CONFIRA ACIMA O NOSSO CARDÁPIO ! \n\n';
               AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
               EnviarMensagem(1, AText, FieldByName('img2').AsString);
            end;

              if FieldByName('img3').IsNull = False then
            begin
                 AText := '';
                 AText := AText + Inject1.Emoticons.AtendenteM + ' CONFIRA ACIMA O NOSSO CARDÁPIO ! \n\n';
                 AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
                 EnviarMensagem(1, AText, FieldByName('img3').AsString);
            end;


              if FieldByName('img4').IsNull = False then
            begin
                 AText := '';
                 AText := AText + Inject1.Emoticons.AtendenteM + ' CONFIRA ACIMA O NOSSO CARDÁPIO ! \n\n';
                 AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
                 EnviarMensagem(1, AText, FieldByName('img4').AsString);
            end;

              if FieldByName('img5').IsNull = False then
            begin
               AText := '';
               AText := AText + Inject1.Emoticons.AtendenteM + ' CONFIRA ACIMA O NOSSO CARDÁPIO ! \n\n';
               AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
               EnviarMensagem(1, AText, FieldByName('img5').AsString);
            end;





    end;




end;

procedure TfrmPrincipal.Enviar_endereco;
var AText:string;
begin

    AText := '';
    AText := AText + Inject1.Emoticons.AtendenteM + 'Confira nosso endereço!\n\n';
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    EnviarMensagem(1, AText, endereco);

end;

procedure TfrmPrincipal.Enviar_finalizarPedido(AIDPedido: integer; AData: TDate;
  AIDCliente: string);
var
  AText: String;
begin

  BotDAO.atualizaPedido(conversaAtual.IDPedido,'','Dinheiro','',conversaAtual.id,Date,0,'N');

  AText := AText + Inject1.Emoticons.AtendenteM +' *Finalizar* pedido. Seus itens: \n\n';
  AText := AText + BotDAO.revisarPedido(AIDPedido, AData, AIDCliente);
  AText := AText + '\n\n' + Inject1.Emoticons.SetaDireita + ' Para finalizar o pedido digite *FINALIZAR* \n\n';
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;

  if length(AText) > 280 then
  begin
    EnviarMensagem(6, AText);
  end else
  begin
    //opcoes
   AText := '';
    AText := Atext + Inject1.Emoticons.LoiraTriste + Inject1.Emoticons.Erro +'Ops.. Não encontrei *itens no seu pedido*. Inclua pelo menos um *item*. É bem rapidinho hein ! ..Vamos lá?\nDigite um *número* como opção:\n\n';
    AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
    AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
    AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
    AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
    AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
    AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    EnviarMensagem(1, AText);
  end;
end;

procedure TfrmPrincipal.EnviarMenu_Observacoes(AFormaPGT: string);
var
  AText: String;
begin
  //gravando a forma de pagamento
  conversaAtual.formaPGT := AFormaPGT;
  BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,conversaAtual.FormaPGT,'',conversaAtual.ID,Date,0,'N');
  AText := AText + Inject1.Emoticons.AtendenteM   + 'Estamos quase no final ok? \n\n';
  AText := AText + Inject1.Emoticons.CanetaAzul + 'Digite alguma *OBSERVAÇÃO* no pedido, por exemplo: *Se precisa de troco*, *Sem cebola* etc... \n Ou então digite um *OK* para continuar. \n\n';
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(11, AText);
end;

procedure TfrmPrincipal.Enviar_revisaoPedido(AIDPedidoRev: integer; AData: TDate; AIDCliente: string);
var
  AText: String;
begin
  BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,'Dinheiro','',conversaAtual.ID,date,0,'N');
  AText := AText + Inject1.Emoticons.AtendenteM +' Olá *'+ConversaAtual.Nome+'* Revise seu pedido: \n\n';
  AText := AText + BotDAO.revisarPedido(AIDPedidoRev, AData, AIDCliente);
  AText := AText + '\n\n' + Inject1.Emoticons.NoEntrySign + 'Para remover um item digite *REMOVER*';
  AText := AText + '\n\n' + Inject1.Emoticons.Estrela + 'Para finalizar o pedido digite *FINALIZAR* \n\n';
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;

  if length(AText) > 360  then
  begin
    EnviarMensagem(3, AText);
  end else
  begin
    //opcoes
    AText := '';
    AText := Atext + Inject1.Emoticons.LoiraTriste + Inject1.Emoticons.Erro +'Ops.. Não encontrei *itens no seu pedido*. Inclua pelo menos um *item*. É bem rapidinho hein ! ..Vamos lá?\nDigite um *número* como opção:\n\n';
    AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
    AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
    AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
    AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
    AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
    AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';
    AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    EnviarMensagem(1, AText);
  end;
end;

procedure TfrmPrincipal.EnviarMenu_PrincipalPedido(AItem, AIDPedido: integer;
  ATipoItem, ADoisSabores: string);
var
  AText: String;
  vItem:Integer;
  st:TStringList;

begin

  conversaAtual.MaiorValor := 0; //Zero o MaiorValor para não confundir os pedidos DUO


  if (ATipoItem = 'Bebidas') then
  begin
   conversaAtual.MaiorValor := BotDAO.verificaValorBebida(ATipoItem, AItem, conversaAtual.MaiorValor);
  end
    else  if (ATipoItem = 'Lanches') then
    begin
      conversaAtual.MaiorValor := BotDAO.verificaValorPizza(ATipoItem, AItem, conversaAtual.MaiorValor);
    end;

  BotDAO.InsereItemPedido(AItem, AIDPedido, 0,ConversaAtual.Qtde ,conversaAtual.MaiorValor,  ATipoItem, '');

  //BotDAO.atualizaPedido(AIDPedido,'','Dinheiro','',conversaAtual.ID,Date,0,'N');
  conversaAtual.IDItem:=AItem;

      AText := AText + Inject1.Emoticons.AtendenteM + 'Item incluído no *pedido*! '+Inject1.Emoticons.Check+'\n\n';


     if (ATipoItem = 'Bebidas') then
      begin

          AText := AText + 'Por favor *digite* um número como opção:  \n\n';

          //opcoes
         AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
        AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
        AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
        AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
        AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
        AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';
        AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
        AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
        EnviarMensagem(1, AText,BotDAO.dir+'img/adicionado.png');

      end
      else if (ATipoItem = 'Lanches') then
      begin
           if Length(MontaAdicional) > 0 then
           begin

               conversaAtual.Items:=BotDAO.ListaAdicionais;
               AText := AText + Inject1.Emoticons.ApontaBaixo+' Selecione um *adicional* para o lanche: \n\n';
               AText := AText + MontaAdicional+'\n\n';
               AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
               AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
               EnviarMensagem(21, AText);

           end
           else
           begin
               AText := AText + 'Por favor *digite* um número como opção:  \n\n';

                //opcoes
              AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
              AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
              AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
              AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
              AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
              AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';
              AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
              AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
              EnviarMensagem(1, AText,BotDAO.dir+'img/adicionado.png');

           end;

      end;







end;

procedure TfrmPrincipal.EnviarMenu_PrincipalPedidoDUO(AItem: integer; AIDPedido: integer;
  ATipoItem: string = ''; ADoisSabores: string = '');
var
  AText: String;
begin
  {
  conversaAtual.MaiorValor := BotDAO.verificaValorPizza(ATipoItem, AItem, conversaAtual.MaiorValor);

  //--Inserindo o segundo sabor com o mesmo IDInc do primeiro
  BotDAO.InsereItemPedido(AItem, AIDPedido, conversaAtual.IDInc, conversaAtual.MaiorValor,
  ATipoItem, ADoisSabores);
  //--

  //--Atualizando campo itemPedido_contatenado, e itemPedido_maiorValor com os dois sabores escolhidos
  BotDAO.AtualizaCamposItemPedido(conversaAtual.IDInc, date, conversaAtual.ID, conversaAtual.MaiorValor, ATipoItem);
  //--

  AText := AText + Inject1.Emoticons.AtendenteM + 'Item incluído no *pedido*!'+Inject1.Emoticons.Check+'\n';
  AText := AText + 'Por favor *digite* um número como opção:  \n\n';

  //opcoes
     AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
    AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
    AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
    AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
    AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
    AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';
    AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    EnviarMensagem(1, AText);
    }
end;

procedure TfrmPrincipal.EnviarMenu_processaEndereco(AEndereco: string);
var
  AText: String;
  ABairro:string;
  vEnd:string;
    st,st2:TStringList;
    I:Integer;
    ok:Boolean;
begin
  //Gravando endereco do cliente
  ConversaAtual.EnderecoCliente := AEndereco;
  conversaAtual.Taxa:=BotDAO.configtaxa.AsCurrency;
  ABairro:='';
  ConversaAtual.Bairro:=ABairro;
  ok:=False;

  if Pos('-',AEndereco) > 0 then
  begin

         st:=TStringList.Create;
         st.StrictDelimiter:=True;
         st.Delimiter:=',';
         st.DelimitedText:=AEndereco;

         st2:=TStringList.Create;
         st2.StrictDelimiter:=True;
         st2.Delimiter:='-';
         st2.DelimitedText:=st[1];

         if(Pos(' ',st2[1]) = 1) then
         begin
           ABairro:=Copy(st2[1],2,Length(st2[1])-1);
         end
         else
         begin
           ABairro:=st2[1];
         end;


         conversaAtual.Bairro:=ABairro;


         with BotDAO.taxas do
         begin
           Close;
           Open();

           if RecordCount > 0 then
           begin

              First;
              for I := 0 to RecordCount - 1 do
              begin

                 if UpperCase(conversaAtual.Bairro)=UpperCase(FieldByName('bairro').AsString) then
                 begin
                    ok:=True;
                    conversaAtual.Bairro:=FieldByName('bairro').AsString;
                    conversaAtual.Taxa:= FieldByName('valor').AsCurrency;
                    break

                 end;

                 Next;

              end;


           end ;

         end;

    if (conversaAtual.Bairro <> '') and (ok=True) then
    begin


              //Se não achar o bairro com a digitação correta !
              AText   := AText + Inject1.Emoticons.Palmas  + ' *CONFIRA ABAIXO SE SEU ENDEREÇO ESTÁ CORRETO:* \n\n';
              AText   := AText + Inject1.Emoticons.DeliveryTruck   + ' A taxa de entrega para o bairro *'+ConversaAtual.Bairro+'* é de: '+CurrtoStrf(ConversaAtual.Taxa,ffCurrency,2)+' \n\n';

              AText   := AText + Inject1.Emoticons.Pino  + ' *Endereço digitado*:\n '+AEndereco+'\n\n';

              AText   := AText + 'Confirma o endereço e o bairro acima?\n\n';
              AText   := AText + Inject1.Emoticons.Um     + ' *Sim*\n';
              AText   := AText + Inject1.Emoticons.Dois   + ' *Não* \n\n';
              AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
              AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
              conversaAtual.EnderecoCliente := AEndereco;
              EnviarMensagem(13, AText);


    end
    else
    begin

              //Se não achar o bairro com a digitação correta !
              AText   := AText + Inject1.Emoticons.LoiraTriste   + ' *NÃO FOI POSSÍVEL LOCALIZAR SEU BAIRRO !* \n';
              AText   := AText + Inject1.Emoticons.DeliveryTruck   + ' A taxa de entrega será fixa ! \n\n';
              AText   := AText + Inject1.Emoticons.AtendenteM   + ' *Por favor *confira os dados*: \n\n';
              AText   := AText + Inject1.Emoticons.Pino  + ' *Endereço digitado*:\n '+AEndereco+'\n';
              AText   := AText +Inject1.Emoticons.Dinheiro  + ' A taxa de entrega  é: *'+CurrToStrF(conversaAtual.Taxa,ffCurrency,2)+'* \n';
              AText   := AText + 'Confirma o endereço e o bairro acima?\n\n';
              AText   := AText + Inject1.Emoticons.Um     + ' *Sim*\n';
              AText   := AText + Inject1.Emoticons.Dois   + ' *Não* \n\n';
              AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
              AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
              conversaAtual.EnderecoCliente := AEndereco;
              EnviarMensagem(13, AText);


    end;

  end
  else
  begin
              //Se não achar o bairro com a digitação correta !
              AText   := AText + Inject1.Emoticons.LoiraTriste   + ' *NÃO FOI POSSÍVEL LOCALIZAR SEU BAIRRO !* \n';
              AText   := AText + Inject1.Emoticons.DeliveryTruck   + ' A taxa de entrega será fixa ! \n\n';
              AText   := AText + Inject1.Emoticons.AtendenteM   + ' *Por favor *confira os dados*: \n\n';
              AText   := AText + Inject1.Emoticons.Pino  + ' *Endereço digitado*:\n '+AEndereco+'\n';
              AText   := AText +Inject1.Emoticons.Dinheiro  + ' A taxa de entrega  é: *'+CurrToStrF(conversaAtual.Taxa,ffCurrency,2)+'* \n';
              AText   := AText + 'Confirma o endereço e o bairro acima?\n\n';
              AText   := AText + Inject1.Emoticons.Um     + ' *Sim*\n';
              AText   := AText + Inject1.Emoticons.Dois   + ' *Não* \n\n';
              AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
              AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
              conversaAtual.EnderecoCliente := AEndereco;
              EnviarMensagem(13, AText);
  end;



end;

procedure TfrmPrincipal.EnviarMenu_removerItem(AIDPedidoRemove: integer; AData: TDate; AIDCliente: string);
var
  AText: String;
begin
  //Objeto Items recebendo o array de códigos
  ConversaAtual.Items  :=  BotDAO.preparaRemocaoItemPedido(AIDPedidoRemove, AData, AIDCliente);

  if (ConversaAtual.Items) = nil then
  begin
    Enviar_finalizarPedido(AIDPedidoRemove, date, AIDCliente);
  end else
  begin
    AText := Inject1.Emoticons.AtendenteM   + 'Digite o *CÓDIGO* correspondente ao *item* que deseja remover do seu pedido: \n\n';
    AText := AText + BotDAO.listaItensParaRemocaoPedido(AIDPedidoRemove, AData, AIDCliente);
    //AText := AText + BotDAO.revisarPedido(AIDPedidoRemove, AData, AIDCliente);
    AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    EnviarMensagem(4, AText);
  end;
end;

procedure TfrmPrincipal.EnviarMenu_segundoSabor(AItem: integer; AIDPedido: integer;
      ATipoItem: string = ''; ADoisSabores: string = '');
var
  AText : string;
begin
  {
  //Inserindo o primeiro sabor

  conversaAtual.MaiorValor := 0; //Zero o MaiorValor para não confundir os pedidos DUO

  //--Aqui incremento o IDInc para que não se repitam. Essencial para pedidos DUO(Dois sabores)
  conversaAtual.IDInc := (conversaAtual.IDInc) + 1;
  //--

  conversaAtual.MaiorValor := BotDAO.verificaValorPizza(ATipoItem, AItem, conversaAtual.MaiorValor);

  BotDAO.InsereItemPedido(AItem, AIDPedido, conversaAtual.IDInc, conversaAtual.MaiorValor,
    ATipoItem, ADoisSabores);

  AText := Inject1.Emoticons.AtendenteM   + 'Agora, digite o *número* correspondente ao *segundo sabor*: \n\n';
  AText := AText + 'Segundo sabor Pizza: *' + ConversaAtual.Tipo +'*\n\n';
  AText := AText + BotDAO.ListaMenuPizza;
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(15, AText);
  }
end;

procedure TfrmPrincipal.EnviarMenu_solicitaLocalizacao;
var
  AText: String;
begin
  AText := Inject1.Emoticons.AtendenteM   + 'Ok. Envie agora a sua *localização*\n';
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(8, AText, ExtractFileDir(Application.ExeName)+'\Img\localizacao.jpeg', 1);
end;

procedure TfrmPrincipal.EnviarMenu_solicitarEndereco;
var
  AText: String;
begin
  AText := Inject1.Emoticons.AtendenteM   +' Por favor digite agora o seu endereço nessa formato: \n\n';
  AText := AText + Inject1.Emoticons.Atencao +' NOME DA RUA, NÚMERO *-* BAIRRO *,* PONTO DE REFERÊNCIA. \n';
 AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(12, AText);
end;

procedure TfrmPrincipal.EnviarMenu_pizza(ATipo: string);
var
  AText: String;
  I:Integer;
begin
  //Objeto Items recebendo o array de códigos das pizzas
  ConversaAtual.Items :=  BotDAO.ListaOpcoesPizza;
  
  //Gravando que é lanche
  ConversaAtual.tipo := 'Lanches';

  AText := Inject1.Emoticons.AtendenteM   + 'Digite a quantidade seguida de *x* e o  *número* correspondente ao Lanche: \n\n';
  AText := AText + BotDAO.ListaMenuPizza;
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;

  EnviarMensagem(2, AText);
end;

procedure TfrmPrincipal.EnviarMenu_primeiroSabor;
var
  AText: String;
begin
  AText := Inject1.Emoticons.AtendenteM   + 'Digite o *número* correspondente ao *primeiro sabor*: \n\n';
  AText := AText + 'Primeiro sabor Pizza: *' + ConversaAtual.Tipo +'*\n\n'; //tamanhoPizza
  AText := AText + BotDAO.ListaMenuPizza;
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(14, AText);
end;

procedure TfrmPrincipal.EnviarMenu_Principal(AData: TDate; AIDCliente: string);
var
  AText,atualiza: String;
begin
  ConversaAtual.Situacao := saEmAtendimento;

  conversaAtual.IDPedido := BotDAO.ConsultaPedido(AData, AIDCliente);


  if conversaAtual.IDPedido > 0 then
  begin

    BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,conversaAtual.FormaPGT,'',conversaAtual.ID,date,conversaAtual.Taxa,'N');
    AText := AText + Inject1.Emoticons.AtendenteM + 'Olá novamente *' + ConversaAtual.Nome + '*! \n';
    AText := AText + Inject1.Emoticons.Hamburguer +' Você está *NextBot Lanches*'+ ' \n';
    AText := AText + 'Seu pedido é o número: *'+ IntToStr(conversaAtual.IDPedido)    + '*\n\n';
    AText := AText + 'Por favor *digite* um número como opção:  \n\n';

    //opcoes
    AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
    AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
    AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
    AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
    AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
    AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';

    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    if (botdao.uLogoimagem.AsString <> '') and (botdao.uLogoimagem.IsNull=False) then
    begin
       EnviarMensagem(1, AText,botdao.uLogoimagem.AsString);
    end
    else
    begin
      EnviarMensagem(1, AText);
    end;


  end
  else begin
        //Armazenando o ID do pedido
        conversaAtual.Taxa:=0;
        conversaAtual.EnderecoCliente:='';
        conversaAtual.Bairro:='';
        conversaAtual.IDPedido := BotDAO.novoPedido(AData, AIDCliente,ConversaAtual.Nome);
        //BotDAO.atualizaPedido(conversaAtual.IDPedido,'','Dinheiro','',conversaAtual.id,Date,0,'N');

        AText := AText + Inject1.Emoticons.AtendenteM + 'Olá *' + ConversaAtual.Nome    + '*!\n';
        AText := AText + Inject1.Emoticons.Hamburguer +' Você está no *NextBot Lanches*'+ '\n';
        AText := AText + 'Seu pedido é o número: *'+ IntToStr(conversaAtual.IDPedido)    + '*\n\n';
        AText := AText + 'Por favor *digite* um número como opção:\n\n';

        //opcoes
          AText := AText + Inject1.Emoticons.Restaurante       + ' *1* - Cardápio \n';
          AText := AText + Inject1.Emoticons.Hamburger     + ' *2* - Lanches \n';
          AText := AText + Inject1.Emoticons.Bebida   + ' *3* - Bebidas \n';
          AText := AText + Inject1.Emoticons.Pino    + ' *4* - Nosso endereço \n';
          AText := AText + Inject1.Emoticons.CarrinhoCompras     + ' *5* - Revisar meu pedido \n';
          AText := AText + Inject1.Emoticons.Estrela     + ' *6* - Quero *finalizar* meu pedido !\n\n';
          AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
          AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
            if (botdao.uLogoimagem.AsString <> '') and (botdao.uLogoimagem.IsNull=False) then
            begin
               EnviarMensagem(1, AText,botdao.uLogoimagem.AsString);
            end
            else
            begin
              EnviarMensagem(1, AText);
            end;
       end;
end;


procedure TfrmPrincipal.EnviarMenu_PrincipalAdicional(AItem, AIDPedido: integer;
  ATipoItem:string);
  var
  AText: String;
  vItem:Integer;
  st:TStringList;
begin


   conversaAtual.ValorExtra := BotDAO.verificaValorExtra(ATipoItem, AItem, conversaAtual.ValorExtra);

   BotDAO.InsereAdicionalPedido(conversaAtual.IDItem, AIDPedido, AItem,conversaAtual.ValorExtra);

               AText:='';

               AText := AText + Inject1.Emoticons.AtendenteM + ' Adicional incluído no *pedido*! '+Inject1.Emoticons.Check+'\n\n';
               AText := AText + Inject1.Emoticons.ApontaBaixo + ' Selecione mais adicionais para seu item: \n\n';
               conversaAtual.Items:=BotDAO.ListaAdicionais;
               AText := AText + MontaAdicional+'\n\n';
               AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
               AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
               EnviarMensagem(21, AText,BotDAO.dir+'\Img\adicionado.png');


end;

procedure TfrmPrincipal.EnviarMenu_PrincipalADM;
var
  AText: String;
begin
  ConversaAtual.Situacao := saEmAtendimento;

  AText := AText + Inject1.Emoticons.AtendenteM + 'Olá *' + ConversaAtual.Nome + '*! \n';
  AText := AText + Inject1.Emoticons.Hamburguer +'Você está no *NextBot Lanches* menu ADM'+ Inject1.Emoticons.Pizza +' \n\n';
  AText := AText + 'Por favor *digite* um número como opção:  \n\n';
  AText := AText + TextoOpcoesSeteDias;

  EnviarMensagem(20,AText);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inject1.ShutDown();
  ExitProcess(0);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
cont:=0;
frmPrincipal.AlphaBlend:=True;
frmPrincipal.AlphaBlendValue:=0;
if splash=nil then
splash:=Tsplash.Create(Self);
splash.Show;
splash.BringToFront;

end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=13) and (tabMenu.TabIndex=1) then
  begin
    btnSalvarPClick(Sender);
  end;


end;

function TfrmPrincipal.TextoOpcoesSeteDias: string;
var
  I: Integer;
  AData: TDate;
begin
  AData := Now - 6;
  for I := -6 to 0 do
  begin
    case I of
      -6 : Result := Result + Inject1.Emoticons.Um;
      -5 : Result := Result + Inject1.Emoticons.Dois;
      -4 : Result := Result + Inject1.Emoticons.Tres;
      -3 : Result := Result + Inject1.Emoticons.Quatro;
      -2 : Result := Result + Inject1.Emoticons.Cinco;
      -1 : Result := Result + Inject1.Emoticons.Seis;
      0 : Result := Result + Inject1.Emoticons.Sete;
    end;
    Result := Result + FormatDateTime('DD/MM/YYYY dddd', AData - I ) + '\n';
  end;
end;

procedure TfrmPrincipal.trayDblClick(Sender: TObject);
begin
WindowState:=wsMaximized;
Self.Show;
Application.BringToFront;
tray.Visible:=False;
end;

function TfrmPrincipal.validaMenu(valor: Integer): Boolean;
var pizza,bebida,adicional:integer;
begin
        pizza:=0;
        bebida:=0;
        adicional:=0;

        with validaPizza do
        begin
          Close;
          ParamByName('id').AsInteger:=valor;
          Open();

          if RecordCount > 0 then
          begin
            pizza:=1;
          end;
        end;

        with validaBebida do
        begin
          Close;
          ParamByName('id').AsInteger:=valor;
          Open();

          if RecordCount > 0 then
          begin
            bebida:=1;
          end;


        end;

         with validaAdicional do
        begin
          Close;
          ParamByName('id').AsInteger:=valor;
          Open();

          if RecordCount > 0 then
          begin
            adicional:=1;
          end;


        end;

        //Retorna
        if bebida or pizza or adicional = 1 then
        begin
          Result:=False;
        end
        else  if bebida and  pizza and adicional = 0 then
        begin
          Result:=True;
        end;

end;

procedure TfrmPrincipal.btnAdClick(Sender: TObject);
begin
tabMenu.TabIndex:=3;
end;

procedure TfrmPrincipal.btnaddBClick(Sender: TObject);
begin
 with BotDAO.qry_bebida do
  begin


          Insert;
          grBebidas.Visible:=True;
          FieldByName('bebida_id_menu').AsInteger:=RecordCount+1;
          FieldByName('status').AsString:='T';
          FieldByName('bebida_valor').AsCurrency:=0;
          edtMenuB.SetFocus;
          imgAddB.Visible:=True;
          imgEditB.Visible:=False;
          lbStatusB.Caption:='Adicionando registro...';



  end;
end;

procedure TfrmPrincipal.btnAddPClick(Sender: TObject);
begin
  with BotDAO.qry_pizza do
  begin


          Insert;
          grPizzas.Visible:=True;
          FieldByName('pizza_id_menu').AsInteger:=RecordCount+1;
          FieldByName('status').AsString:='T';
          FieldByName('pizza_valorGrande').AsCurrency:=0;
          edtMenuP.SetFocus;
          imgAddP.Visible:=True;
          imgEditP.Visible:=False;
          lbStatusP.Caption:='Adicionando registro...';



  end;

end;

procedure TfrmPrincipal.btnBebidasClick(Sender: TObject);
begin
tabMenu.TabIndex:=2;
end;

procedure TfrmPrincipal.btnCancelarBClick(Sender: TObject);
begin

           with BotDAO.qry_bebida do
           begin
            Cancel;
            grBebidas.Visible:=False;
            imgEditB.Visible:=False;
            imgAddB.Visible:=False;
            imgOnB.Visible:=False;
            imgOffB.Visible:=False;
            lbStatusB.Caption:='';
           end;
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
var
motivo:string;
mensagem:string;
begin
      if uPedidos.RecordCount > 0 then
      begin

        if Application.MessageBox('Tem certeza que deseja cancelar o pedido?','ATENÇÃO',MB_YESNO+MB_ICONQUESTION)=ID_YES then
         begin
            motivo:=InputBox('','MOTIVO DO CANCELAMENTO','');

            with auxiliar do
            begin
              Close;
              sql.Clear;
              SQL.Add('update tbl_pedido set pedido_status=:status,pedido_motivo=:motivo where pedido_id=:id');
              ParamByName('status').AsString:='C';
              ParamByName('motivo').AsString:=motivo;
              ParamByName('id').AsInteger:=idPedido;
              ExecSQL;
            end;
            ShowMessage('Pedido cancelado com sucesso !');

            mensagem:='';
            mensagem:=mensagem+Inject1.Emoticons.Triste+' Olá *'+nome+'* ! \n';
            mensagem:=mensagem+'Seu pedido foi cancelado ! \n\n ';
            mensagem:=mensagem+'*Motivo*: '+motivo+' \n\n';
            mensagem:=mensagem+Inject1.Emoticons.LoiraAteLogo+' Esperamos vê-lo(a) novamente ! \n ';

            Inject1.Send(fone,mensagem);

         end;


      end;
end;

procedure TfrmPrincipal.btnCancelarPClick(Sender: TObject);
begin


           with BotDAO.qry_pizza do
           begin
            Cancel;

            grPizzas.Visible:=False;
            imgEditP.Visible:=False;
            imgAddP.Visible:=False;
            imgOn.Visible:=False;
            imgOff.Visible:=False;
            lbStatusP.Caption:='';
           end;
end;

procedure TfrmPrincipal.btnDelPClick(Sender: TObject);
begin
           with BotDAO.qry_pizza do
           begin
            Delete;
            imgEditP.Visible:=False;
            imgAddP.Visible:=False;
            lbStatusP.Caption:='';
            ShowMessage('Registro excluído com sucesso !');
           end;

end;

procedure TfrmPrincipal.btneditarBClick(Sender: TObject);
begin
  with BotDAO.qry_bebida do
           begin
           Edit;
           grBebidas.Visible:=True;
           edtMenuB.SetFocus;
           imgEditB.Visible:=True;
           imgAddB.Visible:=False;
           imgOnB.Visible:=True;
           imgOffB.Visible:=False;
           lbStatusB.Caption:='Editando registro...';
           end;
end;

procedure TfrmPrincipal.btnEditPClick(Sender: TObject);
begin

           with BotDAO.qry_pizza do
           begin
           Edit;
           grPizzas.Visible:=True;
           edtMenuP.SetFocus;
           imgEditP.Visible:=True;
           imgAddP.Visible:=False;
           imgOn.Visible:=True;
           imgOff.Visible:=False;
           lbStatusP.Caption:='Editando registro...';
           end;


end;

procedure TfrmPrincipal.btnExcluirBClick(Sender: TObject);
begin
 with BotDAO.qry_bebida do
           begin
            Delete;
            imgEditB.Visible:=False;
            imgAddB.Visible:=False;
            lbStatusB.Caption:='';
            ShowMessage('Registro excluído com sucesso !');
           end;
end;

procedure TfrmPrincipal.btnPizzasClick(Sender: TObject);
begin
  tabMenu.TabIndex:=1;
end;

procedure TfrmPrincipal.btnSalvarBClick(Sender: TObject);
begin


          with BotDAO.qry_bebida do
           begin
              if (edtMenuB.Text<>'') and (edtDescB.Text<>'') and (edtValorB.Text<>'')  then
              begin

                        if imgOnB.Visible=True then
                        begin
                          Post;
                          imgEditB.Visible:=False;
                          imgAddB.Visible:=False;
                          imgOnB.Visible:=False;
                          imgOffB.Visible:=False;
                          lbStatusB.Caption:='';
                          grBebidas.Visible:=False;
                          Close;
                          Open();
                          ShowMessage('Registro salvo com sucesso !');
                        end
                        else if imgOffB.Visible=True then
                        begin
                          ShowMessage('Dígito do Menu já cadastrado ! Tente outro valor !');
                          edtMenuB.SetFocus;
                        end;


              end
              else
              begin
                ShowMessage('Preencha todo o formulário ! ');
              end;
          end;


end;

procedure TfrmPrincipal.btnSalvarPClick(Sender: TObject);
begin

          with BotDAO.qry_pizza do
           begin
              if (edtMenuP.Text<>'') and (edtDescP.Text<>'') and (edtValorP.Text<>'')  then
              begin

                        if imgOn.Visible=True then
                        begin
                          Post;
                          imgEditP.Visible:=False;
                          imgAddP.Visible:=False;
                          imgOn.Visible:=False;
                          imgOff.Visible:=False;
                          lbStatusP.Caption:='';
                          grPizzas.Visible:=False;
                          Close;
                          Open();
                          ShowMessage('Registro salvo com sucesso !');
                        end
                        else if imgOff.Visible=True then
                        begin
                          ShowMessage('Dígito do Menu já cadastrado ! Tente outro valor !');
                          edtMenuP.SetFocus;
                        end;


              end
              else
              begin
                ShowMessage('Preencha todo o formulário ! ');
              end;
          end;


end;

function TfrmPrincipal.BuscaIDItem(vPedido, vIDMenu: Integer): Integer;
var
fd:TFDQuery;
begin

            fd:=TFDQuery.Create(Self);
            fd.Connection:=BotDAO.CN;

            with fd do
            begin
              Close;
              sql.Clear;
              sql.Add('select itemPedido_id from tbl_itempedido as i where i.itemPedido_pedido_id=:pedido and i.itemPedido_item_id=:item ');
              ParamByName('pedido').AsInteger:=vPedido;
              ParamByName('item').AsInteger:=vIDMenu;
              Open();

              Result:=FieldByName('itemPedido_id').AsInteger;
            end;



end;

procedure TfrmPrincipal.Cancelado1Click(Sender: TObject);
begin
with auxiliar do
     begin
       Close;
       ParamByName('id').AsInteger:=StrToInt(listaLog.Items.Item[listaLog.ItemIndex].Caption);
       Open();
       edit;
       FieldByName('pedido_status').AsString:='C';
       Post;
       Close;
     end;
end;

procedure TfrmPrincipal.cardapios;
begin
  BotDAO.qry_mostrarCardapio.Edit;
  if sl.ActivePageIndex=0 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

             if dialogo.Execute then
             begin

              FieldByName('img1').AsString:=dialogo.FileName;
              img1.Picture.LoadFromFile(dialogo.FileName);
              Post;

             end ;

    end;

  end
  else if sl.ActivePageIndex=1 then
  begin

   with BotDAO.qry_mostrarCardapio do
    begin

             if dialogo.Execute then
             begin

              FieldByName('img2').AsString:=dialogo.FileName;
              img2.Picture.LoadFromFile(dialogo.FileName);
              Post;

             end ;

    end;

  end
  else if sl.ActivePageIndex=2 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

             if dialogo.Execute then
             begin

              FieldByName('img3').AsString:=dialogo.FileName;
              img3.Picture.LoadFromFile(dialogo.FileName);
              Post;

             end ;

    end;

  end
    else if sl.ActivePageIndex=3 then
    begin

          with BotDAO.qry_mostrarCardapio do
          begin

                   if dialogo.Execute then
                   begin

                    FieldByName('img4').AsString:=dialogo.FileName;
                    img4.Picture.LoadFromFile(dialogo.FileName);
                    Post;

                   end ;

          end


    end
    else if sl.ActivePageIndex=4 then
    begin
                        with BotDAO.qry_mostrarCardapio do
                        begin


                        if dialogo.Execute then
                         begin

                          FieldByName('img5').AsString:=dialogo.FileName;
                          img5.Picture.LoadFromFile(dialogo.FileName);
                          Post;

                         end ;



                        end;


   end;




end;

procedure TfrmPrincipal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
               with DBGrid1 do
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

procedure TfrmPrincipal.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
          with DBGrid2 do
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

procedure TfrmPrincipal.DBGrid2Exit(Sender: TObject);
begin
        if botdao.qry_pizza.State in [dsEdit,dsInsert] then
         begin
            if DBGrid2.Columns.Items[0].FieldName='pizza_id_menu' then
          begin

            if validaMenu(DBGrid2.Fields[0].asInteger)=True then
            begin
              dbgrid2.Fields[0].FocusControl;
              ShowMessage('Dígito já cadastrado ! Escolha outro valor por favor !');
            end;

          end;
         end;
end;

procedure TfrmPrincipal.dgPedidosDblClick(Sender: TObject);
begin
  tabPedidos.ActivePageIndex:=1;
  atualiza.Enabled:=False;
end;

procedure TfrmPrincipal.dgPedidosDBTableView1DataControllerDetailCollapsed(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
       atualiza.Enabled:=True;
end;

procedure TfrmPrincipal.dgPedidosDBTableView1DataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
      cont:= ARecordIndex;
      atualiza.Enabled:=False;
end;

procedure TfrmPrincipal.dgPedidosDBTableView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin

    idPedido:=uPedidospedido_id.AsInteger;
    fone:=uPedidospedido_cliente_fone.AsString;
    nome:=uPedidospedido_cliente.AsString;

end;

procedure TfrmPrincipal.dgPedidosDBTableView3DataControllerDetailCollapsed(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
atualiza.Enabled:=True;
end;

procedure TfrmPrincipal.dgPedidosDBTableView3DataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
atualiza.Enabled:=False;
end;

procedure TfrmPrincipal.dgPedidosDBTableView3GroupRowCollapsed(
  Sender: TcxGridTableView; AGroup: TcxGridGroupRow);
begin
atualiza.Enabled:=True;
end;

procedure TfrmPrincipal.dgPedidosDBTableView3GroupRowExpanded(
  Sender: TcxGridTableView; AGroup: TcxGridGroupRow);
begin
atualiza.Enabled:=False;
end;

procedure TfrmPrincipal.edtGraficoClick(Sender: TObject);
begin
  if frmGraficoTipos=nil then
   frmGraficoTipos:=TfrmGraficoTipos.Create(Self);
   frmGraficoTipos.Show;
end;

procedure TfrmPrincipal.edtLogoClick(Sender: TObject);
begin
  if dialogoLogo.Execute then
  begin
    if dialogoLogo.FileName <> '' then
    begin
      imgLogo.Picture.LoadFromFile(dialogoLogo.FileName);
      botdao.uLogo.Edit;
      botdao.uLogoimagem.AsString:= dialogoLogo.FileName;
      botdao.uLogo.Post;
      menu.ActivePageIndex:=0;
      ShowMessage('Logotipo salvo com sucesso !');
    end
    else
    begin
      imgLogo.Picture.Assign(nil);
    end;
  end;
end;

procedure TfrmPrincipal.edtMenuAdExit(Sender: TObject);
begin
if BotDAO.qry_adicionais.State in [dsInsert,dsEdit] then
    begin

      if validaMenu(StrToInt(edtMenuAd.Text))=False then
          begin
            //ShowMessage('Dígito já existente ! Tente outro valor !');
            //edtMenuP.SetFocus;
            ok3.Visible:=False;
            erro3.Visible:=True;
          end
          else
          begin
            ok3.Visible:=True;
            erro3.Visible:=False;
          end;

    end;
end;

procedure TfrmPrincipal.edtMenuBExit(Sender: TObject);
begin
if BotDAO.qry_bebida.State in [dsInsert,dsEdit] then
    begin

      if validaMenu(StrToInt(edtMenuB.Text))=False then
          begin
            //ShowMessage('Dígito já existente ! Tente outro valor !');
            //edtMenuP.SetFocus;
            imgOnB.Visible:=False;
            imgOffB.Visible:=True;
          end
          else
          begin
            imgOnB.Visible:=True;
            imgOffB.Visible:=False;
          end;

    end;
end;

procedure TfrmPrincipal.edtMenuPButtonDown(Sender: TObject; TopButton: Boolean;
  var AutoRepeat, Handled: Boolean);
begin
    if BotDAO.qry_pizza.State in [dsInsert,dsEdit] then
    begin

      if validaMenu((edtMenuP.Value))=False then
          begin
            //ShowMessage('Dígito já existente ! Tente outro valor !');
            //edtMenuP.SetFocus;
            imgOn.Visible:=False;
            imgOff.Visible:=True;
          end
          else
          begin
            imgOn.Visible:=True;
            imgOff.Visible:=False;
          end;

    end;
end;

procedure TfrmPrincipal.edtMenuPExit(Sender: TObject);
begin
    if BotDAO.qry_pizza.State in [dsInsert,dsEdit] then
    begin

      if validaMenu(StrToInt(edtMenuP.Text))=False then
          begin
            //ShowMessage('Dígito já existente ! Tente outro valor !');
            //edtMenuP.SetFocus;
            imgOn.Visible:=False;
            imgOff.Visible:=True;
          end
          else
          begin
            imgOn.Visible:=True;
            imgOff.Visible:=False;
          end;

    end;
end;

procedure TfrmPrincipal.AdvGlowButton1Click(Sender: TObject);
begin
  if tabela=nil then
   tabela:=Ttabela.Create(Self);
   tabela.ShowModal;
end;

procedure TfrmPrincipal.AdvGlowButton2Click(Sender: TObject);
begin
  if formPedidos=nil then
  formPedidos:=TformPedidos.Create(Self);
  formPedidos.ShowModal;
end;

procedure TfrmPrincipal.AdvGlowButton3Click(Sender: TObject);
begin

          Gestor                              := TBotManager.Create(Self);
          Gestor.OnInteracao                  := GestorInteracao;
          Gestor.Simultaneos                  := 20;
          Gestor.SenhaADM                     := 'ALTERE_ESTA_SENHA'; //Defina aqui a senha do administrador do chatBot
          Gestor.TempoInatividade             := (300 * 1000);

          if not Inject1.Auth(false) then
          begin

              Inject1.FormQrCodeType := Ft_Http;
              Inject1.FormQrCodeStart;

          end;

          if not Inject1.FormQrCodeShowing then
          begin
              Inject1.FormQrCodeShowing := True;
          end;
end;

procedure TfrmPrincipal.AdvGlowButton7Click(Sender: TObject);
begin
  if fconfig=nil then
   fconfig:=Tfconfig.Create(Self);
   fconfig.ShowModal;
end;

procedure TfrmPrincipal.AeroSpeedButton1Click(Sender: TObject);
begin
 if sl.ActivePageIndex > 0  then
  begin
    sl.ActivePageIndex:= sl.ActivePageIndex - 1;
  end;
end;

procedure TfrmPrincipal.AeroSpeedButton2Click(Sender: TObject);
begin
  if sl.PageIndex < 4 then
  begin
     sl.NextPage;
  end;
end;

procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
WindowState:=wsMinimized;
Self.Hide;
tray.Visible:=True;
tray.ShowBalloonHint;
end;

procedure TfrmPrincipal.atualizaTimer(Sender: TObject);
var
 K:Integer;
begin

        with uPedidos do
        begin
            Close;
            ParamByName('data').AsDate:=Date;
            OPen();


            if RecordCount > 0 then
            begin
                with uItens do
                begin
                  Close;
                  Open();
                end;

                with uAdicionais do
                begin
                  Close;

                  Open();
                end;
            end;

        end;




end;

procedure TfrmPrincipal.Bloqueados1Click(Sender: TObject);
begin
  frmBlackList.showModal;
end;

procedure TfrmPrincipal.EnviarMenu_confirmaExclusaoItem(AIDItem: string);
var
  AText: String;
begin

  botDAO.confirmaRemocaoItemPedido(AIDItem);
  BotDAO.atualizaPedido(conversaAtual.IDPedido,'','Dinheiro','',conversaAtual.ID,Date,0,'N');
  AText := AText + Inject1.Emoticons.AtendenteM   + 'Item *removido* do seu pedido com sucesso! Por favor, *finalize* seu pedido. \n\n';
  AText := AText + Inject1.Emoticons.Estrela  + 'Para finalizar o pedido digite *FINALIZAR*\n\n';
  AText := AText + Inject1.Emoticons.NoEntrySign + 'Para remover mais itens digite *REMOVER* \n\n';
   AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
   AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(3, AText);
end;

procedure TfrmPrincipal.EnviarMenu_etapaFinal(AObservacoes: string);
var
  AText: String;
begin

  //Armazenando observações do pedido
  BotDAO.atualizaPedido(conversaAtual.IDPedido, conversaAtual.EnderecoCliente, conversaAtual.FormaPGT, AObservacoes,
                          conversaAtual.ID, date,conversaAtual.Taxa,'F');

  AText := AText + Inject1.Emoticons.Restaurante     + ' Seu pedido foi realizado com *sucesso* e já estamos preparando tudo!\n\n';
  AText := AText + Inject1.Emoticons.LapisEPapel      + ' Número do seu pedido: *'  + formatFloat('0000', conversaAtual.IDPedido) + '*\n\n';
  AText := AText + ' *###### SEU PEDIDO ######* \n\n ';
  AText := AText + BotDAO.revisarPedido2(conversaAtual.IDPedido, date, conversaAtual.ID)+' \n';
  AText := AText + Inject1.Emoticons.DeliveryTruck + ' *Taxa de Entrega:* '+CurrToStrF(conversaAtual.Taxa,ffCurrency,2)+' \n\n';
  AText := AText + Inject1.Emoticons.CanetaAzul       + ' Observações do pedido: *' + AObservacoes + '*\n\n';
  AText := AText + Inject1.Emoticons.Chegada      + ' Será entregue no endereço:\n';
  AText := AText +'*' +conversaAtual.EnderecoCliente  + '*\n\n';
  AText := AText + Inject1.Emoticons.Palmas         + ' *OBRIGADO PELA PREFERÊNCIA E VOLTE SEMPRE!*';
  EnviarMensagem(0, AText, ExtractFilePath(Application.ExeName) + 'img\enviado.jpg', 1);
end;

procedure TfrmPrincipal.EnviarMenu_formaPagamento(AIDPedido: integer; AEndereco: string = '');
var
  AText: String;
begin
  if AEndereco <> '' then
    ConversaAtual.EnderecoCliente := AEndereco
  else
    ConversaAtual.EnderecoCliente := '*Irei buscar retirar no local*';
  BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,'Dinheiro','',conversaAtual.ID,Date,0,'N');
  AText := AText + Inject1.Emoticons.AtendenteM + ' Qual a *forma de pagamento?*\n\n';
  AText := AText + Inject1.Emoticons.Dinheiro  + ' *1* - Dinheiro \n';
  AText := AText + Inject1.Emoticons.Cartao + ' *2* - Cartão \n\n';
  AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(10, AText);
end;

procedure TfrmPrincipal.EnviarMenu_localizacao(vLat, vLng: string);
var
  AText, ACoordenadas, EnderecoTexto,ABairro : string;
  Objeto          : TJSONObject;
  ParRows         : TJSONPair;
  ArrayRows       : TJSONArray;
  st ,st2     :TStringList;
  I:Integer;
  ok:Boolean;
begin
  ACoordenadas  :=  StringReplace(vLat, ',', '.', [rfReplaceAll]) + ',' + StringReplace(vLng, ',', '.', [rfReplaceAll]);
  conversaAtual.Taxa:=BotDAO.configtaxa.AsCurrency;
  ABairro:='';
  conversaAtual.Bairro:=ABairro;


  //NÃO ESQUEÇA DE INFORMAR A SUA API KEY DO GOOGLE MATRIX DISTANCE
  RESTClient1.BaseURL := 'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins='+ACoordenadas+'&destinations='+ACoordenadas+'&key=SUA_CHAVE_GOOGLE_MAPS';
  //NÃO ESQUEÇA DE INFORMAR A SUA API KEY DO GOOGLE MATRIX DISTANCE

  RESTRequest1.Execute;

  Objeto := RESTResponse1.JSONValue as TJSONObject;
  ParRows := Objeto.Get('origin_addresses');
  ArrayRows := ParRows.JsonValue as TJSONArray;
  EnderecoTexto := ArrayRows.Items[0].Value;

 ok:=False;

  if Pos('-',EnderecoTexto) > 0 then
  begin

         st:=TStringList.Create;
         st.StrictDelimiter:=True;
         st.Delimiter:=',';
         st.DelimitedText:=EnderecoTexto;

         st2:=TStringList.Create;
         st2.StrictDelimiter:=True;
         st2.Delimiter:='-';
         st2.DelimitedText:=st[1];



         if(Pos(' ',st2[1]) = 1) then
         begin
           ABairro:=Copy(st2[1],2,Length(st2[1])-1);
         end
          else
         begin
           ABairro:=st2[1];
         end;


         conversaAtual.Bairro:=ABairro;


         with BotDAO.taxas do
         begin
           Close;
           Open();

           if RecordCount > 0 then
           begin

              First;
              for I := 0 to RecordCount - 1 do
              begin

                 if UpperCase(conversaAtual.Bairro)=UpperCase(FieldByName('bairro').AsString) then
                 begin
                    ok:=True;
                    conversaAtual.Bairro:=FieldByName('bairro').AsString;
                    conversaAtual.Taxa:= FieldByName('valor').AsCurrency;
                    break

                 end;

                 Next;

              end;


           end ;

         end;

    if (conversaAtual.Bairro <> '') and (ok=True) then
    begin


              //Se não achar o bairro com a digitação correta !
              AText   := AText + Inject1.Emoticons.Palmas   + ' *CONFIRA ABAIXO SE SEU ENDEREÇO ESTÁ CORRETO:* \n';
              AText   := AText + Inject1.Emoticons.DeliveryTruck   + ' A taxa de entrega para o bairro *'+conversaAtual.Bairro+ ' é: '+CurrtoStrF(conversaAtual.Taxa,ffCurrency,2)+'* \n';
              AText   := AText + Inject1.Emoticons.Pino  + ' *Endereço digitado*:\n '+EnderecoTexto+'\n\n';

              AText   := AText + 'Confirma o endereço e o bairro acima?\n\n';
              AText   := AText + Inject1.Emoticons.Um     + ' *Sim*\n';
              AText   := AText + Inject1.Emoticons.Dois   + ' *Não* \n\n';
              AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
              AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
              conversaAtual.EnderecoCliente := EnderecoTexto;
              BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,'Dinheiro','',conversaAtual.ID,Date,0,'N');
              EnviarMensagem(9, AText, ExtractFilePath(Application.ExeName) + 'img\google.jpg', 1);


    end
    else
    begin

              //Se não achar o bairro com a digitação correta !
              AText   := AText + Inject1.Emoticons.LoiraTriste   + ' *NÃO FOI POSSÍVEL LOCALIZAR SEU BAIRRO !*  \n';
              AText   := AText + Inject1.Emoticons.DeliveryTruck   + ' A taxa de entrega será fixa ! \n\n';
              AText   := AText + Inject1.Emoticons.AtendenteM   + ' *Por favor *confira os dados*: \n\n';
              AText   := AText + Inject1.Emoticons.Pino  + ' *Endereço digitado*:\n '+EnderecoTexto+'\n';
              AText   := AText +Inject1.Emoticons.Dinheiro  + ' A taxa de entrega  é: *'+CurrToStrF(conversaAtual.Taxa,ffCurrency,2)+'* \n';
              AText   := AText + 'Confirma o endereço e o bairro acima?\n\n';
              AText   := AText + Inject1.Emoticons.Um     + ' *Sim*\n';
              AText   := AText + Inject1.Emoticons.Dois   + ' *Não* \n\n';
              AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
              AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
              conversaAtual.EnderecoCliente := EnderecoTexto;
              BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,'Dinheiro','',conversaAtual.ID,Date,0,'N');
              EnviarMensagem(9, AText, ExtractFilePath(Application.ExeName) + 'img\google.jpg', 1);


    end;

  end
  else
  begin
  //Se não achar o bairro com a digitação correta !
    AText   := AText + Inject1.Emoticons.LoiraTriste   + ' *NÃO FOI POSSÍVEL LOCALIZAR SEU BAIRRO !*  \n';
    AText   := AText + Inject1.Emoticons.DeliveryTruck   + ' A taxa de entrega será fixa ! \n\n';
    AText   := AText + Inject1.Emoticons.AtendenteM   + ' *Por favor *confira os dados*: \n\n';
    AText   := AText + Inject1.Emoticons.Pino  + ' *Endereço digitado*:\n '+EnderecoTexto+'\n';
    AText   := AText +Inject1.Emoticons.Dinheiro  + ' A taxa de entrega  é: *'+CurrToStrF(conversaAtual.Taxa,ffCurrency,2)+'* \n';
    AText   := AText + 'Confirma o endereço e o bairro acima?\n\n';
    AText   := AText + Inject1.Emoticons.Um     + ' *Sim*\n';
    AText   := AText + Inject1.Emoticons.Dois   + ' *Não* \n\n';
    AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
    AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
    conversaAtual.EnderecoCliente := EnderecoTexto;
    BotDAO.atualizaPedido(conversaAtual.IDPedido,conversaAtual.EnderecoCliente,'Dinheiro','',conversaAtual.ID,Date,0,'N');
    EnviarMensagem(9, AText, ExtractFilePath(Application.ExeName) + 'img\google.jpg', 1);
  end;


end;

procedure TfrmPrincipal.EnviarMenu_bebidas(ATipo: string);
var
  AText: String;
begin
  //Objeto Items recebendo o array de códigos das bebidas
  ConversaAtual.Items :=  BotDAO.ListaOpcoesBebidas;

  //Gravando o tipo
  ConversaAtual.Tipo := 'Bebidas';

  AText := Inject1.Emoticons.AtendenteM   + 'Digite a quantidade seguida de *x* e o *número* correspondente a bebida desejada: \n\n';

  AText := AText + BotDAO.ListaMenuBebida +'\n\n';
   AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
   AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;

  EnviarMensagem(2, AText);
end;

procedure TfrmPrincipal.EnviarMenu_confirmaEndereco(AIDPedido: integer);
begin
  //BotDAO.atualizaEnderecoEntrega(AIDPedido, ConversaAtual.EnderecoCliente);
  EnviarMenu_formaPagamento(AIDPedido, ConversaAtual.EnderecoCliente);
end;

procedure TfrmPrincipal.EDTvENDASClick(Sender: TObject);
begin
    if frmGraficoVendas=nil then
     frmGraficoVendas:=TfrmGraficoVendas.Create(Self);
     frmGraficoVendas.ShowModal;
end;

procedure TfrmPrincipal.Entrega1Click(Sender: TObject);
begin
with auxiliar do
     begin
       Close;
       ParamByName('id').AsInteger:=StrToInt(listaLog.Items.Item[listaLog.ItemIndex].Caption);
       Open();
       edit;
       FieldByName('pedido_status').AsString:='D';
       Post;
       Close;
     end;
end;

procedure TfrmPrincipal.Entregue1Click(Sender: TObject);
begin
with auxiliar do
     begin
       Close;
       ParamByName('id').AsInteger:=StrToInt(listaLog.Items.Item[listaLog.ItemIndex].Caption);
       Open();
       edit;
       FieldByName('pedido_status').AsString:='E';
       Post;
       Close;
     end;
end;

procedure TfrmPrincipal.EnviaCozinha(vFone, vCliente: string);
var
arquivo:string;
mensagem:string;

begin
         arquivo:=botdao.dir+'img/cozinha.png';

         mensagem:='';
         mensagem:= mensagem+Inject1.Emoticons.LoiraOla+' Olá *'+vCliente+'* ! \n';
         mensagem:= mensagem+Inject1.Emoticons.Restaurante+' *Seu Pedido acaba de ir para a cozinha* ! \n';
         mensagem:= mensagem+'Logo logo enviaremos para o endereço ! \n\n';
         mensagem:= mensagem+Inject1.Emoticons.Estrela+Inject1.Emoticons.Estrela+Inject1.Emoticons.Estrela+' *AGRADECEMOS A PREFERÊNCIA* ! \n';

         Inject1.SendFile(vFone,arquivo,mensagem);
end;

procedure TfrmPrincipal.EnviaEntrega(vFone, vCliente: string);
var
mensagem,arquivo:string;
begin
         arquivo:=botdao.dir+'img/delivery.png';

         mensagem:='';
         mensagem:= mensagem+Inject1.Emoticons.LoiraOla+' Olá novamente *'+vCliente+'* ! \n';
         mensagem:= mensagem+Inject1.Emoticons.DeliveryTruck+' *Seu Pedido acaba de sair para entrega* ! \n';
         //mensagem:= mensagem+'Logo logo enviaremos para o endereço ! \n\n';
         mensagem:= mensagem+Inject1.Emoticons.Estrela+Inject1.Emoticons.Estrela+Inject1.Emoticons.Estrela+' *AGRADECEMOS A PREFERÊNCIA* ! \n';

         Inject1.SendFile(vFone,arquivo,mensagem);
end;

procedure TfrmPrincipal.EnviarAvisoInativo(AIDPedido: integer);
var
  AText: String;
begin
  if BotDAO.verificaStatusPedido(AIDPedido) then
  begin
     AText := AText + Inject1.Emoticons.LoiraAteLogo + ' *' + ConversaAtual.Nome + '* Seu tempo de atendimento acabou. Pedido *cancelado*.\n\n';
     AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
     EnviarMensagem(0, AText);
  end;
end;

procedure TfrmPrincipal.EnviarAvisoOpcaoInvalida;
var
  AText: String;
begin
  AText := AText + Inject1.Emoticons.LoiraTriste + Inject1.Emoticons.duvida + ' Desculpe, sua resposta *não é válida*. Ainda estou aprendendo novos vocabulários..rsrs\n\n';
  AText := AText + 'Tente novamente ou volte ao início para recomeçar.. \n\n';
   AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
  AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(conversaAtual.Etapa, AText);
end;

procedure TfrmPrincipal.enviarEnderecoEntrega;
var
  AText: String;
begin
  AText := AText + Inject1.Emoticons.AtendenteM + ' Por favor, escolha uma opção de entrega.\n\n';
  AText := AText + Inject1.Emoticons.Um   + ' Usar a minha localização atual\n';
  AText := AText + Inject1.Emoticons.Dois + ' Irei buscar no local\n';
  AText := AText + Inject1.Emoticons.Tres + ' Irei digitar o meu endereço \n\n';
   AText := AText + Inject1.Emoticons.robot +MENSAGEM_VOLTAR_INICIO;
   AText := AText + Inject1.Emoticons.Atencao + MENSAGEM_TEMPO_PEDIDO+' Você tem 5 minutos para concluir seu pedido ou ele será cancelado !'+Inject1.Emoticons.Ampulheta;
  EnviarMensagem(7, AText);
end;

procedure TfrmPrincipal.GestorInteracao(Conversa: TBotConversa);
var i: integer;
var st:TStringList;
var item:Integer;
begin
  ConversaAtual := Conversa;

  Memo1.Lines.Add(FormatDateTime('DD/MM/YYYY HH:MM:SS',Now)
                 + ' - ' + Conversa.Nome + '(' + Conversa.Telefone + ') ' +#13+
                  GetEnumName(TypeInfo(TSituacaoConversa),integer( Conversa.Situacao )));
  Memo1.Lines.Add('*****************************************');

  case Conversa.Situacao of
    saNova         : begin
                       case Conversa.TipoUsuario of
                        tpCliente: EnviarMenu_Principal(date, conversa.ID);

                        tpAdm:     EnviarMenu_PrincipalADM;
                       end;
                     end;

    saEmAtendimento: begin
                       //Retomada do menu inicial
                       if conversa.Resposta  = Trim('#')
                       then
                       begin
                         case conversa.TipoUsuario of
                            tpCliente: EnviarMenu_Principal(date, conversa.ID);

                            tpAdm:      EnviarMenu_PrincipalADM;
                         end;
                       end else
                        begin
                          case conversa.Etapa of
                            1: begin
                                  //Tratando a resposta
                                  case AnsiIndexStr(conversa.Resposta,['1','2','3','4','5','6'])
                                     of
                                      0: Enviar_cardapio;
                                      1: EnviarMenu_pizza('Lanches');
                                      2: EnviarMenu_bebidas('Bebidas');
                                      3: Enviar_endereco;
                                      4: Enviar_revisaoPedido(conversa.IDPedido, date, conversa.ID);
                                      5: Enviar_finalizarPedido(conversa.IDPedido, date, conversa.ID);


                                     else

                                      EnviarAvisoOpcaoInvalida;

                                    end;


                            end;
                             // etapa 2
                            2: begin

                                  if conversa.Resposta.Contains(('x')) or conversa.Resposta.Contains(('X')) then
                                  begin
                                        //conversa.Resposta:=StringReplace(conversa.Resposta,'x','X',[rfReplaceAll,rfIgnoreCase]);
                                        st:=TStringList.Create;
                                        st.StrictDelimiter:=True;
                                         if   conversa.Resposta.Contains(('x')) then
                                         begin
                                            st.Delimiter:='x';
                                         end
                                         else if   conversa.Resposta.Contains(('X')) then
                                         begin
                                            st.Delimiter:='X';
                                         end;

                                        st.DelimitedText:=conversa.Resposta;
                                        item:=StrToInt(st[1]);
                                        conversaAtual.Qtde:=StrToInt(st[0]);

                                          if conversa.Items.IndexOf(st[1]) > - 1 then
                                          begin
                                            EnviarMenu_PrincipalPedido(item, conversaAtual.IDPedido, conversaAtual.Tipo);
                                          end
                                           else
                                           if conversa.Resposta <> '' then
                                            EnviarAvisoOpcaoInvalida;




                                  end
                                  else
                                  begin

                                          if conversa.Items.IndexOf(conversa.Resposta) > - 1 then
                                          begin
                                           conversaAtual.Qtde:=1;
                                            EnviarMenu_PrincipalPedido(StrToInt(conversa.Resposta), conversaAtual.IDPedido, conversaAtual.Tipo);
                                          end
                                           else
                                             if conversa.Resposta <> '' then
                                            EnviarAvisoOpcaoInvalida;


                                  end;


                            end;
                             //etapa 3
                            //Lista itens à serem removidos
                            3: if upperCase(conversa.Resposta) = 'REMOVER' then
                               begin
                                enviarMenu_removerItem(conversa.IDPedido, date, conversa.ID);
                               end else
                               if upperCase(conversa.Resposta) = 'FINALIZAR' then
                               begin
                                //Finalizar pedido
                                enviarEnderecoEntrega;
                               end else
                               if conversa.Resposta <> '' then
                                       EnviarAvisoOpcaoInvalida;

                            //Confirma remoção do item
                            4: if conversa.Items.IndexOf(UpperCase(conversa.Resposta)) > - 1 then
                            begin
                              EnviarMenu_confirmaExclusaoItem(conversa.Resposta);
                            end else
                            if conversa.Resposta <> '' then
                              EnviarAvisoOpcaoInvalida;

                            //Finalizar pedido
                            6: if upperCase(conversa.Resposta) = 'FINALIZAR' then
                            begin
                              enviarEnderecoEntrega;
                            end else
                            begin
                              EnviarAvisoOpcaoInvalida;
                            end;

                            //Escolha do local de entrega
                            7: case AnsiIndexStr(conversa.Resposta, ['1','2','3'])
                                  of
                                    0: EnviarMenu_solicitaLocalizacao;
                                    1: EnviarMenu_formaPagamento(conversa.IDPedido, conversa.EnderecoCliente);
                                    2: EnviarMenu_solicitarEndereco;
                                  else
                                   if conversa.Resposta <> '' then
                                    EnviarAvisoOpcaoInvalida;
                            end;

                            //Processa localização
                            8: if (conversa.Lat <> 0) and (conversa.Lng <> 0) then
                            begin
                              EnviarMenu_localizacao(conversa.Lat.ToString, conversa.lng.ToString);
                            end else
                            if conversa.Resposta <> '' then
                              EnviarAvisoOpcaoInvalida;

                            //Valida localização
                            9: begin
                                if upperCase(conversa.Resposta) = 'SIM' then
                                begin
                                  EnviarMenu_formaPagamento(conversa.IDPedido, conversa.EnderecoCliente);
                                  exit;
                                end else
                                if (Pos(UpperCase(conversa.Resposta),'NÃO.NAO.NãO') > 0) then
                                begin
                                  EnviarMenu_solicitaLocalizacao;
                                  exit;
                                end;

                                case AnsiIndexStr(conversa.Resposta, ['1','2'])
                                  of
                                    0: EnviarMenu_formaPagamento(conversa.IDPedido, conversa.EnderecoCliente);
                                    1: EnviarMenu_solicitaLocalizacao;
                                  else

                                       EnviarAvisoOpcaoInvalida;
                                end;
                            end;


                            //Forma de pagamento
                            10: begin
                                  if upperCase(conversa.Resposta) = 'DINHEIRO' then
                                  begin
                                    EnviarMenu_Observacoes('DINHEIRO');
                                    exit
                                  end else
                                  if (Pos(UpperCase(conversa.Resposta),'CARTÃO.CARTAO.CARTãO') > 0) then
                                  begin
                                    EnviarMenu_Observacoes('CARTÃO');
                                    exit
                                  end;

                                  case AnsiIndexStr(conversa.Resposta, ['1','2'])
                                  of
                                    0: EnviarMenu_Observacoes('DINHEIRO');
                                    1: EnviarMenu_Observacoes('CARTÃO');
                                    else
                                    if conversa.Resposta <> '' then
                                       EnviarAvisoOpcaoInvalida;
                                  end;
                            end;

                            //Etapa final
                            11: if conversa.Resposta <> '' then
                            begin
                              EnviarMenu_etapaFinal(conversa.Resposta);
                            end;

                            //Processa endereço manual
                            12: if length(conversa.Resposta) >= 20 then
                                  EnviarMenu_processaEndereco(conversa.Resposta)
                                else
                                if conversa.Resposta <> '' then
                                  EnviarAvisoOpcaoInvalida;

                            //Confirma endereço manual
                            13: begin
                                  if upperCase(conversa.Resposta) = 'SIM' then
                                  begin
                                    EnviarMenu_confirmaEndereco(conversa.IDPedido);
                                    exit;
                                  end else
                                  if (Pos(UpperCase(conversa.Resposta),'NÃO.NAO.NãO') > 0) then
                                  begin
                                    EnviarMenu_solicitarEndereco;
                                    exit;
                                  end;

                                  case AnsiIndexStr(conversa.Resposta, ['1','2'])
                                    of
                                      0: EnviarMenu_confirmaEndereco(conversa.IDPedido);
                                      1: EnviarMenu_solicitarEndereco;
                                    else

                                         EnviarAvisoOpcaoInvalida;
                                  end;
                            end;

                            //Pizza Dois sabores - Escolha do sabor 1
                            14: if conversa.Items.IndexOf(UpperCase(conversa.Resposta)) > - 1 then
                            begin
                              EnviarMenu_segundoSabor(strToInt(conversa.Resposta), conversa.IDPedido, conversa.Tipo, 'MEIO À MEIO');//tamanhoPizza
                            end;

                            //Pizza Dois sabores - Escolha do sabor 2
                            15: if conversa.Items.IndexOf(UpperCase(conversa.Resposta)) > - 1 then
                            begin
                              EnviarMenu_PrincipalPedidoDUO(strToInt(conversa.Resposta), conversa.IDPedido, conversa.Tipo, 'MEIO À MEIO'); //tamanhoPizza
                            end;

                            //Aqui, você pode implementar uma ação para o Administrador
                            20:
                            begin
                              //Ação para adminsitrador
                            end;

                            21:  if conversa.Items.IndexOf(UpperCase(conversa.Resposta)) > - 1 then
                                 begin
                                 mm.Lines.Add(conversa.Items.Text);
                                  EnviarMenu_PrincipalAdicional(StrToInt(conversa.Resposta), conversaAtual.IDPedido, conversaAtual.Tipo);
                                 end
                                 else
                                 if conversa.Resposta <> '' then

                                   EnviarAvisoOpcaoInvalida;



                          end;
                        end;
                     end;

    saInativa      : begin
                       EnviarAvisoInativo(conversa.IDPedido);
                     end;
  end;
end;

//procedure TfrmPrincipal.imgClick(Sender: TObject);
//begin
//
//
//end;

//procedure TfrmPrincipal.imgPictureSelect(Sender: TObject; FileName: string;
//  var Allow: Boolean);
//begin
// with BotDAO do
//    begin
//
//       if FileName <> '' then
//       begin
//
//         BotDAO.qry_mostrarCardapio.Insert;
//         BotDAO.qry_mostrarCardapiocardapio_imagem.AsString:=FileName;
//         BotDAO.qry_mostrarCardapio.Post;
//         BotDAO.qry_mostrarCardapio.Refresh;
//
//       end;
//
//
//    end;
//end;

procedure TfrmPrincipal.impressaoTimer(Sender: TObject);
var vID:Integer;
begin
           if botdao.configimpressao.AsString='SIM' then
           begin


            with uBuscaPedido do
            begin
              Close;
              Open();
              if RecordCount > 0 then
              begin
              impressao.Enabled:=False;
              vID:=FieldByName('pedido_id').AsInteger;
              imprime(vID);
              end;
            end;




           end;

end;

procedure TfrmPrincipal.imprime(vID: Integer);
var
report:TfrxReport;
begin

           if BotDao.configImpressora.AsString.IsEmpty=False then
           begin

            with uPedImp do
             begin
               Close;
               ParamByName('id').AsInteger:=vID;
               Open();


                with uItensImp do
                 begin
                   Close;
                   ParamByName('pedido').AsInteger:=vID;
                   Open();
                 end;

                 with uAdicionaisImp do
                 begin
                   Close;
                   ParamByName('pedido').AsInteger:=vID;
                   Open();
                 end;

                   report:=TfrxReport.Create(Self);
                   report.LoadFromFile(BotDAO.dir+'cupom.fr3');
                   report.PreviewOptions.RTLPreview:=False;
                   report.PrintOptions.Printer:=BotDao.configImpressora.AsString;
                   report.PrepareReport(True);
                   report.ShowReport(True);

                   with  uBuscaPedido do
                   begin
                     Edit;
                     FieldByName('pedido_imp').AsInteger:=1;
                     Post;

                   end;

                    impressao.Enabled:=True;


             end;

           end ;

end;

procedure TfrmPrincipal.Inject1Connected(Sender: TObject);
begin
  lblStatus.Caption := 'ONLINE';
  lblStatus.Font.Color:= clGreen;
  pb.Active:=False;
  btnCardapio.Enabled:=False;
  btnEndereco.Enabled:=False;
  btnPizzas.Enabled:=False;
  btnBebidas.Enabled:=False;
  TabSheet2.Enabled:=False;
  TabSheet3.Enabled:=False;
  atualiza.Enabled:=True;

  statusPedidos.Enabled:=True;
  impressao.Enabled:=True;
end;

procedure TfrmPrincipal.Inject1Disconnected(Sender: TObject);
begin
  lblStatus.Caption := 'OFFLINE';
  lblStatus.Font.Color:= clRed;
  pb.Active:=False;

  btnCardapio.Enabled:=True;
  btnEndereco.Enabled:=True;
  btnPizzas.Enabled:=True;
  btnBebidas.Enabled:=True;
  TabSheet2.Enabled:=True;
  TabSheet3.Enabled:=True;
  atualiza.Enabled:=False;
  impressao.Enabled:=False;
  statusPedidos.Enabled:=False;
end;

procedure TfrmPrincipal.Inject1DisconnectedBrute(Sender: TObject);
begin
          lblStatus.Caption := 'OFFLINE';
          lblStatus.Font.Color:= clRed;
          pb.Active:=False;
          btnCardapio.Enabled:=True;
          btnEndereco.Enabled:=True;
          btnPizzas.Enabled:=True;
          btnBebidas.Enabled:=True;
          TabSheet2.Enabled:=True;
          TabSheet3.Enabled:=True;
          atualiza.Enabled:=False;
          impressao.Enabled:=False;
          statusPedidos.Enabled:=False;
end;

procedure TfrmPrincipal.Inject1GetStatus(Sender: TObject);
begin
  if Inject1.Status=Inject_Initializing then
  begin
    pb.Active:=True;
  end
  else if Inject1.Status=Inject_Initialized then
  begin
    pb.Active:=False;
  end;
end;

procedure TfrmPrincipal.Inject1GetUnReadMessages(const Chats: TChatList);
begin
  Gestor.AdministrarChatList(Inject1, Chats);
end;

procedure TfrmPrincipal.listaLogDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
realizarDragAndDrop(Sender, Source);
end;

procedure TfrmPrincipal.listaLogDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
Accept := (Source is TListView);
end;

procedure TfrmPrincipal.listaLogEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  if statusPedidos.Enabled=False then
      statusPedidos.Enabled:=True;

end;

procedure TfrmPrincipal.listaLogStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
   statusPedidos.Enabled:=False;
end;

procedure TfrmPrincipal.ListaPedidos;
var
K:Integer;
begin

              {
                F > FECHADO
                P > COZINHA
                D > ENTREGA
                E > ENTREGUE
                C > CANCELADO
              }

             listaLog.Items.Clear;
             listaProd.Items.Clear;
             listaEnviados.Items.Clear;
             listaEntregues.Items.Clear;

             with uListaStatus do
             begin
               Close;
               ParamByName('data').AsDate:=date;
               Open();

               if RecordCount > 0 then
               begin
                 First;
                  statusPedidos.Enabled:=False;
                 for K := 0 to RecordCount - 1 do
                 begin


                      if uListaStatuspedido_status.AsString='F' then
                      begin
                         listaLog.Items.Add;
                      listaLog.Items.Item[listaLog.Items.Count-1].Caption:=uListaStatuspedido_id.AsString;
                      listaLog.Items.Item[listaLog.Items.Count-1].ImageIndex:=0;
                      listaLog.Items.Item[listaLog.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente.AsString);
                      listaLog.Items.Item[listaLog.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente_fone.AsString);

                      end
                      else if uListaStatuspedido_status.AsString='P' then
                      begin
                         listaProd.Items.Add;
                      listaProd.Items.Item[listaProd.Items.Count-1].Caption:=uListaStatuspedido_id.AsString;
                       listaProd.Items.Item[listaProd.Items.Count-1].ImageIndex:=1;
                      listaProd.Items.Item[listaProd.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente.AsString);
                      listaProd.Items.Item[listaProd.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente_fone.AsString);

                      end
                      else if uListaStatuspedido_status.AsString='D' then
                      begin
                        listaEnviados.Items.Add;
                      listaEnviados.Items.Item[listaEnviados.Items.Count-1].Caption:=uListaStatuspedido_id.AsString;
                       listaEnviados.Items.Item[listaEnviados.Items.Count-1].ImageIndex:=2;
                      listaEnviados.Items.Item[listaEnviados.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente.AsString);
                      listaEnviados.Items.Item[listaEnviados.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente_fone.AsString);

                      end
                      else if uListaStatuspedido_status.AsString='E' then
                      begin
                        listaEntregues.Items.Add;
                      listaEntregues.Items.Item[listaEntregues.Items.Count-1].Caption:=uListaStatuspedido_id.AsString;
                      listaEntregues.Items.Item[listaEntregues.Items.Count-1].ImageIndex:=3;
                      listaEntregues.Items.Item[listaEntregues.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente.AsString);
                      listaEntregues.Items.Item[listaEntregues.Items.Count-1].SubItems.Add(uListaStatuspedido_cliente_fone.AsString);

                      end
                      else if uListaStatuspedido_status.AsString='C' then
                      begin
                        //listaLog.Items.Item[K].ImageIndex:=4;
                      end;

                   Next;

                 end;

                    statusPedidos.Enabled:=True;
               end;

             end;
end;

procedure TfrmPrincipal.listaEntreguesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
realizarDragAndDrop(Sender, Source);
end;

procedure TfrmPrincipal.listaEntreguesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := (Source is TListView);
end;

procedure TfrmPrincipal.listaEntreguesStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
statusPedidos.Enabled:=False;
end;

procedure TfrmPrincipal.listaEnviadosDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
if ((Source as TListview).Name<>'listaEntregues') then
realizarDragAndDrop(Sender, Source);
end;

procedure TfrmPrincipal.listaEnviadosDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TListView);

end;

procedure TfrmPrincipal.listaEnviadosStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
statusPedidos.Enabled:=False;
end;

procedure TfrmPrincipal.listaProdDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
if (Source as TListview).Name='listaLog' then
realizarDragAndDrop(Sender,Source);
end;

procedure TfrmPrincipal.listaProdDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin

    Accept:=(Source is TListView) ;



end;

procedure TfrmPrincipal.listaProdStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
statusPedidos.Enabled:=False;
end;

function TfrmPrincipal.MontaAdicional: string;
var
txt:string;
i:Integer;
begin

    txt:='';
    with BotDAO.qry_adicionais do
    begin
      Close;
      Open();
      First;

      if RecordCount > 0 then
      begin

         for i := 0 to RecordCount - 1 do
         begin
           txt:=txt+Inject1.Emoticons.FrenchFries+' *'+FieldByName('Menu').AsString+'* - '+FieldByName('Descricao').AsString+' \n'+CurrToStrF(FieldByName('Valor').AsCurrency,ffCurrency,2)+' \n';
           Next;
         end;
        Result:=txt;
      end
      else
      begin
        Result:='';
      end;

    end;

end;

procedure TfrmPrincipal.Pedidoswhatsapp1Click(Sender: TObject);
begin
  frmPedidos.showModal;
end;

procedure TfrmPrincipal.realizarDragAndDrop(Sender, Source: TObject);
var
  itemAdicionado: TListItem;
  Item: string;
  fone:string;
  cliente:string;
  itAdd: TListItem;
begin
  if Source <> Sender then
  begin
    with (Source as TListview) do
    begin
      Item := Items[ItemIndex].Caption;
      cliente := Items[ItemIndex].SubItems[0];
      fone := Items[ItemIndex].SubItems[1];
      Items.Delete(ItemIndex);
      itAdd := items[ItemIndex];
    end;
    itemAdicionado := (Sender as TListView).Items.AddItem(itAdd, 1);
    itemAdicionado.Caption := item;
    itemAdicionado.SubItems.Add(cliente);
    itemAdicionado.SubItems.Add(fone);
    codPedido:= StrToInt(itemAdicionado.Caption);

    if (Sender as TListview).Name='listaProd' then
    begin
      itemAdicionado.ImageIndex:=1;

       with auxiliar do
       begin
               Close;
               ParamByName('id').AsInteger:=codPedido;
               Open();
               edit;
               FieldByName('pedido_status').AsString:='P';
               Post;
               codPedido:=0;
               statusPedidos.Enabled:=True;
       end;

        EnviaCozinha(itemAdicionado.SubItems[1],itemAdicionado.SubItems[0]);

    end
    else  if (Sender as TListview).Name='listaEnviados' then
    begin
      itemAdicionado.ImageIndex:=2;

       with auxiliar do
       begin
               Close;
               ParamByName('id').AsInteger:=codPedido;
               Open();
               edit;
               FieldByName('pedido_status').AsString:='D';
               Post;
               codPedido:=0;
               statusPedidos.Enabled:=True;


        end;

       EnviaEntrega(itemAdicionado.SubItems[1],itemAdicionado.SubItems[0]);

    end
     else  if (Sender as TListview).Name='listaEntregues' then
    begin
      itemAdicionado.ImageIndex:=3;

       with auxiliar do
       begin

               Close;
               ParamByName('id').AsInteger:=codPedido;
               Open();
               edit;
               FieldByName('pedido_status').AsString:='E';
               Post;
               codPedido:=0;
               statusPedidos.Enabled:=True;

        end;
      ShowMessage('Pedido Finalizado !');
    end

  end;
end;

procedure TfrmPrincipal.Sai1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.slPageChange(Sender: TObject);
begin
  if sl.PageIndex=0 then
  begin
    img1.Picture.LoadFromFile(BotDAO.qry_mostrarCardapioimg1.AsString);
  end
  else  if sl.PageIndex=1 then
  begin
    img2.Picture.LoadFromFile(BotDAO.qry_mostrarCardapioimg2.AsString);
  end
  else  if sl.PageIndex=2 then
  begin
    img3.Picture.LoadFromFile(BotDAO.qry_mostrarCardapioimg3.AsString);
  end
  else  if sl.PageIndex=3 then
  begin
    img4.Picture.LoadFromFile(BotDAO.qry_mostrarCardapioimg4.AsString);
  end
  else  if sl.PageIndex=4 then
  begin
    img5.Picture.LoadFromFile(BotDAO.qry_mostrarCardapioimg5.AsString);
  end;
end;

procedure TfrmPrincipal.SpeedButton10Click(Sender: TObject);
begin
  with BotDAO.qry_adicionais do
           begin
              if (edtMenuAd.Text<>'') and (edtDescAd.Text<>'') and (edtValorAd.Text<>'')  then
              begin

                        if ok3.Visible=True then
                        begin
                          Post;
                          edit3.Visible:=False;
                          add3.Visible:=False;
                          ok3.Visible:=False;
                          erro3.Visible:=False;
                          lbAdicional.Caption:='';
                          gr_adicionais.Visible:=False;
                          Close;
                          Open();
                          ShowMessage('Registro salvo com sucesso !');
                        end
                        else if erro3.Visible=True then
                        begin
                          ShowMessage('Dígito do Menu já cadastrado ! Tente outro valor !');
                          edtMenuAd.SetFocus;
                        end;


              end
              else
              begin
                ShowMessage('Preencha todo o formulário ! ');
              end;
          end;

end;

procedure TfrmPrincipal.SpeedButton12Click(Sender: TObject);
begin


  if sl.PageIndex=0 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

          if State in [dsEdit] then
          begin

             if dialogo.Execute=True then
             begin

              FieldByName('img1').AsString:='';
              Post;
              img1.Picture.Assign(nil);
             end ;


          end;

    end;

  end
  else if sl.PageIndex=1 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

          if State in [dsEdit] then
          begin

             if dialogo.Execute=True then
             begin

              FieldByName('img2').AsString:='';
              Post;
              img2.Picture.Assign(nil);
             end ;


          end;

    end;

  end
  else if sl.PageIndex=2 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

          if State in [dsEdit] then
          begin

             if dialogo.Execute=True then
             begin

              FieldByName('img3').AsString:='';
              Post;
              img3.Picture.Assign(nil);
             end ;


          end;

    end;

  end
    else if sl.PageIndex=3 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

          if State in [dsEdit] then
          begin

             if dialogo.Execute=True then
             begin

              FieldByName('img4').AsString:='';
              Post;
              img4.Picture.Assign(nil);
             end ;


          end;

    end;

  end
    else if sl.PageIndex=4 then
  begin

    with BotDAO.qry_mostrarCardapio do
    begin

          if State in [dsEdit] then
          begin

             if dialogo.Execute=True then
             begin

              FieldByName('img5').AsString:='';
              Post;
              img5.Picture.Assign(nil);
             end ;


          end;

    end;

  end;

  ShowMessage('Imagem excluída com sucesso !');

end;

procedure TfrmPrincipal.SpeedButton13Click(Sender: TObject);
begin
  cardapios;
end;

procedure TfrmPrincipal.SpeedButton14Click(Sender: TObject);
begin
    with BotDAO do
    begin

      if qry_mostrarCardapio.RecordCount >0 then
      begin

             qry_mostrarCardapio.Delete;
             ShowMessage('Imagem excluída  com sucesso !');

      end;

    end;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin

  tabMenu.TabIndex:=4;
  sl.ActivePageIndex:=0;

end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin

    tabMenu.TabIndex:=5;


    if dialogo.Execute then
    begin

         if dialogo.FileName <> '' then
          begin
            with BotDAO.qry_mostrarEndereco do
            begin
              Close;
              sql.Clear;
              sql.Add('update tbl_endereco set endereco_imagem=:endereco where endereco_id=:status');
              ParamByName('endereco').AsString:=dialogo.FileName;
              ParamByName('status').AsInteger:=1;
              ExecSQL;
              ShowMessage('Endereço cadastrado com sucesso !');
              imgEnd.Picture.LoadFromFile(dialogo.FileName);
              endereco:=dialogo.FileName;
            end;
          end;

    end
    else
    ShowMessage('Não foi possivel cadastrar o endereço !');


end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
 atualiza.Enabled:=False;
 statusPedidos.Enabled:=False;
 impressao.Enabled:=False;
 Close;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin

  with BotDAO.qry_adicionais do
  begin


          Insert;
          gr_adicionais.Visible:=True;
          FieldByName('Menu').AsInteger:=RecordCount+1;
          FieldByName('Valor').AsCurrency:=0;
          edtDescAd.SetFocus;
          add3.Visible:=True;
          edit3.Visible:=False;
          lbAdicional.Caption:='Adicionando registro...';



  end;



end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
 with BotDAO.qry_adicionais do
  begin


          Edit;
          gr_adicionais.Visible:=True;
          edtDescAd.SetFocus;
          add3.Visible:=False;
          edit3.Visible:=True;
          lbAdicional.Caption:='Editando registro...';



  end;
end;

procedure TfrmPrincipal.SpeedButton8Click(Sender: TObject);
begin
 with BotDAO.qry_adicionais do
           begin
            Cancel;
            gr_adicionais.Visible:=False;
            edit3.Visible:=False;
            add3.Visible:=False;
            ok3.Visible:=False;
            erro3.Visible:=False;
            lbAdicional.Caption:='';
           end;
end;

procedure TfrmPrincipal.SpeedButton9Click(Sender: TObject);
begin
with BotDAO.qry_adicionais do
           begin
            Delete;
            edit3.Visible:=False;
            add3.Visible:=False;
            lbAdicional.Caption:='';
            ShowMessage('Registro excluído com sucesso !');
           end;
end;

procedure TfrmPrincipal.statusPedidosTimer(Sender: TObject);
begin
        // Lista Icones co os Status dos Pedidos
        ListaPedidos;
end;

procedure TfrmPrincipal.tabMenuChange(Sender: TObject);
begin
  if tabMenu.TabIndex=1 then
  begin
    lbStatusP.Caption:='';
    imgAddP.Visible:=False;
    imgEditP.Visible:=False;
    imgOn.Visible:=False;
    imgOff.Visible:=False;
  end
  else
   if tabMenu.TabIndex=2 then
   begin
     lbStatusP.Caption:='';
    imgAddP.Visible:=False;
    imgEditP.Visible:=False;
    imgOn.Visible:=False;
    imgOff.Visible:=False;
  end
   else
   if tabMenu.TabIndex=3 then
   begin
     lbAdicional.Caption:='';
    add3.Visible:=False;
    edit3.Visible:=False;
    ok3.Visible:=False;
    erro3.Visible:=False;
  end
  else  if tabMenu.TabIndex=4 then
   begin
    sl.ActivePageIndex:=0;
    img1.Picture.LoadFromFile(BotDAO.qry_mostrarCardapioimg1.AsString);
  end;
end;

procedure TfrmPrincipal.tabPedidosChange(Sender: TObject);
begin
if tabPedidos.TabIndex=0 then
begin
  atualiza.Enabled:=True;
end
else
  atualiza.Enabled:=False;
end;

end.
