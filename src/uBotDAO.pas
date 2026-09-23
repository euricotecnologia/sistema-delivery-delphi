unit uBotDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Data.DBXInterBase, Data.SqlExpr, Data.FMTBcd, Datasnap.Provider,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, uBotConversa,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.SQLite,IniFiles, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TBotDAO = class(TDataModule)
    CN: TFDConnection;
    qry_verificaListaNegra: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qry_registrarCardapio: TFDQuery;
    qry_mostrarCardapio: TFDQuery;
    qry_registrarEndereco: TFDQuery;
    qry_mostrarEndereco: TFDQuery;
    qry_pizza: TFDQuery;
    qry_bebida: TFDQuery;
    ds_bebida: TDataSource;
    ds_pizza: TDataSource;
    qry_listaMenuPizza: TFDQuery;
    qry_listaOpcoesPizza: TFDQuery;
    qry_insereItemPedido: TFDQuery;
    qry_consultaPedido: TFDQuery;
    qry_novoPedido: TFDQuery;
    qry_removerItemPedido: TFDQuery;
    qry_atualizaPedido: TFDQuery;
    qry_somatorioPizzaGrande: TFDQuery;
    qry_somatorioPizzaMedia: TFDQuery;
    qry_retornaValor: TFDQuery;
    qry_retornaCamposItemPedido: TFDQuery;
    qry_atualizaCamposItemPedido: TFDQuery;
    qry_listaOpcoesBebidas: TFDQuery;
    qry_listaMenuBebida: TFDQuery;
    qry_blackList: TFDQuery;
    ds_blackList: TDataSource;
    qry_blackListlistaNegra_id: TFDAutoIncField;
    qry_blackListlistaNegra_fone: TStringField;
    qry_pedidos: TFDQuery;
    ds_pedidos: TDataSource;
    qry_pedidospedido_id: TFDAutoIncField;
    qry_pedidospedido_cliente_fone: TStringField;
    qry_pedidospedido_status: TStringField;
    qry_pedidospedido_forma_pgt: TStringField;
    qry_pedidospedido_valor_total: TFloatField;
    qry_pedidospedido_data: TSQLTimeStampField;
    qry_pedidospedido_obs: TStringField;
    qry_pedidospedido_localEntrega: TStringField;
    qry_itemPedido: TFDQuery;
    ds_itemPedido: TDataSource;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qry_bebidabebida_id: TFDAutoIncField;
    qry_bebidabebida_descricao: TStringField;
    qry_bebidabebida_valor: TSingleField;
    qry_bebidastatus: TStringField;
    qry_pizzapizza_id: TFDAutoIncField;
    qry_pizzapizza_descricao: TStringField;
    qry_pizzapizza_valorGrande: TSingleField;
    qry_pizzastatus: TStringField;
    qry_pedidospedido_cliente: TStringField;
    qry_pizzapizza_id_menu: TIntegerField;
    qry_bebidabebida_id_menu: TIntegerField;
    taxas: TFDQuery;
    ds_taxas: TDataSource;
    taxasid_taxa: TFDAutoIncField;
    taxasbairro: TStringField;
    taxasvalor: TFloatField;
    uLogo: TFDQuery;
    dsLogo: TDataSource;
    uLogoid_logo: TFDAutoIncField;
    uLogoimagem: TStringField;
    bdHost: TFDConnection;
    config: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    configid: TIntegerField;
    configIP: TStringField;
    configBanco: TStringField;
    configLogin: TStringField;
    configSenha: TStringField;
    configPorta: TIntegerField;
    configtaxa: TFloatField;
    configimpressao: TStringField;
    configImpressora: TStringField;
    dsConfig: TDataSource;
    qry_mostrarEnderecoendereco_id: TIntegerField;
    qry_mostrarEnderecoendereco_imagem: TStringField;
    configMostrar: TIntegerField;
    qry_adicionais: TFDQuery;
    ds_adicionais: TDataSource;
    qry_adicionaisidExtra: TFDAutoIncField;
    qry_adicionaisDescricao: TStringField;
    qry_adicionaisValor: TFloatField;
    qry_adicionaisMenu: TIntegerField;
    ds_cardapio: TDataSource;
    qry_mostrarCardapiocardapio_id: TFDAutoIncField;
    qry_mostrarCardapioimg1: TStringField;
    qry_mostrarCardapioimg2: TStringField;
    qry_mostrarCardapioimg3: TStringField;
    qry_mostrarCardapioimg4: TStringField;
    qry_mostrarCardapioimg5: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CNAfterConnect(Sender: TObject);
    procedure CNAfterDisconnect(Sender: TObject);
    procedure bdHostAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure conecta; //Conexão mysql
    var dir:string;

    function  verificaListaNegra(Telefone: String): Boolean;
    procedure RegistrarCardapio(vFileStream: TMemoryStream);
    procedure RegistrarEndereco(vFileStream: TMemoryStream);
    function  MostrarCardapio: string;
    function  MostrarEndereco: string;
    function  ListaMenuPizza: String;
    function  ListaMenuBebida: String;
    function  ListaOpcoesPizza: TStringList;
    function  ListaOpcoesBebidas: TStringList;
    procedure InsereItemPedido(vItem: integer; vIDPedido: integer; vIDItem: integer;vQtde:Integer; vValorItem: currency; vTipoItem: string = ''; vDoisSabores: string = '');
    procedure InsereAdicionalPedido(vItem: integer; vIDPedido: integer; vIDAdicional: integer; vValorItem: currency);
    function  revisarPedido(vIDPedido: integer; vData: TDate; vIDCliente: string): string;
    function  revisarPedido2(vIDPedido: integer; vData: TDate; vIDCliente: string): string;
    function  ConsultaPedido(vData: TDate; vIDCliente: string): integer;
    function  novoPedido(vData: TDate; vIDCliente,vCliente: string): integer;
    function  preparaRemocaoItemPedido(vIDPedidoRemove: integer; vData: TDate; vIDCliente: string): TStringList;
    procedure confirmaRemocaoItemPedido(vIDItem: string);
    function  listaItensParaRemocaoPedido(vIDPedidoListaRemocaoItem: integer; vData: TDate; vIDCliente: string): string;
    procedure atualizaPedido(vIDPedido: integer; vEndereco: string; vFormaPGT: string; vOBSPedido: string;
  vIDContato: string; vData: TDate;vTaxa:Currency;vStatus:string);
    function  verificaValorPizza(vTipoItemValor: string; vIDItemValor: integer; vValorItem: currency): currency;
    function  verificaValorBebida(vTipoItemValor: string; vIDItemValor: integer; vValorItem: currency): currency;
     function  verificaValorExtra(vTipoItemValor: string; vIDItemValor: integer; vValorItem: currency): currency;
    procedure AtualizaCamposItemPedido(vIDMenu: integer; vData: TDate;
      vIDCliente: string; vItemMaiorValor: currency; vTipoItem: string);
    procedure CancelaItemDUO(vIDPedido: integer);
    function  verificaStatusPedido(vIDPedido: integer): boolean;
    procedure GravaINI;
    function ListaAdicionais:TStringList;
  end;

