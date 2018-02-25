-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2018 at 05:21 AM
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
-- Database: `water_cats`
--

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `boardName` varchar(20) NOT NULL,
  `visibility` varchar(10) NOT NULL,
  `background` varchar(50) DEFAULT NULL,
  `teamID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`boardName`, `visibility`, `background`, `teamID`) VALUES
('CATS', 'Private', NULL, 1),
('GUI', 'Public', NULL, 7),
('Knapsack', 'Private', NULL, 6),
('SATC', 'Public', NULL, 2),
('TACS', 'Public', NULL, 3),
('TICTACS', 'Private', NULL, 4),
('Water', 'Private', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `includes`
--

CREATE TABLE `includes` (
  `teamID` int(11) NOT NULL,
  `personID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `includes`
--

INSERT INTO `includes` (`teamID`, `personID`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 7),
(2, 2),
(2, 5),
(2, 11),
(2, 13),
(3, 9),
(3, 15),
(4, 1),
(4, 7),
(4, 14),
(5, 5),
(5, 6),
(5, 9),
(5, 15),
(6, 4),
(6, 8),
(6, 11),
(6, 12),
(7, 2),
(7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `is_assigned`
--

CREATE TABLE `is_assigned` (
  `projectID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `is_assigned`
--

INSERT INTO `is_assigned` (`projectID`, `teamID`) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 1),
(2, 4),
(2, 6),
(3, 2),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personID` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` char(60) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personID`, `email`, `password`, `firstName`, `lastName`) VALUES
(1, 'jasonk@example.com', 'password', 'Jason', 'Kelly'),
(2, 'arthurp@example.com', 'password', 'Arthur', 'Patterson'),
(3, 'juanj@example.com', 'password', 'Juan', 'Jones'),
(4, 'janicej@example.com', 'password', 'Janice', 'Jenkins'),
(5, 'adama@example.com', 'password', 'Adam', 'Alexander'),
(6, 'robertn@example.com', 'password', 'Robert', 'Nelson'),
(7, 'carolyng@example.com', 'password', 'Carolyn', 'Green'),
(8, 'joyces@example.com', 'password', 'Joyce', 'Simmons'),
(9, 'amandab@example.com', 'password', 'Amanda', 'Butler'),
(10, 'dianah@example.com', 'password', 'Diana', 'Henderson'),
(11, 'carolp@example.com', 'password', 'Carol', 'Powell'),
(12, 'erict@example.com', 'password', 'Eric', 'Thompson'),
(13, 'heleng@example.com', 'password', 'Helen', 'Gray'),
(14, 'kathrynm@example.com', 'password', 'Kathryn', 'Moore'),
(15, 'amya@example.com', 'password', 'Amy', 'Allen');

-- --------------------------------------------------------

--
-- Table structure for table `person_specialization`
--

CREATE TABLE `person_specialization` (
  `specialization` varchar(20) NOT NULL,
  `personID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person_specialization`
--

INSERT INTO `person_specialization` (`specialization`, `personID`) VALUES
('Back-end', 4),
('Back-end', 7),
('Back-end', 8),
('Back-end', 12),
('Databases', 9),
('Databases', 15),
('Design', 10),
('Front-end', 2),
('Front-end', 5),
('Front-end', 13),
('Full-stack', 6),
('Full-stack', 11),
('IT', 14),
('Project Management', 1),
('Quality Assurance', 3);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectName` varchar(20) NOT NULL,
  `projectID` int(11) NOT NULL,
  `projectDescription` varchar(50) DEFAULT NULL,
  `projectDue` date DEFAULT NULL,
  `projectStatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectName`, `projectID`, `projectDescription`, `projectDue`, `projectStatus`) VALUES
('Kitty Farm', 1, 'Cat adoption center', '2018-03-14', 'Inactive'),
('SeaS', 2, 'Find water', '2018-02-17', 'Inactive'),
('Jello', 3, 'Trello hello', '2018-05-29', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE `project_category` (
  `category` varchar(20) NOT NULL,
  `projectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_category`
--

INSERT INTO `project_category` (`category`, `projectID`) VALUES
('DBMS', 1),
('Mobile Application', 3);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `taskID` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `taskStatus` varchar(20) NOT NULL,
  `taskDescription` varchar(50) DEFAULT NULL,
  `taskDue` date DEFAULT NULL,
  `assignDate` date NOT NULL,
  `personID` int(11) NOT NULL,
  `boardName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`taskID`, `priority`, `taskStatus`, `taskDescription`, `taskDue`, `assignDate`, `personID`, `boardName`) VALUES
(1, 1, 'In code review', 'Create API', '2018-02-17', '2018-02-10', 7, 'CATS'),
(2, 1, 'In progress', 'Code review for Task 1', '2018-02-14', '2018-02-14', 4, 'CATS'),
(3, 1, 'In QA', 'Implement UI', '2018-01-20', '2018-02-10', 2, 'CATS'),
(4, 1, 'Todo', 'QA for Task 3', '2018-02-15', '2018-02-10', 3, 'CATS'),
(5, 1, 'Done', 'Apply changes to schema', '2018-01-06', '2018-01-05', 15, 'Water'),
(6, 3, 'Todo', 'Create alternative mockups', '2018-02-20', '2018-02-13', 10, 'GUI'),
(7, 4, 'In progress', 'Bug fix', '2018-02-15', '2018-02-14', 11, 'SATC');

-- --------------------------------------------------------

--
-- Table structure for table `task_type`
--

CREATE TABLE `task_type` (
  `taskType` varchar(20) NOT NULL,
  `taskID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_type`
--

INSERT INTO `task_type` (`taskType`, `taskID`) VALUES
('Bug', 6),
('Code review', 2),
('Implementation', 3),
('Modification', 5),
('QA', 4),
('Setup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamName` varchar(20) NOT NULL,
  `teamID` int(11) NOT NULL,
  `focus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`teamName`, `teamID`, `focus`) VALUES
('CATS', 1, 'Database Management'),
('SATC', 2, 'Front-end'),
('TACS', 3, 'Quality Assurance'),
('TICTACS', 4, 'Release'),
('Water', 5, 'Database Management'),
('Knapsack', 6, 'Back-end'),
('GUI', 7, 'UI Design');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`boardName`),
  ADD KEY `teamID` (`teamID`);

--
-- Indexes for table `includes`
--
ALTER TABLE `includes`
  ADD PRIMARY KEY (`teamID`,`personID`),
  ADD KEY `personID` (`personID`);

--
-- Indexes for table `is_assigned`
--
ALTER TABLE `is_assigned`
  ADD PRIMARY KEY (`projectID`,`teamID`),
  ADD KEY `teamID` (`teamID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `person_specialization`
--
ALTER TABLE `person_specialization`
  ADD PRIMARY KEY (`specialization`,`personID`),
  ADD KEY `personID` (`personID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`category`,`projectID`),
  ADD KEY `projectID` (`projectID`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`taskID`),
  ADD KEY `personID` (`personID`),
  ADD KEY `boardName` (`boardName`);

--
-- Indexes for table `task_type`
--
ALTER TABLE `task_type`
  ADD PRIMARY KEY (`taskType`,`taskID`),
  ADD KEY `taskID` (`taskID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `taskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `teamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `board_ibfk_1` FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`);

--
-- Constraints for table `includes`
--
ALTER TABLE `includes`
  ADD CONSTRAINT `includes_ibfk_1` FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`),
  ADD CONSTRAINT `includes_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`);

--
-- Constraints for table `is_assigned`
--
ALTER TABLE `is_assigned`
  ADD CONSTRAINT `is_assigned_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  ADD CONSTRAINT `is_assigned_ibfk_2` FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`);

--
-- Constraints for table `person_specialization`
--
ALTER TABLE `person_specialization`
  ADD CONSTRAINT `person_specialization_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`);

--
-- Constraints for table `project_category`
--
ALTER TABLE `project_category`
  ADD CONSTRAINT `project_category_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`boardName`) REFERENCES `board` (`boardName`);

--
-- Constraints for table `task_type`
--
ALTER TABLE `task_type`
  ADD CONSTRAINT `task_type_ibfk_1` FOREIGN KEY (`taskID`) REFERENCES `task` (`taskID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
