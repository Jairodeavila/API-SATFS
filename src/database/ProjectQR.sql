/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - proyecto
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
  `qrimagen` blob DEFAULT NULL,
  PRIMARY KEY (`id_obj`),
  KEY `TipoObjetoID` (`id_cate`),
  KEY `amb_id` (`id_amb`),
  CONSTRAINT `objetos_ibfk_4` FOREIGN KEY (`id_amb`) REFERENCES `ambientes` (`id_amb`),
  CONSTRAINT `objetos_ibfk_5` FOREIGN KEY (`id_cate`) REFERENCES `categoria` (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetos` */

insert  into `objetos`(`id_obj`,`id_cate`,`ser_obj`,`id_amb`,`fech_adqui`,`est_obj`,`obser_obj`,`tip_obj`,`marc_obj`,`val_obj`,`qrimagen`) values 
(58,1,'12019282',1,'2024-06-14 00:00:00','ACTIVO','En bueno estado ','Portatil','Acer',100000,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\04\0\04\0\0\0��ϟ\0\0\0IDATx�\Z~�\0\05IDAT��An�֒�@R����ɲW$;������Zp��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Zq��Z��C*�bR�*NT����bRy�bRy���;*�P��bR9��TN*NTN*&�;*~����_�x�b��>�b��>�b��>⇗U�I��7UL*S�*wT����L\'\'*wTL*SŤrR1�<�rRqGśT�����T�&�7]���G\\���G\\���G���T�x��D����D�bR�Ce��TNT��Ie�8��T&��bR9���bR�T��IeR�7UܡrR�&�;*~��Zk}��Zk}��Zk}���*&���De��*&���IeR9��T��I�	��\'*&���M*SŤ2��Tܡ2UܡrRqGŉ�T��b��>�b��>�b��>⇏�8�x�bR�T�RŤrR1�L�ʉʉʉ�oR��bR��bR�*N*&�\'T��/�Xk���Xk���Xk����U�&��bR�*&���De�8Q�*&�I�De�8��TTN*�P�*&��bRy�ʛ*NT���T�D���Zk}��Zk}��Zk}�/S���bR�*���T��Ie��T��I�De��TNT���T1�L��T1�L�ʉ�T�&��bR9Q�*NT��.�Z�#.�Z�#.�Z�#��S�*NTN*�P�M�e*S�*\'��IŤ�*�P�*�P9����b��>�b��>�b��>���/R��bR�*&���\'TN*&���	���I削Ie��T�MoR�*�P�*NT���T���\'*NT�x�b��>�b��>�b��>���*wT�I削��bRy��De��TN*NT�8Q�*NTN*&���	�7UL*Sŉ�Tq����I���Zk}��Zk}��Zk}�UL*SŤ�D�T1�L�ʤ�Dŉʉ�T�DŤ2U�TL*\'*SŤrR1�L*S�*\'\'*\'����TqGŉ�Iŉ���T���Zk}��Zk}��Zk}���TN*NT��\'T����bR�*&�;*&���De��T�����;T�K*NT�T1��TL*wTL*OTL*\'w�Lo�Xk���Xk���Xk���ᡊ\'*&���\'T�P�*NTN*&�;T��I厊\'*NTN*&��bR�*&��⎊I�De��TޤrRq�2�L�ʤ2U��.�Z�#.�Z�#.�Z�#��H厊Ie�x����IŤrGŤ�Dŉ�T1��TL*\'\'*\'��T1��TL*OTL*wTܡ2UL*\'��\'*wT<q��Zq��Zq��Za��E*SŤ򦊿�2Uܡ2UL*Sŉ�Tq�rGŉ�IŤrR1��T<�rR1��TL*SŤrR1�L��IŤrR1��TL*SŤ2U<q��Zq��Zq��Z��C*wTL*Sŉʤ2U�Ie��T�P�M*\'w���bR�*&�;T����I��bR�*NT��\'T��;*&�;T��7]���G\\���G\\���G��I�bR�M*\'\'*SŤ�DŤ2UL��IŤ2UL*wT�Ie�����bR�T��\'TNTN*�P9��T���T��\'.�Z�#.�Z�#.�Z�#~x�bR�Ce��C�D�Y�\'*OT��L\'*\'��T1����L\'w�L*wTL*��I�o�Xk���Xk���Xk������Ie�8Q9�8Q9��T��������I�bRy�bR9�xBe��T��;T��I厊Ie�xB����≋��������������RyS�T1�L��TqR1��Qq�rRq��*O�LOTL*\'*Sŉ�TqG�*\'��Tq��*\'O�LSś.�Z�#.�Z�#.�Z�#~�c\'*\'�bRy��De��T��IeR�*&���I�De��*N*�P�Ce��T��\'*NTNT��;*���Tq�2U<q��Zq��Zq��Z��C�ʉ�TqR1����;TN*&���7UL*SŤ2��Q1��TL*\'\'�ʉ�oR����������DeR�Kk��k��k��?<���T1�<�rRq�rRq�2U�Ie��Ce��T�Py��D�D�bR�M\'*��T1��QqGŉ�IŤ2UL*o�Xk���Xk���Xk����U��L��IŤ2U�Q1���L\'*SŤ2Uܡ�D��ʤrGŉ�_��T��Ie��T&�;*�P�*N*&�;*�t��Zq��Zq��Z���*NT�P�*T��;*~��Tq�2U<��DŤrR1�����T���T���Ce��T���T���Zk}��Zk}��Zk}�����Q��I�*OTܡrGŤ2UL*SŤ�DŤrGŉ�T1��TܡrRq��\'*Sŉ�o�8Q��≋��������������R���D�b�xSŉ�*SŉʤrGŤ2UL*\'wTܡ2UL*�bR�*&���T�&�;*NT�t��Zq��Zq��Z���*�P�*NTT��I��7�L��*SŤ2UL*��*Sŉ�IŤ�&����De��T�������bR�C厊7]���G\\���G\\���G�?�E*S�*\'O�L\'*Sŉ���T1��Q��Tq��IŤ2UL*SŤ2U<�2U�I削;T���7U��b��>�b��>�b��>���*S�oR9��T��x��Tq�2U���Q�TN*~��IŤ2U�����M*\'��I���Zk}��Zk}��Zk}��Le��T~S�*\'*wTL��IſIe��TC�bR9�xS�*w�L\'*Sŉ�T1�L*S�*S�k��k��k��?�L�De��Ce��T�x�≊�;*&��;T��\'T�xB�bR9��T�TqGŤ2ULoR�*&���Mk��k��k���^�2UL*�bR��bR���M*wTL*\'\'*�bR���De�8Qy��D�bR�*�P�/�x�b��>�b��>�b��>⇇T�Tq��T�DŤ2Uܡ2U���/��C厊I���bR9��TN*NTN*N*NT����;TN*&��t��Zq��Zq��Z���*&��bR9Q�*~��T1��Q1��Q1�ܡrR1��Ie�8����D�D�bR9��T��;T��;*�P�*�P�*~��Zk}��Zk}��Zk}���≊;T����;*&�;*�Tq�2U���;TN*&��b��T�����;T���I�bRy�≊Ie�x��Zk}��Zk}��Zk}�UL*O�<Q1�Lw��TL*\'*Sŉ�*\'*S�IŤr��*&������Ie��*NT����I��DeRy�bR�*&��≋��������������R�*�P�*NTT��;*��x��Tq�2�L��T1�L\'*\'w�L\'��T1��Ie��T��Ie��KwTL*��b��>�b��>�b��>⇇*&��bR�*NT�T1�LoRy�bR9Q�*�����Ie��T��I�b��T���T1���L��\'*\'��T1���b��>�b��>�b��>⇇TNT��I����bR�*&��bR�7UܡrG�T1�LwTL*S�IŤ2UL*\'*\'*S�T1�Lo�8Q9��TNTN*&��bR�*�t��Zq��Zq��Za������;*�P�*NTT��I�/UL*SŤ�D�*\'��IŤ2UL*wT���TܡrR1�Lw�L��O\\���G\\���G\\���G�?�E*SŤ2U���TL*SŤ2UL*Sŉ�Iŉ�T1��Q�&��bR���	��bR���	����;*&���Ie��T�����/]���G\\���G\\���G���TqGŉ�T1��T�&���I�bR�*�Py�b�8�8Q9Q�*&���bR9Q�*NT���\'*N*&�Ie�8��T�����7]���G\\���G\\���G�?�C*wTL*\'��Tq�2U���T<�rR1�L��o��T��;T��ߤrG�*wTL*\'\'*wTL*\'�����������������~��T1�L����T1U<Q1�<Q��T1�L��T1��T���TL*Sŉ�TqR1�<�rGŤrR1�L\'��\'*S�o�Xk���Xk���Xk������Tq�rGŤ�*&��bR�*&�;*NT~SŤrRq�rR1��TL*Sŉ�Tq��D�*\'\'*SŤ2U<�2U�����������������~��Tq��Tq�rR1���L��TqGŤr�rR1�Lw�L\'*wTL*Sŉʉ�T1U��L��Tq�rRqRq�2UL*\'*wTL��Iś.�Z�#.�Z�#.�Z�#~x��T�DŤ2UL�ʤ2U�����bR�*�P9��C��De��T����D�M*SŤ2UL��*S�o��T&��b�8Q�*��Xk���Xk���Xk����e��IŤrRqGŤ2��TL*\'*\'O��T�Q1�L��*OT��LSŤ2U<�r���ʤ2UL*\'�ʛT���t��Zq��Zq��Z��C��TqG�*\'\'OTL*SŤ2U�TL*OTL*\'*S�*\'*S�*S�*SŤr��Tq�2U�T�T��LwT�T������������������L��T1�L�ʛ*&�������;*&��bR�*�P�*NT��8Q�*&���7�L��Tq��*NT�MO\\���G\\���G\\���G��PŤ2Uܡ2U��L\'*O��T�Q1�LIe�8Q����;*&���I�b�8��T���bR9��T�P�*NTN*�Py��Zk}��Zk}��Zk}�L����De��C厊Ie��T��;T�����\'*&���bR�Ce��*ޤ2U����L\'wTL*SŤ2UL��o�Xk���Xk���Xk����\"�����bR�*ޤrR1�L����\'*\'��I�*SŤrR1�L\'*SŤ2UL*SŤ2U<�2UL*Sŉ�T�T��\'.�Z�#.�Z�#.�Z�#~�e*S�IŤr��T1�LSŤ2�LoR9��TNTN*�xB削I削\'*�P9��*&���	��bR�*&�;*�t��Zq��Zq��Z��S�*N*NT�P9��TNT�8Qy�bR9Q�*NTN*��IeR�*&�7�<��Dŉ�T1UL*wTL*��T1�L�����������������^Vq�r��I���I�Iŉʤ2U��ܡ2UܡrGŉ�*SŤ2UL*Sś*&��bR9��C�bR�T�P�*&��bR�*�t��Zq��Zq��Za��������ߤ2UL*SśT�T1��TL*SŤ�D�*wT���T���Qq��IŤrR1��TL*\'��T�.�Z�#.�Z�#.�Z�#~xYŤ2Uܡ2U���TL\'oR���D��De��T��I�bR�*&��⎊I��T�DŤ2�L�ʤrRqG�*Sś.�Z�#.�Z�#.�Z�#~�e\'o��T�P�*&���bR9Q�*�P�*&����	�\'*&�;*&�Ie�8�8Q�*NT�����IeR�*NT����De�x�b��>�b��>�b��>�?�rR1��I�	������7�ܡ�*&��bR�*NT�8��T������;T�PyB��Mk��k��k������L��IŤ2UL*Sŉ�IŤrRq�2U�&�������7UL*SŤ2U��L��T��T1�Lw�Lw�LO\\���G\\���G\\���G���_��*&��bRy�bR�*N*�P�Ce��TCe�8Q�*&���7U�T������L��I�*Sŉ�I�T񦋵�������������^V�&�7UL*��⎊7��TܡrGſIe�8Q9��T����\'TN*�T�T��\'.�Z�#.�Z�#.�Z�#~�e*wTܡr��*Sŉ�\'*\'SŤ2UL*S�*OT�TL*��T1�LOTL*SŤ�DŤ2�Lw�<Q1������������������>�bR9�xS�_��T����⎊���MO�L�ʉ�o�xS�*wT��b��>�b��>�b��>⇏Q�*NT���TN*&���bR9Q�*NT���bR�Ce��T��Ie�8Q9��TNT��IeR�*&�;*&�����Ie��T��.�Z�#.�Z�#.�Z�#~�e���7U�%����bR�*&�\'T�8Q�*&�7U�TL*\'*SŤ2�L��O�L��T�_v��Zq��Zq��Z���T��UL*wT��L�Ie�8Q9��TNT�Tq�2UL*\'wTL*SŤ�&��⎊I���bR9�x��Zk}��Zk}��Zk}�����������������������������������������������������������������������������������y���J��>\0\0\0\0IEND�B`�'),
(60,2,'Bbnn',2,'2024-06-16 00:00:00','EN USO','Bbn','Bbnnnnn','Bbnnnn',9646464,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\04\0\04\0\0\0��ϟ\0\0\0IDATx�\Z~�\0\0IDAT��A�˒�@2���2GK_�j=�7�?Xk�xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk��xXk����C*Sŉ�7U�P�Q1��T��L\'*SŤrR1��T���TL*SŤrRqC��D�FŤrR1�ܨ�T���O<���K<���K<���K��eߤ�*>�2U�P�*>Qq�򉊓�����T1�L�ʤrRqRq�rR1�ܨ�T��o��&�ozXk��xXk��xXk���ᗩܨ��rRq�rR�M*S�\r�OTL*\'��\'*nTL*��T1�L��T�	�*S�7�Lߤr��7=���K<���K<���K��r*\'7T�����De��TNT>QqCe��TN*n�L7*N*&�o��T��*S������z����z����z���U|��T1U��L7TN*>Q1�ܨ�T&�O����Ie��T>Q1���L7TN*��a��^�a��^�a��^�_V�7�L��I�7�L7*&�O�ܨ�TN*n�L��T1�LS�\r���bR�Qq�rR���Zk���Zk���Zk��_��7�L��T1���L��T1���L��T1�L��T1�L��T1���L��TqR1�L��T1�L��T1�L��TqCe�8Q��=���K<���K<���K���RŤr�bR9Q���T�_��TNTnT�/Q9Q�*>Q1�L\'7T�����%k��k��k�����IŤrR1�ܨ�TN*&���*\'��I�7����I����T�M*SŤ2U��L�P9��Mk��k��k��?|He�8��TN*NT�����IeR9���2UL*\'�Ie��&�OT��L\'*Sŉ�7�L��bR�*NTN*�����z����z����z	���He�8Q�*NT���Ie�8Q9�8Q�Q1��T���M\'*SŤrRqC�FŤ2UL*��bR9�8Q�*&���O<���K<���K<���K�|@e��T>Q1��T��|Sŉ�T1��TL*\'ߤ2U�P�Q1�L7T��I�7U�P�*&�\'*7*&����T񉇵�z����z����z	��/R�*&���Ie�8Q�DŤrR1�ܨ8Q�*&���I��De���2UL*SŤ2UL*7*&���I�FŤr�bR�DŤrRq��O<���K<���K<���K���8����IeR9�8���2U��L7*&����7T���Fō��ʉʍ�IeR�*&���T1�|��Zk���Zk���Zk����/R9�8Q9���rR1�ܨ���I�\r��bR�*&���De��T������I�7�L\'*SŤ2U��ܨ�T����bR�*~��Zk���Zk���Zk��_�2U���T�P�*��IeR�*NT>�rC�*SŤ�M*7Tn�ܨ8Q�*NT>Q1���LSŉ�\r��b����T񉇵�z����z����z�>��M��I�T1��T�P��rR1�L�ʍ�IeR�*NT������bR9���ʉ�TqR1�L�ʍ�I�*&����I�7=���K<���K<���K�|��T�M*S�\r���T��Ie�8Q�*>�2UL*7*NT��*\'�ʍ�Ie��T>Qq�2U���T���T��ܨ�Mk��k��k��?|H�D�bR��rRq�rR1�LS�IŤrRq�2U�T�M��T1�L��ߤ2UL*SŤr�r��_R�*nT�Mk��k��k��?|���Iŉ�T1�ܨ8Q�*NT>Qq��*>�2U|B�Fŉʤ�/�8Q�*&�I��D��D���Z�%�Z�%�Z�%~���T1�L��\'T��*�P9��TNT��bR���\'���De��T��Ie����OT��L��T1�L\'*S�\'�Z�%�Z�%�Z�%~�e\'��TqCe��Q1�L*SŤr�bR�*NT��I��De�8�8Q�Q�M*Sō�I�ʉ�T�M*���TNT�����z����z����z��Le��T�������*SŤrRqC�\'�ʍ����I�\'Tn�L\'*��I�IŤ2U|�bR�Q�Mk��k��k���P�*&�OTL*\'7TN*&���*SŤ2U��L��7UL*SŤ2UL*S�7�ܨ�T>QqC�o��T��Ie��T������Z/��Z/��Z/�Ç*&���I�D�bR�*N*&�\'*\'7T��\'*SŤrR1�ܨ��2Uܨ�T&���Ie��T>Q1�ܨ8Q�_���Z/��Z/��Z/a����D��D���T1�L�Ie��TN*NT��O�L7T��Ie�8Q�*n�L�I��D�bR9��T�����Ie����Zk���Zk���Zk����Qq��	���oR�*&���bR�*&�\'*\'Sŉ�Tq�bR9���r�rR1�L��IŤ2UL7*NTNT����Zk���Zk���Zk��R�*&��bR�*NTN*NTNT��I�F�\'*N*&���D�*\'�P�*&�Ie�8��T~Sŉ�T1��T�P9�8Q�D�7=���K<���K<���K��*7T������I�TN*&��bR�*&��b�8Q�Qq�2UL*S�Iŉ�I�IŤ2�L\'*Sō�IeR�*nT��L��T1�L����Z/��Z/��Z/a��OTL*SŤ�M��IŤ�M\'*���T��I�Yŉ�\'*&���O�L��o��TnT�����z����z����z	���L��7UL*S�\r���Ie��TN*�I�Fŉ�I�\r����7T����T1�|SŤ�*NT��O<���K<���K<���K��Ie��TnTL*SŤ2U�T|Be��TNTN*N*n�ܨ�T����IŤrCe��D�7��TL*SŤ2U|�bR9��T�����z����z����z	���H�Tq�2UL*7*&��bR9���2UL*���I�FŤrR1�ܨ�T��Ie��T�����I�*�Kk��k��k��?|He�8��T��*S�\r��bR�*>Q1��TL*SŤ2UL*SŤ2UL*\'7TnTL*Sŉʉ�T1�L\'*7TN*n���ܨ���Zk���Zk���Zk����TN*n�L7TN*N*&���OTL*\'*7*N*&��bR9Q�*>�rCe��TN*&���*Sŉ�T1�L\'*\'*Sŉ�T1�L����Z/��Z/��Z/�ÇT��IeR�QqC��I�Iŉ�\'*&��bR��ʉʍ��Tq�rRq�rR1��M*SŤ�\'��a��^�a��^�a��^���?��*&���*SŤ2UL*SŤ2U|��TqC�_R1��T��L��o��T��Ie��T�K��T񉇵�z����z����z	��_���o���ʍ�Ie���T�K��T1�L\'*S�7�ܨ�T��I��I��7=���K<���K<���K��CTnT|�ʍ�I�F�\r���T�����\'*&���*SŤ�M�ʍ�I���IŤ2U�����z����z����z�>�rRq�rRq�2U�P���Tq�2�L�P�Q1U���TL*\'\'*\'*\'7TnTL*Sŉʍ�I��*&�I��T񉇵�z����z����z���bR�*n�L\'*Sō�I�bR�*N*nT�T|Be��*~��Iŉʤ���bR9��T����Ie�8Q�*&��ʤ��Z�%�Z�%�Z�%~��UL*�I�ʍ�*S�\r�oR�Q1�LS�\r���Ie�8Q9�8��Q1�L7TN*�������Z/��Z/��Z/�×�L��\r��bR�DŤrR�	���T����bR�*n�|Be�8��T��I�bR�TN*&���*\'�Tq�rCe����Zk���Zk���Zk��_Vq�bR�*&������*S�IŤrR�M*\'*SŤ�_R�*N*&�*�Tq�2U|B�bR�M*S�7=���K<���K<���K��CT>Q�/S�*&�OTL*SŤ2UL*\'\'*SŤ�/��T��Ie���TN*NTN*&���D���Z�%�Z�%�Z�%�~��T�	�7T>Q1��T|��T1�L��IŤ2U��L��TqC�bR�*NTN*&����T1��T�P������k��k��k��?���Ie��TN*&���De��Qq�2UL*�ʍ�*7*&�������bR�*NT���Tq�rR1�|Be��Q1�|���Z�%�Z�%�Z�%�>��*\'��I�\r�OTL*Sŉ�I�\r���I��De��T��Ie����Iŉ�Tq�r��*\'\'*\'�����z����z����z	��/R9��TnT|B�*NT�����o���2U|B�*&��bR�Dŉ�Tq�2U��ܨ�T��I��7=���K<���K<���K�|@e�8Q�Q1��TL*\'7TN*NTN*&���Ie��T��I��*\'��TqC�o��&�OT�P9�8Q�Q�Mk��k��k���_�2U�P9���2UL*���T��Ie����Iŉʍ��7T��O��T���T���T�P�*NT�����D���Z�%�Z�%�Z�%~���TqCe����OT|Be�8Q�&���Fō�Ie���2U��*nT��ܨ�T���bR9��Q�7=���K<���K<���K���*\'��IŤ2U��L\'7TnT�P�T�Ie���2U��L\'*7*&����T1�L�P9Q9��TNTnT�����z����z����z	��/R9�8Q�*&�OT��L��o����IŤ2U��L\'*\'��TqCe��T��I�ߤ2U��ܨ��rRqCe����Zk���Zk���Zk��R9�8Q9Q�*n�ܨ�Qq�2UL*7T���bR��ʉ�TqRqRqCe���2UL*SŤ2�|�b�8Q9��TNTN*NT����a��^�a��^�a��^���*S�\'T������T1�|�bR�Qq��*&�OT|Be�8Q�DŤrR1�L\'*\'��T1��TL*S�7=���K<���K<���K��Ie��TN*&��b��TnTL*\'�ʍ�o��TN*&����*\'��\'*n�ܨ�T��oR�Q1�ܨ�Q1�L��a��^�a��^�a��^��XŤ2U��ܨ�T��IeR�*n�ܨ8Q��2U|B�b��T&��bR���Tq�2UL*�P�*&��bR�*&���DeR�*NT����a��^�a��^�a��^��L��T1����T���M*7*n�L7T&�OT|S�IŤ2U|S�IŤ2�LSŤ2UL*\'*\'*7*N*&�I�F�\'�Z�%�Z�%�Z�%~�e\'7TNT��I�De����Ie��TNT>Q1�L��\r���I�TnTL*Sō�O�L��T1��T��L��Tq�2U|��Zk���Zk���Zk����T�����I�F�\r���_�rR1�|��D�T1��T|Be��TN*NTnT��L��7UL*\'����Z/��Z/��Z/a�?Le�8Q�Q1�|��De���2U��ܨ�T��*Sŉ�T1��T��L�P�*n�|��De����ozXk��xXk��xXk����C*S�7UL*��I�\r����Iŉ�Iŉ�\r���D����TnTL\'*Sō�I�D��TqR1��Mk��k��k���P�*�Ie�8Q9��T��I�FŤ2U|B���TqCe���rR1�ܨ�TN*NT>Q1��T|B�F�\r�����a��^�a��^�a��^�_�r���Tq�2U�T�P�*&�OTL*��TqRq�2U��|��bR�*N*&�I���7�L��\'T>Q1�L��a��^�a��^�a��^��g*NT��I���I�IŤr�rRq�rR1��P�Q1�ܨ8Q�TnT�Tܨ�TN*NTN*n�L��Zk���Zk���Zk����*&���o��DŤ�7UL*7*&���IŤ2UL*����2�L7T������bR�T��I�D�F�\'�Z�%�Z�%�Z�%~�eSŤr�2UL*ߤrRq�2U��L��Iŉʍ�Ie�8Q�*&���I��T��I�7U�Tܨ�T�Kk��k��k��?|��Ie��TNTn��T|S�Iō���b�8Q��ʉ�T�T��o��Qq�2U��L7*&���7=���K<���K<���K����<���K<���K<���K<���K<���K<���K<���K<���K<���K<���K<���K<���K<���K<���K<���K�ᡵʕ�s \0\0\0\0IEND�B`�');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTY4MjUxMjIsImV4cCI6MTcxNjkxMTUyMn0.uIuUTYNodKCPi5olt3Pyei1rcvI2Eq0c1E4QMFWyeNM',1716911522,123456,'1','2024-05-27 15:52:02','2024-05-27 15:52:02'),
(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTgwNzYxNzksImV4cCI6MTcxODE2MjU3OX0.pF1BXkOgXeEg1Eb8xAIWbPwnqftpIJIWgWouUVOykoU',1718162579,123456,'1','2024-06-11 03:23:00','2024-06-11 03:23:00'),
(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTgzMzcxMzIsImV4cCI6MTcxODQyMzUzMn0.Jxq4wezYKnPxbPoLKikAIfVgkBir7cFUCAJwVmSlZuw',1718423532,123456,'1','2024-06-14 03:52:12','2024-06-14 03:52:12'),
(28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDI0OTIsImV4cCI6MTcxODU4ODg5Mn0.3h077v-zgyeHxjs0y1vHG_S9fpESfKjc_N040GbAtek',1718588892,123456,'1','2024-06-16 01:48:12','2024-06-16 01:48:12'),
(29,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDg4MDIsImV4cCI6MTcxODU5NTIwMn0._JQMxsJJJmCcuAl3ULAzn70saUHQecxZGkn_ZrRUn4Y',1718595202,123456,'1','2024-06-16 03:33:22','2024-06-16 03:33:22'),
(30,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDg4MjksImV4cCI6MTcxODU5NTIyOX0.x-yoPwR2ewAgtinhBWREePZsa0I1HU1LIMS2HlF_PsE',1718595229,123456,'1','2024-06-16 03:33:49','2024-06-16 03:33:49'),
(31,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDg5ODAsImV4cCI6MTcxODU5NTM4MH0.IMDi-u5UpIi5k7IImMxi7foRN3-2ZOuz24pG0fFxE1Y',1718595380,123456,'1','2024-06-16 03:36:20','2024-06-16 03:36:20'),
(32,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDkyNjEsImV4cCI6MTcxODU5NTY2MX0.IIMvz-n-s3KpH04kVT-B5Rm-InulY7oUFsS-SzvJBko',1718595661,123456,'1','2024-06-16 03:41:01','2024-06-16 03:41:01'),
(33,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDkyOTYsImV4cCI6MTcxODU5NTY5Nn0.zwKzUcmFVCOupkd-4J0S5q-GB8qIRbzGVlSlogZSEig',1718595696,123456,'1','2024-06-16 03:41:36','2024-06-16 03:41:36'),
(34,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDkzMjUsImV4cCI6MTcxODU5NTcyNX0.UPZG8rapiEpW6yRCCK3DOYBfvOTvYY5IZkuq9ZJmptg',1718595725,123456,'1','2024-06-16 03:42:05','2024-06-16 03:42:05'),
(35,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDk1ODksImV4cCI6MTcxODU5NTk4OX0.6SopDUVCQJXbe_EBNIlmv7WVYCv8hWufZcgbqh1BnZs',1718595989,123456,'1','2024-06-16 03:46:29','2024-06-16 03:46:29'),
(36,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDk5MzEsImV4cCI6MTcxODU5NjMzMX0.aHyG3xOeDUT5OzNy8R7SZ2iIB49DV3O33PIDiUXUoNY',1718596331,123456,'1','2024-06-16 03:52:11','2024-06-16 03:52:11'),
(37,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MDk5NTcsImV4cCI6MTcxODU5NjM1N30.NwiqSvITl64ATulDixdnQleKWvjd1DqpVcWKVFA7cE4',1718596357,123456,'1','2024-06-16 03:52:37','2024-06-16 03:52:37'),
(38,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTAyOTEsImV4cCI6MTcxODU5NjY5MX0.l82vx9Zj1lb3ebTCQ2bSAnHFR-6M89eQXd2XkorIOyQ',1718596691,123456,'1','2024-06-16 03:58:11','2024-06-16 03:58:11'),
(39,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTAzMTcsImV4cCI6MTcxODU5NjcxN30.Oj8r_4blzFUC7Bvgv5gjgQ2HWm57bL7uICnyLKwFXeA',1718596717,123456,'1','2024-06-16 03:58:37','2024-06-16 03:58:37'),
(40,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTA1MDIsImV4cCI6MTcxODU5NjkwMn0.yXtLsNsTvPndyjv4laRpOwSQ_RF7nrfH6WESD78y9AU',1718596902,123456,'1','2024-06-16 04:01:42','2024-06-16 04:01:42'),
(41,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTA5NjcsImV4cCI6MTcxODU5NzM2N30.Nk0OQh8y-dqv6Nyl2abqGAMpACjA251vT0Ud_CDisj0',1718597367,123456,'1','2024-06-16 04:09:27','2024-06-16 04:09:27'),
(42,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTA5NzMsImV4cCI6MTcxODU5NzM3M30.dknFbyUSDoKzqFN8NeQLqe_HUDmPgJRjw-vm3QZV-8c',1718597373,123456,'1','2024-06-16 04:09:33','2024-06-16 04:09:33'),
(43,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTEwNzIsImV4cCI6MTcxODU5NzQ3Mn0.xdmhL703yFrP2SFrP4IHyNkOmiQZIb9oYdR78DyJT0M',1718597472,123456,'1','2024-06-16 04:11:12','2024-06-16 04:11:12'),
(44,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTEwNzgsImV4cCI6MTcxODU5NzQ3OH0.OW3iHytw97GpUYbBseeLHrG90mYUcceTUeMEe0eEEVg',1718597478,123456,'1','2024-06-16 04:11:18','2024-06-16 04:11:18'),
(45,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTEzMjksImV4cCI6MTcxODU5NzcyOX0.eCQkAaMhe84LicHUofEzeMxkPnCjd8xvhvYoAeDjKBU',1718597729,123456,'1','2024-06-16 04:15:29','2024-06-16 04:15:29'),
(46,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTEzNTMsImV4cCI6MTcxODU5Nzc1M30.a_1LEc0Q9AXgbnEwPAJfF40a3m6FxO3YiuXIYpG_wDc',1718597753,123456,'1','2024-06-16 04:15:53','2024-06-16 04:15:53'),
(47,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTEzNjMsImV4cCI6MTcxODU5Nzc2M30.7WWYNyUPkOaXR9b73chweLItriX91l7uzUQBR_612EU',1718597763,123456,'1','2024-06-16 04:16:03','2024-06-16 04:16:03'),
(48,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTE4NzIsImV4cCI6MTcxODU5ODI3Mn0.zvQ_ieP4sEkthtMKVdLX7hGQkqUE6NlBRE-QuaG-rtk',1718598272,123456,'1','2024-06-16 04:24:32','2024-06-16 04:24:32'),
(49,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTIwOTQsImV4cCI6MTcxODU5ODQ5NH0.XhKMGmEIBZbiloPrLL_V3cSKEAjyXksU1GXCVcyYvQY',1718598494,123456,'1','2024-06-16 04:28:14','2024-06-16 04:28:14'),
(50,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTIyMzAsImV4cCI6MTcxODU5ODYzMH0.xkdcnrxbA3JuMSmF5XiDhy0S47GtHDe5bU1we1V5b_Y',1718598630,123456,'1','2024-06-16 04:30:30','2024-06-16 04:30:30'),
(51,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTI1NTUsImV4cCI6MTcxODU5ODk1NX0.xN4cIehLnmoQm_r3QrRknSmJslpurQOBuNZQrsKE9M0',1718598955,123456,'1','2024-06-16 04:35:55','2024-06-16 04:35:55'),
(52,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTI1ODQsImV4cCI6MTcxODU5ODk4NH0.NSo5gRLeOk0krIDoCWaMltnWqUD_J5S6LNeHzMz41CM',1718598984,123456,'1','2024-06-16 04:36:24','2024-06-16 04:36:24'),
(53,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTI2OTksImV4cCI6MTcxODU5OTA5OX0.ahS7iudDV0C938fHWPMrkmFiaH_OMwaVpRFNFJ1_tBo',1718599099,123456,'1','2024-06-16 04:38:19','2024-06-16 04:38:19'),
(54,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTI3MjIsImV4cCI6MTcxODU5OTEyMn0.vmHM4x26w_Z-2_kacUuPSt8TdaA6tzbucHCt70T204I',1718599122,123456,'1','2024-06-16 04:38:42','2024-06-16 04:38:42'),
(55,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJlc0BnbWFpbC5jb20iLCJpYXQiOjE3MTg1MTI3NTEsImV4cCI6MTcxODU5OTE1MX0.mAvGSWkR01v2cujexo6SSFaeJofVNRgy5rHexUUKmS0',1718599151,123456,'1','2024-06-16 04:39:11','2024-06-16 04:39:11');

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
(1047859632,'Johana','Pertuz','','margarita@gmail.com','$2b$05$QYnM8V0/kkdZgWajti18Ae2QHuQHdVTlmu8RvPSKi0cHjMVV8vroG','CC','3214567896',2),
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
