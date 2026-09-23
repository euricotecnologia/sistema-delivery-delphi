object BotDAO: TBotDAO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 535
  Width = 944
  object CN: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    AfterConnect = CNAfterConnect
    AfterDisconnect = CNAfterDisconnect
    Left = 56
    Top = 32
  end
  object qry_verificaListaNegra: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 55
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 191
    Top = 457
  end
  object qry_registrarCardapio: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 55
    Top = 160
  end
  object qry_mostrarCardapio: TFDQuery
    Connection = CN
    SQL.Strings = (
      
        'select * from tbl_cardapio where cardapio_id='#39'1'#39' order by cardap' +
        'io_id ASC')
    Left = 55
    Top = 216
    object qry_mostrarCardapiocardapio_id: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'cardapio_id'
      Origin = 'cardapio_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_mostrarCardapioimg1: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'IMAGEM 1'
      FieldName = 'img1'
      Origin = 'img1'
      Size = 255
    end
    object qry_mostrarCardapioimg2: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'IMAGEM 2'
      FieldName = 'img2'
      Origin = 'img2'
      Size = 255
    end
    object qry_mostrarCardapioimg3: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'IMAGEM 3'
      FieldName = 'img3'
      Origin = 'img3'
      Size = 255
    end
    object qry_mostrarCardapioimg4: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'IMAGEM 4'
      FieldName = 'img4'
      Origin = 'img4'
      Size = 255
    end
    object qry_mostrarCardapioimg5: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'IMAGEM 5'
      FieldName = 'img5'
      Origin = 'img5'
      Size = 255
    end
  end
  object qry_registrarEndereco: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 191
    Top = 160
  end
  object qry_mostrarEndereco: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_endereco where endereco_id='#39'1'#39)
    Left = 191
    Top = 216
    object qry_mostrarEnderecoendereco_id: TIntegerField
      FieldName = 'endereco_id'
      Origin = 'endereco_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qry_mostrarEnderecoendereco_imagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco_imagem'
      Origin = 'endereco_imagem'
      Size = 255
    end
  end
  object qry_pizza: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_pizza order by pizza_id asc')
    Left = 321
    Top = 160
    object qry_pizzapizza_id: TFDAutoIncField
      FieldName = 'pizza_id'
      Origin = 'pizza_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_pizzapizza_id_menu: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pizza_id_menu'
      Origin = 'pizza_id_menu'
    end
    object qry_pizzapizza_descricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pizza_descricao'
      Origin = 'pizza_descricao'
      Size = 50
    end
    object qry_pizzapizza_valorGrande: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Vlr.Pizza Grande'
      FieldName = 'pizza_valorGrande'
      Origin = 'pizza_valorGrande'
      currency = True
    end
    object qry_pizzastatus: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status'
      FieldName = 'status'
      Origin = 'status'
      Size = 1
    end
  end
  object qry_bebida: TFDQuery
    Connection = CN
    SQL.Strings = (
      'SELECT * FROM tbl_bebida order by bebida_id asc')
    Left = 399
    Top = 160
    object qry_bebidabebida_id: TFDAutoIncField
      FieldName = 'bebida_id'
      Origin = 'bebida_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_bebidabebida_id_menu: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bebida_id_menu'
      Origin = 'bebida_id_menu'
    end
    object qry_bebidabebida_descricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'bebida_descricao'
      Origin = 'bebida_descricao'
      Size = 50
    end
    object qry_bebidabebida_valor: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor'
      FieldName = 'bebida_valor'
      Origin = 'bebida_valor'
      currency = True
    end
    object qry_bebidastatus: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status'
      FieldName = 'status'
      Origin = 'status'
      Size = 1
    end
  end
  object ds_bebida: TDataSource
    DataSet = qry_bebida
    Left = 400
    Top = 216
  end
  object ds_pizza: TDataSource
    DataSet = qry_pizza
    Left = 322
    Top = 216
  end
  object qry_listaMenuPizza: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 55
    Top = 304
  end
  object qry_listaOpcoesPizza: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 191
    Top = 304
  end
  object qry_insereItemPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 319
    Top = 304
  end
  object qry_consultaPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 55
    Top = 384
  end
  object qry_novoPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 191
    Top = 384
  end
  object qry_removerItemPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 319
    Top = 384
  end
  object qry_atualizaPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 744
    Top = 384
  end
  object qry_somatorioPizzaGrande: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 451
    Top = 384
  end
  object qry_somatorioPizzaMedia: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 596
    Top = 384
  end
  object qry_retornaValor: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 591
    Top = 304
  end
  object qry_retornaCamposItemPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'SELECT * FROM tbl_bebida')
    Left = 447
    Top = 304
  end
  object qry_atualizaCamposItemPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 590
    Top = 224
  end
  object qry_listaOpcoesBebidas: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_agenda as a join tbl_cliente as b'
      'on a.id_cliente = b.id')
    Left = 591
    Top = 160
  end
  object qry_listaMenuBebida: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_listaNegra')
    Left = 743
    Top = 160
  end
  object qry_blackList: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_listaNegra')
    Left = 743
    Top = 224
    object qry_blackListlistaNegra_id: TFDAutoIncField
      FieldName = 'listaNegra_id'
      Origin = 'listaNegra_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_blackListlistaNegra_fone: TStringField
      FieldName = 'listaNegra_fone'
      Origin = 'listaNegra_fone'
    end
  end
  object ds_blackList: TDataSource
    DataSet = qry_blackList
    Left = 744
    Top = 304
  end
  object qry_pedidos: TFDQuery
    Connection = CN
    SQL.Strings = (
      'SELECT * FROM tbl_pedido ORDER BY pedido_id DESC')
    Left = 847
    Top = 160
    object qry_pedidospedido_id: TFDAutoIncField
      FieldName = 'pedido_id'
      Origin = 'pedido_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_pedidospedido_cliente_fone: TStringField
      FieldName = 'pedido_cliente_fone'
      Origin = 'pedido_cliente_fone'
    end
    object qry_pedidospedido_status: TStringField
      FieldName = 'pedido_status'
      Origin = 'pedido_status'
    end
    object qry_pedidospedido_forma_pgt: TStringField
      FieldName = 'pedido_forma_pgt'
      Origin = 'pedido_forma_pgt'
    end
    object qry_pedidospedido_valor_total: TFloatField
      FieldName = 'pedido_valor_total'
      Origin = 'pedido_valor_total'
    end
    object qry_pedidospedido_data: TSQLTimeStampField
      FieldName = 'pedido_data'
      Origin = 'pedido_data'
    end
    object qry_pedidospedido_obs: TStringField
      FieldName = 'pedido_obs'
      Origin = 'pedido_obs'
      Size = 250
    end
    object qry_pedidospedido_localEntrega: TStringField
      FieldName = 'pedido_localEntrega'
      Origin = 'pedido_localEntrega'
      Size = 250
    end
    object qry_pedidospedido_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pedido_cliente'
      Origin = 'pedido_cliente'
      Size = 255
    end
  end
  object ds_pedidos: TDataSource
    DataSet = qry_pedidos
    Left = 848
    Top = 224
  end
  object qry_itemPedido: TFDQuery
    Connection = CN
    SQL.Strings = (
      'SELECT * FROM tbl_pedido ORDER BY pedido_id DESC')
    Left = 847
    Top = 304
  end
  object ds_itemPedido: TDataSource
    DataSet = qry_itemPedido
    Left = 848
    Top = 384
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 80
    Top = 472
  end
  object taxas: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_taxas order by bairro asc')
    Left = 544
    Top = 464
    object taxasid_taxa: TFDAutoIncField
      FieldName = 'id_taxa'
      Origin = 'id_taxa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object taxasbairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 180
    end
    object taxasvalor: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
    end
  end
  object ds_taxas: TDataSource
    DataSet = taxas
    Left = 640
    Top = 464
  end
  object uLogo: TFDQuery
    Connection = CN
    SQL.Strings = (
      'select * from tbl_logo where id_logo='#39'1'#39)
    Left = 752
    Top = 464
    object uLogoid_logo: TFDAutoIncField
      FieldName = 'id_logo'
      Origin = 'id_logo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object uLogoimagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'imagem'
      Origin = 'imagem'
      Size = 255
    end
  end
  object dsLogo: TDataSource
    DataSet = uLogo
    Left = 824
    Top = 464
  end
  object bdHost: TFDConnection
    Params.Strings = (
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = bdHostAfterConnect
    Left = 464
    Top = 24
  end
  object config: TFDQuery
    Connection = bdHost
    SQL.Strings = (
      'select * from config where id='#39'1'#39)
    Left = 560
    Top = 32
    object configid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object configIP: TStringField
      FieldName = 'IP'
      Origin = 'IP'
      Required = True
      Size = 120
    end
    object configBanco: TStringField
      FieldName = 'Banco'
      Origin = 'Banco'
      Required = True
      Size = 120
    end
    object configLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
      Required = True
      Size = 80
    end
    object configSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Size = 80
    end
    object configPorta: TIntegerField
      FieldName = 'Porta'
      Origin = 'Porta'
      Required = True
    end
    object configtaxa: TFloatField
      FieldName = 'taxa'
      Origin = 'taxa'
    end
    object configimpressao: TStringField
      DisplayLabel = 'Permitir Impress'#227'o'
      FieldName = 'impressao'
      Origin = 'impressao'
      FixedChar = True
      Size = 3
    end
    object configImpressora: TStringField
      DisplayWidth = 20
      FieldName = 'Impressora'
      Origin = 'Impressora'
      Size = 255
    end
    object configMostrar: TIntegerField
      FieldName = 'Mostrar'
      Origin = 'Mostrar'
    end
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 464
    Top = 88
  end
  object dsConfig: TDataSource
    DataSet = config
    Left = 552
    Top = 88
  end
  object qry_adicionais: TFDQuery
    Connection = CN
    SQL.Strings = (
      'SELECT * FROM tbl_adicionais order by idExtra asc')
    Left = 479
    Top = 160
    object qry_adicionaisidExtra: TFDAutoIncField
      FieldName = 'idExtra'
      Origin = 'idExtra'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_adicionaisMenu: TIntegerField
      FieldName = 'Menu'
      Origin = 'Menu'
      Required = True
    end
    object qry_adicionaisDescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 20
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 120
    end
    object qry_adicionaisValor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Valor'
      Origin = 'Valor'
      currency = True
    end
  end
  object ds_adicionais: TDataSource
    DataSet = qry_adicionais
    Left = 480
    Top = 216
  end
  object ds_cardapio: TDataSource
    DataSet = qry_mostrarCardapio
    Left = 56
    Top = 264
  end
end
