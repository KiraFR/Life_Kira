/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-14 11:13:01
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `dynmarket` VALUES ('1', '[[\"apple\",50,0],[\"heroinu\",1850,0],[\"heroinp\",2650,0],[\"salema\",45,0],[\"ornate\",40,0],[\"mackerel\",175,0],[\"tuna\",700,0],[\"mullet\",250,0],[\"catshark\",300,0],[\"rabbit\",65,0],[\"oilp\",3200,0],[\"turtle\",3000,0],[\"water\",5,0],[\"coffee\",5,0],[\"turtlesoup\",1000,0],[\"donuts\",60,0],[\"marijuana\",2350,0],[\"tbacon\",25,0],[\"lockpick\",75,0],[\"pickaxe\",750,0],[\"redgull\",200,0],[\"peach\",55,0],[\"cocaine\",3000,0],[\"cocainep\",5000,0],[\"diamond\",750,0],[\"diamondc\",2000,0],[\"iron_r\",3200,0],[\"copper_r\",1500,0],[\"salt_r\",1650,0],[\"glass\",1450,0],[\"cement\",1950,0],[\"goldbar\",95000,0],[\"heroinu\",1200,0],[\"heroinp\",2500,0],[\"cocaine\",1500,0],[\"cocainep\",3500,0],[\"marijuana\",2000,0],[\"turtle\",3000,0]]');

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
INSERT INTO `phonenumber` VALUES ('1', '76561197964675179', 'Kira Luci', '026677', '0', '1');

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
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `Ppermis` int(2) NOT NULL DEFAULT '0',
  `nbrPermis` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('14', 'Kira Luci', '76561197964675179', '999561344', '999561344', '7', '[[\"license_cop_air\",0],[\"license_cop_swat\",0],[\"license_cop_cg\",0]]', '[[\"license_civ_driver\",0],[\"license_civ_air\",1],[\"license_civ_heroin\",1],[\"license_civ_marijuana\",1],[\"license_civ_gang\",1],[\"license_civ_boat\",1],[\"license_civ_oil\",1],[\"license_civ_dive\",1],[\"license_civ_truck\",0],[\"license_civ_gun\",1],[\"license_civ_rebel\",1],[\"license_civ_coke\",1],[\"license_civ_diamond\",1],[\"license_civ_copper\",1],[\"license_civ_iron\",1],[\"license_civ_sand\",1],[\"license_civ_salt\",1],[\"license_civ_cement\",1],[\"license_civ_home\",1]]', '[]', '[\"U_Rangemaster\",\"V_Rangemaster_belt\",\"\",\"\",\"\",[\"ItemMap\",\"ItemCompass\",\"ItemWatch\",\"ItemGPS\"],\"\",\"hgun_P07_snds_F\",[],[\"16Rnd_9x21_Mag\"],[],[],[],[\"16Rnd_9x21_Mag\",\"16Rnd_9x21_Mag\",\"16Rnd_9x21_Mag\",\"16Rnd_9x21_Mag\",\"16Rnd_9x21_Mag\"],[\"\",\"\",\"\",\"\"],[\"muzzle_snds_L\",\"\",\"\",\"\"],[]]', '[]', '0', '0', '[\"Kira Luci\"]', '0', '0', '[\"U_C_Poloshirt_burgundy\",\"\",\"\",\"\",\"\",[\"ItemMap\",\"ItemCompass\",\"ItemWatch\"],\"\",\"\",[],[],[],[],[],[],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[]]', '0', '12', '2');

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
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('6', 'cop', 'C_SUV_01_F', 'Car', '76561197964675179', '1', '0', '346811', '1', '\"[]\"', '1');
INSERT INTO `vehicles` VALUES ('7', 'civ', 'C_SUV_01_F', 'Car', '76561197964675179', '1', '0', '181170', '0', '\"[]\"', '1');
INSERT INTO `vehicles` VALUES ('8', 'civ', 'C_SUV_01_F', 'Car', '76561197964675179', '1', '0', '419296', '0', '\"[]\"', '1');
INSERT INTO `vehicles` VALUES ('9', 'civ', 'C_SUV_01_F', 'Car', '76561197964675179', '1', '0', '521387', '0', '\"[]\"', '1');
INSERT INTO `vehicles` VALUES ('10', 'civ', 'C_SUV_01_F', 'Car', '76561197964675179', '1', '0', '733918', '0', '\"[]\"', '1');
INSERT INTO `vehicles` VALUES ('11', 'civ', 'C_SUV_01_F', 'Car', '76561197964675179', '1', '1', '716756', '0', '\"[]\"', '0');

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
