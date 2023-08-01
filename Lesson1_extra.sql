DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
	TraineeID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(50),
    Birth_Date DATE,
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ INT CHECK(0 <= ET_IQ <= 20),
    ET_Gmath INT CHECK(0 <= ET_Gmath <= 20),
    ET_English INT CHECK(0 <= ET_English <= 50),
    Training_Class VARCHAR(10),
    Evaluation_Notes TEXT
);

ALTER TABLE Trainee 
ADD VTI_Account VARCHAR(50) NOT NULL UNIQUE;

/*
Exercise 2:
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50),
Code CHAR(5),
ModifiedDate DATATIME	

Exercise 3:
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50),
BirthDate DATE,
Gender TINYINT(1),
IsDeleteFlag TINYINT(1)
*/



