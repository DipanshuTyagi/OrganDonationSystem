/*
SQLyog Community v12.02 (32 bit)
MySQL - 5.5.29 : Database - organ
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`organ` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `organ`;

/*Table structure for table `det` */

DROP TABLE IF EXISTS `det`;

CREATE TABLE `det` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `age` varchar(200) DEFAULT NULL,
  `blood` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `part` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `det` */

insert  into `det`(`id`,`name`,`age`,`blood`,`mobile`,`email`,`location`,`part`) values (1,'aswin','22','O+ve','7708150152','aswinvlsa01@gmail.com','Vadapalani','Eyes'),(2,'yy','23','O+ve','7708150152','bhuvana.vlsa@gmail.com','Vadapalani','Kidneys');

/*Table structure for table `his` */

DROP TABLE IF EXISTS `his`;

CREATE TABLE `his` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `his` */

insert  into `his`(`id`,`name`,`keyword`) values (1,'aswin','eye'),(2,'yy','eye'),(3,'yy','kidn');

/*Table structure for table `reg` */

DROP TABLE IF EXISTS `reg`;

CREATE TABLE `reg` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `reg` */

insert  into `reg`(`id`,`name`,`pass`,`mobile`,`email`,`location`,`country`) values (1,'aswin','111111','7708150152','aswinvlsa01@gmail.com','Vadapalani','India'),(2,'yy','123456','7708150152','bhuvana.vlsa@gmail.com','Vadapalani','India');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
