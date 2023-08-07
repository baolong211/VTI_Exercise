DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE IF NOT EXISTS Fresher;
USE Fresher;

DROP TABLE IF EXISTS Fresher_management;
CREATE TABLE Fresher_management (
	TraineeID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Full_Name NVARCHAR(50) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('male', 'female', 'unknown') NOT NULL,
    ET_IQ TINYINT UNSIGNED CHECK(ET_IQ <= 20) NOT NULL,
    ET_Gmath TINYINT UNSIGNED CHECK(ET_Gmath <= 20) NOT NULL,
    ET_English TINYINT UNSIGNED CHECK(ET_English <= 50) NOT NULL,
    Training_Class VARCHAR(10) NOT NULL,
    Evaluation_Notes TEXT(100) NOT NULL
);

ALTER TABLE Fresher_management 
ADD COLUMN VTI_Account VARCHAR(50) NOT NULL UNIQUE;

/*
Exercise 2:
ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50)NOT NULL,
Code CHAR(5) NOT NULL,
ModifiedDate DATATIME DEFAULT NOW()	

Exercise 3:
ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
BirthDate DATE NOT NULL,
Gender ENUM('0', '1', '2'), --0: Male, 1: Female, 2: Unknown
IsDeleteFlag ENUM('0', '1') DEFAULT 0 --0: Active, 1: Delete
*/

INSERT INTO Fresher_management (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES 
('Phung Bao Long', '2003-11-02', 'Male', '18', '19', '47', 'Rocket38', 'Good', 'long.phungbao@vtiacademy.edu.vn'),
('Phung Bao Long1', '2003-12-04', 'Male', '15', '19', '44', 'Rocket38', 'Good', 'long.phungbao1@vtiacademy.edu.vn'),
('Phung Bao Long2', '2003-11-18', 'Male', '16', '11', '42', 'Rocket38', 'Good', 'long.phungbao2@vtiacademy.edu.vn'),
('Phung Bao Long3', '2003-11-19', 'Male', '12', '13', '43', 'Rocket38', 'Good', 'long.phungbao3@vtiacademy.edu.vn'),
('Phung Bao Long4', '2003-11-25', 'Male', '11', '16', '41', 'Rocket38', 'Good', 'long.phungbao4@vtiacademy.edu.vn'),
('Phung Bao Long5', '2003-03-10', 'Male', '17', '14', '40', 'Rocket38', 'Good', 'long.phungbao5@vtiacademy.edu.vn'),
('Phung Bao Long6', '2003-07-02', 'Male', '19', '17', '39', 'Rocket38', 'Good', 'long.phungbao6@vtiacademy.edu.vn'),
('Phung Bao Long7', '2003-10-10', 'Male', '13', '19', '38', 'Rocket38', 'Good', 'long.phungbao7@vtiacademy.edu.vn'),
('Phung Bao Long8', '2003-10-31', 'Male', '14', '16', '38', 'Rocket38', 'Good', 'long.phungbao8@vtiacademy.edu.vn'),
('Phung Bao Long9', '2003-08-12', 'Male', '20', '15', '37', 'Rocket38', 'Good', 'long.phungbao9@vtiacademy.edu.vn');