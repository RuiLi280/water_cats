-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2018 at 10:34 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`CalendarKey`, `FullDate`, `DayOfWeek`, `DayOfMonth`, `Month`, `Quarter`, `Year`) VALUES
(1, '2018-01-08', 'Monday', 8, 'January', 'Q1', 2018),
(2, '2018-01-09', 'Tuesday', 9, 'January', 'Q1', 2018),
(3, '2018-01-10', 'Wednesday', 10, 'January', 'Q1', 2018),
(4, '2018-01-11', 'Thursday', 11, 'January', 'Q1', 2018),
(5, '2018-01-12', 'Friday', 12, 'January', 'Q1', 2018),
(6, '2018-02-05', 'Monday', 5, 'February', 'Q1', 2018),
(7, '2018-02-06', 'Tuesday', 6, 'February', 'Q1', 2018),
(8, '2018-02-07', 'Wednesday', 7, 'February', 'Q1', 2018),
(9, '2018-02-08', 'Thursday', 8, 'February', 'Q1', 2018),
(10, '2018-02-09', 'Friday', 9, 'February', 'Q1', 2018),
(11, '2018-03-05', 'Monday', 5, 'March', 'Q1', 2018),
(12, '2018-03-06', 'Tuesday', 6, 'March', 'Q1', 2018),
(13, '2018-03-07', 'Wednesday', 7, 'March', 'Q1', 2018),
(14, '2018-03-08', 'Thursday', 8, 'March', 'Q1', 2018),
(15, '2018-03-09', 'Friday', 9, 'March', 'Q1', 2018),
(16, '2018-04-02', 'Monday', 2, 'April', 'Q2', 2018),
(17, '2018-04-03', 'Tuesday', 3, 'April', 'Q2', 2018),
(18, '2018-04-04', 'Wednesday', 4, 'April', 'Q2', 2018),
(19, '2018-04-05', 'Thursday', 5, 'April', 'Q2', 2018),
(20, '2018-04-06', 'Friday', 6, 'April', 'Q2', 2018),
(21, '2018-05-07', 'Monday', 7, 'May', 'Q2', 2018),
(22, '2018-05-08', 'Tuesday', 8, 'May', 'Q2', 2018),
(23, '2018-05-09', 'Wednesday', 9, 'May', 'Q2', 2018),
(24, '2018-05-10', 'Thursday', 10, 'May', 'Q2', 2018),
(25, '2018-05-11', 'Friday', 11, 'May', 'Q2', 2018),
(26, '2018-06-04', 'Monday', 4, 'June', 'Q2', 2018),
(27, '2018-06-05', 'Tuesday', 5, 'June', 'Q2', 2018),
(28, '2018-06-06', 'Wednesday', 6, 'June', 'Q2', 2018),
(29, '2018-06-07', 'Thursday', 7, 'June', 'Q2', 2018),
(30, '2018-06-08', 'Friday', 8, 'June', 'Q2', 2018),
(31, '2018-07-02', 'Monday', 2, 'July', 'Q3', 2018),
(32, '2018-07-03', 'Tuesday', 3, 'July', 'Q3', 2018),
(33, '2018-07-04', 'Wednesday', 4, 'July', 'Q3', 2018),
(34, '2018-07-05', 'Thursday', 5, 'July', 'Q3', 2018),
(35, '2018-07-06', 'Friday', 6, 'July', 'Q3', 2018),
(36, '2018-08-06', 'Monday', 6, 'August', 'Q3', 2018),
(37, '2018-08-07', 'Tuesday', 7, 'August', 'Q3', 2018),
(38, '2018-08-08', 'Wednesday', 8, 'August', 'Q3', 2018),
(39, '2018-08-09', 'Thursday', 9, 'August', 'Q3', 2018),
(40, '2018-08-10', 'Friday', 10, 'August', 'Q3', 2018),
(41, '2018-09-03', 'Monday', 3, 'September', 'Q3', 2018),
(42, '2018-09-04', 'Tuesday', 4, 'September', 'Q3', 2018),
(43, '2018-09-05', 'Wednesday', 5, 'September', 'Q3', 2018),
(44, '2018-09-06', 'Thursday', 6, 'September', 'Q3', 2018),
(45, '2018-09-07', 'Friday', 7, 'September', 'Q3', 2018),
(46, '2018-10-01', 'Monday', 1, 'October', 'Q4', 2018),
(47, '2018-10-02', 'Tuesday', 2, 'October', 'Q4', 2018),
(48, '2018-10-03', 'Wednesday', 3, 'October', 'Q4', 2018),
(49, '2018-10-04', 'Thursday', 4, 'October', 'Q4', 2018),
(50, '2018-10-05', 'Friday', 5, 'October', 'Q4', 2018),
(51, '2018-11-05', 'Monday', 5, 'November', 'Q4', 2018),
(52, '2018-11-06', 'Tuesday', 6, 'November', 'Q4', 2018),
(53, '2018-11-07', 'Wednesday', 7, 'November', 'Q4', 2018),
(54, '2018-11-08', 'Thursday', 8, 'November', 'Q4', 2018),
(55, '2018-11-09', 'Friday', 9, 'November', 'Q4', 2018),
(56, '2018-11-03', 'Monday', 3, 'December', 'Q4', 2018),
(57, '2018-11-04', 'Tuesday', 4, 'December', 'Q4', 2018),
(58, '2018-11-05', 'Wednesday', 5, 'December', 'Q4', 2018),
(59, '2018-11-06', 'Thursday', 6, 'December', 'Q4', 2018),
(60, '2018-11-07', 'Friday', 7, 'December', 'Q4', 2018);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PersonKey`, `PersonID`, `FirstName`, `LastName`, `Specialization`, `Email`) VALUES
(1, 1, 'Jason', 'Kelly', 'Project Management', 'jasonk@example.com'),
(2, 2, 'Arthur', 'Patterson', 'Front-end', 'arthurp@example.com'),
(3, 3, 'Mac', 'chiato', 'Back-end', 'mcchiato@example.com'),
(4, 4, 'Frap', 'pucino', 'Back-end', 'fpucino@example.com'),
(5, 5, 'Cap', 'pucino', 'Quality Assurance', 'cpucino@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `progressproject`
--

CREATE TABLE `progressproject` (
  `TaskComplete` int(11) NOT NULL,
  `TotalTask` int(11) NOT NULL,
  `ProjectKey` int(11) NOT NULL,
  `TaskKey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `progresstask`
