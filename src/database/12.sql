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
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`amb_id`),
  KEY `Centro_FK` (`cen_fk`),
  CONSTRAINT `ambientes_ibfk_1` FOREIGN KEY (`cen_fk`) REFERENCES `centros` (`cen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambientes` */

insert  into `ambientes`(`amb_id`,`nom_amb`,`cen_fk`,`createdAt`,`updatedAt`) values 
(1,'ADSO',1,NULL,NULL);

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_cate` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cate` varchar(50) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`id_cate`,`nom_cate`,`createdAt`,`updatedAt`) values 
(1,'PRUEBA',NULL,NULL);

/*Table structure for table `centros` */

DROP TABLE IF EXISTS `centros`;

CREATE TABLE `centros` (
  `cen_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_centro` varchar(100) DEFAULT NULL,
  `dir_centro` varchar(50) DEFAULT NULL,
  `tel_centro` char(15) DEFAULT NULL,
  `sub_dir_nom` char(30) DEFAULT NULL,
  `muni_id` char(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`cen_id`),
  KEY `fk_muni123` (`muni_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `centros` */

insert  into `centros`(`cen_id`,`nom_centro`,`dir_centro`,`tel_centro`,`sub_dir_nom`,`muni_id`,`createdAt`,`updatedAt`) values 
(1,'SIYA','30303','123','JAIRO','123',NULL,NULL);

/*Table structure for table `detalles` */

DROP TABLE IF EXISTS `detalles`;

CREATE TABLE `detalles` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) NOT NULL,
  `id_inve` int(10) NOT NULL,
  `id_ambiente` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `ObjetoID` (`obj_id`),
  KEY `ambifk1` (`id_ambiente`),
  KEY `invefk1` (`id_inve`),
  CONSTRAINT `ambifk1` FOREIGN KEY (`id_ambiente`) REFERENCES `ambientes` (`amb_id`),
  CONSTRAINT `invefk1` FOREIGN KEY (`id_inve`) REFERENCES `inventario` (`id_inve`),
  CONSTRAINT `objefk1` FOREIGN KEY (`obj_id`) REFERENCES `objetos` (`id_obj`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalles` */

insert  into `detalles`(`id_detalle`,`obj_id`,`id_inve`,`id_ambiente`,`createdAt`,`updatedAt`) values 
(1,1,2,1,NULL,'2024-05-21 13:40:48'),
(2,1,2,1,NULL,'2024-05-21 13:40:48');

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `id_inve` int(10) NOT NULL,
  `fech_inve` datetime DEFAULT NULL,
  `Obs_inve` varchar(50) DEFAULT NULL COMMENT 'Observaciones',
  `Est_inve` varchar(10) DEFAULT NULL COMMENT 'Activo/Dado de baja/En pausa',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_inve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `inventario` */

insert  into `inventario`(`id_inve`,`fech_inve`,`Obs_inve`,`Est_inve`,`createdAt`,`updatedAt`) values 
(1,'2024-04-03 08:43:00','ninguna','activo',NULL,NULL),
(2,'2020-02-02 00:00:00','ninguna','yepes',NULL,NULL),
(4,'2020-02-02 00:00:00','observacion 4','listo',NULL,NULL);

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id_muni` char(10) NOT NULL,
  `nom_muni` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
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
  `fech_adqui` date DEFAULT NULL,
  `obser_obj` varchar(30) DEFAULT NULL COMMENT 'Observaciones del objeto',
  `tip_obj` varchar(10) DEFAULT NULL,
  `marc_obj` varchar(15) DEFAULT NULL,
  `val_obj` bigint(20) DEFAULT NULL,
  `estado_obj` int(1) DEFAULT NULL COMMENT 'Activo / Dado de baja / En transición',
  `placa` varchar(10) DEFAULT NULL,
  `url_img` varchar(200) DEFAULT NULL,
  `valor` tinyint(4) DEFAULT NULL,
  `caracteristicas` varchar(1000) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_obj`),
  KEY `TipoObjetoID` (`id_cate`),
  KEY `amb_id` (`id_amb`),
  CONSTRAINT `objetos_ibfk_5` FOREIGN KEY (`id_cate`) REFERENCES `categoria` (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetos` */

insert  into `objetos`(`id_obj`,`id_cate`,`ser_obj`,`id_amb`,`fech_adqui`,`obser_obj`,`tip_obj`,`marc_obj`,`val_obj`,`estado_obj`,`placa`,`url_img`,`valor`,`caracteristicas`,`createdAt`,`updatedAt`) values 
(1,1,'123',1223,'2024-05-21','123','prueba','prueba',123,0,'123',NULL,123,'prueba',NULL,NULL);

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
  `email` varchar(50) NOT NULL,
  `rol_fun` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'contraseña del funcionario',
  `tip_doc` varchar(4) DEFAULT NULL,
  `est_email_func` int(1) DEFAULT NULL,
  `tel_fun` varchar(20) DEFAULT NULL,
  `id_rol_fk` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`num_doc`),
  KEY `fkrol` (`id_rol_fk`),
  CONSTRAINT `fkrol` FOREIGN KEY (`id_rol_fk`) REFERENCES `roles` (`id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`num_doc`,`nom_fun`,`ape_fun`,`car_fun`,`email`,`rol_fun`,`password`,`tip_doc`,`est_email_func`,`tel_fun`,`id_rol_fk`,`createdAt`,`updatedAt`) values 
(123,'tati','manuel','aprendiz','jandy@gmail.com','admin','$2b$10$0XxSQV4ejmhuklRt2WZ.v.y','cc ',1,'123',9,NULL,NULL),
(321,'keine','manue','estudiante','keinemanue@gmail.maricon','normas','1234','ti',1,'23334',9,NULL,NULL),
(1231,'jairo','de avila ','admin','jairo@gmail.com','admin','1234','cc',0,'34234',9,NULL,NULL),
(123456,'tati','manuel','aprendiz','andres@gmail.com','admin','$2b$05$jnoUaF1n8dJ8FR1VcTSOieqM270GKz5Bc//UblyWknOjLbzE3bsJi','cc ',1,'123',9,NULL,NULL);

/*Table structure for table `usuxinve` */

DROP TABLE IF EXISTS `usuxinve`;

CREATE TABLE `usuxinve` (
  `id_fun` int(10) DEFAULT NULL,
  `id_inve` int(10) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  KEY `idfun` (`id_fun`),
  KEY `idinve` (`id_inve`),
  CONSTRAINT `idfun` FOREIGN KEY (`id_fun`) REFERENCES `usuario` (`num_doc`),
  CONSTRAINT `idinve` FOREIGN KEY (`id_inve`) REFERENCES `inventario` (`id_inve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuxinve` */

insert  into `usuxinve`(`id_fun`,`id_inve`,`createdAt`,`updatedAt`) values 
(1231,1,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
