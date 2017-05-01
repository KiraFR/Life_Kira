/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-24 00:37:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banque
-- ----------------------------
DROP TABLE IF EXISTS `banque`;
CREATE TABLE `banque` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(30) NOT NULL,
  `nam_account` text NOT NULL,
  `numcompte` varchar(30) NOT NULL,
  `offshore` tinyint(1) NOT NULL DEFAULT '0',
  `entreprise` tinyint(1) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `dflt` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of banque
-- ----------------------------

-- ----------------------------
-- Table structure for dynmarket
-- ----------------------------
DROP TABLE IF EXISTS `dynmarket`;
CREATE TABLE `dynmarket` (
  `id` int(11) NOT NULL DEFAULT '1',
  `prices` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dynmarket
-- ----------------------------

-- ----------------------------
-- Table structure for gangs
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gangs
-- ----------------------------

-- ----------------------------
-- Table structure for gouv
-- ----------------------------
DROP TABLE IF EXISTS `gouv`;
CREATE TABLE `gouv` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `par` varchar(255) NOT NULL,
  `montant` int(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `pour` varchar(10) NOT NULL,
  `total` int(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gouv
-- ----------------------------

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of houses
-- ----------------------------

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `PID` varchar(32) NOT NULL,
  `PID2` varchar(32) NOT NULL DEFAULT '',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Type` varchar(20) NOT NULL,
  `Text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(12) NOT NULL,
  `de` varchar(20) NOT NULL,
  `deUID` varchar(50) NOT NULL,
  `Pto` varchar(20) NOT NULL,
  `toUID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `nowtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for messagecop
-- ----------------------------
DROP TABLE IF EXISTS `messagecop`;
CREATE TABLE `messagecop` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `de` varchar(20) NOT NULL,
  `deUID` varchar(50) NOT NULL,
  `nto` varchar(20) NOT NULL,
  `toUID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `nowtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messagecop
-- ----------------------------

-- ----------------------------
-- Table structure for messageinde
-- ----------------------------
DROP TABLE IF EXISTS `messageinde`;
CREATE TABLE `messageinde` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `de` varchar(20) NOT NULL,
  `deUID` varchar(50) NOT NULL,
  `nto` varchar(20) NOT NULL,
  `toUID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `nowtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messageinde
-- ----------------------------

-- ----------------------------
-- Table structure for numberrepertoire
-- ----------------------------
DROP TABLE IF EXISTS `numberrepertoire`;
CREATE TABLE `numberrepertoire` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pid_owner` varchar(50) NOT NULL,
  `pid_contact` varchar(50) NOT NULL,
  `num_contact` varchar(20) NOT NULL,
  `nam_contact` text NOT NULL,
  `contact_isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of numberrepertoire
-- ----------------------------

-- ----------------------------
-- Table structure for permis
-- ----------------------------
DROP TABLE IF EXISTS `permis`;
CREATE TABLE `permis` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL DEFAULT '0',
  `Ppermis` int(2) NOT NULL DEFAULT '0',
  `nbrPermis` int(3) NOT NULL DEFAULT '0',
  `permisDispo` tinyint(1) NOT NULL DEFAULT '0',
  `waitTime` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permis
-- ----------------------------

-- ----------------------------
-- Table structure for phonenumber
-- ----------------------------
DROP TABLE IF EXISTS `phonenumber`;
CREATE TABLE `phonenumber` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pid_owner` varchar(50) NOT NULL,
  `nom` text NOT NULL,
  `numero` varchar(20) NOT NULL,
  `annuaire` varchar(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of phonenumber
-- ----------------------------

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `Ppermis` int(2) NOT NULL DEFAULT '0',
  `nbrPermis` int(10) NOT NULL DEFAULT '0',
  `fourriere` tinyint(1) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  `fourriere` tinyint(1) NOT NULL,
  `insure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------

-- ----------------------------
-- Procedure structure for deleteDeadVehicles
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for deleteOldGangs
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for deleteOldHouses
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for resetLifePlayers
-- ----------------------------
DROP PROCEDURE IF EXISTS `resetLifePlayers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifePlayers`()
BEGIN
  UPDATE players SET `alive`= 0,`faim`= 100,`soif`= 100,`vie`= 100 ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for resetLifeVehicles
-- ----------------------------
DROP PROCEDURE IF EXISTS `resetLifeVehicles`;
DELIMITER ;;
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END
;;
DELIMITER ;