var
  BotDAO: TBotDAO;

implementation

uses
  Vcl.Forms,MMsystem, uTInject.Emoticons, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  System.NetEncoding, u_principal, Vcl.StdCtrls, Vcl.Dialogs, uConfig, uBackup,
  fPedidos, uGraficoTipo, uGraficoVendas, uAjustes, fsplash;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TBotDAO.AtualizaCamposItemPedido(vIDMenu: integer; vData: TDate;
  vIDCliente: string; vItemMaiorValor: currency; vTipoItem: string);
var nomeDUO: string;
begin

nomeDUO:='';

  if vTIpoItem <> 'Bebidas' then
  begin
    with qry_retornaCamposItemPedido do
    begin
      close;
      sql.clear;
      sql.add('SELECT * FROM tbl_pedido as A_P INNER JOIN tbl_itemPedido as A_IP ON A_P.pedido_id = A_IP.itemPedido_pedido_id '+
      ' INNER JOIN tbl_pizza AS A_PI ON A_IP.itemPedido_item_id = A_PI.pizza_id_menu WHERE  '+
      ' A_IP.itemPedido_item_id = :itemPedido_idMenu AND A_P.pedido_cliente_fone = :pedido_cliente_fone AND  itemPedido_item_tipo= ''Lanches'' ');
      params.paramByName('itemPedido_idMenu').value  :=  vIDMenu;
      params.paramByName('pedido_cliente_fone').value   :=  vIDCliente;

      open;
      first;

      nomeDUO := qry_retornaCamposItemPedido.fieldByName('pizza_descricao').value;


    end;

    if qry_retornaCamposItemPedido.IsEmpty = false then
    begin
      with qry_atualizaCamposItemPedido do
      begin
        close;
        sql.Clear;
        sql.Add('UPDATE tbl_itemPedido SET itemPedido_concatenado = :itemPedido_concatenado, '+
        ' itemPedido_maiorValor = :itemPedido_maiorValor WHERE itemPedido_pedido_id = :itemPedido_pedido_id AND itemPedido_item_id = :itemPedido_item_id ');
        params.paramByName('itemPedido_pedido_id').value    :=  qry_retornaCamposItemPedido.FieldByName('pedido_id').value;
        params.paramByName('itemPedido_concatenado').value  :=  nomeDUO ;
        params.paramByName('itemPedido_maiorValor').value   :=  vItemMaiorValor;
        params.paramByName('itemPedido_item_id').value    :=  vIDMenu;
        execSQL;

      end;
    end;
  end
  else  if vTIpoItem = 'Bebidas' then
  begin


         with qry_retornaCamposItemPedido do
            begin
              close;
              sql.clear;
              sql.add('SELECT * FROM tbl_pedido as A_P INNER JOIN tbl_itemPedido as A_IP ON A_P.pedido_id = A_IP.itemPedido_pedido_id '+
              ' INNER JOIN tbl_bebida AS A_BE ON A_IP.itemPedido_item_id = A_BE.bebida_id_menu WHERE  '+
              ' A_IP.itemPedido_item_id = :itemPedido_idMenu AND A_P.pedido_cliente_fone = :pedido_cliente_fone AND   '+
              '  itemPedido_item_tipo= ''Bebidas'' ');
              params.paramByName('itemPedido_idMenu').value  :=  vIDMenu;
              params.paramByName('pedido_cliente_fone').value   :=  vIDCliente;

              open;
              first;

              nomeDUO := qry_retornaCamposItemPedido.fieldByName('bebida_descricao').value;


            end;

            if qry_retornaCamposItemPedido.IsEmpty = false then
            begin
              with qry_atualizaCamposItemPedido do
              begin
                close;
                sql.Clear;
                sql.Add('UPDATE tbl_itemPedido SET itemPedido_concatenado = :itemPedido_concatenado, '+
                ' itemPedido_maiorValor = :itemPedido_maiorValor WHERE itemPedido_pedido_id = :itemPedido_pedido_id AND itemPedido_item_id = :itemPedido_item_id ');
                params.paramByName('itemPedido_pedido_id').value    :=  qry_retornaCamposItemPedido.FieldByName('pedido_id').value;
                params.paramByName('itemPedido_concatenado').value  :=  nomeDUO ;
                params.paramByName('itemPedido_maiorValor').value   :=  vItemMaiorValor;
                params.paramByName('itemPedido_item_id').value    :=  vIDMenu;
                execSQL;

              end;
            end;

  end;
