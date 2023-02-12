
CREATE TABLE `TB_JOGO` (
  `ID_JOGO` int NOT NULL AUTO_INCREMENT,
  `NM_JOGO` varchar(120) DEFAULT NULL,
  `VL_JOGO` decimal(10,2) DEFAULT NULL,
  `DS_JOGO` varchar(500) DEFAULT NULL,
  `QTD_ESTOQUE` int DEFAULT NULL,
  `IMG_CAPA` varchar(500) DEFAULT NULL,
  `DS_REQUISITOS` varchar(300) DEFAULT NULL,
  `BL_DISPONIVEL` tinyint(1) DEFAULT NULL,
  `BL_MAISVENDIDO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_JOGO`)
);

CREATE TABLE `TB_USUARIO` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NM_USUARIO` varchar(100) DEFAULT NULL,
  `DS_CEP` varchar(12) DEFAULT NULL,
  `DS_NASCIMENTO` date DEFAULT NULL,
  `DS_CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`)
);

CREATE TABLE `TB_ADMIN` (
  `ID_ADMIN` int NOT NULL AUTO_INCREMENT,
  `DS_NOME` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`ID_ADMIN`)
);

CREATE TABLE `TB_PLATAFORMA` (
  `ID_PLATAFORMA` int NOT NULL AUTO_INCREMENT,
  `DS_PLATAFORMA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_PLATAFORMA`)
);

CREATE TABLE `TB_PEDIDO` (
  `ID_PEDIDO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int DEFAULT NULL,
  `DS_STATUS` varchar(50) DEFAULT NULL,
  `VL_TOTAL` decimal(10,2) DEFAULT NULL,
  `VL_FRETE` decimal(10,2) DEFAULT NULL,
  `COD_NOTAFISCAL` varchar(50) DEFAULT NULL,
  `DT_PEDIDO` date DEFAULT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `TB_PEDIDO_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `TB_USUARIO` (`ID_USUARIO`)
);

CREATE TABLE `TB_ENDERECO` (
  `ID_ENDERECO` int NOT NULL AUTO_INCREMENT,
  `DS_CEP` varchar(9) DEFAULT NULL,
  `DS_ENDERECO` varchar(50) DEFAULT NULL,
  `DS_CIDADE` varchar(50) DEFAULT NULL,
  `DS_BAIRRO` varchar(50) DEFAULT NULL,
  `DS_NUMERO` varchar(6) DEFAULT NULL,
  `FK_PEDIDO` int DEFAULT NULL,
  PRIMARY KEY (`ID_ENDERECO`),
  KEY `FK_PEDIDO` (`FK_PEDIDO`),
  CONSTRAINT `TB_ENDERECO_ibfk_1` FOREIGN KEY (`FK_PEDIDO`) REFERENCES `TB_PEDIDO` (`ID_PEDIDO`)
);

CREATE TABLE `TB_GENERO` (
  `ID_GENERO` int NOT NULL AUTO_INCREMENT,
  `DS_GENERO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_GENERO`)
);



CREATE TABLE `TB_ADMIN_LOGIN` (
  `ID_ADMIN_LOGIN` int NOT NULL AUTO_INCREMENT,
  `FK_ADMIN` int DEFAULT NULL,
  `DS_LOGIN` varchar(35) DEFAULT NULL,
  `DS_SENHA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_ADMIN_LOGIN`),
  KEY `FK_ADMIN` (`FK_ADMIN`),
  CONSTRAINT `TB_ADMIN_LOGIN_ibfk_1` FOREIGN KEY (`FK_ADMIN`) REFERENCES `TB_ADMIN` (`ID_ADMIN`)
);



CREATE TABLE `TB_GENERO_JOGO` (
  `ID_GENERO_JOGO` int NOT NULL AUTO_INCREMENT,
  `FK_JOGO` int DEFAULT NULL,
  `FK_GENERO` int DEFAULT NULL,
  PRIMARY KEY (`ID_GENERO_JOGO`),
  KEY `FK_JOGO` (`FK_JOGO`),
  KEY `FK_GENERO` (`FK_GENERO`),
  CONSTRAINT `TB_GENERO_JOGO_ibfk_1` FOREIGN KEY (`FK_JOGO`) REFERENCES `TB_JOGO` (`ID_JOGO`),
  CONSTRAINT `TB_GENERO_JOGO_ibfk_2` FOREIGN KEY (`FK_GENERO`) REFERENCES `TB_GENERO` (`ID_GENERO`)
);




CREATE TABLE `TB_JOGO_PEDIDO` (
  `ID_JOGO_PEDIDO` int NOT NULL AUTO_INCREMENT,
  `ID_PEDIDO` int DEFAULT NULL,
  `ID_JOGO` int DEFAULT NULL,
  `QTD_ITENS` int DEFAULT NULL,
  `VL_PRODUTO` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`ID_JOGO_PEDIDO`),
  KEY `ID_PEDIDO` (`ID_PEDIDO`),
  KEY `ID_JOGO` (`ID_JOGO`),
  CONSTRAINT `TB_JOGO_PEDIDO_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `TB_PEDIDO` (`ID_PEDIDO`),
  CONSTRAINT `TB_JOGO_PEDIDO_ibfk_2` FOREIGN KEY (`ID_JOGO`) REFERENCES `TB_JOGO` (`ID_JOGO`)
);

