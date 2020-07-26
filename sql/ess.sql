/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.16 : Database - ess
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ess` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ess`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` char(16) NOT NULL,
  `username` char(16) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `dormuserid` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dormuserid` (`dormuserid`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`dormuserid`) REFERENCES `dormuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `account` */

/*Table structure for table `dorm` */

DROP TABLE IF EXISTS `dorm`;

CREATE TABLE `dorm` (
  `id` char(16) NOT NULL,
  `adr` int(11) DEFAULT NULL,
  `dormarea` int(11) DEFAULT NULL,
  `roomno` int(11) DEFAULT NULL,
  `membernum` int(11) DEFAULT NULL,
  `paymentid` char(16) DEFAULT NULL,
  `epid` char(16) DEFAULT NULL,
  `wpid` char(16) DEFAULT NULL,
  `eletwaterid` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentid` (`paymentid`),
  KEY `epid` (`epid`),
  KEY `wpid` (`wpid`),
  KEY `eletwaterid` (`eletwaterid`),
  CONSTRAINT `dorm_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `payment` (`id`),
  CONSTRAINT `dorm_ibfk_2` FOREIGN KEY (`epid`) REFERENCES `eletperday` (`id`),
  CONSTRAINT `dorm_ibfk_3` FOREIGN KEY (`wpid`) REFERENCES `waterperday` (`id`),
  CONSTRAINT `dorm_ibfk_4` FOREIGN KEY (`eletwaterid`) REFERENCES `eletwater` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dorm` */

/*Table structure for table `dormuser` */

DROP TABLE IF EXISTS `dormuser`;

CREATE TABLE `dormuser` (
  `id` char(16) NOT NULL,
  `uno` char(10) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `usex` int(11) DEFAULT NULL,
  `uphone` varchar(20) DEFAULT NULL,
  `dormid` char(16) DEFAULT NULL,
  `userstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uno` (`uno`),
  KEY `dormid` (`dormid`),
  CONSTRAINT `dormuser_ibfk_1` FOREIGN KEY (`dormid`) REFERENCES `dorm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dormuser` */

/*Table structure for table `eletperday` */

DROP TABLE IF EXISTS `eletperday`;

CREATE TABLE `eletperday` (
  `id` char(16) NOT NULL,
  `eletday` date DEFAULT NULL,
  `eletuse` double DEFAULT NULL,
  `eletfee` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `eletperday` */

/*Table structure for table `eletwater` */

DROP TABLE IF EXISTS `eletwater`;

CREATE TABLE `eletwater` (
  `id` char(16) NOT NULL,
  `preeletbalance` double DEFAULT NULL,
  `eletsupply` double DEFAULT NULL,
  `eletbalance` double DEFAULT NULL,
  `eletstatus` int(11) DEFAULT NULL,
  `prewaterbalance` double DEFAULT NULL,
  `watersupply` double DEFAULT NULL,
  `waterbalance` double DEFAULT NULL,
  `waterstatus` int(11) DEFAULT NULL,
  `paymentid` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `eletwater_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `eletwater` */

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` char(16) NOT NULL,
  `paytype` int(11) DEFAULT NULL,
  `tradetype` int(11) DEFAULT NULL,
  `paymount` double DEFAULT NULL,
  `tradetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payment` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` char(16) NOT NULL,
  `permissionname` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `permission` */

/*Table structure for table `userrole` */

DROP TABLE IF EXISTS `userrole`;

CREATE TABLE `userrole` (
  `id` char(16) NOT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `roledesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userrole` */

/*Table structure for table `userrole_account` */

DROP TABLE IF EXISTS `userrole_account`;

CREATE TABLE `userrole_account` (
  `accountid` char(16) NOT NULL,
  `userroleid` char(16) NOT NULL,
  PRIMARY KEY (`accountid`,`userroleid`),
  KEY `userrole_account_ibfk_2` (`userroleid`),
  CONSTRAINT `userrole_account_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`),
  CONSTRAINT `userrole_account_ibfk_2` FOREIGN KEY (`userroleid`) REFERENCES `userrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userrole_account` */

/*Table structure for table `userrole_permission` */

DROP TABLE IF EXISTS `userrole_permission`;

CREATE TABLE `userrole_permission` (
  `userroleid` char(16) NOT NULL,
  `permissionid` char(16) NOT NULL,
  PRIMARY KEY (`userroleid`,`permissionid`),
  KEY `userrole_permission_ibfk_2` (`permissionid`),
  CONSTRAINT `userrole_permission_ibfk_1` FOREIGN KEY (`userroleid`) REFERENCES `dormuser` (`id`),
  CONSTRAINT `userrole_permission_ibfk_2` FOREIGN KEY (`permissionid`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userrole_permission` */

/*Table structure for table `waterperday` */

DROP TABLE IF EXISTS `waterperday`;

CREATE TABLE `waterperday` (
  `id` char(16) NOT NULL,
  `waterday` date DEFAULT NULL,
  `wateruse` double DEFAULT NULL,
  `waterfee` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `waterperday` */

/* Trigger structure for table `account` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `accountid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `accountid_trigger` BEFORE INSERT ON `account` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `dorm` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dormid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dormid_trigger` BEFORE INSERT ON `dorm` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `dormuser` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dormuserid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dormuserid_trigger` BEFORE INSERT ON `dormuser` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `eletperday` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `eletperdayid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `eletperdayid_trigger` BEFORE INSERT ON `eletperday` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `eletwater` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `eletwaterid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `eletwaterid_trigger` BEFORE INSERT ON `eletwater` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `payment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `paymentid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `paymentid_trigger` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `permission` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `permissionid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `permissionid_trigger` BEFORE INSERT ON `permission` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `userrole` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `userroleid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `userroleid_trigger` BEFORE INSERT ON `userrole` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `waterperday` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `waterperdayid_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `waterperdayid_trigger` BEFORE INSERT ON `waterperday` FOR EACH ROW BEGIN
		SET new.id=upper(REPLACE(UUID(),'-','')); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