end;

procedure TBotDAO.atualizaPedido(vIDPedido: integer; vEndereco: string; vFormaPGT: string; vOBSPedido: string;
  vIDContato: string; vData: TDate;vTaxa:Currency;vStatus:string);
var
subtotal, taxaEntrega,totalAdicionais: currency;
fd:TFDQuery;
begin
  subtotal   := 0;
  totalAdicionais  := 0;
  taxaEntrega:=vTaxa;


  with qry_somatorioPizzaGrande do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM tbl_pedido as A_P INNER JOIN tbl_itemPedido as A_IP ON A_P.pedido_id = A_IP.itemPedido_pedido_id     '+
    '  WHERE  A_P.pedido_id = :pedido_id  AND A_P.pedido_cliente_fone = :pedido_cliente_fone '+' ORDER BY A_IP.itemPedido_id ASC');
    params.ParamByName('pedido_id').Value           :=  vIDPedido;
    params.ParamByName('pedido_cliente_fone').Value :=  vIDContato;


    open;
    first;
    while not eof do
    begin
      subtotal := subtotal + fieldByName('itemPedido_total').AsCurrency;
      next;
    end;
  end;

  try

    fd:=TFDQuery.Create(Self);
    fd.Connection:=CN;

    with fd do
    begin
      Close;
      sql.Clear;
      sql.Add('select sum(Valor) as total from tbl_extraspedido where Pedido=:pedido');
      ParamByName('pedido').AsInteger:= vIDPedido;
      Open();

      totalAdicionais:=FieldByName('total').AsCurrency;
    end;


  finally
      fd.Free;
  end;

  //Grava pedido
  with qry_atualizaPedido do
  begin
    close;
    sql.Clear;
    sql.Add('UPDATE tbl_pedido SET                '+
    ' pedido_localEntrega = :pedido_localEntrega, '+
    ' pedido_forma_pgt    = :pedido_forma_pgt,    '+
    ' pedido_subtotal     = :subtotal,            '+
    ' pedido_taxa         = :taxa,                '+
    ' pedido_adicionais   = :adicionais,          '+
    ' pedido_valor_total  = :pedido_valor_total,  '+
    ' pedido_obs          = :pedido_obs,          '+
    ' pedido_status       = :pedido_status        '+
    ' WHERE pedido_id = :pedido_id');

    params.ParamByName('pedido_localEntrega').Value := vEndereco;
    params.ParamByName('pedido_forma_pgt').Value    := vFormaPGT;
    params.ParamByName('subtotal').Value            := subtotal;
    params.ParamByName('adicionais').Value          := totalAdicionais;
    params.ParamByName('taxa').Value                := vTaxa;
    params.ParamByName('pedido_valor_total').Value  := subtotal+vTaxa+totalAdicionais;
    params.ParamByName('pedido_obs').Value          := vOBSPedido;
    params.ParamByName('pedido_id').Value           := vIDPedido;
    params.ParamByName('pedido_status').Value       := vStatus;//Pedido foi finalizado pelo cliente
    execSQL ;

  end;

  //frmPrincipal.alerta.Show('NOVO PEDIDO','Um novo Pedido acaba de chegar !',2);
  //PlaySound('som.wav',1,SND_ASYNC);

end;

procedure TBotDAO.bdHostAfterConnect(Sender: TObject);
begin
  config.Open();
  if configMostrar.Value=0 then
  begin
         if frmAjustes=nil then
         frmAjustes:=TfrmAjustes.Create(Self);
         frmAjustes.ShowModal;
  end
  else
  begin
    conecta;
  end;
end;

procedure TBotDAO.CancelaItemDUO(vIDPedido: integer);
begin
  with qry_removerItemPedido do
  begin
    close;
    sql.Clear;
    sql.Add('DELETE FROM tbl_itemPedido WHERE itemPedido_pedido_id = :idPedido');
    params.ParamByName('idPedido').Value := vIDPedido;
    execSQL;

  end;
end;

procedure TBotDAO.CNAfterConnect(Sender: TObject);
begin
    with qry_bebida do
    begin
      close;

      open;
    end;

    with qry_pizza do
    begin
      close;
      
      open;
    end;

    with qry_adicionais do
    begin
      close;

      open;
    end;


    with frmPrincipal.uPedidos do
    begin
        Close;
        ParamByName('data').AsDate:=Date;
        OPen();
    end;

    with frmPrincipal.uItens do
      begin
        Close;
        OPen();
      end;


       with frmPrincipal.uAdicionais do
      begin
        Close;
        OPen();
      end;

     taxas.Open();

     uLogo.Open();

     if (uLogoimagem.AsString <> '') and (uLogoimagem.IsNull=False) then
     begin
         if FileExists(uLogoimagem.AsString,True) then
          frmPrincipal.imgLogo.Picture.LoadFromFile(uLogoimagem.AsString);
     end;



    with qry_mostrarCardapio do
    begin
      close;
      Open;

        if FieldByName('img1').AsString<>'' then
        begin
           frmPrincipal.img1.Picture.LoadFromFile(FieldByName('img1').AsString);
        end;

         if FieldByName('img2').AsString<>'' then
        begin
           frmPrincipal.img2.Picture.LoadFromFile(FieldByName('img2').AsString);
        end;

         if FieldByName('img3').AsString<>'' then
        begin
           frmPrincipal.img3.Picture.LoadFromFile(FieldByName('img3').AsString);
        end;

         if FieldByName('img4').AsString<>'' then
        begin
           frmPrincipal.img4.Picture.LoadFromFile(FieldByName('img4').AsString);
        end;

         if FieldByName('img5').AsString<>'' then
        begin
           frmPrincipal.img5.Picture.LoadFromFile(FieldByName('img5').AsString);
        end;



    end;

    with qry_mostrarEndereco do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM tbl_endereco where endereco_id=:status');
      ParamByName('status').AsInteger:=1;
      open;

      if (FieldByName('endereco_imagem').AsString <> '') and (FieldByName('endereco_imagem').IsNull=False) then
      begin


          frmPrincipal.imgEnd.Picture.LoadFromFile(FieldByName('endereco_imagem').AsString);
          frmPrincipal.endereco:=FieldByName('endereco_imagem').AsString;


      end
      else
      begin
         frmPrincipal.imgEnd.Picture.Assign(nil);
         frmPrincipal.endereco:='';
      end;

    end;

    frmPrincipal.status.Panels[0].Text:='Conectado';

