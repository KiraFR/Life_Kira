-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 06 août 2017 à 23:16
-- Version du serveur :  10.1.24-MariaDB
-- Version de PHP :  7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `arma3life`
--
CREATE DATABASE IF NOT EXISTS `arma3life` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `arma3life`;

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles` ()  BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

DROP PROCEDURE IF EXISTS `deleteOldGangs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs` ()  BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

DROP PROCEDURE IF EXISTS `deleteOldHouses`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses` ()  BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

DROP PROCEDURE IF EXISTS `IncrementFourriere`$$
CREATE DEFINER=`kira`@`88.162.102.166` PROCEDURE `IncrementFourriere` ()  BEGIN
	UPDATE vehicles set fourriereTime = fourriereTime + 1 WHERE fourriere = 1;

END$$

DROP PROCEDURE IF EXISTS `resetLifePlayers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifePlayers` ()  BEGIN
  UPDATE players SET `alive`= 0,`faim`= 100,`soif`= 100,`vie`= 100 ;
END$$

DROP PROCEDURE IF EXISTS `resetLifeVehicles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles` ()  BEGIN
	UPDATE vehicles SET `active`= 0;
END$$

DROP PROCEDURE IF EXISTS `resetPositionPlayer`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetPositionPlayer` ()  BEGIN
	UPDATE players SET alive='0';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `banque`
--

DROP TABLE IF EXISTS `banque`;
CREATE TABLE IF NOT EXISTS `banque` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(30) NOT NULL,
  `nam_account` text NOT NULL,
  `numcompte` varchar(30) NOT NULL,
  `offshore` tinyint(1) NOT NULL DEFAULT '0',
  `entreprise` tinyint(1) NOT NULL DEFAULT '0',
  `organisme` tinyint(1) NOT NULL DEFAULT '0',
  `epargne` tinyint(1) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `dflt` tinyint(1) NOT NULL DEFAULT '0',
  `first` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bourse`
--

DROP TABLE IF EXISTS `bourse`;
CREATE TABLE IF NOT EXISTS `bourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `valeur` text NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gangs`
--

DROP TABLE IF EXISTS `gangs`;
CREATE TABLE IF NOT EXISTS `gangs` (
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

-- --------------------------------------------------------

--
-- Structure de la table `houses`
--

DROP TABLE IF EXISTS `houses`;
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL,
  `bank` int(100) NOT NULL,
  `montant` int(100) NOT NULL,
  `taxes` int(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notaire`
--

DROP TABLE IF EXISTS `notaire`;
CREATE TABLE IF NOT EXISTS `notaire` (
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

-- --------------------------------------------------------

--
-- Structure de la table `permis`
--

DROP TABLE IF EXISTS `permis`;
CREATE TABLE IF NOT EXISTS `permis` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL DEFAULT '0',
  `Ppermis` int(2) NOT NULL DEFAULT '0',
  `nbrPermis` int(3) NOT NULL DEFAULT '0',
  `permisDispo` tinyint(1) NOT NULL DEFAULT '0',
  `waitTime` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phonenumber`
--

DROP TABLE IF EXISTS `phonenumber`;
CREATE TABLE IF NOT EXISTS `phonenumber` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pid_owner` varchar(50) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` varchar(2) NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` varchar(2) NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` varchar(2) NOT NULL DEFAULT '0',
  `donatorlvl` varchar(2) NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `Ppermis` int(2) NOT NULL DEFAULT '0',
  `nbrPermis` int(10) NOT NULL DEFAULT '0',
  `fourriere` tinyint(1) NOT NULL,
  `civPosition` text NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
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
  `fourriereTime` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
