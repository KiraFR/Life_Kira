/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-21 23:28:27
*/

SET FOREIGN_KEY_CHECKS=0;

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
