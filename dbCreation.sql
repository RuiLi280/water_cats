DROP DATABASE IF EXISTS water_cats;
CREATE DATABASE water_cats;
USE water_cats;

CREATE TABLE Project
(
  projectName VARCHAR(20) NOT NULL,
  projectID INT NOT NULL AUTO_INCREMENT,
  projectDescription VARCHAR(50),
  projectDue DATE,
  projectStatus VARCHAR(10),
  PRIMARY KEY (projectID)
);

INSERT INTO Project VALUES('Kitty Farm', NULL, 'Cat adoption center', '2018-03-14', 'Inactive'); 
INSERT INTO Project VALUES('SeaS', NULL, 'Find water', '2018-02-17', 'Inactive'); 
INSERT INTO Project VALUES('Jello', NULL, 'Trello hello', '2018-05-29', 'Active');

CREATE TABLE Team
(
  teamName VARCHAR(20) NOT NULL,
  teamID INT NOT NULL AUTO_INCREMENT,
  focus VARCHAR(20),
  PRIMARY KEY (teamID)
);

INSERT INTO Team VALUES('CATS', NULL, 'Database Management');
INSERT INTO Team VALUES('SATC', NULL, 'Front-end');
INSERT INTO Team VALUES('TACS', NULL, 'Quality Assurance');
INSERT INTO Team VALUES('TICTACS', NULL, 'Release');
INSERT INTO Team VALUES('Water', NULL, 'Database Management');
INSERT INTO Team VALUES('Knapsack', NULL, 'Back-end');
INSERT INTO Team VALUES('GUI', NULL, 'UI Design');

CREATE TABLE Person
(
  personID INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(20) NOT NULL,
  PRIMARY KEY (personID)
);

INSERT INTO Person VALUES(NULL, 'Jason', 'Kelly');
INSERT INTO Person VALUES(NULL, 'Arthur', 'Patterson');
INSERT INTO Person VALUES(NULL, 'Juan', 'Jones');
INSERT INTO Person VALUES(NULL, 'Janice', 'Jenkins');
INSERT INTO Person VALUES(NULL, 'Adam', 'Alexander');
INSERT INTO Person VALUES(NULL, 'Robert', 'Nelson');
INSERT INTO Person VALUES(NULL, 'Carolyn', 'Green');
INSERT INTO Person VALUES(NULL, 'Joyce', 'Simmons');
INSERT INTO Person VALUES(NULL, 'Amanda', 'Butler');
INSERT INTO Person VALUES(NULL, 'Diana', 'Henderson');
INSERT INTO Person VALUES(NULL, 'Carol', 'Powell');
INSERT INTO Person VALUES(NULL, 'Eric', 'Thompson');
INSERT INTO Person VALUES(NULL, 'Helen', 'Gray');
INSERT INTO Person VALUES(NULL, 'Kathryn', 'Moore');
INSERT INTO Person VALUES(NULL, 'Amy', 'Allen');

CREATE TABLE Activity
(
  activityDescription VARCHAR(50) NOT NULL,
  activityDate TIMESTAMP NOT NULL,
  activityID INT NOT NULL AUTO_INCREMENT,
  personID INT NOT NULL,
  PRIMARY KEY (activityID),
  FOREIGN KEY (personID) REFERENCES Person(personID)
);

CREATE TABLE is_assigned
(
  projectID INT NOT NULL,
  teamID INT NOT NULL,
  PRIMARY KEY (projectID, teamID),
  FOREIGN KEY (projectID) REFERENCES Project(projectID),
  FOREIGN KEY (teamID) REFERENCES Team(teamID)
);

INSERT INTO is_assigned VALUES(1, 1);
INSERT INTO is_assigned VALUES(1, 2);
INSERT INTO is_assigned VALUES(1, 5);
INSERT INTO is_assigned VALUES(2, 4);
INSERT INTO is_assigned VALUES(2, 1);
INSERT INTO is_assigned VALUES(2, 6);
INSERT INTO is_assigned VALUES(3, 3);
INSERT INTO is_assigned VALUES(3, 2);
INSERT INTO is_assigned VALUES(3, 5);
INSERT INTO is_assigned VALUES(3, 4);

CREATE TABLE includes
(
  teamID INT NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (teamID, personID),
  FOREIGN KEY (teamID) REFERENCES Team(teamID),
  FOREIGN KEY (personID) REFERENCES Person(personID)
);

INSERT INTO includes VALUES(1, 7);
INSERT INTO includes VALUES(1, 3);
INSERT INTO includes VALUES(1, 4);
INSERT INTO includes VALUES(1, 2);
INSERT INTO includes VALUES(2, 2);
INSERT INTO includes VALUES(2, 5);
INSERT INTO includes VALUES(2, 13);
INSERT INTO includes VALUES(2, 11);
INSERT INTO includes VALUES(3, 15);
INSERT INTO includes VALUES(3, 9);
INSERT INTO includes VALUES(4, 1);
INSERT INTO includes VALUES(4, 7);
INSERT INTO includes VALUES(4, 14);
INSERT INTO includes VALUES(5, 5);
INSERT INTO includes VALUES(5, 6);
INSERT INTO includes VALUES(5, 9);
INSERT INTO includes VALUES(5, 15);
INSERT INTO includes VALUES(6, 4);
INSERT INTO includes VALUES(6, 8);
INSERT INTO includes VALUES(6, 11);
INSERT INTO includes VALUES(6, 12);
INSERT INTO includes VALUES(7, 10);
INSERT INTO includes VALUES(7, 2);

