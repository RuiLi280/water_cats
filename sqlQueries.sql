CREATE TABLE Project
(
  projectName INT NOT NULL,
  projectID INT NOT NULL,
  projectDescription INT,
  projectDue INT,
  projectStatus INT NOT NULL,
  PRIMARY KEY (projectID)
);

CREATE TABLE Team
(
  teamName INT NOT NULL,
  teamID INT NOT NULL,
  focus INT,
  PRIMARY KEY (teamID)
);

CREATE TABLE Person
(
  personID INT NOT NULL,
  firstName INT NOT NULL,
  lastName INT NOT NULL,
  teamID INT NOT NULL,
  PRIMARY KEY (personID),
  FOREIGN KEY (teamID) REFERENCES Team(teamID)
);

CREATE TABLE Activity
(
  activityDescription INT NOT NULL,
  activityDate INT NOT NULL,
  activityID INT NOT NULL,
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

CREATE TABLE Project_category
(
  category INT NOT NULL,
  projectID INT NOT NULL,
  PRIMARY KEY (category, projectID),
  FOREIGN KEY (projectID) REFERENCES Project(projectID)
);

CREATE TABLE Person_specialization
(
  specialization INT NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (specialization, personID),
  FOREIGN KEY (personID) REFERENCES Person(personID)
);

CREATE TABLE Person_email
(
  email INT NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (email, personID),
  FOREIGN KEY (personID) REFERENCES Person(personID)
);

CREATE TABLE Board
(
  boardName INT NOT NULL,
  visibility INT NOT NULL,
  background INT,
  teamID INT NOT NULL,
  activityID INT NOT NULL,
  PRIMARY KEY (boardName),
  FOREIGN KEY (teamID) REFERENCES Team(teamID),
  FOREIGN KEY (activityID) REFERENCES Activity(activityID)
);

CREATE TABLE Task
(
  taskID INT NOT NULL,
  priority INT NOT NULL,
  taskStatus INT NOT NULL,
  taskDescription INT,
  taskDue INT,
  assignDate INT NOT NULL,
  personID INT NOT NULL,
  boardName INT NOT NULL,
  PRIMARY KEY (taskID),
  FOREIGN KEY (personID) REFERENCES Person(personID),
  FOREIGN KEY (boardName) REFERENCES Board(boardName)
);

CREATE TABLE Task_type
(
  type INT NOT NULL,
  taskID INT NOT NULL,
  PRIMARY KEY (type, taskID),
  FOREIGN KEY (taskID) REFERENCES Task(taskID)
);
