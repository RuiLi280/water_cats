DROP DATABASE IF EXISTS CIS_water_cats;
CREATE DATABASE CIS_water_cats;
USE CIS_water_cats;

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
