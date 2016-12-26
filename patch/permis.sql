/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-21 23:28:36
*/

SET FOREIGN_KEY_CHECKS=0;

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