end;

procedure TBotDAO.CNAfterDisconnect(Sender: TObject);
begin
frmPrincipal.status.Panels[0].Text:='Desconectado';
end;

procedure TBotDAO.conecta;
begin

    CN.Params.Add('Server='+configIP.AsString);
    CN.Params.Add('Database='+configBanco.AsString);
    CN.Params.Add('User_Name='+configLogin.AsString);
    CN.Params.Add('Password='+configSenha.AsString);

    CN.Connected := true;

end;

procedure TBotDAO.confirmaRemocaoItemPedido(vIDItem: string);
begin
  with qry_removerItemPedido do
  begin
    close;
    sql.Clear;
    sql.Add('DELETE FROM tbl_itemPedido WHERE itemPedido_id = :itemPedido_id');
    params.ParamByName('itemPedido_id').AsInteger := StrToInt(vIDItem);
    execSQL;

  end;

   with qry_removerItemPedido do
  begin
    close;
    sql.Clear;
    sql.Add('DELETE FROM tbl_extraspedido WHERE idItem = :id');
    params.ParamByName('id').AsInteger := StrToInt(vIDItem);
    execSQL;

  end;
end;

function TBotDAO.ConsultaPedido(vData: TDate; vIDCliente: string): integer;
begin
  with qry_consultaPedido do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM tbl_pedido WHERE pedido_cliente_fone = :pedido_cliente_fone AND pedido_data = :pedido_data AND pedido_status = ''N'' ');
    params.ParamByName('pedido_cliente_fone').Value := vIDCliente;
    params.ParamByName('pedido_data').asDate        := vData;
    open;
  end;

  if qry_consultaPedido.RecordCount > 0 then
    result := qry_consultaPedido.FieldByName('pedido_id').Value;
end;

procedure TBotDAO.DataModuleCreate(Sender: TObject);
var

host,banco,login,senha:string;
porta:Integer;
begin

  dir:=ExtractFilePath(ParamStr(0));

//  arquivo:=TIniFile.Create(dir+'config.ini');
//
//  host:=arquivo.ReadString('conexao','host',host);
//  banco:=arquivo.ReadString('conexao','banco',banco);
//  login:=arquivo.ReadString('conexao','login',login);
//  senha:=arquivo.ReadString('conexao','senha',senha);
//  porta:=arquivo.ReadInteger('conexao','porta',porta);
//
//  arquivo.Free;





  bdHost.Params.Database:=dir+'db.db';
  bdHost.Connected:=True;

  GravaINI;

end;

