/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - proyecto
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

/*Table structure for table `funxinve` */

DROP TABLE IF EXISTS `funxinve`;

CREATE TABLE `funxinve` (
  `id_fun` int(10) DEFAULT NULL,
  `id_inve` int(10) DEFAULT NULL,
  KEY `idfun` (`id_fun`),
  KEY `idinve` (`id_inve`),
  CONSTRAINT `idfun` FOREIGN KEY (`id_fun`) REFERENCES `funcionario` (`num_doc`),
  CONSTRAINT `idinve` FOREIGN KEY (`id_inve`) REFERENCES `inventario` (`id_inve`)
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

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id_muni` char(10) NOT NULL,
  `nom_muni` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_muni`),
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

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`apellido`,`telefono`) values 
(2,'jainer','123','yepes','123456789'),
(3,'keiner','123','yepes','123456789'),
(4,'jainer','123','yepes','123456789');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
