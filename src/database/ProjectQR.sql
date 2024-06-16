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
(58,1,'12019282',1,'2024-06-14 00:00:00','ACTIVO','En bueno estado ','Portatil','Acer',100000,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\04\0\04\0\0\0¢ÏŸ\0\0\0IDATxì\Z~Ò\0\05IDATíÁAnÀÖ’À@Rðý¯ÌÉ²W$;ùš®²°ÖZp±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZq±ÖZñÃC*©bR™*NT¦Š•©bRy¢bRy¢â•;*îP¹£bR9©˜TN*NTN*&•;*~“Ê“Ê_ªxâb­µ>âb­µ>âb­µ>â‡—U¼Iå•7UL*SÅ*wTœ¨œ¨L\'\'*wTL*SÅ¤rR1©<¡rRqGÅ›T¦Š“ŠßTñ&•7]¬µÖG\\¬µÖG\\¬µÖGüðËTî¨x¢âDå•©âDå¤bR¹Ceª˜TNT¦ŠIeª8©˜T&•©bR9©¸£bR™T¦ŠIeRù7UÜ¡rRñ&•;*~ÓÅZk}ÄÅZk}ÄÅZk}Äÿã*&•©âDeª˜*&•“ŠIeR9©˜T¦ŠIå	••\'*&•©âM*SÅ¤2©œTÜ¡2UÜ¡rRqGÅ‰ÊTñ¿ìb­µ>âb­µ>âb­µ>â‡©8©x¢bR™TþRÅ¤rR1©L“Ê‰Ê‰Ê‰ÊoR¹£bR¹£bR™*N*&•\'T¦Š/»Xk­¸Xk­¸Xk­øá—Uü&•©bR™*&•©âDeª8Q™*&•IåDeª8©˜Tî¨˜TN*îP™*&•©bRy“Ê›*NT¦Š¿TñDÅÉÅZk}ÄÅZk}ÄÅZk}Ä/Sù•©bR™*ž¨˜T¦ŠIeª˜T¦ŠIåDeª˜TNT¦ŠßT1©L“ÊT1©L“Ê‰ÊTñ&•©bR9Q™*NTþË.ÖZë#.ÖZë#.ÖZë#ìüS™*NTN*îPùMÿe*SÅ*\'“ÊIÅ¤ò›*îP™*žP9©øÿäb­µ>âb­µ>âb­µ>ÂþÁ/R¹£bR™*&•“Š\'TN*&•©â	•“ŠIå‰ŠIeª˜TþMoR™*îP™*NTž¨˜T¦Š•\'*NTî¨xâb­µ>âb­µ>âb­µ>ÂþÁ*wT¼Iå‰Š•©bRy¢âDeª˜TN*NTî¨8Q™*NTN*&•©â	•7UL*SÅ‰ÊTq‡Ê“ÊIÅÉÅZk}ÄÅZk}ÄÅZk}ÄUL*SÅ¤òDÅT1©L“Ê¤òDÅ‰Ê‰ÊTñDÅ¤2UœTL*\'*SÅ¤rR1©L*SÅ*\'\'*\'“Ê“ÊTqGÅ‰ÊIÅ‰Ê“ÊTñÄÅZk}ÄÅZk}ÄÅZk}„ýƒTN*NT¦Š\'T¦Š•©bR™*&•;*&•©âDeª˜T¦Š•“Š;TþK*NTÞT1©œTL*wTL*OTL*\'w¨LoºXk­¸Xk­¸Xk­øá¡Š\'*&•“Š\'TžP™*NTN*&•;T¦ŠIåŽŠ\'*NTN*&•©bR™*&•©âŽŠIåDeª˜TÞ¤rRq¢2©L“Ê¤2Uü›.ÖZë#.ÖZë#.ÖZë#ì¼HåŽŠIeªx“Ê“ÊIÅ¤rGÅ¤òDÅ‰ÊT1©œTL*\'\'*\'“ÊT1©œTL*OTL*wTÜ¡2UL*\'“Ê\'*wT<q±ÖZq±ÖZq±ÖZaÿàE*SÅ¤ò¦Š¿¤2UÜ¡2UL*SÅ‰ÊTq¢rGÅ‰ÊIÅ¤rR1©œT<¡rR1©œTL*SÅ¤rR1©L“ÊIÅ¤rR1©œTL*SÅ¤2U<q±ÖZq±ÖZq±ÖZñÃC*wTL*SÅ‰Ê¤2U¼Ieª˜TžPùM*\'w¨¼©bR™*&•;T¦Š“ŠIå¤â¤bR™*NT¦Š\'T¦Š;*&•;T¦Š7]¬µÖG\\¬µÖG\\¬µÖGüð²ŠIå¤bRùM*\'\'*SÅ¤òDÅ¤2UL“ÊIÅ¤2UL*wT¼Ieª¸£â¤â¤bR™T¦Š\'TNTN*îP9©˜Tž¨˜T¦Š\'.ÖZë#.ÖZë#.ÖZë#~x¨bR¹Ceª¸CåDåYÅ\'*OTœ¨L\'*\'“ÊT1©ü—¨L\'w¨L*wTL*“ÊIÅoºXk­¸Xk­¸Xk­°ð¦ò¦ŠIeª8Q9©8Q9©˜T¦Š•©â•“ŠIå¤bRy¢bR9©xBeª˜T¦Š;T¦ŠIåŽŠIeªxBå¤â•©â‰‹µÖúˆ‹µÖúˆ‹µÖúˆRySÅT1©L“ÊTqR1©ÜQq¢rRq‡Ê*O¨LOTL*\'*SÅ‰ÊTqGÅ*\'“ÊTq‡Ê*\'O¨LSÅ›.ÖZë#.ÖZë#.ÖZë#~øc\'*\'©bRy¢âDeª˜T¦ŠIeR™*&•“ŠIåDeª˜*N*îP¹Ceª˜T¦Š\'*NTNT¦Š;*þ’ÊTq¢2U<q±ÖZq±ÖZq±ÖZñÃC“Ê‰ÊTqR1©ü¦Š;TN*&•“Š7UL*SÅ¤2©ÜQ1©œTL*\'\'“Ê‰ÊoR¹£â••©â•©âDeRùKk­õk­õk­õ?<¤ò„ÊT1©<¡rRq¢rRq¢2U¼Ieª¸Ceª˜TîPy¢âDåDå¤bRùM\'*“ÊT1©ÜQqGÅ‰ÊIÅ¤2UL*oºXk­¸Xk­¸Xk­øáUœ¨L“ÊIÅ¤2UÜQ1©œ¨L\'*SÅ¤2UÜ¡òDÅ“Ê¤rGÅ‰Ê_ª˜T¦ŠIeª˜T&•;*žP™*N*&•;*Þt±ÖZq±ÖZq±ÖZñÃË*NTîP™*î¨˜T¦Š;*~“ÊTq¢2U<¡òDÅ¤rR1©œ¨ü›Tž¨˜Tž¨¸Ceª˜Tþ’ÊTñÄÅZk}ÄÅZk}ÄÅZk}„ýƒ©ÜQñ„ÊIÅ*OTÜ¡rGÅ¤2UL*SÅ¤òDÅ¤rGÅ‰ÊT1©œTÜ¡rRq‡Ê\'*SÅ‰Êoª8Q¹£â‰‹µÖúˆ‹µÖúˆ‹µÖúˆR¹£âDå¤bªxSÅ‰Ê*SÅ‰Ê¤rGÅ¤2UL*\'wTÜ¡2UL*©bR™*&•“ÊTñ&•;*NTÞt±ÖZq±ÖZq±ÖZñÃË*îP™*NTî¨˜T¦ŠIå¤â7©L“Ê*SÅ¤2UL*“Ê*SÅ‰ÊIÅ¤ò&•©â¤âDeª˜T¦Š©â¤â•©bR¹CåŽŠ7]¬µÖG\\¬µÖG\\¬µÖGØ?øE*SÅ*\'O¨L\'*SÅ‰Ê“ÊT1©ÜQñ„ÊTq‡ÊIÅ¤2UL*SÅ¤2U<¡2U¼Iå‰Š;T¦Š•7U¼éb­µ>âb­µ>âb­µ>ÂþÁ*SÅoR9©˜Tž¨x“ÊTq¢2Uœ¨ÜQñ›TN*~“ÊIÅ¤2Uœ¨¼©âM*\'“ÊIÅÙÅZk}ÄÅZk}ÄÅZk}Ä¿Leª˜T~SÅ*\'*wTL“ÊIÅ¿Ieª˜Tî¨¸Cå¤bR9©xSÅ*w¨L\'*SÅ‰ÊT1©L*SÅ*SÅk­õk­õk­õ?¼LåDeª¸Ceª˜Tî¨x¢â‰Š•;*&••;T¦Š\'Tî¨xBå¤bR9©˜TÞTqGÅ¤2ULoR™*&•©âMk­õk­õk­õö^¤2UL*©bR¹£bR¹£âM*wTL*\'\'*©bR¹£âDeª8Qy¢âDå¤bR™*îPù/©xâb­µ>âb­µ>âb­µ>â‡‡TÞTq‡ÊTñDÅ¤2UÜ¡2Uœ¨ü/«¸CåŽŠIå•©bR9©˜TN*NTN*N*NT¦Š“Š;TN*&•ßt±ÖZq±ÖZq±ÖZñÃË*&•©bR9Q™*~“ÊT1©ÜQ1©ÜQ1©Ü¡rR1©¼Ieª8©¸£âDåDå¤bR9©˜T¦Š;T¦Š;*žP™*îP™*~ÓÅZk}ÄÅZk}ÄÅZk}Ä¿¬â‰Š;T¦Š“Š;*&•;*ÞTq¢2Uü¥Š;TN*&•©bª˜T¦Š•“Š;T¦Š•Iå¤bRy¢â‰ŠIeªxÓÅZk}ÄÅZk}ÄÅZk}ÄUL*O¨<Q1©Lw¨œTL*\'*SÅ‰Ê*\'*SÅIÅ¤r¢ò—*&•©â•“ŠIeª˜*NT¦Š“ŠIå¤âDeRy¢bR™*&•©â‰‹µÖúˆ‹µÖúˆ‹µÖúˆR™*îP™*NTî¨˜T¦Š;*ž¨x“ÊTq¢2©L“ÊT1©L\'*\'w¨L\'“ÊT1©¼Ieª˜T¦ŠIeªøKwTL*¿éb­µ>âb­µ>âb­µ>â‡‡*&•©bR™*NTÞT1©LoRy¢bR9Q™*¦Šÿ’ŠIeª˜T¦ŠIå¤bª˜T¦Š¿T1©œ¨L“Ê\'*\'“ÊT1©¼éb­µ>âb­µ>âb­µ>â‡‡TNT¦ŠIå¤â•©bR™*&•©bRù7UÜ¡rGÅT1©LwTL*SÅIÅ¤2UL*\'*\'*SÅT1©Loª8Q9©˜TNTN*&•©bR™*Þt±ÖZq±ÖZq±ÖZaÿà•“Š•;*žP™*NTî¨˜T¦ŠIå/UL*SÅ¤òDÅ*\'“ÊIÅ¤2UL*wTœ¨œTÜ¡rR1©Lw¨L“ÊO\\¬µÖG\\¬µÖG\\¬µÖGØ?øE*SÅ¤2Uœ¨œTL*SÅ¤2UL*SÅ‰ÊIÅ‰ÊT1©ÜQñ&•©bR¹£â	•©bR¹£â	•©â•;*&•“ŠIeª˜T¦Š•©â/]¬µÖG\\¬µÖG\\¬µÖGüðÊTqGÅ‰ÊT1©œTü&•“ŠIå¤bR™*îPy¢bª8©8Q9Q™*&••©bR9Q™*NT¦Š•\'*N*&•Ieª8©˜T¦Š•©â7]¬µÖG\\¬µÖG\\¬µÖGØ?øC*wTL*\'“ÊTq¢2Uœ¨œT<¡rR1©L“Êoª˜T¦Š;T¦Šß¤rGÅ*wTL*\'\'*wTL*\'ÿ¦‹µÖúˆ‹µÖúˆ‹µÖúˆ~™ÊT1©L“Ê“ÊT1U<Q1©<Qñ„ÊT1©L“ÊT1©œTœ¨œTL*SÅ‰ÊTqR1©<¡rGÅ¤rR1©L\'“Ê\'*SÅoºXk­¸Xk­¸Xk­°ð€ÊTq¢rGÅ¤ò—*&•©bR™*&•;*NT~SÅ¤rRq¢rR1©œTL*SÅ‰ÊTq¢òDÅ*\'\'*SÅ¤2U<¡2Uü¥‹µÖúˆ‹µÖúˆ‹µÖúˆ~™ÊTq‡ÊTq¢rR1©œ¨L“ÊTqGÅ¤r¢rR1©Lw¨L\'*wTL*SÅ‰Ê‰ÊT1Uœ¨L“ÊTq¢rRqRq¢2UL*\'*wTL“ÊIÅ›.ÖZë#.ÖZë#.ÖZë#~x™ÊTñDÅ¤2UL“Ê¤2Uœ¨¼©â¤bR™*žP9©¸Cå¤âDeª˜T¦Š©âDåM*SÅ¤2UL“Ê*SÅoª˜T&•©bª8Q™*ž¸Xk­¸Xk­¸Xk­øáe“ÊIÅ¤rRqGÅ¤2©œTL*\'*\'O¨œTÜQ1©L“Ê*OTœ¨LSÅ¤2U<¡r‡Ê“Ê¤2UL*\'“Ê›T¦Šßt±ÖZq±ÖZq±ÖZñÃC“ÊTqGÅ*\'\'OTL*SÅ¤2UœTL*OTL*\'*SÅ*\'*SÅ*SÅ*SÅ¤r‡ÊTq¢2UœTœTœ¨LwTœTü¥‹µÖúˆ‹µÖúˆ‹µÖúû¨L“ÊT1©L“Ê›*&•©â•“Š•;*&•©bR™*îP™*NTž¨8Q™*&•©â7©L“ÊTq¢ò›*NTþMO\\¬µÖG\\¬µÖG\\¬µÖGüðPÅ¤2UÜ¡2Uœ¨L\'*O¨œTÜQ1©LIeª8Q¹£â•;*&•“ŠIå¤bª8©˜T¦Š©bR9©˜TîP™*NTN*îPyÓÅZk}ÄÅZk}ÄÅZk}ÄLå•©âDeª¸CåŽŠIeª˜T¦Š;T¦Š“Š•\'*&••©bR¹Ceª˜*Þ¤2Uœ¨œ¨L\'wTL*SÅ¤2UL“ÊoºXk­¸Xk­¸Xk­°ð\"•©â•©bR™*Þ¤rR1©L“Ê“Ê\'*\'“ÊIÅ*SÅ¤rR1©L\'*SÅ¤2UL*SÅ¤2U<¡2UL*SÅ‰ÊTñ—T¦Š\'.ÖZë#.ÖZë#.ÖZë#~øe*SÅIÅ¤r‡ÊT1©LSÅ¤2©LoR9©˜TNTN*î¨xBå‰ŠIå‰Š\'*žP9©˜*&•©â	•©bR™*&•;*Þt±ÖZq±ÖZq±ÖZñÃS™*N*NTžP9©˜TNTî¨8Qy¢bR9Q™*NTN*¦ŠIeR™*&•7©<¡òDÅ‰ÊT1UL*wTL*“ÊT1©Lÿ¦‹µÖúˆ‹µÖúˆ‹µÖúˆ^Vq¢r‡ÊIÅ“ÊIÅIÅ‰Ê¤2Uœ¨Ü¡2UÜ¡rGÅ‰Ê*SÅ¤2UL*SÅ›*&•©bR9©¸Cå¤bR™TîP™*&•©bR™*Þt±ÖZq±ÖZq±ÖZaÿà•“Š•“Šß¤2UL*SÅ›TÞT1©œTL*SÅ¤òDÅ*wTœ¨œTœ¨ÜQq‡ÊIÅ¤rR1©œTL*\'“ÊTñ›.ÖZë#.ÖZë#.ÖZë#~xYÅ¤2UÜ¡2Uœ¨œTL\'oR¹£âDå¤âDeª˜T¦ŠIå¤bR™*&•©âŽŠIåßTñDÅ¤2©L“Ê¤rRqGÅ*SÅ›.ÖZë#.ÖZë#.ÖZë#~øe\'oª˜TžP™*&•©â¤bR9Q™*žP™*&•©â¤â	•\'*&•;*&•Ieª8©8Q™*NT¦Š•“ŠIeR™*NT¦Š©âDeªxâb­µ>âb­µ>âb­µ>â‡?¦rR1©¼Iå	••©â¤â•7©Ü¡ò›*&•©bR™*NTî¨8©˜T¦Š•“Š•;TîPyBå¤âMk­õk­õk­õöþ‡©L“ÊIÅ¤2UL*SÅ‰ÊIÅ¤rRq¢2Uü&•©â•©â•7UL*SÅ¤2Uœ¨L“ÊTñ„ÊT1©Lw¨Lw¨LO\\¬µÖG\\¬µÖG\\¬µÖGüðÊ_ª˜*&•©bRy¢bR™*N*žP¹Ceª˜Tî¨¸Ceª8Q™*&•“Š7UœTœ¨œ¨œ¨L“ÊIÅ*SÅ‰ÊIÅTñ¦‹µÖúˆ‹µÖúˆ‹µÖúˆ^Vñ&•7UL*¿©âŽŠ7©œTÜ¡rGÅ¿Ieª8Q9©˜T¦Š“Š\'TN*ÞTñ›T¦Š\'.ÖZë#.ÖZë#.ÖZë#~øe*wTÜ¡r‡Ê*SÅ‰Ê\'*\'SÅ¤2UL*SÅ*OTœTL*“ÊT1©LOTL*SÅ¤òDÅ¤2©Lw¨<Q1©ü¥‹µÖúˆ‹µÖúˆ‹µÖúˆ>¦bR9©xSÅ_ª˜T¦Š©â¤âŽŠ•©âMO¨L“Ê‰ÊoªxSÅ*wT¼éb­µ>âb­µ>âb­µ>â‡Q™*NTž¨˜TN*&•©â¤bR9Q™*NT¦Š©bR¹Ceª˜T¦ŠIeª8Q9©˜TNT¦ŠIeR™*&•;*&•“Š“ŠIeª˜TþË.ÖZë#.ÖZë#.ÖZë#~øe¿©â7Uü%•“Š©bR™*&•\'Tî¨8Q™*&•7UœTL*\'*SÅ¤2©L“ÊO¨L“ÊTñ_v±ÖZq±ÖZq±ÖZñÃËTþ—UL*wTœ¨L¿Ieª8Q9©˜TNTÞTq¢2UL*\'wTL*SÅ¤ò&•©âŽŠIå•©bR9©xÓÅZk}ÄÅZk}ÄÅZk}„ýƒµÖú€‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆ‹µÖúˆÿyËÍ÷J›…>\0\0\0\0IEND®B`‚'),
(60,2,'Bbnn',2,'2024-06-16 00:00:00','EN USO','Bbn','Bbnnnnn','Bbnnnn',9646464,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\04\0\04\0\0\0¢ÏŸ\0\0\0IDATxì\Z~Ò\0\0IDATíÁAŽË’À@2Ñ÷¿2GK_¨j=ý7³?Xk­xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—xXk­—øáC*SÅ‰Ê7UÜP¹Q1©œTœ¨L\'*SÅ¤rR1©œTœ¨œTL*SÅ¤rRqCå¤âDåFÅ¤rR1©Ü¨˜Tþ¦ŠO<¬µÖK<¬µÖK<¬µÖKüðeß¤ò›*>¡2UÜP™*>Qq¢ò‰Š“Š•©â†ÊT1©L“Ê¤rRqRq¢rR1©Ü¨˜T¦Šoªø&•ozXk­—xXk­—xXk­—øá—©Ü¨¸¡rRq¢rRñM*SÅ\r•OTL*\'“Ê\'*nTL*“ÊT1©L“ÊTñ	•*SÅ7©Lß¤r£â7=¬µÖK<¬µÖK<¬µÖKüðr*\'7T¦Š¿©âDeª˜TNT>QqCeª˜TN*n¨L7*N*&•oª˜T¦Š*SÅÿ²‡µÖz‰‡µÖz‰‡µÖz‰þÇU|“ÊT1Uœ¨L7TN*>Q1©Ü¨˜T&•O¨ü¦ŠIeª˜T>Q1©œ¨L7TN*Þìa­µ^âa­µ^âa­µ^â‡_Vñ7©L“ÊIÅ7©L7*&•O¨Ü¨˜TN*n¨L“ÊT1©LSÅ\r•¿©bR¹Qq¢rRñ‰ŠÉÃZk½ÄÃZk½ÄÃZk½Ä_¦ò7©L“ÊT1©œ¨L“ÊT1©œ¨L“ÊT1©L“ÊT1©L“ÊT1©œ¨L“ÊTqR1©L“ÊT1©L“ÊT1©L“ÊTqCeª8Qù—=¬µÖK<¬µÖK<¬µÖKüð¡ŠÿRÅ¤r£bR9Qù„ÊTñ_ª˜TNTnTü/Q9Q™*>Q1©L\'7T¦Š“Šÿ%k­õk­õk­õö‘ÊIÅ¤rR1©Ü¨˜TN*&•“Š*\'“ÊIÅ7©ü¦ŠIå“ÊßTñM*SÅ¤2Uœ¨LŸP9©øMk­õk­õk­õ?|Heª8©˜TN*NT¦Š•“ŠIeR9©¸¡2UL*\'¿Ieªø&•OTœ¨L\'*SÅ‰Ê7©L¿©bR™*NTN*þ¦‡µÖz‰‡µÖz‰‡µÖz	ûƒ¿Heª8Q™*NT¦Š¿Ieª8Q9©8Q¹Q1©œTœ¨üM\'*SÅ¤rRqCåFÅ¤2UL*¿©bR9©8Q™*&•“ŠO<¬µÖK<¬µÖK<¬µÖKØ|@eª˜T>Q1©œTœ¨|SÅ‰ÊT1©œTL*\'ß¤2UÜP¹Q1©L7T¦ŠIå7UÜP™*&•\'*7*&•©â†ÊTñ‰‡µÖz‰‡µÖz‰‡µÖz	ûƒ/R™*&•“ŠIeª8QùDÅ¤rR1©Ü¨8Q™*&•“ŠIå¤âDeª¸¡2UL*SÅ¤2UL*7*&•“ŠIåFÅ¤r£bRùDÅ¤rRq¢ò‰ŠO<¬µÖK<¬µÖK<¬µÖKüð«8©ø¦ŠIeR9©8©¸¡2Uœ¨L7*&••©â7T¾©âFÅŠ“Ê‰ÊŠIeR™*&•“ÊT1©|ÓÃZk½ÄÃZk½ÄÃZk½„ýÁ/R9©8Q9©¸¡rR1©Ü¨ø„ÊIÅ\r•©bR™*&•©âDeª˜T¦Š•©â†ÊIÅ7©L\'*SÅ¤2Uœ¨Ü¨˜T¦Š•©bR™*~ÓÃZk½ÄÃZk½ÄÃZk½Ä_¦2Uœ¨œTÜP™*¦ŠIeR™*NT>¡rCå*SÅ¤òM*7Tn¨Ü¨8Q™*NT>Q1©œ¨LSÅ‰Ê\r•©bªø„ÊTñ‰‡µÖz‰‡µÖz‰‡µÖz‰>¤òM“ÊIÅT1©œTÜP¹¡rR1©L“ÊŠIeR™*NT¦Š“Š•©bR9©ø„Ê‰ÊTqR1©L“ÊŠIå›*&••“ŠIå7=¬µÖK<¬µÖK<¬µÖKØ|‘ÊTñM*SÅ\r•©â›T¦ŠIeª8Q™*>¡2UL*7*NT¦Š*\'“ÊŠIeª˜T>Qq¢2Uœ¨œTœ¨œTœ¨Ü¨øMk­õk­õk­õ?|HåDå¤bR¹¡rRq¢rR1©LSÅIÅ¤rRq¢2UœTüM“ÊT1©L“Êß¤2UL*SÅ¤r¢r¢ò_R™*nTüMk­õk­õk­õ?|¨â†ÊIÅ‰ÊT1©Ü¨8Q™*NT>Qq£â›*>¡2U|BåFÅ‰Ê¤ò/©8Q™*&•Iå¤âDå¤âDå¤â›ÖZë%ÖZë%ÖZë%~øÊT1©L“Ê\'T¦Š*ŸP9©˜TNT¾©bRù¦Š\'¿©âDeª˜T¦ŠIeªø¦ŠOTœ¨L“ÊT1©L\'*SÅ\'ÖZë%ÖZë%ÖZë%~øe\'“ÊTqCeª¸Q1©L*SÅ¤r£bR™*NT¦ŠIå¤âDeª8©8Q¹QñM*SÅŠIå†Ê‰ÊTñM*Ÿ¨˜TNTþ¦‡µÖz‰‡µÖz‰‡µÖz‰¾Leª˜T¦Š•“Š©â*SÅ¤rRqCå\'“ÊŠ•‰ÊIÅ\'Tn¨L\'*“ÊIÅIÅ¤2U|¢bR¹QñMk­õk­õk­õöP™*&•OTL*\'7TN*&•“Š*SÅ¤2Uœ¨L“Ê7UL*SÅ¤2UL*SÅ7©Ü¨˜T>QqCåoª˜T¦ŠIeª˜T¦Šßô°ÖZ/ñ°ÖZ/ñ°ÖZ/ñÃ‡*&•“ŠIåDå¤bR™*N*&•\'*\'7T¦Š\'*SÅ¤rR1©Ü¨¸¡2UÜ¨˜T&•“ŠIeª˜T>Q1©Ü¨8Qù_ö°ÖZ/ñ°ÖZ/ñ°ÖZ/að•©âDå¤âDå¤â†ÊT1©L¿Ieª˜TN*NT¦ŠO¨L7T¦ŠIeª8Q™*n¨L¿Iå¤âDå¤bR9©˜T¦Š•“ŠIeªøÄÃZk½ÄÃZk½ÄÃZk½Äª¸Qq¢ò	•“ŠoR™*&•©â¤bR™*&•\'*\'SÅ‰ÊTq£bR9©¸¡r¢rR1©L“ÊIÅ¤2UL7*NTNT¦ŠÉÃZk½ÄÃZk½ÄÃZk½ÄR™*&•©bR™*NTN*NTNT¦ŠIåFÅ\'*N*&•©âDå*\'ŸP™*&•Ieª8©˜T~SÅ‰ÊT1©œTÜP9©8QùDÅ7=¬µÖK<¬µÖK<¬µÖKüð¡Š*7T¦Š•“Š•Iå›TN*&•©bR™*&•©bª8Q¹Qq¢2UL*SÅIÅ‰ÊIÅIÅ¤2©L\'*SÅŠIeR™*nTœ¨L“ÊT1©Lßô°ÖZ/ñ°ÖZ/ñ°ÖZ/að•OTL*SÅ¤òM“ÊIÅ¤òM\'*Ÿ¨˜T¦ŠIåYÅ‰Ê\'*&•“ŠO¨L“Êoª˜TnTü¦‡µÖz‰‡µÖz‰‡µÖz	ûƒ¨L“Ê7UL*SÅ\r•“ŠIeª˜TN*¾IåFÅ‰ÊIÅ\r•“Š•7T¦Š•ßT1©|SÅ¤ò›*NT¦ŠO<¬µÖK<¬µÖK<¬µÖKüð¡ŠIeª˜TnTL*SÅ¤2UœT|Beª˜TNTN*N*n¨Ü¨˜T¦Š“ÊIÅ¤rCeªøDÅ7©œTL*SÅ¤2U|¢bR9©˜Tþ¦‡µÖz‰‡µÖz‰‡µÖz	ûƒ¿Hå¿Tq¢2UL*7*&•©bR9©¸¡2UL*ÿ²ŠIåFÅ¤rR1©Ü¨˜T¦ŠIeª˜T¦Š•“ŠIå›*þKk­õk­õk­õ?|Heª8©˜T¦Š*SÅ\r•©bR™*>Q1©œTL*SÅ¤2UL*SÅ¤2UL*\'7TnTL*SÅ‰Ê‰ÊT1©L\'*7TN*n¨œ¨Ü¨øÄÃZk½ÄÃZk½ÄÃZk½Äª˜TN*n¨L7TN*N*&•“ŠOTL*\'*7*N*&•©bR9Q™*>¡rCeª˜TN*&•“Š*SÅ‰ÊT1©L\'*\'*SÅ‰ÊT1©Lßô°ÖZ/ñ°ÖZ/ñ°ÖZ/ñÃ‡T¦ŠIeR¹QqCå†ÊIÅIÅ‰Ê\'*&•©bRù„Ê‰ÊŠßTq¢rRq¢rR1©üM*SÅ¤ò‰Š\'¿éa­µ^âa­µ^âa­µ^Âþà?¤ò›*&•“Š*SÅ¤2UL*SÅ¤2U|“ÊTqCå_R1©œTœ¨L“Êoª˜T¦ŠIeª˜TþK“ÊTñ‰‡µÖz‰‡µÖz‰‡µÖz	ûƒ_¤ò‰Š•oªø„ÊŠIeªø›TþK“ÊT1©L\'*SÅ7©Ü¨˜T¦ŠIå¿Iå¤â7=¬µÖK<¬µÖK<¬µÖKØüCTnT|“ÊŠIåFÅ\r•©â›T¦Š•“Ê\'*&•“Š*SÅ¤òM“ÊŠIå“ÊIÅ¤2Uü¦‡µÖz‰‡µÖz‰‡µÖz‰>¤rRq¢rRq¢2UÜPù„ÊTq¢2©LŸP¹Q1Uœ¨œTL*\'\'*\'*\'7TnTL*SÅ‰ÊŠIå¤â›*&•Iå†ÊTñ‰‡µÖz‰‡µÖz‰‡µÖz‰¾¬bR™*n¨L\'*SÅŠIå¤bR™*N*nTœT|Beª˜*~“ÊIÅ‰Ê¤ò‰Š•©bR9©˜T¦Š“ŠIeª8Q™*&•“Ê¤ò›ÖZë%ÖZë%ÖZë%~øÇUL*¿Iå†ÊŠ*SÅ\r•oR¹Q1©LSÅ\r•“ŠIeª8Q9©8©¸Q1©L7TN*þ¦Šßô°ÖZ/ñ°ÖZ/ñ°ÖZ/ñÃ—©L“Ê\r•©bRùDÅ¤rRñ	•©â›T¦Š•©bR™*n¨|Beª8©˜T¦ŠIå¤bR™TN*&•©â*\'ßTq¢rCeªøÄÃZk½ÄÃZk½ÄÃZk½Ä_Vq£bR™*&•“Š•“Š*SÅIÅ¤rRñM*\'*SÅ¤ò_R™*N*&•*ßTq¢2U|Bå¤bRùM*SÅ7=¬µÖK<¬µÖK<¬µÖKØüCT>Qñ/S™*&•OTL*SÅ¤2UL*\'\'*SÅ¤ò/©˜T¦ŠIeªø›TN*NTN*&•©âDå¤â›ÖZë%ÖZë%ÖZë%ì~‘ÊTñ	•7T>Q1©œT|“ÊT1©L“ÊIÅ¤2Uœ¨L“ÊTqCå¤bR™*NTN*&•©â†ÊT1©œTÜPù¦Š•©âk­õk­õk­õ?ü²ŠIeª˜TN*&•©âDeª¸Qq¢2UL*“ÊŠ*7*&•“Š•••©bR™*NT¦ŠßTq¢rR1©|Beª¸Q1©|¢â›ÖZë%ÖZë%ÖZë%ì> ò‰Š*\'“ÊIÅ\r•OTL*SÅ‰ÊIÅ\r•“ŠIå¤âDeª˜T¦ŠIeªø„ÊIÅ‰ÊTq¢r£â*\'\'*\'ÿ’‡µÖz‰‡µÖz‰‡µÖz	ûƒ/R9©˜TnT|Bå›*NT¦Š•“Êoª¸¡2U|Bå›*&•©bRùDÅ‰ÊTq¢2Uœ¨Ü¨˜T¦ŠIå¤â7=¬µÖK<¬µÖK<¬µÖKØ|@eª8Q¹Q1©œTL*\'7TN*NTN*&•“ŠIeª˜T¦ŠIå¤â*\'“ÊTqCåoªø&•OTÜP9©8Q¹QñMk­õk­õk­õö_¤2UÜP9©¸¡2UL*Ÿ¨˜T¦ŠIeªø„ÊIÅ‰ÊŠ•7T¦ŠO¨œTœ¨œTœ¨œTÜP™*NT¦Š•©âDå¤â›ÖZë%ÖZë%ÖZë%~øÊTqCeªø¦ŠOT|Beª8Qù&•©âFÅŠIeª¸¡2UüË*nTœ¨Ü¨˜T¦Š©bR9©¸Qñ7=¬µÖK<¬µÖK<¬µÖKüð¡Š•*\'“ÊIÅ¤2Uœ¨L\'7TnTÜP™T¾Ieª¸¡2Uœ¨L\'*7*&•©â†ÊT1©LŸP9Q9©˜TNTnTü¦‡µÖz‰‡µÖz‰‡µÖz	ûƒ/R9©8Q™*&•OTœ¨L“Êoªø„ÊIÅ¤2Uœ¨L\'*\'“ÊTqCeª˜T¦ŠIåß¤2Uœ¨Ü¨¸¡rRqCeªøÄÃZk½ÄÃZk½ÄÃZk½ÄR9©8Q9Q™*n¨Ü¨¸Qq¢2UL*7T¦Š©bRù„Ê‰ÊTqRqRqCeª¸¡2UL*SÅ¤2©|¢bª8Q9©˜TNTN*NT¦Š¿éa­µ^âa­µ^âa­µ^Âþà*SÅ\'T¦Š•©â†ÊT1©|¢bR¹Qq¢ò›*&•OT|Beª8QùDÅ¤rR1©L\'*\'“ÊT1©œTL*SÅ7=¬µÖK<¬µÖK<¬µÖKüð¡ŠIeª˜TN*&•©bª˜TnTL*\'“ÊŠoª˜TN*&••©â*\'“Ê\'*n¨Ü¨˜T¦ŠoR¹Q1©Ü¨¸Q1©L¿éa­µ^âa­µ^âa­µ^â‡ÿXÅ¤2Uœ¨Ü¨˜T¦ŠIeR™*n¨Ü¨8Q¹¡2U|Bå¤bª˜T&•©bRù„ÊTq¢2UL*ŸP™*&•©bR™*&•©âDeR™*NT¦Š¿éa­µ^âa­µ^âa­µ^â‡©L“ÊT1©œ¨œTœ¨üM*7*n¨L7T&•OT|SÅIÅ¤2U|SÅIÅ¤2©LSÅ¤2UL*\'*\'*7*N*&•IåFÅ\'ÖZë%ÖZë%ÖZë%~øe\'7TNT¦ŠIåDeªø¦ŠIeª˜TNT>Q1©L“Ê\r•“ŠIå›TnTL*SÅŠO¨L“ÊT1©œTœ¨L“ÊTq¢2U|ÓÃZk½ÄÃZk½ÄÃZk½„ýÁT¦Š•“ŠIåFÅ\r•©â_¦rR1©|¢âDå¿T1©œT|Beª˜TN*NTnTœ¨L“Ê7UL*\'ßô°ÖZ/ñ°ÖZ/ñ°ÖZ/að?Leª8Q¹Q1©|¢âDeª¸¡2Uœ¨Ü¨˜T¦Š*SÅ‰ÊT1©œTœ¨LŸP™*n¨|¢âDeª¸¡ò‰ŠozXk­—xXk­—xXk­—øáC*SÅ7UL*“ÊIÅ\r•©â†ÊIÅ‰ÊIÅ‰Ê\r•©âDåŸ¨˜TnTL\'*SÅŠIåDå†ÊTqR1©üMk­õk­õk­õöP™*¾Ieª8Q9©˜T¦ŠIåFÅ¤2U|Bå¤â†ÊTqCeª¸¡rR1©Ü¨˜TN*NT>Q1©œT|BåFÅ\r•“Š¿éa­µ^âa­µ^âa­µ^â‡_¦r£â†ÊTq¢2UœTÜP™*&•OTL*“ÊTqRq¢2Uœ¨|¢â¤bR™*N*&•Iå¤â†Ê7©L“Ê\'T>Q1©L¿éa­µ^âa­µ^âa­µ^â‡ÿg*NT¦ŠIå“ÊIÅIÅ¤r¢rRq¢rR1©ÜP¹Q1©Ü¨8Q™TnTœTÜ¨˜TN*NTN*n¨LÓÃZk½ÄÃZk½ÄÃZk½Äÿã*&•“ŠoªøDÅ¤ò7UL*7*&•“ÊIÅ¤2UL*Ÿ¨¸¡2©L7T¦Š“Š•©bR™T¦ŠIåDåFÅ\'ÖZë%ÖZë%ÖZë%~øeSÅ¤r¢2UL*ß¤rRq¢2Uœ¨L“ÊIÅ‰ÊŠIeª8Q™*&•“ŠIå¤â›T¦ŠIå7UœTÜ¨˜TþKk­õk­õk­õ?|™ÊIeª˜TNTn¨œT|SÅIÅŠ•©bª8Qù„Ê‰ÊTñ›T¦Šoª¸Qq¢2Uœ¨L7*&•©â7=¬µÖK<¬µÖK<¬µÖKØ¬µÖ<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖK<¬µÖKüá¡µÊ•Ús \0\0\0\0IEND®B`‚');

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
  `password` varchar(255) NOT NULL COMMENT 'contraseÃ±a del funcionario',
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