procedure TBotDAO.GravaINI;
var arquivo:TIniFile;
begin
      try
        arquivo:=TIniFile.Create(dir+'ConfTInject.ini');
        arquivo.WriteString('Informacao','Aplicativo vinculado',dir+Application.ExeName);
        arquivo.WriteString('Path Defines','Locales',dir+'locales');
        arquivo.WriteString('Path Defines','Cache',dir+'cache');
        arquivo.WriteString('Path Defines','Data User',dir+'User Data');
        arquivo.WriteString('Path Defines','Log Console',dir+'LogTinject\');
        arquivo.WriteString('Path Defines','Auto Receiver attached Path',dir);
      finally
        arquivo.Free;
      end;
end;

procedure TBotDAO.InsereAdicionalPedido(vItem, vIDPedido, vIDAdicional: integer;
  vValorItem: currency);
   var qr,fd:TFDQuery;
var adicional:string;
var idItem:Integer;
begin
     adicional:='';

   //Busca o nome do produto
  //Lanches
  qr:=TFDQuery.Create(self);
  qr.Connection:=CN;
  qr.Close;
  qr.SQL.Clear;

        qr.SQL.Add('select * from tbl_adicionais where Menu=:menu');
        qr.ParamByName('menu').AsInteger:=vIDAdicional;
        qr.Open();
        adicional:=qr.FieldByName('Descricao').AsString;


   fd:=TFDQuery.Create(self);
  fd.Connection:=CN;
   with fd do
  begin
    close;
    sql.Clear;
    sql.Add('INSERT INTO tbl_extraspedido '+
    '(   Pedido,   idItem,  idAdicional, Adicional  , Valor) VALUES '+
    '(  :idPedido,  :idItem, :idAdicioanal, :adicional , :valor )');
    params.ParamByName('idPedido').Value    := vIDPedido;
    params.ParamByName('idItem').Value      := vItem;
    params.ParamByName('idAdicioanal').Value    := vIDAdicional;
    params.ParamByName('adicional').Value    := adicional;
    params.ParamByName('valor').Value    := vValorItem;

    execSQL;

  end;


end;

procedure  TBotDAO.InsereItemPedido(vItem: integer; vIDPedido: integer; vIDItem: integer; vQtde:Integer;
  vValorItem: currency; vTipoItem: string = ''; vDoisSabores: string = '');
 var qr:TFDQuery;
var nome:string;
var idItem:Integer;
begin

    nome:='';

   //Busca o nome do produto
  //Lanches
  qr:=TFDQuery.Create(self);
  qr.Connection:=CN;
  qr.Close;
  qr.SQL.Clear;
  if vTipoItem='Lanches' then
  begin
        qr.SQL.Add('select pizza_descricao from tbl_pizza where pizza_id_menu=:id');
        qr.ParamByName('id').AsInteger:=vItem;
        qr.Open();
        nome:=qr.FieldByName('pizza_descricao').AsString;

  end
  else  if vTipoItem='Bebidas' then
  begin
      qr.SQL.Add('select bebida_descricao from tbl_bebida where bebida_id_menu=:id');
      qr.ParamByName('id').AsInteger:=vItem;
      qr.Open();
      nome:=qr.FieldByName('bebida_descricao').AsString;
  end;

  with qry_insereItemPedido do
  begin
    close;
    sql.Clear;
    sql.Add('INSERT INTO tbl_itemPedido '+
    '(   itemPedido_pedido_id,   itemPedido_item_id,  itemPedido_item_tipo, itemPedido_concatenado  , itemPedido_qtde,itemPedido_valor,itemPedido_total) VALUES '+
    '(  :itemPedido_pedido_id,  :itemPedido_item_id, :itemPedido_item_tipo, :concatenado ,:qtde, :valor ,:total)');
    params.ParamByName('itemPedido_pedido_id').Value    := vIDPedido;
    params.ParamByName('itemPedido_item_id').Value      := vItem;
    params.ParamByName('itemPedido_item_tipo').Value    := vTipoItem;
    params.ParamByName('concatenado').Value    := nome;
    params.ParamByName('qtde').Value    := vQtde;
    params.ParamByName('valor').Value    := vValorItem;
    params.ParamByName('total').Value   := vValorItem * vQtde;//qry_retornaValor.FieldByName(myField).Value;
    execSQL;

  end;
end;

function TBotDAO.listaItensParaRemocaoPedido(vIDPedidoListaRemocaoItem: integer; vData: TDate; vIDCliente: string): string;
var
  valorTotal            : currency;
  qry_revisarPedido     : TFDQuery;
   K:Integer;
begin

  qry_revisarPedido := TFDQuery.Create(self);
  qry_revisarPedido.Connection := CN;


  //Revisando pedidos simples
  with qry_revisarPedido do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM  tbl_itemPedido  WHERE itemPedido_pedido_id= :pedido   ORDER BY itemPedido_id ASC');
    params.ParamByName('pedido').Value           := vIDPedidoListaRemocaoItem;

    open;

    if IsEmpty = false then
    begin
      First;

      while not Eof do
      begin
          Result := Result + frmPrincipal.Inject1.Emoticons.SetaDireita +  '*'   + FieldByName('itemPedido_id').AsString + '* '
           +' ' +FieldByName('itemPedido_concatenado').AsString;

          valorTotal := valorTotal + FieldByName('itemPedido_total').value;

          Next;
      end;
    end;
    close;
    free;
  end;

  result := result + '\n\n *TOTAL:* ' + TInjectEmoticons.Dinheiro + formatFloat(' *TOTAL* R$ #,##0.00', valorTotal) + ' + Taxa de entrega';
end;

procedure TBotDAO.RegistrarCardapio(vFileStream: TMemoryStream);
begin
  with qry_registrarCardapio do
  begin
    close;
    sql.Clear;
    sql.Add('UPDATE tbl_cardapio SET cardapio_imagem = :file WHERE cardapio_id = 1');
    params.ParamByName('file').LoadFromStream(vFileStream, ftBlob);
    execSQL;

  end;
end;

procedure TBotDAO.RegistrarEndereco(vFileStream: TMemoryStream);
begin
  with qry_registrarEndereco do
  begin
    close;
    sql.Clear;
    sql.Add('UPDATE tbl_endereco SET endereco_imagem = :file WHERE endereco_id = 1');
    params.ParamByName('file').LoadFromStream(vFileStream, ftBlob);
    execSQL;
  end;
end;

function TBotDAO.preparaRemocaoItemPedido(vIDPedidoRemove: integer; vData: TDate; vIDCliente: string): TStringList;
var
  AItem: TStringList;
  qry_revisarPedido: TFDQuery;
begin
  AItem := TStringList.Create;
  qry_revisarPedido := TFDQuery.Create(self);
  qry_revisarPedido.Connection := CN;

  with qry_revisarPedido do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM tbl_pedido as A_P INNER JOIN tbl_itemPedido as A_IP ON A_P.pedido_id = A_IP.itemPedido_pedido_id '+
    ' WHERE A_P.pedido_id = :pedido_id AND A_P.pedido_cliente_fone = :pedido_cliente_fone  '+ ' ORDER BY A_IP.itemPedido_id ASC');
    params.ParamByName('pedido_id').Value           := vIDPedidoRemove;
    params.ParamByName('pedido_cliente_fone').Value := vIDCliente;

    open;
  end;

  qry_revisarPedido.First;

  if qry_revisarPedido.IsEmpty = false then
  begin
    while not qry_revisarPedido.Eof do
    begin
      AItem.Add(qry_revisarPedido.FieldByName('itemPedido_id').AsString);
      qry_revisarPedido.Next;
    end;
    Result := AItem;
  end
  else
  begin
    Result :=nil;
  end;


end;

function TBotDAO.revisarPedido(vIDPedido: integer; vData: TDate; vIDCliente: string): string;
var
  total,subtotal,taxa,adicionais:    currency;
  qry_revisarPedido ,fd              : TFDQuery;
  txt                                :      string;
