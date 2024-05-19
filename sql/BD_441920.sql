-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2024 at 10:18 PM
-- Server version: 11.3.2-MariaDB
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BD_441920`
--

-- --------------------------------------------------------

--
-- Table structure for table `colis`
--

CREATE TABLE `colis` (
  `idColis` int(11) NOT NULL,
  `dateColis` datetime NOT NULL,
  `fragile` char(1) NOT NULL,
  `etat` int(11) NOT NULL DEFAULT 0,
  `cinExp` varchar(8) NOT NULL,
  `cinTrans` varchar(5) NOT NULL,
  `teldest` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `destinataire`
--

CREATE TABLE `destinataire` (
  `teldest` varchar(8) NOT NULL,
  `nomDest` varchar(100) NOT NULL,
  `adrDest` varchar(100) NOT NULL,
  `codePostal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expediteur`
--

CREATE TABLE `expediteur` (
  `cinExp` varchar(8) NOT NULL,
  `nomExp` varchar(100) NOT NULL,
  `telExp` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expediteur`
--

INSERT INTO `expediteur` (`cinExp`, `nomExp`, `telExp`) VALUES
('12233445', 'Nejia Missaoui', '56565656'),
('12345678', 'Mohamed ben salah', '24242424');

-- --------------------------------------------------------

--
-- Table structure for table `transporteur`
--

CREATE TABLE `transporteur` (
  `idTrans` varchar(5) NOT NULL,
  `nomTrans` varchar(100) NOT NULL,
  `telTrans` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transporteur`
--

INSERT INTO `transporteur` (`idTrans`, `nomTrans`, `telTrans`) VALUES
('AE512', 'FastColis', '22333444'),
('B2355', 'RapideLiv', '99111222'),
('BC542', 'Express Service', '55666777');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colis`
--
ALTER TABLE `colis`
  ADD PRIMARY KEY (`idColis`),
  ADD KEY `cinExp` (`cinExp`),
  ADD KEY `idTrans` (`cinTrans`),
  ADD KEY `cindest` (`teldest`);

--
-- Indexes for table `destinataire`
--
ALTER TABLE `destinataire`
  ADD PRIMARY KEY (`teldest`);

--
-- Indexes for table `expediteur`
--
ALTER TABLE `expediteur`
  ADD PRIMARY KEY (`cinExp`);

--
-- Indexes for table `transporteur`
--
ALTER TABLE `transporteur`
  ADD PRIMARY KEY (`idTrans`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colis`
--
ALTER TABLE `colis`
  MODIFY `idColis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `colis`
--
ALTER TABLE `colis`
  ADD CONSTRAINT `colis_ibfk_1` FOREIGN KEY (`cinTrans`) REFERENCES `transporteur` (`idTrans`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colis_ibfk_2` FOREIGN KEY (`cinExp`) REFERENCES `expediteur` (`cinExp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colis_ibfk_3` FOREIGN KEY (`teldest`) REFERENCES `destinataire` (`teldest`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
