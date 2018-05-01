DROP DATABASE IF EXISTS watercats;
CREATE DATABASE watercats;
USE watercats;

CREATE TABLE person (
    personID int NOT NULL,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    email varchar(100) NOT NULL
);

INSERT INTO person (personID, firstName, lastName, email) VALUES
(100, 'Jason', 'Kelly', 'jkelly@example.com'),
(101, 'Arthur', 'Patterson', 'apatterson@example.com'),
(102, 'Janice', 'Jenkinson', 'jjenkinson@example.com'),
(103, 'Adam', 'Alexander', 'aalexander@example.com'),
(104, 'Robert', 'Nelson', 'rnelson@example.com'),
(105, 'Ron', 'Mak', 'rmak@example.com');