CREATE TABLE Project_category
(
  category VARCHAR(20) NOT NULL,
  projectID INT NOT NULL,
  PRIMARY KEY (category, projectID),
  FOREIGN KEY (projectID) REFERENCES Project(projectID)
);

INSERT INTO Project_category VALUES('DBMS', 1);
INSERT INTO Project_category VALUES('Mobile Application', 3);

CREATE TABLE Person_specialization
(
  specialization VARCHAR(20) NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (specialization, personID),
  FOREIGN KEY (personID) REFERENCES Person(personID)
);

INSERT INTO Person_specialization VALUES('Project Management', 1);
INSERT INTO Person_specialization VALUES('Front-end', 2);
INSERT INTO Person_specialization VALUES('Quality Assurance', 3);
INSERT INTO Person_specialization VALUES('Back-end', 4);
INSERT INTO Person_specialization VALUES('Front-end', 5);
INSERT INTO Person_specialization VALUES('Full-stack', 6);
INSERT INTO Person_specialization VALUES('Back-end', 7);
INSERT INTO Person_specialization VALUES('Back-end', 8);
INSERT INTO Person_specialization VALUES('Databases', 9);
INSERT INTO Person_specialization VALUES('Design', 10);
INSERT INTO Person_specialization VALUES('Full-stack', 11);
INSERT INTO Person_specialization VALUES('Back-end', 12);
INSERT INTO Person_specialization VALUES('Front-end', 13);
INSERT INTO Person_specialization VALUES('IT', 14);
INSERT INTO Person_specialization VALUES('Databases', 15);

CREATE TABLE Person_email
(
  email VARCHAR(30) NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (email, personID),
  FOREIGN KEY (personID) REFERENCES Person(personID)
);

INSERT INTO Person_email VALUES('jasonk@example.com', 1);
INSERT INTO Person_email VALUES('arthurp@example.com', 2);
INSERT INTO Person_email VALUES('juanj@example.com', 3);
INSERT INTO Person_email VALUES('janicej@example.com', 4);
INSERT INTO Person_email VALUES('adama@example.com', 5);
INSERT INTO Person_email VALUES('robertn@example.com', 6);
INSERT INTO Person_email VALUES('carolyng@example.com', 7);
INSERT INTO Person_email VALUES('joyces@example.com', 8);
INSERT INTO Person_email VALUES('amandab@example.com', 9);
INSERT INTO Person_email VALUES('dianah@example.com', 10);
INSERT INTO Person_email VALUES('carolp@example.com', 11);
INSERT INTO Person_email VALUES('erict@example.com', 12);
INSERT INTO Person_email VALUES('heleng@example.com', 13);
INSERT INTO Person_email VALUES('kathrynm@example.com', 14);
INSERT INTO Person_email VALUES('amya@example.com', 15);

CREATE TABLE Board
(
  boardName VARCHAR(20) NOT NULL,
  visibility VARCHAR(10) NOT NULL,
  background VARCHAR(50),
  teamID INT NOT NULL,
  activityID INT NOT NULL,
  PRIMARY KEY (boardName),
  FOREIGN KEY (teamID) REFERENCES Team(teamID),
  FOREIGN KEY (activityID) REFERENCES Activity(activityID)
);

INSERT INTO Board values('Tasks', 'Private', NULL, 1);
INSERT INTO Board values('Discussion', 'Public', NULL, 2);
INSERT INTO Board values('Tasks', 'Private', NULL, 3);
INSERT INTO Board values('Tasks', 'Private', NULL, 4);
INSERT INTO Board values('Welcome', 'Public', NULL, 5);
INSERT INTO Board values('Tasks', 'Private', NULL, 6);
INSERT INTO Board values('Tasks', 'Private', NULL, 7);

CREATE TABLE Task
(
  taskID INT NOT NULL AUTO_INCREMENT,
  priority VARCHAR(10) NOT NULL,
  taskStatus VARCHAR(20) NOT NULL,
  taskDescription VARCHAR(50),
  taskDue DATE,
  assignDate DATE NOT NULL,
  personID INT NOT NULL,
  boardName VARCHAR(20) NOT NULL,
  PRIMARY KEY (taskID),
  FOREIGN KEY (personID) REFERENCES Person(personID),
  FOREIGN KEY (boardName) REFERENCES Board(boardName)
);

CREATE TABLE Task_type
(
  taskType VARCHAR(20) NOT NULL,
  taskID INT NOT NULL,
  PRIMARY KEY (taskType, taskID),
  FOREIGN KEY (taskID) REFERENCES Task(taskID)
);