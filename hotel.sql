-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2021 at 03:01 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `ospiti`
--

CREATE TABLE `ospiti` (
  `ospite_ID` int(11) NOT NULL,
  `ospite_nome` varchar(40) NOT NULL,
  `ospite_cognome` varchar(40) NOT NULL,
  `ospite_codice_fiscale` varchar(20) NOT NULL,
  `ospite_data_di_nascita` date NOT NULL,
  `ospite_nazionalità` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospiti_prenotazioni`
--

CREATE TABLE `ospiti_prenotazioni` (
  `fk_ospite_ID` int(11) DEFAULT NULL,
  `fk_pren_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `pren_ID` int(11) NOT NULL,
  `pren_check_in` datetime NOT NULL,
  `pren_check_out` datetime NOT NULL,
  `pren_prezzo` decimal(8,2) NOT NULL,
  `pren_richieste_speciali` text,
  `fk_stanza_ID_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stanze`
--

CREATE TABLE `stanze` (
  `stanza_ID` int(11) NOT NULL,
  `stanza_numero` int(11) NOT NULL,
  `stanza_posti` tinyint(4) NOT NULL,
  `stanza_mq` tinyint(4) DEFAULT NULL,
  `stanza_servizi` text,
  `stanza_tipo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ospiti`
--
ALTER TABLE `ospiti`
  ADD PRIMARY KEY (`ospite_ID`);

--
-- Indexes for table `ospiti_prenotazioni`
--
ALTER TABLE `ospiti_prenotazioni`
  ADD KEY `fk_ospite_ID` (`fk_ospite_ID`),
  ADD KEY `fk_pren_ID` (`fk_pren_ID`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`pren_ID`),
  ADD KEY `fk_stanza_ID_2` (`fk_stanza_ID_2`);

--
-- Indexes for table `stanze`
--
ALTER TABLE `stanze`
  ADD PRIMARY KEY (`stanza_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ospiti`
--
ALTER TABLE `ospiti`
  MODIFY `ospite_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `pren_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stanze`
--
ALTER TABLE `stanze`
  MODIFY `stanza_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ospiti_prenotazioni`
--
ALTER TABLE `ospiti_prenotazioni`
  ADD CONSTRAINT `ospiti_prenotazioni_ibfk_1` FOREIGN KEY (`fk_ospite_ID`) REFERENCES `ospiti` (`ospite_ID`),
  ADD CONSTRAINT `ospiti_prenotazioni_ibfk_2` FOREIGN KEY (`fk_pren_ID`) REFERENCES `prenotazioni` (`pren_ID`);

--
-- Constraints for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`fk_stanza_ID_2`) REFERENCES `stanze` (`stanza_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