begin

  txt:='';
  subtotal:= 0;
  adicionais:= 0;
  taxa:= 0;
  total:=0;

  //Criando as querys
  qry_revisarPedido                   := TFDQuery.Create(self);
  qry_revisarPedido.Connection        := CN;

  fd                   := TFDQuery.Create(self);
  fd.Connection        := CN;

  with qry_revisarPedido do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM  tbl_itempedido as i inner join tbl_pedido as p on i.itemPedido_pedido_id=p.pedido_id  WHERE p.pedido_status=:status and i.itemPedido_pedido_id=:pedido and p.pedido_cliente_fone=:fone ');
    ParamByName('pedido').AsInteger := vIDPedido;
    ParamByName('fone').AsString := vIDCliente;
    ParamByName('status').AsString := 'N';
    Open();

    if IsEmpty = false then
    begin

      First;
      taxa:=FieldByName('pedido_taxa').AsCurrency;
      adicionais:=FieldByName('pedido_adicionais').AsCurrency;
      total:=FieldByName('pedido_valor_total').AsCurrency;

      while not Eof do
      begin

          if FieldByName('itemPedido_item_tipo').AsString='Lanches' then
          begin
             txt := txt + frmPrincipal.Inject1.Emoticons.Hamburger+' '+ FieldByName('itemPedido_concatenado').AsString+' \n Qtde: '+ FieldByName('itemPedido_qtde').AsString +' x ' +formatFloat('R$ #,##0.00', FieldByName('itemPedido_valor').value) +' = *'+CurrToStrF(FieldByName('itemPedido_total').AsCurrency,ffCurrency,2)+'* \n';

          end
          else if FieldByName('itemPedido_item_tipo').AsString='Bebidas' then
          begin
             txt := txt + frmPrincipal.Inject1.Emoticons.Bebida+' '+ FieldByName('itemPedido_concatenado').AsString+' \n Qtde: '+ FieldByName('itemPedido_qtde').AsString +' x ' +CurrToStrf(FieldByName('itemPedido_valor').AsCurrency,ffCurrency,2) +' = *'+CurrToStrF(FieldByName('itemPedido_total').AsCurrency,ffCurrency,2)+'* \n';

          end;



          subtotal := subtotal + FieldByName('itemPedido_total').AsCurrency;

        qry_revisarPedido.Next;
      end;

       txt := txt + '------------------------------------------------------ \n' + frmPrincipal.Inject1.Emoticons.Dinheiro +' *SubTotal: '+ CurrToStrF(subtotal,ffCurrency,2)+'* \n';
       txt := txt + frmPrincipal.Inject1.Emoticons.FrenchFries + ' *Adicionais: '+CurrToStrF(adicionais,ffCurrency,2)+'* \n';
       txt := txt + frmPrincipal.Inject1.Emoticons.DeliveryTruck + ' *Taxa Ent.: '+CurrToStrF(taxa,ffCurrency,2)+'* \n';
       txt := txt + frmPrincipal.Inject1.Emoticons.MoneyBag + ' *Total: '+CurrToStrF(total,ffCurrency,2)+'* \n\n';

       Result:=txt;

    end
    else
    begin
        Result :='';
    end;

  end;


end;


function TBotDAO.revisarPedido2(vIDPedido: integer; vData: TDate; vIDCliente: string): string;
var
  total,subtotal,taxa,adicionais:    currency;
  qry_revisarPedido ,fd              : TFDQuery;
  txt                                :      string;
begin

  txt:='';
  subtotal:= 0;
  adicionais:= 0;
  taxa:= 0;
  total:=0;

  //Criando as querys
  qry_revisarPedido                   := TFDQuery.Create(self);
  qry_revisarPedido.Connection        := CN;

  fd                   := TFDQuery.Create(self);
  fd.Connection        := CN;

  with qry_revisarPedido do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM  tbl_itempedido as i left join tbl_pedido as p on i.itemPedido_pedido_id=p.pedido_id  WHERE p.pedido_status=:status and p.pedido_id=:pedido and p.pedido_cliente_fone=:fone ');
    ParamByName('pedido').Value := vIDPedido;
    ParamByName('fone').Value := vIDCliente;
    ParamByName('status').Value := 'F';
    Open();

    if IsEmpty = false then
    begin

      First;
      taxa:=FieldByName('pedido_taxa').AsCurrency;
      adicionais:=FieldByName('pedido_adicionais').AsCurrency;
      total:=FieldByName('pedido_valor_total').AsCurrency;

      while not Eof do
      begin

          if FieldByName('itemPedido_item_tipo').AsString='Lanches' then
          begin
             txt := txt + frmPrincipal.Inject1.Emoticons.Hamburger+' '+ FieldByName('itemPedido_concatenado').AsString+' \n Qtde: '+ FieldByName('itemPedido_qtde').AsString +' x ' +formatFloat('R$ #,##0.00', FieldByName('itemPedido_valor').value) +' = *'+CurrToStrF(FieldByName('itemPedido_total').AsCurrency,ffCurrency,2)+'* \n';

          end
          else if FieldByName('itemPedido_item_tipo').AsString='Bebidas' then
          begin
             txt := txt + frmPrincipal.Inject1.Emoticons.Bebida+' '+ FieldByName('itemPedido_concatenado').AsString+' \n Qtde: '+ FieldByName('itemPedido_qtde').AsString +' x ' +CurrToStrf(FieldByName('itemPedido_valor').AsCurrency,ffCurrency,2) +' = *'+CurrToStrF(FieldByName('itemPedido_total').AsCurrency,ffCurrency,2)+'* \n';

          end;



          subtotal := subtotal + FieldByName('itemPedido_total').AsCurrency;

        qry_revisarPedido.Next;
      end;

       txt := txt + '------------------------------------------------------ \n' + frmPrincipal.Inject1.Emoticons.Dinheiro +' *SubTotal: '+ CurrToStrF(subtotal,ffCurrency,2)+'* \n';
       txt := txt + frmPrincipal.Inject1.Emoticons.FrenchFries + ' *Adicionais: '+CurrToStrF(adicionais,ffCurrency,2)+'* \n';
       txt := txt + frmPrincipal.Inject1.Emoticons.DeliveryTruck + ' *Taxa Ent.: '+CurrToStrF(taxa,ffCurrency,2)+'* \n';
       txt := txt + frmPrincipal.Inject1.Emoticons.MoneyBag + ' *Total: '+CurrToStrF(total,ffCurrency,2)+'* \n\n';

       Result:=txt;

    end
    else
    begin
        Result :='';
    end;

  end;
