-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2022 at 08:33 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab-inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `BorrowID` char(5) NOT NULL,
  `Username` char(30) NOT NULL,
  `ItemID` char(5) NOT NULL,
  `QuantityBorrow` int(2) NOT NULL,
  `DurationBorrow` date NOT NULL,
  `DescriptionBorrow` text NOT NULL,
  `TimestampBorrow` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` char(5) NOT NULL,
  `NameItem` varchar(40) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `BrandItem` varchar(20) NOT NULL,
  `QuantityItem` int(3) NOT NULL,
  `TypeItem` char(10) NOT NULL,
  `PictureItem` mediumblob DEFAULT NULL,
  `DescriptionItem` text NOT NULL,
  `TimestampItem` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ProjectID` char(5) NOT NULL,
  `ProjectName` varchar(40) NOT NULL,
  `ProjectPicture` mediumblob NOT NULL,
  `Username` char(30) NOT NULL,
  `CreatedDate` date NOT NULL,
  `FileType` char(8) NOT NULL,
  `File` longblob NOT NULL,
  `Description` text NOT NULL,
  `TimestampProject` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` char(30) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UserPicture` mediumblob NOT NULL,
  `Position` char(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `PhoneNumber` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`BorrowID`),
  ADD KEY `ItemID FK` (`ItemID`),
  ADD KEY `Username FK Borrow` (`Username`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `Username FK Item` (`Username`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `Username FK` (`Username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `ItemID FK` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`),
  ADD CONSTRAINT `Username FK Borrow` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `Username FK Item` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `Username FK` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
