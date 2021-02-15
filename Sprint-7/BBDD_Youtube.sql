-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube
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
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canales` (
  `canal_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha-creacion` date NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`canal_id`),
  KEY `fk_canales_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_canales_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (1,'películas','de todas las épocas y géneros','2010-02-22',1),(2,'vídeos musicales','Rock','2016-03-23',2);
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `texto` varchar(1000) NOT NULL,
  `like` tinyint DEFAULT NULL,
  `dislike` tinyint DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`comentario_id`),
  KEY `fk_comentarios_videos1_idx` (`video_id`),
  KEY `fk_comentarios_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_comentarios_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentarios_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Que gran película, pero muy triste',1,NULL,'2020-03-22 09:54:21',1,1),(2,'Que triste, no me ha gustado. Con Chaplin me esperaba reir mucho',NULL,1,'2019-06-11 22:45:21',1,2),(3,'Que lenta la película, por favor. He visto westerns mucho mejores',NULL,1,'2021-02-14 11:30:02',3,3),(4,'Que pedazo de canción, y como engancha. Cada día la escucho',1,NULL,'2021-02-14 11:30:02',2,5);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `etiqueta_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`etiqueta_id`),
  KEY `fk_etiquetas_videos1_idx` (`video_id`),
  CONSTRAINT `fk_etiquetas_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (1,'cine clásico',1),(2,'Dancing in the dark',2),(3,'Born to run',2),(4,'Hungry Heart',2),(5,'John Ford\'s Classics',3);
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_dislikes`
--

DROP TABLE IF EXISTS `likes_dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_dislikes` (
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  `like` tinyint DEFAULT NULL,
  `dislike` tinyint DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`,`video_id`),
  KEY `fk_likes_dislikes_usuarios1_idx` (`usuario_id`),
  KEY `fk_likes_dislikes_videos1_idx` (`video_id`),
  CONSTRAINT `fk_likes_dislikes_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_dislikes_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_dislikes`
--

LOCK TABLES `likes_dislikes` WRITE;
/*!40000 ALTER TABLE `likes_dislikes` DISABLE KEYS */;
INSERT INTO `likes_dislikes` VALUES (1,1,1,NULL,'2018-03-02 08:30:00'),(2,1,NULL,1,'2016-11-22 10:37:22'),(3,3,NULL,1,'2019-12-12 16:22:56'),(4,4,1,NULL,'2020-10-31 23:09:34'),(5,2,1,NULL,'2021-02-02 18:01:43');
/*!40000 ALTER TABLE `likes_dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha-creacion` date DEFAULT NULL,
  `estado` enum('PU','PR') NOT NULL COMMENT '''PU'' = Pública\n''PR'' = Privada',
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlists_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_playlists_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Clásicos del cine','2019-09-12','PU',1),(2,'Westerns','2018-12-22','PU',1),(3,'Terror de los 70-80s','2019-01-31','PU',1),(4,'The Rolling Stones','2016-03-09','PR',2),(5,'Bruce Springsteen','2016-05-24','PR',2);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `suscripcion_id` int NOT NULL AUTO_INCREMENT,
  `canal_id` int NOT NULL,
  PRIMARY KEY (`suscripcion_id`),
  KEY `fk_suscripciones_canales1_idx` (`canal_id`),
  CONSTRAINT `fk_suscripciones_canales1` FOREIGN KEY (`canal_id`) REFERENCES `canales` (`canal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,1),(2,1),(3,1),(4,2);
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha-nac` date DEFAULT NULL,
  `sexo` enum('H','M') DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `codigo-postal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'a@a.com','ttgt','Pinu','2000-11-12','H','España','08005'),(2,'a@b.com','yhyt','Hanna','1997-03-23','M','Holanda','67543'),(3,'cvd@nb.com','hgjy','Isa','2003-04-21','M','España','28765'),(4,'bn@jh.com','jhuytre','Jan','1980-02-24','H','España','08001'),(5,'a@bnh.com','hgut','Nancy','1990-06-23','M','Perú','89765');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `tamaño` varchar(10) DEFAULT NULL,
  `nombre-archivo` varchar(100) NOT NULL,
  `duracion` varchar(10) DEFAULT NULL,
  `thumbnail` varchar(50) DEFAULT NULL,
  `num-reproducciones` int DEFAULT NULL,
  `estado` enum('PU','PR','OC') NOT NULL COMMENT '''PU'' = Público\n''PR'' = Privado\n''OC'' = Oculto',
  `fecha-publi` date DEFAULT NULL,
  `hora-publi` time DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `fk_videos_usuarios_idx` (`usuario_id`),
  CONSTRAINT `fk_videos_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'The Kid','película de Charles Chaplin','20MB','hgjhghjg','81','ghghg',190,'PU','2018-01-01','16:32:00',1),(2,'Greatest Hits Bruce Springsteen','De todos sus discos hasta Magic','5MB','hghjg','678','hggffd',56,'PR','2019-02-20','19:54:00',2),(3,'The Searchers','El mejor western de John Ford','34MB','hg','117','jurddsa',198765,'PU','2014-03-22','10:23:00',1),(4,'The Shining','Un Kubrick imprescindible y un terror inolvidable','39MB','astum','131','jhkjhkhj',1876543,'PU','2012-12-20','23:43:00',1);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-14 11:30:46
