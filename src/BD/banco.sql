-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Out-2020 às 18:41
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nextbotlanchespro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_adicionais`
--

CREATE TABLE `tbl_adicionais` (
  `idExtra` int(11) NOT NULL,
  `Menu` int(11) NOT NULL,
  `Descricao` varchar(120) DEFAULT NULL,
  `Valor` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_adicionais`
--

INSERT INTO `tbl_adicionais` (`idExtra`, `Menu`, `Descricao`, `Valor`) VALUES
(1, 10, 'CATUPIRY', 5.00),
(2, 11, 'MILHO', 2.00),
(3, 12, 'CHEDDAR', 5.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_bebida`
--

CREATE TABLE `tbl_bebida` (
  `bebida_id` int(11) NOT NULL,
  `bebida_id_menu` int(11) DEFAULT NULL,
  `bebida_descricao` varchar(50) DEFAULT NULL,
  `bebida_valor` float DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_bebida`
--

INSERT INTO `tbl_bebida` (`bebida_id`, `bebida_id_menu`, `bebida_descricao`, `bebida_valor`, `status`) VALUES
(35, 7, 'COCA-COLA', 5, 'T'),
(36, 8, 'FANTA', 5, 'T'),
(37, 9, 'SKOL LATA', 6, 'T');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cardapio`
--

CREATE TABLE `tbl_cardapio` (
  `cardapio_id` int(11) NOT NULL,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT '',
  `img3` varchar(255) DEFAULT '',
  `img4` varchar(255) DEFAULT '',
  `img5` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_cardapio`
--

INSERT INTO `tbl_cardapio` (`cardapio_id`, `img1`, `img2`, `img3`, `img4`, `img5`) VALUES
(1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_endereco`
--

CREATE TABLE `tbl_endereco` (
  `endereco_id` int(11) NOT NULL,
  `endereco_imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_endereco`
--

INSERT INTO `tbl_endereco` (`endereco_id`, `endereco_imagem`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_extraspedido`
--

CREATE TABLE `tbl_extraspedido` (
  `idItemExtra` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `idAdicional` int(11) NOT NULL,
  `Adicional` varchar(160) DEFAULT NULL,
  `Valor` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_itempedido`
--

CREATE TABLE `tbl_itempedido` (
  `itemPedido_id` int(11) NOT NULL,
  `itemPedido_pedido_id` int(11) NOT NULL,
  `itemPedido_item_id` int(11) DEFAULT NULL,
  `itemPedido_item_tipo` varchar(20) DEFAULT NULL,
  `itemPedido_concatenado` varchar(50) DEFAULT NULL,
  `itemPedido_qtde` int(11) DEFAULT NULL,
  `itemPedido_valor` float DEFAULT NULL,
  `itemPedido_total` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_listanegra`
--

CREATE TABLE `tbl_listanegra` (
  `listaNegra_id` int(11) NOT NULL,
  `listaNegra_fone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_logo`
--

CREATE TABLE `tbl_logo` (
  `id_logo` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_logo`
--

INSERT INTO `tbl_logo` (`id_logo`, `imagem`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pedido`
--

CREATE TABLE `tbl_pedido` (
  `pedido_id` int(11) NOT NULL,
  `pedido_data` datetime DEFAULT NULL,
  `pedido_cliente` varchar(255) DEFAULT NULL,
  `pedido_cliente_fone` varchar(20) DEFAULT NULL,
  `pedido_subtotal` double(10,2) DEFAULT NULL,
  `pedido_adicionais` double(10,2) DEFAULT NULL,
  `pedido_taxa` double(10,2) DEFAULT NULL,
  `pedido_valor_total` float DEFAULT NULL,
  `pedido_forma_pgt` varchar(20) DEFAULT NULL,
  `pedido_imp` int(1) DEFAULT NULL,
  `pedido_status` varchar(20) DEFAULT NULL,
  `pedido_obs` varchar(250) DEFAULT NULL,
  `pedido_localEntrega` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pizza`
--

CREATE TABLE `tbl_pizza` (
  `pizza_id` int(11) NOT NULL,
  `pizza_id_menu` int(11) DEFAULT NULL,
  `pizza_descricao` varchar(50) DEFAULT NULL,
  `pizza_valorGrande` float DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_pizza`
--

INSERT INTO `tbl_pizza` (`pizza_id`, `pizza_id_menu`, `pizza_descricao`, `pizza_valorGrande`, `status`) VALUES
(12, 1, 'X-BURGUER', 10, 'T'),
(13, 2, 'X-SALADA', 12, 'T'),
(15, 4, 'DOGAO', 15, 'T');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_taxas`
--

CREATE TABLE `tbl_taxas` (
  `id_taxa` int(11) NOT NULL,
  `bairro` varchar(180) NOT NULL,
  `valor` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `tbl_taxas`
--

INSERT INTO `tbl_taxas` (`id_taxa`, `bairro`, `valor`) VALUES
(24, 'CENTRO', 5.00),
(25, 'PRIMAVERA', 8.00),
(26, 'CONJ.JAMARI', 10.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_adicionais`
--
ALTER TABLE `tbl_adicionais`
  ADD PRIMARY KEY (`idExtra`) USING BTREE;

--
-- Indexes for table `tbl_bebida`
--
ALTER TABLE `tbl_bebida`
  ADD PRIMARY KEY (`bebida_id`) USING BTREE;

--
-- Indexes for table `tbl_cardapio`
--
ALTER TABLE `tbl_cardapio`
  ADD PRIMARY KEY (`cardapio_id`) USING BTREE;

--
-- Indexes for table `tbl_endereco`
--
ALTER TABLE `tbl_endereco`
  ADD PRIMARY KEY (`endereco_id`) USING BTREE;

--
-- Indexes for table `tbl_extraspedido`
--
ALTER TABLE `tbl_extraspedido`
  ADD PRIMARY KEY (`idItemExtra`,`idItem`) USING BTREE,
  ADD KEY `fkitem` (`idItem`) USING BTREE;

--
-- Indexes for table `tbl_itempedido`
--
ALTER TABLE `tbl_itempedido`
  ADD PRIMARY KEY (`itemPedido_id`) USING BTREE,
  ADD KEY `fkPedido` (`itemPedido_pedido_id`) USING BTREE,
  ADD KEY `itemPedido_item_id` (`itemPedido_item_id`) USING BTREE;

--
-- Indexes for table `tbl_listanegra`
--
ALTER TABLE `tbl_listanegra`
  ADD PRIMARY KEY (`listaNegra_id`) USING BTREE;

--
-- Indexes for table `tbl_logo`
--
ALTER TABLE `tbl_logo`
  ADD PRIMARY KEY (`id_logo`) USING BTREE;

--
-- Indexes for table `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`pedido_id`) USING BTREE;

--
-- Indexes for table `tbl_pizza`
--
ALTER TABLE `tbl_pizza`
  ADD PRIMARY KEY (`pizza_id`) USING BTREE;

--
-- Indexes for table `tbl_taxas`
--
ALTER TABLE `tbl_taxas`
  ADD PRIMARY KEY (`id_taxa`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_adicionais`
--
ALTER TABLE `tbl_adicionais`
  MODIFY `idExtra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_bebida`
--
ALTER TABLE `tbl_bebida`
  MODIFY `bebida_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tbl_extraspedido`
--
ALTER TABLE `tbl_extraspedido`
  MODIFY `idItemExtra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_itempedido`
--
ALTER TABLE `tbl_itempedido`
  MODIFY `itemPedido_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_listanegra`
--
ALTER TABLE `tbl_listanegra`
  MODIFY `listaNegra_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_logo`
--
ALTER TABLE `tbl_logo`
  MODIFY `id_logo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_pizza`
--
ALTER TABLE `tbl_pizza`
  MODIFY `pizza_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tbl_taxas`
--
ALTER TABLE `tbl_taxas`
  MODIFY `id_taxa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_extraspedido`
--
ALTER TABLE `tbl_extraspedido`
  ADD CONSTRAINT `fkitem` FOREIGN KEY (`idItem`) REFERENCES `tbl_itempedido` (`itemPedido_item_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tbl_itempedido`
--
ALTER TABLE `tbl_itempedido`
  ADD CONSTRAINT `fkPedido` FOREIGN KEY (`itemPedido_pedido_id`) REFERENCES `tbl_pedido` (`pedido_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
