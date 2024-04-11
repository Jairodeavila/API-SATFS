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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambientes` */

insert  into `ambientes`(`amb_id`,`nom_amb`,`cen_fk`) values 
(1,'adsp',1);

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_cate` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`id_cate`,`nom_cate`) values 
(1,'prueba'),
(2,'prueba2');

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
(1,'prueba ','123','123','123','1');

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

insert  into `departamento`(`id_depart`,`nom_depart`,`pais_id_fk`) values 
('123','123','123');

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

/*Table structure for table `funcionario` */

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `num_doc` int(10) NOT NULL,
  `nom_fun` varchar(30) NOT NULL,
  `ape_fun` varchar(30) NOT NULL,
  `car_fun` varchar(20) NOT NULL COMMENT 'cargo del funcionario',
  `correo_fun` varchar(50) NOT NULL,
  `rol_fun` varchar(20) NOT NULL,
  `contra` varchar(30) NOT NULL COMMENT 'contraseña del funcionario',
  `tip_doc` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`num_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `funcionario` */

insert  into `funcionario`(`num_doc`,`nom_fun`,`ape_fun`,`car_fun`,`correo_fun`,`rol_fun`,`contra`,`tip_doc`) values 
(102932323,'JUAN','OLIVARES','INSTRUCTOR','JUANOLIVARE@GMAIL','ADMINISTRADOR','123','CC');

/*Table structure for table `funxinve` */

DROP TABLE IF EXISTS `funxinve`;

CREATE TABLE `funxinve` (
  `id_fun` int(11) NOT NULL,
  `id_inve` int(11) NOT NULL,
  PRIMARY KEY (`id_fun`,`id_inve`),
  UNIQUE KEY `funxinve_id_inve_id_fun_unique` (`id_fun`,`id_inve`),
  KEY `id_inve` (`id_inve`),
  CONSTRAINT `funxinve_ibfk_1` FOREIGN KEY (`id_fun`) REFERENCES `funcionario` (`num_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funxinve_ibfk_2` FOREIGN KEY (`id_inve`) REFERENCES `inventario` (`id_inve`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `funxinve` */

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
(2,'2020-02-02 00:00:00','ninguna','yepes');

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

insert  into `municipio`(`id_muni`,`nom_muni`,`depart_id_fk`) values 
('1','prueba',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetos` */

insert  into `objetos`(`id_obj`,`id_cate`,`ser_obj`,`id_amb`,`fech_adqui`,`est_obj`,`obser_obj`,`tip_obj`,`marc_obj`,`val_obj`) values 
(1,1,'123',1,'2024-04-11 10:03:23','prueba','prueba','prueba','prueba',123),
(2,2,'prueba',1,'2024-04-12 10:03:23','est_obj','prueba','prueba','prueba',123);

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
(1,'admin','2024-04-07 10:05:51','2024-04-16 10:05:53'),
(2,'admin','2024-04-07 15:05:51','2024-04-16 15:05:53'),
(9,'admin','2024-04-03 08:38:56','2024-04-03 08:38:59');

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id_token` int(255) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `fec_caducidad` varchar(100) DEFAULT NULL,
  `user_id_fk` int(10) DEFAULT NULL,
  `tipo_token` char(1) DEFAULT NULL COMMENT '1: inicio Sesion, 2: verificacion Email, 3: recuperacion de contraseña, 4: Verificar IP',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_token`),
  KEY `num_doc` (`user_id_fk`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `usuario` (`num_doc`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tokens` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `num_doc` int(10) NOT NULL,
  `nom_fun` varchar(30) NOT NULL,
  `ape_fun` varchar(30) NOT NULL,
  `car_fun` varchar(20) NOT NULL COMMENT 'cargo del funcionario',
  `correo_fun` varchar(50) NOT NULL,
  `rol_fun` varchar(20) NOT NULL,
  `contra` varchar(30) NOT NULL COMMENT 'contraseña del funcionario',
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

insert  into `usuario`(`num_doc`,`nom_fun`,`ape_fun`,`car_fun`,`correo_fun`,`rol_fun`,`contra`,`tip_doc`,`fot_use`,`est_email_func`,`tel_fun`,`id_rol_fk`) values 
(1,'jainer','manuel','aprendiz','jainer@gmail.com','admin','123','Conn','prueba',1,'123',9),
(2,'jandy','manuel','aprendiz','jandy@gmail.com','admin','123','cc: ','prueba',1,'123',9),
(321,'keine','manue','estudiante','keinemanue@gmail.maricon','normas','1234','ti','fmdksfs',1,'23334',9),
(1231,'jairo','de avila ','admin','jairo@gmail.com','admin','1234','cc','fdgfs',0,'34234',9);

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

/*Table structure for table `usuxinven` */

DROP TABLE IF EXISTS `usuxinven`;

CREATE TABLE `usuxinven` (
  `id_fun` int(11) NOT NULL,
  `id_inve` int(11) NOT NULL,
  PRIMARY KEY (`id_fun`,`id_inve`),
  UNIQUE KEY `usuxinven_id_inve_id_fun_unique` (`id_fun`,`id_inve`),
  KEY `id_inve` (`id_inve`),
  CONSTRAINT `usuxinven_ibfk_1` FOREIGN KEY (`id_fun`) REFERENCES `funcionario` (`num_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuxinven_ibfk_2` FOREIGN KEY (`id_inve`) REFERENCES `inventario` (`id_inve`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuxinven` */

insert  into `usuxinven`(`id_fun`,`id_inve`) values 
(102932323,1),
(102932323,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
