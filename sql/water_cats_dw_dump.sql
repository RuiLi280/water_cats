-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2018 at 11:45 PM
-- Server version: 5.7.19-log
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `water_cats_dw`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `CalendarKey` int(11) NOT NULL,
  `FullDate` date NOT NULL,
  `DayOfWeek` varchar(10) NOT NULL,
  `DayOfMonth` int(11) NOT NULL,
  `Month` varchar(10) NOT NULL,
  `Quarter` varchar(2) NOT NULL,
  `Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`CalendarKey`, `FullDate`, `DayOfWeek`, `DayOfMonth`, `Month`, `Quarter`, `Year`) VALUES
(1, '2018-03-01', 'Thursday', 1, 'March', 'Q1', 2018),
(2, '2018-03-02', 'Friday', 2, 'March', 'Q1', 2018),
(3, '2018-03-05', 'Monday', 5, 'March', 'Q1', 2018),
(4, '2018-03-06', 'Tuesday', 6, 'March', 'Q1', 2018),
(5, '2018-03-07', 'Wednesday', 7, 'March', 'Q1', 2018),
(6, '2018-01-07', 'Monday', 7, 'January', 'Q1', 2018),
(7, '2018-01-08', 'Tuesday', 8, 'January', 'Q1', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PersonKey` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Specialization` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PersonKey`, `PersonID`, `FirstName`, `LastName`, `Specialization`, `Email`) VALUES
(1, 1, 'Jason', 'Kelly', 'Project Management', 'jasonk@example.com'),
(2, 2, 'Arthur', 'Patterson', 'Front-end', 'arthurp@example.com'),
(3, 3, 'Juan', 'Jones', 'Quality Assurance', 'juanj@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `progressproject`
--

CREATE TABLE `progressproject` (
  `TaskComplete` int(11) NOT NULL,
  `TotalTask` int(11) NOT NULL,
  `ProjectKey` int(11) NOT NULL,
  `TaskKey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `progressproject`
--

INSERT INTO `progressproject` (`TaskComplete`, `TotalTask`, `ProjectKey`, `TaskKey`) VALUES
(10, 15, 1, 2),
(14, 20, 1, 1),
(2, 22, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `progresstask`
--

CREATE TABLE `progresstask` (
  `Status` int(11) NOT NULL,
  `TimeOfDay` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TaskComplete` int(11) NOT NULL,
  `CalendarKey` int(11) NOT NULL,
  `PersonKey` int(11) NOT NULL,
  `TaskKey` int(11) NOT NULL,
  `ProjectKey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `progresstask`
--

INSERT INTO `progresstask` (`Status`, `TimeOfDay`, `TaskComplete`, `CalendarKey`, `PersonKey`, `TaskKey`, `ProjectKey`) VALUES
(1, '2018-03-01 18:10:10', 1, 1, 1, 1, 2),
(1, '2018-03-01 18:10:10', 1, 1, 2, 2, 2),
(1, '2018-03-02 20:01:00', 1, 2, 1, 3, 2),
(1, '2018-03-05 18:10:10', 1, 3, 3, 4, 3),
(1, '2018-01-07 18:10:10', 1, 6, 3, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ProjectKey` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(20) NOT NULL,
  `Category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectKey`, `ProjectID`, `ProjectName`, `Category`) VALUES
(1, 1, 'Kitty Farm', 'DBMS'),
(2, 2, 'SeaS', 'Web'),
(3, 3, 'Jello', 'Mobile Application');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `TaskKey` int(11) NOT NULL,
  `TaskID` int(11) NOT NULL,
  `TaskPriority` int(11) NOT NULL,
  `TaskType` varchar(20) NOT NULL,
  `TeamName` varchar(20) NOT NULL,
  `BoardName` varchar(20) NOT NULL,
  `TeamFocus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`TaskKey`, `TaskID`, `TaskPriority`, `TaskType`, `TeamName`, `BoardName`, `TeamFocus`) VALUES
(1, 1, 1, 'Setup', 'CATS', 'CATS', 'Database Management'),
(2, 2, 1, 'Code review', 'SATC', 'SATC', 'Front-end'),
(3, 3, 1, 'Implementation', 'TACS', 'TACS', 'Quality Assurance'),
(4, 4, 1, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(5, 5, 1, 'Implementation', 'TACS', 'TACS', 'Front-end');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`CalendarKey`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PersonKey`);

--
-- Indexes for table `progressproject`
--
ALTER TABLE `progressproject`
  ADD KEY `ProjectKey` (`ProjectKey`),
  ADD KEY `TaskKey` (`TaskKey`);

--
-- Indexes for table `progresstask`
--
ALTER TABLE `progresstask`
  ADD KEY `CalendarKey` (`CalendarKey`),
  ADD KEY `PersonKey` (`PersonKey`),
  ADD KEY `TaskKey` (`TaskKey`),
  ADD KEY `ProjectKey` (`ProjectKey`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ProjectKey`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`TaskKey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `CalendarKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `PersonKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `TaskKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `progressproject`
--
ALTER TABLE `progressproject`
  ADD CONSTRAINT `progressproject_ibfk_1` FOREIGN KEY (`ProjectKey`) REFERENCES `project` (`ProjectKey`),
  ADD CONSTRAINT `progressproject_ibfk_2` FOREIGN KEY (`TaskKey`) REFERENCES `task` (`TaskKey`);

--
-- Constraints for table `progresstask`
--
ALTER TABLE `progresstask`
  ADD CONSTRAINT `progresstask_ibfk_1` FOREIGN KEY (`CalendarKey`) REFERENCES `calendar` (`CalendarKey`),
  ADD CONSTRAINT `progresstask_ibfk_2` FOREIGN KEY (`PersonKey`) REFERENCES `person` (`PersonKey`),
  ADD CONSTRAINT `progresstask_ibfk_3` FOREIGN KEY (`TaskKey`) REFERENCES `task` (`TaskKey`),
  ADD CONSTRAINT `progresstask_ibfk_4` FOREIGN KEY (`ProjectKey`) REFERENCES `project` (`ProjectKey`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
