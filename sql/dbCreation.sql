DROP DATABASE IF EXISTS water_cats;
CREATE DATABASE water_cats;
USE water_cats;

CREATE TABLE Project
(
  projectName VARCHAR(20) NOT NULL,
  projectID INT NOT NULL AUTO_INCREMENT,
  projectDescription VARCHAR(50),
  projectDue DATE,
  projectStatus INT,
  PRIMARY KEY (projectID)
);

INSERT INTO Project VALUES('Kitty Farm', NULL, 'Cat adoption center', '2018-03-14', 0); 
INSERT INTO Project VALUES('SeaS', NULL, 'Find water', '2018-02-17', 0); 
INSERT INTO Project VALUES('Jello', NULL, 'Trello hello', '2018-05-29', 1);

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

CREATE TABLE Board
(
  boardName VARCHAR(20) NOT NULL,
  visibility VARCHAR(10) NOT NULL,
  background VARCHAR(50),
  teamID INT NOT NULL,
  PRIMARY KEY (boardName),
  FOREIGN KEY (teamID) REFERENCES Team(teamID)
);

INSERT INTO Board values('CATS', 'Private', NULL, 1);
INSERT INTO Board values('SATC', 'Public', NULL, 2);
INSERT INTO Board values('TACS', 'Public', NULL, 3);
INSERT INTO Board values('TICTACS', 'Private', NULL, 4);
INSERT INTO Board values('Water', 'Private', NULL, 5);
INSERT INTO Board values('Knapsack', 'Private', NULL, 6);
INSERT INTO Board values('GUI', 'Public', NULL, 7);

CREATE TABLE Person
(
  personID INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(30) NOT NULL UNIQUE,
  password CHAR(60) NOT NULL,
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(20) NOT NULL,
  PRIMARY KEY (personID)
);

INSERT INTO Person VALUES(NULL, 'jasonk@example.com', 'password', 'Jason', 'Kelly');
INSERT INTO Person VALUES(NULL, 'arthurp@example.com', 'password', 'Arthur', 'Patterson');
INSERT INTO Person VALUES(NULL, 'juanj@example.com', 'password', 'Juan', 'Jones');
INSERT INTO Person VALUES(NULL, 'janicej@example.com', 'password', 'Janice', 'Jenkins');
INSERT INTO Person VALUES(NULL, 'adama@example.com', 'password', 'Adam', 'Alexander');
INSERT INTO Person VALUES(NULL, 'robertn@example.com', 'password', 'Robert', 'Nelson');
INSERT INTO Person VALUES(NULL, 'carolyng@example.com', 'password', 'Carolyn', 'Green');
INSERT INTO Person VALUES(NULL, 'joyces@example.com', 'password', 'Joyce', 'Simmons');
INSERT INTO Person VALUES(NULL, 'amandab@example.com', 'password', 'Amanda', 'Butler');
INSERT INTO Person VALUES(NULL, 'dianah@example.com', 'password', 'Diana', 'Henderson');
INSERT INTO Person VALUES(NULL, 'carolp@example.com', 'password', 'Carol', 'Powell');
INSERT INTO Person VALUES(NULL, 'erict@example.com', 'password', 'Eric', 'Thompson');
INSERT INTO Person VALUES(NULL, 'heleng@example.com', 'password', 'Helen', 'Gray');
INSERT INTO Person VALUES(NULL, 'kathrynm@example.com', 'password', 'Kathryn', 'Moore');
INSERT INTO Person VALUES(NULL, 'amya@example.com', 'password', 'Amy', 'Allen');

CREATE TABLE Task
(
  taskID INT NOT NULL AUTO_INCREMENT,
  priority INT NOT NULL,
  taskStatus INT NOT NULL,
  taskDescription VARCHAR(50),
  taskDue DATE,
  assignDate DATE NOT NULL,
  personID INT NOT NULL,
  boardName VARCHAR(20) NOT NULL,
  PRIMARY KEY (taskID),
  FOREIGN KEY (personID) REFERENCES Person(personID),
  FOREIGN KEY (boardName) REFERENCES Board(boardName)
);

INSERT INTO Task VALUES(NULL, 1, 1, 'Create API', '2018-02-17', '2018-02-10', 7, 'CATS');
INSERT INTO Task VALUES(NULL, 1, 0, 'Code review for Task 1', '2018-02-14', '2018-02-14', 4, 'CATS');
INSERT INTO Task VALUES(NULL, 1, 1, 'Implement UI', '2018-01-20', '2018-02-10', 2, 'CATS');
INSERT INTO Task VALUES(NULL, 1, 0, 'QA for Task 3', '2018-02-15', '2018-02-10', 3, 'CATS');
INSERT INTO Task VALUES(NULL, 1, 1, 'Apply changes to schema', '2018-01-06', '2018-01-05', 15, 'Water');
INSERT INTO Task VALUES(NULL, 3, 0, 'Create alternative mockups', '2018-02-20', '2018-02-13', 10, 'GUI');
INSERT INTO Task VALUES(NULL, 4, 1, 'Bug fix', '2018-02-15', '2018-02-14', 11, 'SATC');

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

CREATE TABLE Task_type
(
  taskType VARCHAR(20) NOT NULL,
  taskID INT NOT NULL,
  PRIMARY KEY (taskType, taskID),
  FOREIGN KEY (taskID) REFERENCES Task(taskID)
);

INSERT INTO Task_type VALUES('Setup',1);
INSERT INTO Task_type VALUES('Code review', 2);
INSERT INTO Task_type VALUES('Implementation', 3);
INSERT INTO Task_type VALUES('QA', 4);
INSERT INTO Task_type VALUES('Modification', 5);
INSERT INTO Task_type VALUES('Bug', 6);
