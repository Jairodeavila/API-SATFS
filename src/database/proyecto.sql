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
  `amb_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_amb` varchar(100) DEFAULT NULL,
  `cen_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`amb_id`),
  KEY `Centro_FK` (`cen_fk`),
  CONSTRAINT `ambientes_ibfk_1` FOREIGN KEY (`cen_fk`) REFERENCES `centros` (`cen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambientes` */

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_cate` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categoria` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `centros` */

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

insert  into `inventario`(`id_inve`,`fech_inve`,`Obs_inve`,`Est_inve`) values 
(1,'2024-04-03 08:43:00','ninguna','activo'),
(2,'2020-02-02 00:00:00','ninguna','yepes'),
(4,'2020-02-02 00:00:00','observacion 4','listo');

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
  CONSTRAINT `objetos_ibfk_4` FOREIGN KEY (`id_amb`) REFERENCES `ambientes` (`amb_id`),
  CONSTRAINT `objetos_ibfk_5` FOREIGN KEY (`id_cate`) REFERENCES `categoria` (`id_cate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetos` */

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
(9,'admin','2024-04-03 08:38:56','2024-04-03 08:38:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `token` */

insert  into `token`(`id_token`,`token`,`fec_caducidad`,`user_id_fk`,`tipo_token`,`createdAt`,`updatedAt`) values 
(1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb3JyZW9fZnVuIjoiYW5kcmVzQGdtYWlsLmNvbSIsImlhdCI6MTcxMzM2NTIyNywiZXhwIjoxNzEzNDUxNjI3fQ.GeUgJzQGUXckfAc7Gijehor5zzZ5EfRoyITInjTIrmc',1713451627,123456,'1','2024-04-17 14:47:07','2024-04-17 14:47:07'),
(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb3JyZW9fZnVuIjoiYW5kcmVzQGdtYWlsLmNvbSIsImlhdCI6MTcxMzM2NjE1NCwiZXhwIjoxNzEzNDUyNTU0fQ.fow0vZsl4da-SChIWNX8EJejzPk-GqySiubIl9XWlw8',1713452554,123456,'1','2024-04-17 15:02:34','2024-04-17 15:02:34'),
(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb3JyZW9fZnVuIjoiYW5kcmVzQGdtYWlsLmNvbSIsImlhdCI6MTcxMzQ0NTkwNCwiZXhwIjoxNzEzNTMyMzA0fQ.WvMhWBfmItAgNXScQckMbeUYJe5mXoS43lfUHoIdFTM',1713532304,123456,'1','2024-04-18 13:11:44','2024-04-18 13:11:44'),
(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb3JyZW9fZnVuIjoiYW5kcmVzQGdtYWlsLmNvbSIsImlhdCI6MTcxMzQ0NjI4MCwiZXhwIjoxNzEzNTMyNjgwfQ.X7mtZYUOubgkOqPMDaWedd3EKaQgf44vloasz_TpUUo',1713532680,123456,'1','2024-04-18 13:18:00','2024-04-18 13:18:00');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `num_doc` int(10) NOT NULL,
  `nom_fun` varchar(30) NOT NULL,
  `ape_fun` varchar(30) NOT NULL,
  `car_fun` varchar(20) NOT NULL COMMENT 'cargo del funcionario',
  `correo_fun` varchar(50) NOT NULL,
  `rol_fun` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'contraseña del funcionario',
  `tip_doc` varchar(4) DEFAULT NULL,
  `fot_use` varchar(255) DEFAULT NULL,
  `est_email_func` int(1) DEFAULT NULL,
  `tel_fun` varchar(20) DEFAULT NULL,
  `id_rol_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_doc`),
  KEY `fkrol` (`id_rol_fk`),
  CONSTRAINT `fkrol` FOREIGN KEY (`id_rol_fk`) REFERENCES `roles` (`id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`num_doc`,`nom_fun`,`ape_fun`,`car_fun`,`correo_fun`,`rol_fun`,`password`,`tip_doc`,`fot_use`,`est_email_func`,`tel_fun`,`id_rol_fk`) values 
(123,'tati','manuel','aprendiz','jandy@gmail.com','admin','$2b$10$0XxSQV4ejmhuklRt2WZ.v.y','cc ','prueba',1,'123',9),
(321,'keine','manue','estudiante','keinemanue@gmail.maricon','normas','1234','ti','fmdksfs',1,'23334',9),
(1231,'jairo','de avila ','admin','jairo@gmail.com','admin','1234','cc','fdgfs',0,'34234',9),
(123456,'tati','manuel','aprendiz','andres@gmail.com','admin','$2b$05$jnoUaF1n8dJ8FR1VcTSOieqM270GKz5Bc//UblyWknOjLbzE3bsJi','cc ','prueba',1,'123',9);

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

insert  into `usuxinve`(`id_fun`,`id_inve`) values 
(1231,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