end;

function TBotDAO.verificaListaNegra(Telefone: String): Boolean;
begin
  with qry_verificaListaNegra do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM tbl_listaNegra WHERE listaNegra_fone = :cliente_fone');
    params.ParamByName('cliente_fone').Value  := telefone;
    open;
  end;

  Result := qry_verificaListaNegra.RecordCount > 0;
end;

function TBotDAO.verificaStatusPedido(vIDPedido: integer): boolean;
var
  qry_status      : TFDQuery;
  qry_removePedido: TFDQuery;
begin
  qry_status                  := TFDQuery.Create(self);
  qry_status.Connection       := CN;

  with qry_status do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT pedido_status FROM tbl_pedido WHERE pedido_id = :pedido_id');
    params.ParamByName('pedido_id').Value := vIDPedido;
    open;

    if isEmpty = false then
    begin
      if fieldByName('pedido_status').Value = 'N' then
      begin
        //Caso chegue ao limite do tempo com o pedido sem ser finalizado, excluo e mando mensagem
        qry_removePedido            := TFDQuery.Create(self);
        qry_removePedido.Connection := CN;

        with qry_removePedido do
        begin
          close;
          sql.Clear;
          sql.Add('DELETE FROM tbl_itemPedido WHERE itemPedido_pedido_id = :itemPedido_pedido_id');
          params.ParamByName('itemPedido_pedido_id').Value := vIDPedido;
          execSQL;

          close;
          sql.Clear;
          sql.Add('DELETE FROM tbl_pedido WHERE pedido_id = :pedido_id');
          params.ParamByName('pedido_id').Value := vIDPedido;
          execSQL;

          close;
          free;
        end;
        result := true;
      end else
        result := false;
    end else
      result := false
  end;

  qry_status.Close;
  qry_status.Free;
end;

function TBotDAO.verificaValorPizza(vTipoItemValor: string; vIDItemValor: integer; vValorItem: currency): currency;
const ASQL = 'SELECT %s FROM tbl_pizza WHERE pizza_id_menu = :pizza_id_menu';
var myField: string;
begin
  //Aqui retorno o valor do primeiro sabor, para
  //depois, antes de inserir o segundo valor, comparar qual o sabor de maior valor.

    myField := 'pizza_valorGrande';

  with qry_retornaValor do
  begin
    close;
    sql.clear;
    sql.Text := format(ASQL, [myField]);
    params.paramByName('pizza_id_menu').value := vIDItemValor;
    open
  end;

  if vValorItem < qry_retornaValor.FieldByName(myField).Value then
    result := result + qry_retornaValor.FieldByName(myField).Value else
    result := result + vValorItem;
end;

function TBotDAO.verificaValorBebida(vTipoItemValor: string; vIDItemValor: integer; vValorItem: currency): currency;
const ASQL = 'SELECT %s FROM tbl_bebida WHERE bebida_id_menu = :bebida_id_menu';
var myField: string;
begin

  myField := 'bebida_valor';

  with qry_retornaValor do
  begin
    close;
    sql.clear;
    sql.Text := format(ASQL, [myField]);
    params.paramByName('bebida_id_menu').value := vIDItemValor;
    open
  end;
    if qry_retornaValor.IsEmpty = false then
    result := qry_retornaValor.FieldByName(myField).Value else
    result := 0;

end;

function TBotDAO.verificaValorExtra(vTipoItemValor: string;
  vIDItemValor: integer; vValorItem: currency): currency;
  var
  fd:TFDquery;
begin
               try

                  fd:=TFDquery.Create(Self);
                  fd.Connection:=CN;

                  with fd do
                  begin
                    Close;
                    sql.Clear;
                    SQL.Add('select Valor from tbl_adicionais where Menu=:menu');
                    ParamByName('menu').AsInteger:= vIDItemValor;
                    Open();

                    if RecordCount > 0 then
                    begin
                      Result:=FieldByName('Valor').AsCurrency;
                    end
                    else
                    begin
                      Result:=0;
                    end;
                  end;

               finally
                    fd.Free;
               end;
end;

function TBotDAO.ListaMenuBebida: String;
var K:Integer;
begin
  with qry_listaMenuBebida do
  begin
    close;
    sql.Clear;
    sql.add('SELECT * FROM tbl_bebida ORDER BY bebida_id_menu asc');
    open;
  end;

  qry_listaMenuBebida.First;
   for K := 0 to qry_listaMenuBebida.RecordCount -1 do
  begin
    Result := Result + TInjectEmoticons.Bebida + ' *' +qry_listaMenuBebida.FieldByName('bebida_id_menu').AsString +'*'
                     + ' - ' + qry_listaMenuBebida.FieldByName('bebida_descricao').AsString +' > '+CurrtoStrF(qry_listaMenuBebida.FieldByName('bebida_valor').AsCurrency,ffCurrency,2)+'\n';
    qry_listaMenuBebida.Next;
  end;
  Result := Result;