CREATE TABLE `TB_PAGAMENTO_PIX` (
  `ID_PAGAMENTO_PIX` int NOT NULL AUTO_INCREMENT,
  `NM_CLIENTE` varchar(50) DEFAULT NULL,
  `DS_CPF` varchar(12) DEFAULT NULL,
  `DS_CHAVEPIX` varchar(40) DEFAULT NULL,
  `FK_PEDIDO` int DEFAULT NULL,
  PRIMARY KEY (`ID_PAGAMENTO_PIX`),
  KEY `FK_PEDIDO` (`FK_PEDIDO`),
  CONSTRAINT `TB_PAGAMENTO_PIX_ibfk_1` FOREIGN KEY (`FK_PEDIDO`) REFERENCES `TB_PEDIDO` (`ID_PEDIDO`)
);





CREATE TABLE `TB_PLATAFORMA_JOGO` (
  `ID_PLATAFORMA_JOGO` int NOT NULL AUTO_INCREMENT,
  `FK_JOGO` int DEFAULT NULL,
  `FK_PLATAFORMA` int DEFAULT NULL,
  PRIMARY KEY (`ID_PLATAFORMA_JOGO`),
  KEY `FK_JOGO` (`FK_JOGO`),
  KEY `FK_PLATAFORMA` (`FK_PLATAFORMA`),
  CONSTRAINT `TB_PLATAFORMA_JOGO_ibfk_1` FOREIGN KEY (`FK_JOGO`) REFERENCES `TB_JOGO` (`ID_JOGO`),
  CONSTRAINT `TB_PLATAFORMA_JOGO_ibfk_2` FOREIGN KEY (`FK_PLATAFORMA`) REFERENCES `TB_PLATAFORMA` (`ID_PLATAFORMA`)
);



CREATE TABLE `TB_USUARIO_FAVORITO` (
  `ID_USUARIO_FAVORITO` int NOT NULL AUTO_INCREMENT,
  `FK_USUARIO` int DEFAULT NULL,
  `FK_JOGO` int DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO_FAVORITO`),
  KEY `FK_USUARIO` (`FK_USUARIO`),
  KEY `FK_JOGO` (`FK_JOGO`),
  CONSTRAINT `TB_USUARIO_FAVORITO_ibfk_1` FOREIGN KEY (`FK_USUARIO`) REFERENCES `TB_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `TB_USUARIO_FAVORITO_ibfk_2` FOREIGN KEY (`FK_JOGO`) REFERENCES `TB_JOGO` (`ID_JOGO`)
);

CREATE TABLE `TB_USUARIO_LOGIN` (
  `ID_USUARIO_LOGIN` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int DEFAULT NULL,
  `DS_EMAIL` varchar(35) DEFAULT NULL,
  `DS_SENHA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO_LOGIN`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `TB_USUARIO_LOGIN_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `TB_USUARIO` (`ID_USUARIO`)
);