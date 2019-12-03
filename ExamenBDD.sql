-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 12, 2019 at 09:21 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--
CREATE DATABASE IF NOT EXISTS `football` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `football`;

-- --------------------------------------------------------

--
-- Table structure for table `assoc_j_c`
--

DROP TABLE IF EXISTS `assoc_j_c`;
CREATE TABLE IF NOT EXISTS `assoc_j_c` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_carton` int(11) NOT NULL,
  `id_rencontre` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `minute_carton` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_joueur` (`id_joueur`),
  KEY `id_rencontre` (`id_rencontre`),
  KEY `assoc_j_c_ibfk_3` (`id_carton`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assoc_j_c`
--

INSERT INTO `assoc_j_c` (`id`, `id_carton`, `id_rencontre`, `id_joueur`, `minute_carton`) VALUES
(1, 1, 1, 23, 10),
(2, 1, 2, 27, 12),
(3, 1, 2, 27, 34),
(4, 1, 3, 15, 76),
(5, 1, 7, 15, 31),
(6, 2, 8, 20, 43),
(7, 1, 9, 11, 42),
(8, 1, 10, 21, 7),
(9, 1, 11, 9, 53);

-- --------------------------------------------------------

--
-- Table structure for table `assoc_j_e`
--

DROP TABLE IF EXISTS `assoc_j_e`;
CREATE TABLE IF NOT EXISTS `assoc_j_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `date_entree` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_equipe` (`id_equipe`),
  KEY `id_joueur` (`id_joueur`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assoc_j_e`
--

INSERT INTO `assoc_j_e` (`id`, `id_joueur`, `id_equipe`, `date_entree`) VALUES
(1, 1, 8, '2007-07-01'),
(2, 2, 8, '2017-07-13'),
(3, 3, 8, '2015-07-06'),
(4, 4, 8, '2010-07-01'),
(5, 5, 8, '2017-01-18'),
(6, 6, 8, '2013-07-03'),
(7, 7, 8, '2015-02-02'),
(8, 8, 7, '2014-03-12'),
(9, 9, 7, '2000-02-15'),
(10, 10, 7, '2012-09-14'),
(11, 11, 7, '2009-07-23'),
(12, 12, 7, '2015-08-19'),
(13, 13, 7, '2008-04-12'),
(14, 14, 7, '2007-05-11'),
(15, 15, 6, '2014-03-12'),
(16, 16, 6, '2000-02-15'),
(17, 17, 6, '2012-09-05'),
(18, 18, 6, '2009-10-09'),
(19, 19, 6, '2017-09-16'),
(20, 20, 6, '2014-11-12'),
(21, 21, 6, '2015-07-13'),
(22, 22, 5, '2012-03-12'),
(23, 23, 5, '2001-03-13'),
(24, 24, 5, '2012-09-16'),
(25, 25, 5, '2012-10-22'),
(26, 26, 4, '2014-03-17'),
(27, 27, 4, '2016-01-18'),
(28, 28, 3, '2018-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `assoc_j_n`
--

DROP TABLE IF EXISTS `assoc_j_n`;
CREATE TABLE IF NOT EXISTS `assoc_j_n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur` int(11) NOT NULL,
  `id_nationalite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_joueur` (`id_joueur`),
  KEY `id_nationalite` (`id_nationalite`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assoc_j_n`
--

INSERT INTO `assoc_j_n` (`id`, `id_joueur`, `id_nationalite`) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 7, 2),
(4, 6, 1),
(5, 2, 1),
(6, 5, 1),
(7, 3, 1),
(17, 8, 7),
(18, 9, 8),
(19, 9, 1),
(20, 10, 3),
(21, 11, 1),
(22, 11, 2),
(23, 12, 1),
(24, 12, 6),
(25, 13, 9),
(26, 14, 10),
(27, 14, 1),
(28, 15, 1),
(29, 16, 1),
(30, 17, 1),
(31, 18, 1),
(32, 19, 1),
(33, 20, 1),
(34, 20, 4),
(35, 21, 1),
(36, 22, 1),
(37, 23, 1),
(38, 24, 1),
(39, 24, 2),
(40, 25, 1),
(41, 25, 3),
(42, 26, 5),
(43, 26, 6),
(44, 26, 7),
(45, 27, 3),
(46, 28, 5);

-- --------------------------------------------------------

--
-- Table structure for table `buts`
--

DROP TABLE IF EXISTS `buts`;
CREATE TABLE IF NOT EXISTS `buts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rencontre` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `minute_but` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_joueur` (`id_joueur`),
  KEY `id_rencontre` (`id_rencontre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buts`
--

INSERT INTO `buts` (`id`, `id_rencontre`, `id_joueur`, `minute_but`) VALUES
(1, 1, 25, 45),
(2, 1, 26, 12),
(3, 1, 25, 78),
(4, 2, 26, 87),
(5, 3, 28, 56),
(6, 4, 17, 53),
(7, 4, 18, 89),
(8, 5, 13, 9),
(9, 6, 20, 67),
(10, 6, 16, 67),
(11, 7, 21, 3),
(12, 8, 21, 14),
(13, 8, 21, 18),
(14, 8, 21, 44),
(15, 9, 13, 79),
(16, 10, 6, 67),
(17, 10, 7, 71),
(18, 11, 3, 14);

-- --------------------------------------------------------

--
-- Table structure for table `cartons`
--

DROP TABLE IF EXISTS `cartons`;
CREATE TABLE IF NOT EXISTS `cartons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cartons`
--

INSERT INTO `cartons` (`id`, `nom`) VALUES
(1, 'Jaune'),
(2, 'Rouge');

-- --------------------------------------------------------

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
CREATE TABLE IF NOT EXISTS `equipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `date_creation` date NOT NULL,
  `budget` double(20,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipes`
--

INSERT INTO `equipes` (`id`, `nom`, `date_creation`, `budget`) VALUES
(1, 'Stade Rennais', '1901-03-10', 68000000.00),
(2, 'Girondins de Bordeaux', '1881-01-01', 70000000.00),
(3, 'FC Nantes', '1943-01-01', 60000000.00),
(4, 'LOSC', '1944-11-23', 90000000.00),
(5, 'AS Saint-Étienne', '1919-01-01', 74000000.00),
(6, 'PSG', '1970-08-12', 500000000.00),
(7, 'AS Monaco', '1919-08-01', 200000000.00),
(8, 'OM', '1899-08-31', 160000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
CREATE TABLE IF NOT EXISTS `joueurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `date_naissance` date NOT NULL,
  `taille` int(11) NOT NULL,
  `poste` enum('Gardien','Défense','Milieu','Attaque') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joueurs`
--

INSERT INTO `joueurs` (`id`, `nom`, `prenom`, `date_naissance`, `taille`, `poste`) VALUES
(1, 'Mandanda', 'Steve', '1985-03-28', 185, 'Gardien'),
(2, 'Rami', 'Adil', '1985-12-27', 190, 'Défense'),
(3, 'Sarr', 'Bouna', '1992-01-31', 177, 'Défense'),
(4, 'Lopez', 'Maxime', '1997-12-04', 167, 'Milieu'),
(5, 'Sanson', 'Morgan', '1994-08-18', 180, 'Milieu'),
(6, 'Payet', 'Dimitri', '1987-03-29', 175, 'Attaque'),
(7, 'Ocampos', 'Lucas', '1994-07-11', 187, 'Attaque'),
(8, 'Subasic', 'Danijel', '1984-10-27', 191, 'Gardien'),
(9, 'Badiashile', 'Benoit', '2001-03-26', 194, 'Défense'),
(10, 'Glik', 'Kamil', '1988-02-03', 188, 'Défense'),
(11, 'Vainqueur', 'William', '1988-11-19', 169, 'Milieu'),
(12, 'Silva', 'Adrien', '1989-03-15', 187, 'Milieu'),
(13, 'Pellegri', 'Pietro', '2001-03-17', 176, 'Attaque'),
(14, 'Sylla', 'Moussa', '1999-11-25', 186, 'Attaque'),
(15, 'Areola', 'Alphonse', '1988-02-03', 189, 'Gardien'),
(16, 'Presnel', 'Kimpembe', '1997-11-09', 165, 'Défense'),
(17, 'Alves', 'Daniel', '2001-03-01', 179, 'Défense'),
(18, 'Rabiot', 'Adrien', '1990-03-19', 167, 'Milieu'),
(19, 'Diana', 'Lassana', '1992-03-13', 196, 'Milieu'),
(20, 'Diaby', 'Moussa', '1999-09-25', 174, 'Attaque'),
(21, 'Mbappé', 'Kylian', '2001-03-22', 186, 'Attaque'),
(22, 'Ruffier', 'Stephane', '1988-02-19', 189, 'Gardien'),
(23, 'Perrin', 'Loic', '1998-11-12', 176, 'Défense'),
(24, 'Hamouma', 'Romain', '1999-07-22', 178, 'Attaque'),
(25, 'Diony', 'Lois', '1998-03-21', 182, 'Attaque'),
(26, 'Soumaoro', 'Adama', '1997-03-14', 198, 'Défense'),
(27, 'Fonte', 'Rui', '1998-01-12', 182, 'Attaque'),
(28, 'Tatarusanu', 'Ciprian', '1992-04-29', 178, 'Gardien');

-- --------------------------------------------------------

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
CREATE TABLE IF NOT EXISTS `nationalite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nationalite`
--

INSERT INTO `nationalite` (`id`, `nom`) VALUES
(1, 'France'),
(2, 'Argentine'),
(3, 'Allemagne'),
(4, 'Etats-Unis'),
(5, 'Anglaise'),
(6, 'Espagnol'),
(7, 'Croatie'),
(8, 'Congo'),
(9, 'Italie'),
(10, 'Mali'),
(11, 'Portugais');

-- --------------------------------------------------------

--
-- Table structure for table `rencontres`
--

DROP TABLE IF EXISTS `rencontres`;
CREATE TABLE IF NOT EXISTS `rencontres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipe_exterieur` int(11) NOT NULL,
  `equipe_domicile` int(11) NOT NULL,
  `date_match` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipe_domicile` (`equipe_domicile`),
  KEY `equipe_exterieur` (`equipe_exterieur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rencontres`
--

INSERT INTO `rencontres` (`id`, `equipe_exterieur`, `equipe_domicile`, `date_match`) VALUES
(1, 5, 4, '2018-12-28'),
(2, 4, 5, '2018-10-13'),
(3, 5, 3, '2012-05-13'),
(4, 5, 6, '2011-12-29'),
(5, 5, 7, '2009-01-12'),
(6, 7, 6, '2012-12-16'),
(7, 1, 6, '2006-08-12'),
(8, 4, 6, '2019-01-28'),
(9, 7, 6, '2012-12-16'),
(10, 8, 7, '2017-10-21'),
(11, 7, 8, '2018-04-11');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assoc_j_c`
--
ALTER TABLE `assoc_j_c`
  ADD CONSTRAINT `assoc_j_c_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_j_c_ibfk_2` FOREIGN KEY (`id_rencontre`) REFERENCES `rencontres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_j_c_ibfk_3` FOREIGN KEY (`id_carton`) REFERENCES `cartons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assoc_j_e`
--
ALTER TABLE `assoc_j_e`
  ADD CONSTRAINT `assoc_j_e_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_j_e_ibfk_2` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assoc_j_n`
--
ALTER TABLE `assoc_j_n`
  ADD CONSTRAINT `assoc_j_n_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_j_n_ibfk_2` FOREIGN KEY (`id_nationalite`) REFERENCES `nationalite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buts`
--
ALTER TABLE `buts`
  ADD CONSTRAINT `buts_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buts_ibfk_2` FOREIGN KEY (`id_rencontre`) REFERENCES `rencontres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rencontres`
--
ALTER TABLE `rencontres`
  ADD CONSTRAINT `rencontres_ibfk_1` FOREIGN KEY (`equipe_domicile`) REFERENCES `equipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rencontres_ibfk_2` FOREIGN KEY (`equipe_exterieur`) REFERENCES `equipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
