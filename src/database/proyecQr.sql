/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - proyecto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `proyecto`;

/*Table structure for table `ambientes` */

DROP TABLE IF EXISTS `ambientes`;

CREATE TABLE `ambientes` (
  `id_amb` int(11) NOT NULL AUTO_INCREMENT,
  `nom_amb` varchar(100) DEFAULT NULL,
  `cen_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_amb`),
  KEY `Centro_FK` (`cen_fk`),
  CONSTRAINT `ambientes_ibfk_1` FOREIGN KEY (`cen_fk`) REFERENCES `centros` (`cen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambientes` */

insert  into `ambientes`(`id_amb`,`nom_amb`,`cen_fk`) values 
(1,'SISTEMAS',1),
(2,'ARTES GRAFICAS',1),
(3,'CONFECCIONES',1),
(4,'ADSO',1);

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_cate` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`id_cate`,`nom_cate`) values 
(1,'ELECTRONICOS'),
(2,'PAPELERIA'),
(3,'AUTOMOTRIZ');

/*Table structure for table `centros` */

DROP TABLE IF EXISTS `centros`;

CREATE TABLE `centros` (
  `cen_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_centro` varchar(100) DEFAULT NULL,
  `dir_centro` varchar(50) DEFAULT NULL,
  `tel_centro` char(15) DEFAULT NULL,
  `sub_dir_nom` char(30) DEFAULT NULL,
  `muni_id` char(20) DEFAULT NULL,
  PRIMARY KEY (`cen_id`),
  KEY `fk_muni123` (`muni_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `centros` */

insert  into `centros`(`cen_id`,`nom_centro`,`dir_centro`,`tel_centro`,`sub_dir_nom`,`muni_id`) values 
(1,'CIYA','CALLE 30 #6B','301239234','JUAN OLIVARES','1');

/*Table structure for table `departamento` */

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `id_depart` char(10) NOT NULL,
  `nom_depart` varchar(20) DEFAULT NULL,
  `pais_id_fk` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_depart`),
  KEY `paisfk` (`pais_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `departamento` */

/*Table structure for table `detalleinve` */

DROP TABLE IF EXISTS `detalleinve`;

CREATE TABLE `detalleinve` (
  `id_inv` int(10) DEFAULT NULL,
  `id_obj` int(11) DEFAULT NULL,
  KEY `idobje` (`id_inv`),
  CONSTRAINT `idinve2` FOREIGN KEY (`id_inv`) REFERENCES `inventario` (`id_inve`),
  CONSTRAINT `idobje` FOREIGN KEY (`id_inv`) REFERENCES `objetos` (`id_obj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleinve` */

/*Table structure for table `detalles` */

DROP TABLE IF EXISTS `detalles`;

CREATE TABLE `detalles` (
  `obj_id` int(11) NOT NULL,
  `atri_obj` text DEFAULT NULL,
  `val_ingre` bigint(20) NOT NULL,
  `est_obj` varchar(20) NOT NULL,
  `est_plac` varchar(40) DEFAULT NULL COMMENT 'estado placa',
  KEY `ObjetoID` (`obj_id`),
  CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`obj_id`) REFERENCES `objetos` (`id_obj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalles` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `id_inve` int(10) NOT NULL,
  `fech_inve` datetime DEFAULT NULL,
  `Obs_inve` varchar(50) DEFAULT NULL COMMENT 'Observaciones',
  `Est_inve` varchar(10) DEFAULT NULL COMMENT 'Activo/Dado de baja/En pausa',
  PRIMARY KEY (`id_inve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `inventario` */

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id_muni` char(10) NOT NULL,
  `nom_muni` varchar(20) DEFAULT NULL,
  `depart_id_fk` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_muni`),
  KEY `fkdepar` (`depart_id_fk`),
  CONSTRAINT `fkdepar` FOREIGN KEY (`depart_id_fk`) REFERENCES `departamento` (`id_depart`),
  CONSTRAINT `fkmuni123` FOREIGN KEY (`id_muni`) REFERENCES `centros` (`muni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `municipio` */

/*Table structure for table `objetos` */

DROP TABLE IF EXISTS `objetos`;

CREATE TABLE `objetos` (
  `id_obj` int(11) NOT NULL AUTO_INCREMENT,
  `id_cate` int(11) DEFAULT NULL,
  `ser_obj` varchar(30) NOT NULL COMMENT 'serial del objeto',
  `id_amb` int(11) DEFAULT NULL,
  `fech_adqui` datetime DEFAULT NULL,
  `est_obj` varchar(30) DEFAULT NULL,
  `obser_obj` varchar(30) DEFAULT NULL COMMENT 'Observaciones del objeto',
  `tip_obj` varchar(10) DEFAULT NULL,
  `marc_obj` varchar(15) DEFAULT NULL,
  `val_obj` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_obj`),
  KEY `TipoObjetoID` (`id_cate`),
  KEY `amb_id` (`id_amb`),
  CONSTRAINT `objetos_ibfk_4` FOREIGN KEY (`id_amb`) REFERENCES `ambientes` (`id_amb`),
  CONSTRAINT `objetos_ibfk_5` FOREIGN KEY (`id_cate`) REFERENCES `categoria` (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetos` */

insert  into `objetos`(`id_obj`,`id_cate`,`ser_obj`,`id_amb`,`fech_adqui`,`est_obj`,`obser_obj`,`tip_obj`,`marc_obj`,`val_obj`) values 
(1,1,'7778',2,'2024-05-20 00:00:00','EN USO','Camara canon 48px','Devolutivo','Canon',30000),
(56,1,'011',1,'2024-05-16 00:00:00','ACTIVO','Ninguna ','Nulo','Lenovo',1000000),
(57,3,'0111',2,'2024-05-07 07:22:38','ACTIVO','Telefono','Devolutivo','Xiaomi',100000);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `nom_Rol` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`id_Rol`,`nom_Rol`,`createdAt`,`updatedAt`) values 
(1,'ADMINISTRADOR',NULL,NULL),
(2,'FUNCIONARIO',NULL,NULL),
(3,'APRENDIZ',NULL,NULL);

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id_token` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `fec_caducidad` int(11) NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `tipo_token` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_token`),
  KEY `user_id_fk` (`user_id_fk`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `usuario` (`num_doc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `token` */

insert  into `token`(`id_token`,`token`,`fec_caducidad`,`user_id_fk`,`tipo_token`,`createdAt`,`updatedAt`) values 
(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTUzNTA4NTEsImV4cCI6MTcxNTQzNzI1MX0.pjYEDf5eNB7NB-LSoI4QhFGTl9XFUZIuCDBQC59g6nw',1715437251,123456,'1','2024-05-10 14:20:51','2024-05-10 14:20:51'),
(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtlaW5lckBnbWFpbC5jb20iLCJpYXQiOjE3MTUzNTA4OTMsImV4cCI6MTcxNTQzNzI5M30.cIPZzlkRP6fT2ktszvOldWpfrI5DygkhaRr1fbMtioE',1715437293,11111,'1','2024-05-10 14:21:33','2024-05-10 14:21:33'),
(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU2OTA4OTIsImV4cCI6MTcxNTc3NzI5Mn0.XYn9LNtG5Ns__as0F1_ITzD4ZQTueU3iEo2PcQ-bpUQ',1715777292,123456,'1','2024-05-14 12:48:12','2024-05-14 12:48:12'),
(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU2OTIwMzYsImV4cCI6MTcxNTc3ODQzNn0.pXHV7kdUPgiUiHXzSY3r3eQmlugIFg6lXAbWfdYSZ5c',1715778436,123456,'1','2024-05-14 13:07:16','2024-05-14 13:07:16'),
(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtlaW5lckBnbWFpbC5jb20iLCJpYXQiOjE3MTU2OTIwNzgsImV4cCI6MTcxNTc3ODQ3OH0.E6R6F4xhXPgZXLsFcO5iCqyJf1_5SQ1cCxNyO41fZ7g',1715778478,11111,'1','2024-05-14 13:07:58','2024-05-14 13:07:58'),
(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtlaW5lckBnbWFpbC5jb20iLCJpYXQiOjE3MTU2OTIwNzksImV4cCI6MTcxNTc3ODQ3OX0.uFfCKs-QxH1jM6_K4300swTeEiCvyfYcHmu0mrdypWs',1715778479,11111,'1','2024-05-14 13:07:59','2024-05-14 13:07:59'),
(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU2OTIxMjQsImV4cCI6MTcxNTc3ODUyNH0.Fjr3tWlIp2uc62nxzZJ6KQSwhKr8EQGjvgRxpOnpasI',1715778524,123456,'1','2024-05-14 13:08:44','2024-05-14 13:08:44'),
(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU2OTc5NTksImV4cCI6MTcxNTc4NDM1OX0.WLciRDK3X9KVtoQqMmKcI37H2MdmePvmnGUr3EaFNI4',1715784359,123456,'1','2024-05-14 14:45:59','2024-05-14 14:45:59'),
(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU3MDM0MDEsImV4cCI6MTcxNTc4OTgwMX0.Ba0IC8qGbXcgX8JaLuGjKYQgaf8imH6NtZj8dUvnrKw',1715789801,123456,'1','2024-05-14 16:16:41','2024-05-14 16:16:41'),
(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU3MDM0MTYsImV4cCI6MTcxNTc4OTgxNn0.uBj1H5fGpXxfAW2kvZP8owcpa4roNT-tSyd2LiLtXz0',1715789816,123456,'1','2024-05-14 16:16:56','2024-05-14 16:16:56'),
(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTU3MDM3OTksImV4cCI6MTcxNTc5MDE5OX0.Q4sIrU2-N6jZOy1gwdPK7azrzlDYtv5PTiz0bXE59VY',1715790199,123456,'1','2024-05-14 16:23:19','2024-05-14 16:23:19'),
(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtlaW5lckBnbWFpbC5jb20iLCJpYXQiOjE3MTU3MDQ1OTUsImV4cCI6MTcxNTc5MDk5NX0.BVTAG6pxR23hDDkJ0fPL_8KcIQzcn58ZZ_Uh0PH2c-A',1715790995,11111,'1','2024-05-14 16:36:35','2024-05-14 16:36:35'),
(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtlaW5lckBnbWFpbC5jb20iLCJpYXQiOjE3MTU3NzU0NzEsImV4cCI6MTcxNTg2MTg3MX0.RxDGgkSXHrlzdNSRFaG95TfwXS_ETtwLbOij58CcM9Q',1715861871,11111,'1','2024-05-15 12:17:51','2024-05-15 12:17:51'),
(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtlaW5lckBnbWFpbC5jb20iLCJpYXQiOjE3MTU3NzU0ODksImV4cCI6MTcxNTg2MTg4OX0.tHrioBCIMhW_euY1EIwVYGznxxKrKMqCSsgJ8d-6_hs',1715861889,11111,'1','2024-05-15 12:18:09','2024-05-15 12:18:09'),
(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MTc2NDUsImV4cCI6MTcxNjkwNDA0NX0.RdJVjfEpxgLGcHRUcUaiWax0sjITL2ezUpTct8qFnv8',1716904045,123456,'1','2024-05-27 13:47:25','2024-05-27 13:47:25'),
(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MTgyNDUsImV4cCI6MTcxNjkwNDY0NX0.xynEwof7d7syXX_yHbWAsiCCNbPxYBI8vgd3ejDzy0c',1716904645,123456,'1','2024-05-27 13:57:25','2024-05-27 13:57:25'),
(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MTg0NzUsImV4cCI6MTcxNjkwNDg3NX0.zGBqqjv_SRWkkdWu1nP0XUzXeAxkfLhUOIokWESme5I',1716904875,123456,'1','2024-05-27 14:01:15','2024-05-27 14:01:15'),
(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNlbmFAZ21haWwuY29tIiwiaWF0IjoxNzE2ODE5NDI2LCJleHAiOjE3MTY5MDU4MjZ9.3xPVDG-YBPopVp7X7TAgopro-cAj9oMLwxTr2vK8pyY',1716905826,1140893630,'1','2024-05-27 14:17:06','2024-05-27 14:17:06'),
(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MjAwOTEsImV4cCI6MTcxNjkwNjQ5MX0.pMSPRxqq2pRmcFIZcks3U4TdoXzyMDvQvg2uLHdA6sU',1716906491,123456,'1','2024-05-27 14:28:11','2024-05-27 14:28:11'),
(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MjUxMjEsImV4cCI6MTcxNjkxMTUyMX0.Jggv7QIzs-5MIoSagMiT7MMiimjFMtXNYLEMvNYo9As',1716911521,123456,'1','2024-05-27 15:52:02','2024-05-27 15:52:02'),
(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MjUxMjIsImV4cCI6MTcxNjkxMTUyMn0.uIuUTYNodKCPi5olt3Pyei1rcvI2Eq0c1E4QMFWyeNM',1716911522,123456,'1','2024-05-27 15:52:02','2024-05-27 15:52:02');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `num_doc` int(10) NOT NULL,
  `nom_fun` varchar(30) NOT NULL,
  `ape_fun` varchar(30) NOT NULL,
  `car_fun` varchar(20) NOT NULL COMMENT 'cargo del funcionario',
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'contraseña del funcionario',
  `tip_doc` varchar(4) DEFAULT NULL,
  `tel_fun` varchar(20) DEFAULT NULL,
  `id_rol_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_doc`),
  KEY `fkrol` (`id_rol_fk`),
  CONSTRAINT `fkrol` FOREIGN KEY (`id_rol_fk`) REFERENCES `roles` (`id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`num_doc`,`nom_fun`,`ape_fun`,`car_fun`,`email`,`password`,`tip_doc`,`tel_fun`,`id_rol_fk`) values 
(11111,'keiner','manuel','ADMINISTRADOR','keiner@gmail.com','$2b$05$QOUOSmAQ7VXnVgbzt4zuQOGkpUcp6rXmfgSK9Z5Vsb47svPIJ5T3i','cc ','123',2),
(123456,'Jairo','manuel','ADMINISTRADOR','andres@gmail.com','$2b$05$bgL.IVtOJGjOTvpMgoGa6O5ekpCiCzGz06YmohA0gyflEPqIzRBrq','cc ','123',1),
(444444,'JJ','alvarez','fdsflsd','santiago@gmail.com','$2b$05$C1UpyJwYBtMq.ue6Dk8b.uupabt9BGyILxDr..WbUiOdJYCDXIlbu','cc','33333',1),
(1140893630,'Alex ','Maestre','','Sena@gmail.com','$2b$05$q8nM2cKHIerHzJS5z9m6AO5Hilyv2gELbbqHBEFRfiz89MXpJ5jJ6','CC','Xxxxxxx',1);

/*Table structure for table `usuxinve` */

DROP TABLE IF EXISTS `usuxinve`;

CREATE TABLE `usuxinve` (
  `id_fun` int(10) DEFAULT NULL,
  `id_inve` int(10) DEFAULT NULL,
  KEY `idfun` (`id_fun`),
  KEY `idinve` (`id_inve`),
  CONSTRAINT `idfun` FOREIGN KEY (`id_fun`) REFERENCES `usuario` (`num_doc`),
  CONSTRAINT `idinve` FOREIGN KEY (`id_inve`) REFERENCES `inventario` (`id_inve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuxinve` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
