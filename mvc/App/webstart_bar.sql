-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 21 Mars 2021 à 14:39
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `webstart_bar`
--

-- --------------------------------------------------------

--
-- Structure de la table `card`
--

CREATE TABLE IF NOT EXISTS `card` (
  `idCard` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idCard`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `card`
--

INSERT INTO `card` (`idCard`, `Title`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Soir', 0, '2021-03-19 00:00:00', '2021-03-19 00:00:00'),
(2, 'Midi', 1, '2021-03-19 00:00:00', '2021-03-19 00:00:00'),
(3, 'midi et soir', 1, '2021-03-19 00:00:00', '2021-03-19 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `IdCategory` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Created_at` datetime NOT NULL,
  `Updated_at` datetime DEFAULT NULL,
  `Deleted_at` datetime NOT NULL,
  PRIMARY KEY (`IdCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`IdCategory`, `Title`, `Created_at`, `Updated_at`, `Deleted_at`) VALUES
(1, 'Vin', '2021-03-19 00:00:00', '2021-03-19 00:00:00', '2021-03-19 00:00:00'),
(2, 'Coktail', '2021-03-19 00:00:00', '2021-03-19 00:00:00', '2021-03-19 00:00:00'),
(3, 'Bière', '2021-03-19 00:00:00', '2021-03-19 00:00:00', '2021-03-19 00:00:00'),
(4, 'Soft', '2021-03-19 00:00:00', '2021-03-19 00:00:00', '2021-03-19 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `idProduct` int(11) NOT NULL DEFAULT '0',
  `prix` int(11) NOT NULL,
  `alcool` int(11) NOT NULL,
  `description` varchar(400) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `Title` varchar(45) NOT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE KEY `alcool_UNIQUE` (`alcool`),
  UNIQUE KEY `description_UNIQUE` (`description`),
  KEY `fk_product_product_has_card1_idx` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `product_has_card`
--

CREATE TABLE IF NOT EXISTS `product_has_card` (
  `idCard` int(11) NOT NULL DEFAULT '0',
  `idProduct` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCard`,`idProduct`),
  KEY `fk_Category_has_Product_card1_idx` (`idCard`),
  KEY `fk_Product_has_Card_product1_idx` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `product_has_category`
--

CREATE TABLE IF NOT EXISTS `product_has_category` (
  `idProduct` int(11) NOT NULL DEFAULT '0',
  `IdCategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `fk_Product_has_Category_Category1_idx` (`IdCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `waiter`
--

CREATE TABLE IF NOT EXISTS `waiter` (
  `idWaiter` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `Age` varchar(45) NOT NULL,
  `presentation` varchar(400) DEFAULT NULL,
  `horaire` varchar(45) NOT NULL,
  `Created_at` datetime NOT NULL,
  `Updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idWaiter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `waiter`
--

INSERT INTO `waiter` (`idWaiter`, `name`, `Age`, `presentation`, `horaire`, `Created_at`, `Updated_at`) VALUES
(1020544587, 'Jean', '22 ans', 'Lorem Ipsum est simplement un faux texte de l''industrie de l''impression et de la composition. Lorem Ipsum a été le texte factice standard de l''industrie depuis les années 1500, quand un imprimeur inconnu a pris une galère de caractères et l''a brouillée pour en faire un livre de spécimens. Il a survécu non seulement cinq siècles, mais aussi le saut dans la composition électronique, demeurant essent', 'midi', '2021-03-19 00:00:00', '2021-03-19 00:00:00'),
(1024367952, 'Julie', '25', 'Lorem Ipsum est simplement un faux texte de l''industrie de l''impression et de la composition. Lorem Ipsum a été le texte factice standard de l''industrie depuis les années 1500, quand un imprimeur inconnu a pris une galère de caractères et l''a brouillée pour en faire un livre de spécimens. Il a survécu non seulement cinq siècles, mais aussi le saut dans la composition électronique, demeurant essent', 'soir', '2021-03-19 00:00:00', '2021-03-19 00:00:00');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_product_has_card1` FOREIGN KEY (`idProduct`) REFERENCES `product_has_category` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_has_card`
--
ALTER TABLE `product_has_card`
  ADD CONSTRAINT `fk_Category_has_Product_card1` FOREIGN KEY (`idCard`) REFERENCES `card` (`idCard`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_has_Card_product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_has_category`
--
ALTER TABLE `product_has_category`
  ADD CONSTRAINT `fk_Product_has_Category_Category1` FOREIGN KEY (`IdCategory`) REFERENCES `category` (`IdCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;