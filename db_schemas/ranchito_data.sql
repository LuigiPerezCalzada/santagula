-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: ranchito
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL,
  `user_create` int NOT NULL,
  `updated` date NOT NULL,
  `user_update` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `tienda_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `tienda_id` (`tienda_id`),
  KEY `user_update` (`user_update`),
  KEY `user_create` (`user_create`),
  CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `almacenes_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` VALUES (1,'2022-05-29',1,'2022-05-29',1,1,5,1),(2,'2022-05-29',1,'2022-05-29',1,2,15,1),(3,'2022-05-29',1,'2022-05-29',1,4,9,1),(4,'2022-05-29',1,'2022-05-29',1,6,9,1),(5,'2022-05-29',1,'2022-05-29',1,8,10,1),(6,'2022-05-29',1,'2022-05-29',1,11,7,1),(7,'2022-05-29',1,'2022-05-29',1,9,9,1),(8,'2022-05-29',1,'2022-05-29',1,7,7,1),(9,'2022-05-29',1,'2022-05-29',1,5,10,1),(10,'2022-05-29',1,'2022-05-29',1,3,10,1),(11,'2022-05-29',1,'2022-05-29',1,10,10,1);
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created` date NOT NULL,
  `created_by_user_id` int NOT NULL,
  `activo` tinyint NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `created_by_user_id` (`created_by_user_id`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Refresco','2022-05-28',1,1,'Refresco.png'),(2,'Papas','2022-05-28',1,1,'Papas.jpg'),(3,'Cervezas','2022-05-28',1,1,'Cervezas.jpeg');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ap` varchar(50) NOT NULL,
  `am` varchar(50) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `municipio` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rfc` varchar(15) NOT NULL,
  `porc_desc` int NOT NULL,
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `franq` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costales`
--

DROP TABLE IF EXISTS `costales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tienda_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tienda_id` (`tienda_id`),
  CONSTRAINT `costales_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costales`
--

LOCK TABLES `costales` WRITE;
/*!40000 ALTER TABLE `costales` DISABLE KEYS */;
/*!40000 ALTER TABLE `costales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion_info`
--

DROP TABLE IF EXISTS `cotizacion_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizacion_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `folio` varchar(15) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `tienda_id` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `total` float NOT NULL,
  `cotizador_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`,`tienda_id`,`cotizador_id`),
  KEY `tienda_id` (`tienda_id`),
  KEY `cotizador_id` (`cotizador_id`),
  CONSTRAINT `cotizacion_info_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_info_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_info_ibfk_3` FOREIGN KEY (`cotizador_id`) REFERENCES `cotizador` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion_info`
--

LOCK TABLES `cotizacion_info` WRITE;
/*!40000 ALTER TABLE `cotizacion_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion_prod`
--

DROP TABLE IF EXISTS `cotizacion_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizacion_prod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `cotizacion_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` float NOT NULL,
  `costo_total` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`,`cotizacion_id`),
  KEY `cotizacion_id` (`cotizacion_id`),
  CONSTRAINT `cotizacion_prod_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_prod_ibfk_2` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizacion_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion_prod`
--

LOCK TABLES `cotizacion_prod` WRITE;
/*!40000 ALTER TABLE `cotizacion_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizador`
--

DROP TABLE IF EXISTS `cotizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizador`
--

LOCK TABLES `cotizador` WRITE;
/*!40000 ALTER TABLE `cotizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'ACTIVO'),(2,'DESACTIVO');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_est`
--

DROP TABLE IF EXISTS `pedido_est`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_est` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_est`
--

LOCK TABLES `pedido_est` WRITE;
/*!40000 ALTER TABLE `pedido_est` DISABLE KEYS */;
INSERT INTO `pedido_est` VALUES (1,'Entregado');
/*!40000 ALTER TABLE `pedido_est` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_est_pago`
--

DROP TABLE IF EXISTS `pedido_est_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_est_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_est_pago`
--

LOCK TABLES `pedido_est_pago` WRITE;
/*!40000 ALTER TABLE `pedido_est_pago` DISABLE KEYS */;
INSERT INTO `pedido_est_pago` VALUES (1,'Por pagar'),(2,'Pagado');
/*!40000 ALTER TABLE `pedido_est_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_info`
--

DROP TABLE IF EXISTS `pedidos_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `tienda_id` int NOT NULL,
  `nombre_cliente` varchar(150) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `hora` varchar(5) DEFAULT NULL,
  `total` float(8,2) NOT NULL,
  `est_pedido_id` int NOT NULL,
  `id_pedido_est_pago` int NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `hora_entrega_inicial` time DEFAULT NULL,
  `hora_entrega_final` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tienda_id` (`tienda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_info`
--

LOCK TABLES `pedidos_info` WRITE;
/*!40000 ALTER TABLE `pedidos_info` DISABLE KEYS */;
INSERT INTO `pedidos_info` VALUES (1,1,1,'Luis','2022-06-09 23:16:31',NULL,20.00,1,1,NULL,NULL,NULL),(2,1,1,'Yo','2022-07-14 22:37:47',NULL,20.00,1,1,NULL,NULL,NULL),(3,1,1,'Luigi','2022-08-11 22:15:27',NULL,45.00,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pedidos_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_pagos`
--

DROP TABLE IF EXISTS `pedidos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_pagos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_info_id` int NOT NULL,
  `pago` float(8,2) NOT NULL,
  `recibido` float(8,2) NOT NULL,
  `cambio` float(8,2) NOT NULL,
  `usuario_id` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_pagos`
--

LOCK TABLES `pedidos_pagos` WRITE;
/*!40000 ALTER TABLE `pedidos_pagos` DISABLE KEYS */;
INSERT INTO `pedidos_pagos` VALUES (1,1,0.00,0.00,0.00,1,'2022-06-09'),(2,2,10.00,10.00,0.00,1,'2022-07-14'),(3,1,5.00,10.00,5.00,1,'2022-07-14'),(4,3,20.00,20.00,0.00,1,'2022-08-11'),(5,3,2.00,2.00,0.00,1,'2022-08-11'),(6,3,4.00,5.00,1.00,1,'2022-08-18'),(7,1,5.00,5.00,0.00,1,'2022-08-18');
/*!40000 ALTER TABLE `pedidos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_prod`
--

DROP TABLE IF EXISTS `pedidos_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_prod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `pedido_info_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` float(8,2) NOT NULL,
  `costo_total` float(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `venta__info_id` (`pedido_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_prod`
--

LOCK TABLES `pedidos_prod` WRITE;
/*!40000 ALTER TABLE `pedidos_prod` DISABLE KEYS */;
INSERT INTO `pedidos_prod` VALUES (1,1,1,1,20.00,20.00),(2,1,2,1,20.00,20.00),(3,9,3,3,15.00,45.00);
/*!40000 ALTER TABLE `pedidos_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perfil` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'GERENTE'),(2,'COTIZADOR'),(3,'VENDEDOR'),(4,'FRANQUICIA');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio_publico` float(8,2) NOT NULL,
  `precio_franquicia` float(8,2) DEFAULT NULL,
  `precio_cotizador` float(8,2) DEFAULT NULL,
  `precio_raiz` float(8,2) DEFAULT NULL,
  `cant_minima` int NOT NULL,
  `img` varchar(20) NOT NULL,
  `pdf` varchar(1) DEFAULT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `codigo_barras` varchar(20) NOT NULL,
  `categoria_id` int NOT NULL,
  `subcategoria_id` int NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `created_by_user_id` int NOT NULL,
  `updated_by_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Cheetos torciditos',20.00,NULL,NULL,11.00,1,'0.png',NULL,'Chhetos torciditos',1,'0258',2,3,'2022-05-29','2022-06-06',1,1),(2,'Lata 455ml',16.00,NULL,NULL,13.00,1,'1.jpg',NULL,'Indio lata 455ml',-1,'02589',3,5,'2022-05-29','2022-05-29',1,1),(3,'Media ',20.00,NULL,NULL,15.00,1,'2.jpg',NULL,'Indio media ',-1,'02586',3,5,'2022-05-29','2022-05-29',1,1),(4,'Caguama',35.00,NULL,NULL,30.00,1,'3.jpg',NULL,'Indio caguama',1,'02583',3,5,'2022-05-29','2022-05-29',1,1),(5,'Lata 455ml',13.00,NULL,NULL,11.00,1,'4.jpg',NULL,'Lata tecate',1,'03698',3,6,'2022-05-29','2022-05-29',1,1),(6,'Caguama',37.00,NULL,NULL,31.00,1,'5.jpg',NULL,'caguama de tecate',1,'03695',3,6,'2022-05-29','2022-05-29',1,1),(7,'Lata 435ml',23.00,NULL,NULL,20.00,1,'6.png',NULL,'lata victoria',1,'03695',3,7,'2022-05-29','2022-05-29',1,1),(8,'Caguama',40.00,NULL,NULL,33.00,1,'7.jpg',NULL,'caguama victoria',1,'03692',3,7,'2022-05-29','2022-05-29',1,1),(9,'Doritos diablo',15.00,NULL,NULL,12.00,1,'8.jpg',NULL,'Doritos diablo',1,'1230',2,3,'2022-05-29','2022-05-29',1,1),(10,'Takis fuego',9.00,NULL,NULL,7.00,1,'9.jpg',NULL,'takis fuego',1,'0456',2,4,'2022-05-29','2022-05-29',1,1),(11,'Chips verdes',14.00,NULL,NULL,12.00,12,'10.jpg',NULL,'chips verdes',1,'0789',2,4,'2022-05-29','2022-05-29',1,1),(1000,'efectivo',-1.00,NULL,NULL,-1.00,10000,'efectivo.jpg',NULL,'Para cuando se requiere efectivo',1,'1',1,1,'2022-07-21','2022-07-21',1,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sobrantes`
--

DROP TABLE IF EXISTS `sobrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sobrantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `tienda_ida` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `sobrantes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sobrantes`
--

LOCK TABLES `sobrantes` WRITE;
/*!40000 ALTER TABLE `sobrantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sobrantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint NOT NULL,
  `categoria_id` int NOT NULL,
  `created` date NOT NULL,
  `create_by` int NOT NULL,
  `updated` date NOT NULL,
  `update_by` int NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `categoria_id` (`categoria_id`),
  KEY `create_by` (`create_by`),
  KEY `update_by` (`update_by`),
  CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `subcategorias_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `subcategorias_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,'Coca-Cola',1,1,'2022-05-28',1,'2022-05-28',1,'Coca-Cola.jpg'),(2,'Pepsi',1,1,'2022-05-28',1,'2022-05-28',1,'Pepsi.png'),(3,'Sabritas',1,2,'2022-05-28',1,'2022-05-28',1,'Sabritas.jpeg'),(4,'Barcel',1,2,'2022-05-28',1,'2022-05-28',1,'Barcel.jpeg'),(5,'Indio',1,3,'2022-05-28',1,'2022-05-28',1,'Indio.jpg'),(6,'Tecate',1,3,'2022-05-28',1,'2022-05-28',1,'Tecate.jpg'),(7,'Victoria',1,3,'2022-05-28',1,'2022-05-28',1,'Victoria.jpg');
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `cp` int NOT NULL,
  `tel` varchar(15) NOT NULL,
  `num_sess` int NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `activo` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'El Ranchito','Revolución No. 25','UHU',9,'0',1,'0','0','123','2022-05-28','2022-05-28',1);
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ap` varchar(30) NOT NULL,
  `am` varchar(30) NOT NULL,
  `user` varchar(20) DEFAULT NULL,
  `password` int NOT NULL,
  `perfil_id` int NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `num_int` varchar(10) DEFAULT NULL,
  `num_ext` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `municipio` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `fec_nac` date DEFAULT NULL,
  `activo` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Luigi','Perez','Calzada','123',123,1,'666',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-28','2022-05-28',NULL,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_mensajes`
--

DROP TABLE IF EXISTS `usuarios_mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `mensaje` text NOT NULL,
  `creado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_mensajes`
--

LOCK TABLES `usuarios_mensajes` WRITE;
/*!40000 ALTER TABLE `usuarios_mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_info`
--

DROP TABLE IF EXISTS `ventas_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `tienda_id` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `pago` float(8,2) NOT NULL,
  `total` float(8,2) NOT NULL,
  `cambio` float(8,2) NOT NULL,
  `descuento` int DEFAULT NULL,
  `total_desc` int DEFAULT NULL,
  `cant_desc` int DEFAULT NULL,
  `cambio_desc` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tienda_id` (`tienda_id`),
  CONSTRAINT `ventas_info_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `ventas_info_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_info`
--

LOCK TABLES `ventas_info` WRITE;
/*!40000 ALTER TABLE `ventas_info` DISABLE KEYS */;
INSERT INTO `ventas_info` VALUES (1,1,1,'2022-05-29','13:31',50.00,37.00,13.00,NULL,NULL,NULL,NULL,NULL),(2,1,1,'2022-05-29','13:31',100.00,24.00,76.00,NULL,NULL,NULL,NULL,NULL),(3,1,1,'2022-08-11','22:14',20.00,15.00,5.00,NULL,NULL,NULL,NULL,NULL),(4,1,1,'2022-08-29','22:17',50.00,42.00,8.00,NULL,NULL,NULL,NULL,NULL),(5,1,1,'2022-08-29','22:18',100.00,55.00,45.00,NULL,NULL,NULL,NULL,NULL),(6,1,1,'2022-08-29','22:19',0.00,46.00,0.00,NULL,NULL,NULL,NULL,NULL),(7,1,1,'2022-08-29','22:19',150.00,140.00,10.00,NULL,NULL,NULL,NULL,NULL),(8,1,1,'2022-09-05','22:22',0.00,-51.00,0.00,NULL,-51,NULL,NULL,NULL),(9,1,1,'2022-09-05','22:37',30.00,23.00,7.00,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ventas_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_prod`
--

DROP TABLE IF EXISTS `ventas_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_prod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `venta_info_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` varchar(10) NOT NULL,
  `costo_total` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `venta__info_id` (`venta_info_id`),
  CONSTRAINT `ventas_prod_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `ventas_prod_ibfk_2` FOREIGN KEY (`venta_info_id`) REFERENCES `ventas_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_prod`
--

LOCK TABLES `ventas_prod` WRITE;
/*!40000 ALTER TABLE `ventas_prod` DISABLE KEYS */;
INSERT INTO `ventas_prod` VALUES (1,6,1,1,'37.00','37'),(2,1,2,2,'12.00','24'),(3,9,3,1,'15.00','15'),(4,11,4,3,'14.00','42'),(5,4,5,1,'35.00','35'),(6,1,5,1,'20.00','20'),(7,7,6,2,'23.00','46'),(8,1,7,7,'20.00','140'),(9,1000,8,1,'-51','-51'),(10,7,9,1,'23.00','23');
/*!40000 ALTER TABLE `ventas_prod` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 23:12:54
