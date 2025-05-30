-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2025 at 09:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sherkat`
--

-- --------------------------------------------------------

--
-- Table structure for table `bakhsh`
--

CREATE TABLE `bakhsh` (
  `dcode` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mgrcode` int(4) NOT NULL,
  `mgrsdate` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `bakhsh`
--

INSERT INTO `bakhsh` (`dcode`, `name`, `mgrcode`, `mgrsdate`) VALUES
(100, 'IT', 1, '1403'),
(101, 'App_mobile', 2, '1403'),
(102, 'app_Wim', 3, '1400'),
(103, 'web_design', 4, '1399');

-- --------------------------------------------------------

--
-- Table structure for table `karmandan`
--

CREATE TABLE `karmandan` (
  `code` int(4) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `bdate` int(4) NOT NULL,
  `addrees` text DEFAULT NULL,
  `dcode` int(4) NOT NULL,
  `supercode` int(4) DEFAULT NULL,
  `salary` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `karmandan`
--

INSERT INTO `karmandan` (`code`, `fn`, `ln`, `bdate`, `addrees`, `dcode`, `supercode`, `salary`) VALUES
(1, 'alireza', 'safarzadeh', 1382, 'mdbfbfghjgfh', 100, NULL, '100000'),
(2, 'sajjad', 'salari', 1382, 'hkjbdgkjfedhbfhejndbfhj', 101, NULL, '100000'),
(3, 'mohammad', 'feyz', 1385, 'jbfjbfhjfbjbfnfvfg', 102, NULL, '100000'),
(4, 'ali', 'penhani', 1384, 'lnrkmdfnbfdfbjkdx', 103, NULL, '100000'),
(5, 'asghar', 'akbari', 1382, 'mbfgnmgjngmnm', 100, 2, '50000'),
(6, 'akbar', 'asghari', 1372, 'tnsrkjnkjefhdjgh', 101, 3, '80000'),
(7, 'leyla', 'ahmadi', 1379, 'nnnmgmgkgmgngngjkr', 103, 4, '8500'),
(8, 'hasan', 'alizadeh', 1386, 'dbhfbgkhjghjgbjgbngmhgjg', 101, 2, '80000'),
(9, 'vavid', 'MDpour', 1383, 'hfhfvhjgf', 100, 1, '9000'),
(10, 'reza', 'moeinpour', 1382, 'jngnmbjgbjg', 100, 1, '90000'),
(11, 'sara', 'moeinpour', 1381, 'jngnmbjgbjg', 101, 2, '2000'),
(12, 'asal', 'mirzaei', 1375, 'fkjhgjhhgjgk', 102, 3, '10000'),
(13, 'rasol', 'zahedi', 1365, 'fkjhgjhhgjgk', 102, 3, '9000'),
(14, 'soheil', 'sohrabi', 1385, 'fkjhgjhhgjgk', 102, 3, '10000');

-- --------------------------------------------------------

--
-- Table structure for table `proje`
--

CREATE TABLE `proje` (
  `code` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `plocation` varchar(20) NOT NULL,
  `dcode` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `proje`
--

INSERT INTO `proje` (`code`, `name`, `plocation`, `dcode`) VALUES
(1000, 'winapp1', 'Neyshabur', 102),
(1001, 'hotelweb', 'Neyshabur', 103),
(1002, 'Security', 'Neyshabur', 100),
(1003, 'game1', 'Thran', 101),
(1005, 'Unity', 'Neyshabur', 101);

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `ecode` int(4) NOT NULL,
  `pcode` int(4) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`ecode`, `pcode`, `hours`) VALUES
(5, 1002, 95),
(6, 1000, 2),
(6, 1003, 20),
(7, 1001, 5),
(8, 1003, 9),
(9, 1002, 1),
(10, 1002, 60),
(11, 1003, 78),
(12, 1000, 45),
(13, 1000, 20),
(14, 1000, 57);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bakhsh`
--
ALTER TABLE `bakhsh`
  ADD PRIMARY KEY (`dcode`);

--
-- Indexes for table `karmandan`
--
ALTER TABLE `karmandan`
  ADD PRIMARY KEY (`code`),
  ADD KEY `dcode` (`dcode`),
  ADD KEY `fk_supercode` (`supercode`);

--
-- Indexes for table `proje`
--
ALTER TABLE `proje`
  ADD PRIMARY KEY (`code`),
  ADD KEY `dcode` (`dcode`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`ecode`,`pcode`),
  ADD KEY `pcode` (`pcode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karmandan`
--
ALTER TABLE `karmandan`
  ADD CONSTRAINT `fk_supercode` FOREIGN KEY (`supercode`) REFERENCES `karmandan` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `karmandan_ibfk_1` FOREIGN KEY (`dcode`) REFERENCES `bakhsh` (`dcode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proje`
--
ALTER TABLE `proje`
  ADD CONSTRAINT `proje_ibfk_1` FOREIGN KEY (`dcode`) REFERENCES `bakhsh` (`dcode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`ecode`) REFERENCES `karmandan` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `work_ibfk_2` FOREIGN KEY (`pcode`) REFERENCES `proje` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
