DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pid` varchar(50) NOT NULL,
  `cash` varchar(32) NOT NULL,
  `bank` varchar(32) NOT NULL,
  `montant` varchar(32) NOT NULL,
  `taxes` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