--

INSERT INTO `progresstask` (`Status`, `TimeOfDay`, `TaskComplete`, `CalendarKey`, `PersonKey`, `TaskKey`, `ProjectKey`) VALUES
(1, '2018-03-05 18:10:10', 1, 11, 1, 1, 3),
(0, '2018-03-05 18:10:10', 0, 11, 2, 1, 2),
(1, '2018-03-05 20:01:00', 1, 11, 3, 2, 1),
(0, '2018-03-06 18:10:10', 0, 12, 4, 2, 5),
(1, '2018-03-06 18:10:10', 1, 12, 5, 3, 13),
(0, '2018-03-07 18:10:10', 0, 13, 1, 3, 2),
(1, '2018-03-08 18:10:10', 1, 14, 2, 4, 1),
(0, '2018-03-08 18:10:10', 0, 14, 3, 4, 3),
(1, '2018-03-08 18:10:10', 1, 14, 4, 5, 14),
(1, '2018-05-07 17:10:10', 1, 21, 5, 6, 7),
(0, '2018-05-07 17:10:10', 0, 21, 1, 6, 10),
(1, '2018-05-07 19:01:00', 1, 21, 2, 7, 9),
(0, '2018-05-08 17:10:10', 0, 22, 3, 7, 13),
(1, '2018-05-09 17:10:10', 1, 23, 4, 8, 12),
(0, '2018-05-09 17:10:10', 0, 23, 5, 8, 11),
(1, '2018-05-10 17:10:10', 1, 24, 1, 9, 3),
(0, '2018-05-11 17:10:10', 0, 25, 2, 9, 3),
(1, '2018-05-07 17:10:10', 1, 21, 3, 10, 5),
(0, '2018-05-07 17:10:10', 0, 21, 4, 10, 1),
(1, '2018-05-07 17:10:10', 1, 21, 5, 11, 6),
(0, '2018-05-08 17:10:10', 0, 22, 1, 12, 14),
(1, '2018-05-11 17:10:10', 1, 25, 2, 13, 1),
(0, '2018-05-11 17:10:10', 0, 25, 3, 13, 7),
(1, '2018-05-10 17:10:10', 1, 24, 4, 13, 8),
(0, '2018-05-08 17:10:10', 0, 22, 5, 24, 3),
(1, '2018-05-07 17:10:10', 1, 21, 1, 20, 1),
(0, '2018-01-09 18:10:10', 0, 2, 5, 16, 10),
(1, '2018-01-09 18:10:10', 1, 2, 3, 17, 9),
(1, '2018-08-08 17:10:10', 1, 38, 1, 18, 7),
(1, '2018-08-07 17:10:10', 1, 37, 5, 19, 5),
(0, '2018-12-05 18:10:10', 0, 58, 5, 22, 1),
(1, '2018-12-03 18:10:10', 1, 56, 3, 25, 2),
(1, '2018-12-04 18:10:10', 1, 57, 5, 28, 10),
(1, '2018-12-04 18:10:10', 1, 57, 3, 29, 9),
(1, '2018-07-02 17:10:10', 1, 31, 2, 30, 11),
(0, '2018-07-06 17:10:10', 0, 35, 1, 31, 14);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ProjectKey` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(20) NOT NULL,
  `Category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectKey`, `ProjectID`, `ProjectName`, `Category`) VALUES
(1, 1, 'Kitty Farm', 'DBMS'),
(2, 2, 'Duck Farm', 'DBMS'),
(3, 3, 'SeaS', 'Web'),
(4, 4, 'LakeS', 'Web'),
(5, 5, 'OceanS', 'Web'),
(6, 6, 'RiverS', 'Web'),
(7, 7, 'StreamS', 'Web'),
(8, 8, 'Jello', 'Mobile Application'),
(9, 9, 'Pillow', 'Mobile Application'),
(10, 10, 'Business Bucks', 'BI Application'),
(11, 11, 'Star Intelligence', 'BI Application'),
(12, 12, 'Mocha Marketing', 'Marketing'),
(13, 13, 'Ron', 'Compiler'),
(14, 14, 'Mak', 'Compiler');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`TaskKey`, `TaskID`, `TaskPriority`, `TaskType`, `TeamName`, `BoardName`, `TeamFocus`) VALUES
(1, 1, 1, 'Setup', 'A', 'A', 'Database Management'),
(2, 2, 1, 'Setup', 'B', 'B', 'Database Management'),
(3, 3, 1, 'Setup', 'C', 'C', 'Front-end'),
(4, 4, 1, 'Setup', 'D', 'D', 'Quality Assurance'),
(5, 5, 1, 'Implementation', 'A', 'A', 'Database Management'),
(6, 6, 2, 'Implementation', 'B', 'B', 'Database Management'),
(7, 7, 1, 'Implementation', 'C', 'C', 'Front-end'),
(8, 8, 3, 'Implementation', 'D', 'D', 'Quality Assurance'),
(9, 9, 1, 'Implementation', 'E', 'E', 'Back-end'),
(10, 10, 1, 'Setup', 'F', 'F', 'Full-stack'),
(11, 11, 1, 'Setup', 'A', 'A', 'Database Management'),
(12, 12, 2, 'Code review', 'G', 'G', 'Front-end'),
(13, 13, 1, 'Implementation', 'B', 'B', 'Database Management'),
(14, 14, 2, 'Implementation', 'D', 'D', 'Quality Assurance'),
(15, 15, 4, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(16, 16, 1, 'Setup', 'TACS', 'TACS', 'Front-end'),
(17, 17, 1, 'Setup', 'TACS', 'TACS', 'Front-end'),
(18, 18, 2, 'Code review', 'SATC', 'SATC', 'Front-end'),
(19, 19, 1, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(20, 20, 2, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(21, 21, 2, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(22, 22, 1, 'Setup', 'A', 'A', 'Database Management'),
(23, 23, 1, 'Setup', 'B', 'B', 'Database Management'),
(24, 24, 2, 'Code review', 'SATC', 'SATC', 'Front-end'),
(25, 25, 1, 'Implementation', 'D', 'D', 'Quality Assurance'),
(26, 26, 2, 'Implementation', 'C', 'C', 'Front-end'),
(27, 27, 2, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(28, 28, 1, 'Setup', 'G', 'G', 'Front-end'),
(29, 29, 1, 'Setup', 'G', 'G', 'Front-end'),
(30, 30, 2, 'Code review', 'SATC', 'SATC', 'Front-end'),
(31, 31, 1, 'Implementation', 'TACS', 'TACS', 'Front-end'),
(32, 32, 2, 'Implementation', 'TACS', 'TACS', 'Front-end');

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
  MODIFY `CalendarKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `PersonKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `TaskKey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
