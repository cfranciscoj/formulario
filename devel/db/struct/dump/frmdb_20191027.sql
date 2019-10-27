-- MySQL dump 10.17  Distrib 10.3.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: frmdb
-- ------------------------------------------------------
-- Server version	10.3.18-MariaDB-1:10.3.18+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `frmdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `frmdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `frmdb`;

--
-- Table structure for table `frm_plantilla_cab`
--

DROP TABLE IF EXISTS `frm_plantilla_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_plantilla_cab` (
  `id_pla_cab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripicion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned DEFAULT NULL,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_pla_cab`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_plantilla_cab`
--

LOCK TABLES `frm_plantilla_cab` WRITE;
/*!40000 ALTER TABLE `frm_plantilla_cab` DISABLE KEYS */;
INSERT INTO `frm_plantilla_cab` VALUES (8,'Formulario','Formulario de requerimiento de datos','2019-10-27 15:31:25',10,NULL,NULL);
/*!40000 ALTER TABLE `frm_plantilla_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frm_plantilla_det`
--

DROP TABLE IF EXISTS `frm_plantilla_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_plantilla_det` (
  `id_pla_det` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pla_cab` int(10) unsigned NOT NULL,
  `etiqueta` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_corto` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tpo_val` int(10) unsigned NOT NULL,
  `id_pla_det_pdr` int(10) unsigned NOT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned DEFAULT NULL,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_pla_det`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_plantilla_det`
--

LOCK TABLES `frm_plantilla_det` WRITE;
/*!40000 ALTER TABLE `frm_plantilla_det` DISABLE KEYS */;
INSERT INTO `frm_plantilla_det` VALUES (8,8,'Nombre','Nombre',1,0,'2019-10-27 15:41:40',10,NULL,NULL),(9,8,'Módulo','Módulo',1,0,'2019-10-27 15:42:04',10,NULL,NULL),(10,8,'Cargo','Cargo',1,0,'2019-10-27 15:42:08',10,NULL,NULL),(11,8,'Ejecutivo comercial','Ejecutivo',2,0,'2019-10-27 15:42:12',10,NULL,NULL),(12,8,'Asistente comercial','Asistente',2,0,'2019-10-27 15:42:17',10,NULL,NULL),(13,8,'Operaciones','Operaciones',2,0,'2019-10-27 15:42:21',10,NULL,NULL),(14,8,'SACS','SACS',2,0,'2019-10-27 15:42:25',10,NULL,NULL),(15,8,'UPR','UPR',2,0,'2019-10-27 15:42:29',10,NULL,NULL),(16,8,'Cumplimiento','Cumplimiento',2,0,'2019-10-27 15:42:33',10,NULL,NULL),(17,8,'Persona','Persona',2,11,'2019-10-27 15:46:07',10,NULL,NULL),(18,8,'Empresa','Empresa',2,11,'2019-10-27 15:46:10',10,NULL,NULL),(19,8,'Grupo','Grupo',2,11,'2019-10-27 15:46:14',10,NULL,NULL),(20,8,'Persona','Persona',2,12,'2019-10-27 15:46:57',10,NULL,NULL),(21,8,'Empresa','Empresa',2,12,'2019-10-27 15:47:02',10,NULL,NULL),(22,8,'Cuenta Corriente','CtaCte',2,13,'2019-10-27 15:52:27',10,NULL,NULL),(23,8,'Hipotecario','Hipotecario',2,13,'2019-10-27 15:52:30',10,NULL,NULL),(24,8,'Tarjeta','Tarjeta',2,13,'2019-10-27 15:52:33',10,NULL,NULL),(25,8,'Custodia','Custodia',2,13,'2019-10-27 15:52:38',10,NULL,NULL),(26,8,'Comentario','Comentario',4,0,'2019-10-27 15:54:37',10,NULL,NULL);
/*!40000 ALTER TABLE `frm_plantilla_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frm_resultado_det`
--

DROP TABLE IF EXISTS `frm_resultado_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_resultado_det` (
  `id_res_det` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pla_det` int(10) unsigned NOT NULL,
  `res_valor` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_nro_valor` int(10) unsigned DEFAULT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned DEFAULT NULL,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_res_det`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_resultado_det`
--

LOCK TABLES `frm_resultado_det` WRITE;
/*!40000 ALTER TABLE `frm_resultado_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `frm_resultado_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frm_tipo_valor`
--

DROP TABLE IF EXISTS `frm_tipo_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_tipo_valor` (
  `id_tpo_val` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_tpo_val` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_largo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_corto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned DEFAULT NULL,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_tpo_val`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_tipo_valor`
--

LOCK TABLES `frm_tipo_valor` WRITE;
/*!40000 ALTER TABLE `frm_tipo_valor` DISABLE KEYS */;
INSERT INTO `frm_tipo_valor` VALUES (1,'TXT','Respuesta de texto','texto','2019-10-27 15:26:29',10,NULL,NULL),(2,'CHK','Respuesta de CheckBox','check','2019-10-27 15:26:42',10,NULL,NULL),(3,'RAD','Respuesta de RadioButton','radio','2019-10-27 15:26:46',10,NULL,NULL),(4,'GLO','Respuesta de Glosa','glosa','2019-10-27 15:26:48',10,NULL,NULL);
/*!40000 ALTER TABLE `frm_tipo_valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (7,'admin','Administrador',NULL,NULL),(8,'user','Usuario',NULL,NULL),(9,'super','Supervisor',NULL,NULL),(10,'vacio','Rol por omision',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'usuario1@ejemplo.cl','$2y$10$M9yagwLod1NDgXtW1q59Tu2zJXP/sm8sGVpgIfxub5j1b2f5iDIw6','tZfd581OQMhGohVnCSWPSG3jMFkpATsTeUs3EY5awM6sS9SfpJmm8Q05C4De',NULL,NULL),(9,'usuario2@ejemplo.cl','$2y$10$bRpFQrgcg6D498a21x7w.utPEWPUFW8jDar6Ns4zOcfXHypW3x2aG','0VXfiVucA3b5kkMKeaM38wZCNQnIOvwbuCFMiEKhrYQGo3oyGrtpzUX1eS7c',NULL,NULL),(10,'admin@ejemplo.cl','$2y$10$18EoZb2I2/scIKwhsQA16eadsAHjv70iP9/JO9jzDhjVAbO.plTAC','Z6MSUCxKm4T5k3s6jnwzBU4sj8RYQrG36QJkuQCLqsBGDM9rn4DhZBBrbhlB',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-27 19:02:46
