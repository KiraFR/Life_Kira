/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-18 00:14:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notaire
-- ----------------------------
DROP TABLE IF EXISTS `notaire`;
CREATE TABLE `notaire` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `uidPlayer` varchar(50) NOT NULL,
  `amount` int(32) NOT NULL,
  `realAmount` int(32) NOT NULL,
  `toPlayer` varchar(50) NOT NULL,
  `nomNotaire` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
