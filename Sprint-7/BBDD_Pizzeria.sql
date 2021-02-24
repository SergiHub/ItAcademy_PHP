-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias-pizzas`
--

DROP TABLE IF EXISTS `categorias-pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias-pizzas` (
  `categoria-pizza_id` int NOT NULL AUTO_INCREMENT,
  `nombre-categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria-pizza_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias-pizzas`
--

LOCK TABLES `categorias-pizzas` WRITE;
/*!40000 ALTER TABLE `categorias-pizzas` DISABLE KEYS */;
INSERT INTO `categorias-pizzas` VALUES (1,'vegetales'),(2,'sin lactosa'),(3,'sin gluten'),(4,'normales');
/*!40000 ALTER TABLE `categorias-pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `localidad_id` int NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `fk_clientes_localidades_idx` (`localidad_id`),
  CONSTRAINT `fk_clientes_localidades` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`localidad_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Oscar','Romero Tes','C/A, 23','08001','932425676',1),(2,'María','Casa Nuñez','C/B, 23','08023','934556767',1),(3,'Teresa','Gaspar Baltasar','C/C, 45','28675','915676543',4),(4,'Gemma','Puig Gisbert','C/D, 33','08021','665789876',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandas`
--

DROP TABLE IF EXISTS `comandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandas` (
  `comanda_id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo` enum('RD','RT') NOT NULL,
  `tienda_id` int NOT NULL,
  `empleado_id` int DEFAULT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`comanda_id`),
  KEY `fk_comandas_tiendas1_idx` (`tienda_id`),
  KEY `fk_comandas_empleados1_idx` (`empleado_id`),
  KEY `fk_comandas_clientes1_idx` (`cliente_id`),
  CONSTRAINT `fk_comandas_clientes1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comandas_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comandas_tiendas1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`tienda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandas`
--

LOCK TABLES `comandas` WRITE;
/*!40000 ALTER TABLE `comandas` DISABLE KEYS */;
INSERT INTO `comandas` VALUES (2,'2020-12-22','21:35:00','RD',2,2,2),(3,'2020-12-22','21:35:00','RD',2,2,2),(4,'2020-12-22','21:35:00','RD',2,2,2),(5,'2020-11-13','20:55:00','RT',1,NULL,1);
/*!40000 ALTER TABLE `comandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandas_has_productos`
--

DROP TABLE IF EXISTS `comandas_has_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandas_has_productos` (
  `comanda_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`comanda_id`,`producto_id`),
  KEY `fk_comandas_has_productos_productos1_idx` (`producto_id`),
  KEY `fk_comandas_has_productos_comandas1_idx` (`comanda_id`),
  CONSTRAINT `fk_comandas_has_productos_comandas1` FOREIGN KEY (`comanda_id`) REFERENCES `comandas` (`comanda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comandas_has_productos_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandas_has_productos`
--

LOCK TABLES `comandas_has_productos` WRITE;
/*!40000 ALTER TABLE `comandas_has_productos` DISABLE KEYS */;
INSERT INTO `comandas_has_productos` VALUES (5,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `comandas_has_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `tipo-empleado` varchar(1) DEFAULT NULL COMMENT 'R: Repartidor\nC: Cocinero',
  `tienda_id` int NOT NULL,
  PRIMARY KEY (`empleado_id`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  KEY `fk_empleados_tiendas1_idx` (`tienda_id`),
  CONSTRAINT `fk_empleados_tiendas1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`tienda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Sergi','Ortiz Termes','45678676H','665777888','C',1),(2,'Silvia','Gil Ledesma','38999666G','656000111','R',2),(3,'Jordi','Salvat Papaseit','38222444R','655444111','R',3),(4,'Anna','Garcia Bardí','44555777Y','656098765','C',3);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `localidad_id` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(45) NOT NULL,
  `provincia_id` int NOT NULL,
  PRIMARY KEY (`localidad_id`),
  KEY `idx_localidad` (`localidad`),
  KEY `fk_localidades_provincias1_idx` (`provincia_id`),
  CONSTRAINT `fk_localidades_provincias1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`provincia_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Barcelona',1),(2,'Badalona',1),(3,'Figueres',2),(4,'Alcorcón',3);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre-producto` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `precio` varchar(45) NOT NULL,
  `tipo_producto_id` int NOT NULL,
  `categoria-pizza_id` int DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  UNIQUE KEY `nombre-producto_UNIQUE` (`nombre-producto`),
  KEY `fk_productos_tipos_productos1_idx` (`tipo_producto_id`),
  KEY `fk_productos_categorias-pizzas1_idx` (`categoria-pizza_id`),
  CONSTRAINT `fk_productos_categorias-pizzas1` FOREIGN KEY (`categoria-pizza_id`) REFERENCES `categorias-pizzas` (`categoria-pizza_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_tipos_productos1` FOREIGN KEY (`tipo_producto_id`) REFERENCES `tipos_productos` (`tipo_producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Pizza king-vegetal','Pizza 100% vegetal','imagen-1','12€',1,1),(2,'Hamburguesa americana','Hamburguesa con queso, bacon y 200gr de carne','imagen-2','15€',2,NULL),(3,'Leffe','Cerveza belga nº1','imagen-3','3,5€',3,NULL),(4,'Pizza Barbacoa','100% carne de vacuno y queso suizo','imagen-4','13,5€',1,4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `provincia_id` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`provincia_id`),
  KEY `iddx_provincia` (`provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Barcelona'),(2,'Girona'),(3,'Madrid');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `tienda_id` int NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `codigo-postal` varchar(5) NOT NULL,
  `localidad_id` int NOT NULL,
  PRIMARY KEY (`tienda_id`),
  KEY `fk_tiendas_localidades1_idx` (`localidad_id`),
  CONSTRAINT `fk_tiendas_localidades1` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`localidad_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'C/Cartagena, 27. Bajos','08021',1),(2,'Plaça Major, s/n','12345',1),(3,'Av.De la comida, 1','28673',4);
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_productos`
--

DROP TABLE IF EXISTS `tipos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_productos` (
  `tipo_producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_productos`
--

LOCK TABLES `tipos_productos` WRITE;
/*!40000 ALTER TABLE `tipos_productos` DISABLE KEYS */;
INSERT INTO `tipos_productos` VALUES (1,'pizzas'),(2,'hamburguesas'),(3,'bebidas');
/*!40000 ALTER TABLE `tipos_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24 15:55:47