end;

function TBotDAO.ListaMenuPizza: String;
var I:Integer;
begin
  with qry_listaMenuPizza do
  begin
    close;
    sql.Clear;
    sql.add('SELECT * FROM tbl_pizza ORDER BY pizza_id_menu asc');
    open;
  end;

  qry_listaMenuPizza.First;
  for I := 0 to qry_listaMenuPizza.RecordCount -1 do
  begin
    Result := Result + TInjectEmoticons.Hamburger
                     + ' *' + qry_listaMenuPizza.FieldByName('pizza_id_menu').AsString+'*'+ ' - ' + qry_listaMenuPizza.FieldByName('pizza_descricao').AsString +' > '+CurrtoStrF(qry_listaMenuPizza.FieldByName('pizza_valorGrande').AsCurrency,ffCurrency,2)+'\n';
    qry_listaMenuPizza.Next;
  end;
  Result := Result;
end;

function TBotDAO.ListaOpcoesBebidas: TStringList;
var AItem: TStringList;
var J:Integer;
begin

            AItem := TStringList.Create;
  with qry_listaOpcoesBebidas do
  begin
    close;
    sql.Clear;
    sql.add('SELECT bebida_id_menu FROM tbl_bebida ORDER BY bebida_id_menu asc');
    open;
  end;

  qry_listaOpcoesBebidas.First;
  for J := 0 to qry_listaOpcoesBebidas.RecordCount - 1 do
  begin
    AItem.Add(qry_listaOpcoesBebidas.FieldByName('bebida_id_menu').AsString);
    qry_listaOpcoesBebidas.Next;
  end;
  Result := AItem;


end;

function TBotDAO.ListaOpcoesPizza: TStringList;
var AItem: TStringList;
var K:Integer;
begin
    AItem := TStringList.Create;
  with qry_listaOpcoesPizza do
  begin
    close;
    sql.Clear;
    sql.add('SELECT pizza_id_menu FROM tbl_pizza ORDER BY pizza_id_menu asc');
    open;
  end;

  qry_listaOpcoesPizza.First;
  for K := 0 to qry_listaOpcoesPizza.RecordCount - 1 do
  begin
    AItem.Add(qry_listaOpcoesPizza.FieldByName('pizza_id_menu').AsString);
    qry_listaOpcoesPizza.Next;
  end;
  Result := AItem;
end;

function TBotDAO.ListaAdicionais: TStringList;
var Itens: TStringList;
var K:Integer;
var qr:TFDQuery;
begin

  qr:=TFDQuery.Create(Self);
  qr.Connection:=CN;

  Itens := TStringList.Create;
  with qr do
  begin
    close;
    sql.Clear;
    sql.add('SELECT Menu FROM tbl_adicionais ORDER BY Menu asc');
    open;
  end;

  qr.First;
  for K := 0 to qr.RecordCount - 1 do
  begin
    Itens.Add(qr.FieldByName('Menu').AsString);
    qr.Next;
  end;
  Result := Itens;

end;

function TBotDAO.MostrarCardapio: string;


begin

    with qry_mostrarCardapio do
    begin
      close;
      Sql.Clear;
      Sql.Add('SELECT cardapio_imagem FROM tbl_cardapio WHERE cardapio_id = :id');
      ParamByName('id').AsInteger:=1;
      open;
    end;

   frmPrincipal.cardapio:=qry_mostrarCardapio.FieldByName('cardapio_imagem').AsString;
    Result :=  frmPrincipal.cardapio;
end;

function TBotDAO.MostrarEndereco: string;

begin

    with qry_mostrarEndereco do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT endereco_imagem FROM tbl_endereco WHERE endereco_id = :id');
      ParamByName('id').AsInteger:=1;
      Open;
    end;

    frmPrincipal.endereco:=qry_mostrarEndereco.FieldByName('endereco_imagem').AsString;
    Result :=  frmPrincipal.endereco;
end;

function TBotDAO.novoPedido(vData: TDate; vIDCliente,vCliente: string): integer;
begin
  with qry_novoPedido do
  begin
    close;
    sql.Clear;
    sql.Add('INSERT INTO tbl_pedido'+
    ' ( pedido_data,pedido_cliente,pedido_cliente_fone,pedido_subtotal,pedido_adicionais,pedido_taxa,pedido_valor_total, pedido_status,pedido_imp) VALUES '+
    ' (:data,:pedido_cliente,:pedido_cliente_fone,:subtotal,:adicionais,:taxa,:total,:pedido_status,:imp) ');
    params.ParamByName('pedido_cliente').Value := vCliente;
    params.ParamByName('pedido_cliente_fone').Value := vIDCliente;
    params.ParamByName('subtotal').AsCurrency        := 0;
    params.ParamByName('adicionais').AsCurrency        := 0;
    params.ParamByName('taxa').AsCurrency        := 0;
    params.ParamByName('total').AsCurrency        := 0;
    params.ParamByName('pedido_status').Value       := 'N'; //novo pedido
    params.ParamByName('data').asDate        := vData;
    params.ParamByName('imp').Value := 0;
    execSQL;

    close;
    sql.clear;
    sql.Add('SELECT MAX(pedido_id) pedido_id FROM tbl_pedido WHERE pedido_cliente_fone = :pedido_cliente_fone  AND pedido_status <> ''F'' ');
    params.ParamByName('pedido_cliente_fone').Value := vIDCliente;

    open;
  end;

  result := qry_novoPedido.FieldByName('pedido_id').Value;
end;

end.

