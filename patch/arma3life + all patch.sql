-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 23 Mai 2017 à 14:19
-- Version du serveur :  10.0.30-MariaDB-0+deb8u2
-- Version de PHP :  5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `altislife`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifePlayers`()
BEGIN
  UPDATE players SET `alive`= 0,`faim`= 100,`soif`= 100,`vie`= 100 ;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `banque`
--

CREATE TABLE IF NOT EXISTS `banque` (
`id` int(55) NOT NULL,
  `playerid` varchar(30) NOT NULL,
  `nam_account` text NOT NULL,
  `numcompte` varchar(30) NOT NULL,
  `offshore` tinyint(1) NOT NULL DEFAULT '0',
  `entreprise` tinyint(1) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `dflt` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bourse`
--

CREATE TABLE IF NOT EXISTS `bourse` (
`id` int(11) NOT NULL,
  `name` text NOT NULL,
  `valeur` text NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gangs`
--

CREATE TABLE IF NOT EXISTS `gangs` (
`id` int(11) NOT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gouv`
--

CREATE TABLE IF NOT EXISTS `gouv` (
`id` int(255) NOT NULL,
  `par` varchar(255) NOT NULL,
  `montant` int(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `pour` varchar(10) NOT NULL,
  `total` int(255) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
`id` int(11) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` int(255) NOT NULL,
  `PID` varchar(32) NOT NULL,
  `PID2` varchar(32) NOT NULL DEFAULT '',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Type` varchar(20) NOT NULL,
  `Text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(12) NOT NULL,
  `de` varchar(20) NOT NULL,
  `deUID` varchar(50) NOT NULL,
  `Pto` varchar(20) NOT NULL,
  `toUID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `nowtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `messagecop`
--

CREATE TABLE IF NOT EXISTS `messagecop` (
`id` int(12) NOT NULL,
  `de` varchar(20) NOT NULL,
  `deUID` varchar(50) NOT NULL,
  `nto` varchar(20) NOT NULL,
  `toUID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `nowtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `messageinde`
--

CREATE TABLE IF NOT EXISTS `messageinde` (
`id` int(12) NOT NULL,
  `de` varchar(20) NOT NULL,
  `deUID` varchar(50) NOT NULL,
  `nto` varchar(20) NOT NULL,
  `toUID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `nowtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `numberrepertoire`
--

CREATE TABLE IF NOT EXISTS `numberrepertoire` (
`id` int(255) NOT NULL,
  `pid_owner` varchar(50) NOT NULL,
  `pid_contact` varchar(50) NOT NULL,
  `num_contact` varchar(20) NOT NULL,
  `nam_contact` text NOT NULL,
  `contact_isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `permis`
--

CREATE TABLE IF NOT EXISTS `permis` (
`id` int(255) NOT NULL,
  `uid` varchar(50) NOT NULL DEFAULT '0',
  `Ppermis` int(2) NOT NULL DEFAULT '0',
  `nbrPermis` int(3) NOT NULL DEFAULT '0',
  `permisDispo` tinyint(1) NOT NULL DEFAULT '0',
  `waitTime` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phonenumber`
--

CREATE TABLE IF NOT EXISTS `phonenumber` (
`id` int(255) NOT NULL,
  `pid_owner` varchar(50) NOT NULL,
  `nom` text NOT NULL,
  `numero` varchar(20) NOT NULL,
  `annuaire` varchar(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
`uid` int(12) NOT NULL,
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
  `fourriere` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
`id` int(12) NOT NULL,
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
  `insure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `banque`
--
ALTER TABLE `banque`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bourse`
--
ALTER TABLE `bourse`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gangs`
--
ALTER TABLE `gangs`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Index pour la table `gouv`
--
ALTER TABLE `gouv`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `houses`
--
ALTER TABLE `houses`
 ADD PRIMARY KEY (`id`,`pid`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messagecop`
--
ALTER TABLE `messagecop`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messageinde`
--
ALTER TABLE `messageinde`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `numberrepertoire`
--
ALTER TABLE `numberrepertoire`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permis`
--
ALTER TABLE `permis`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phonenumber`
--
ALTER TABLE `phonenumber`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `players`
--
ALTER TABLE `players`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `playerid` (`playerid`), ADD KEY `name` (`name`), ADD KEY `blacklist` (`blacklist`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
 ADD PRIMARY KEY (`id`), ADD KEY `side` (`side`), ADD KEY `pid` (`pid`), ADD KEY `type` (`type`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `banque`
--
ALTER TABLE `banque`
MODIFY `id` int(55) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `bourse`
--
ALTER TABLE `bourse`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `gangs`
--
ALTER TABLE `gangs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `gouv`
--
ALTER TABLE `gouv`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `houses`
--
ALTER TABLE `houses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `messagecop`
--
ALTER TABLE `messagecop`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `messageinde`
--
ALTER TABLE `messageinde`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `numberrepertoire`
--
ALTER TABLE `numberrepertoire`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `permis`
--
ALTER TABLE `permis`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `phonenumber`
--
ALTER TABLE `phonenumber`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `players`
--
ALTER TABLE `players`
MODIFY `uid` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
