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

-- Question 1

INSERT INTO Fresher_management (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES 
	('Phung Bao Long', '2003-11-02', 'male', '18', '19', '47', '3', 'Good', 'long.phungbao@vtiacademy.edu.vn'),
	('Phung Bao Long1', '2003-12-04', 'female', '15', '19', '44', '2', 'Bad', 'long.phungbao1@vtiacademy.edu.vn'),
	('Phung Bao Long2', '2003-11-18', 'unknown', '16', '11', '42', '4', 'Normal', 'long.phungbao2@vtiacademy.edu.vn'),
	('Phung Bao Long3', '2003-11-19', 'female', '12', '13', '43', '4', 'Good', 'long.phungbao3@vtiacademy.edu.vn'),
	('Phung Bao Long4', '2003-11-25', 'male', '11', '16', '41', '7', 'Good', 'long.phungbao4@vtiacademy.edu.vn'),
	('Phung Bao Long5', '2003-03-10', 'female', '17', '14', '40', '1', 'Normal', 'long.phungbao5@vtiacademy.edu.vn'),
	('Phung Bao Long6', '2003-07-02', 'male', '19', '17', '39', '2', 'Good', 'long.phungbao6@vtiacademy.edu.vn'),
	('Phung Bao Long7', '2003-10-10', 'male', '13', '19', '38', '4', 'Normal', 'long.phungbao7@vtiacademy.edu.vn'),
	('Phung Bao Long8', '2003-10-31', 'male', '14', '16', '38', '5', 'Bad', 'long.phungbao8@vtiacademy.edu.vn'),
	('Phung Bao Long9', '2003-08-12', 'male', '20', '15', '37', '3', 'Good', 'long.phungbao9@vtiacademy.edu.vn'),
    ('Pham Minh Tuan', '1990-05-15', 'male', '10', '15', '16', '1', 'Normal', 'phamminhtuan@vtiacademy.edu.vn'),
    ('Tuan Pham Minh', '1992-03-25', 'female', '12', '15', '44', '1', 'Good', 'tuanphamminh@vtiacademy.edu.vn'),
    ('Minh Tuan Pham', '1991-03-10', 'male', '19', '17', '42', '2', 'Good', 'minhtuanpham@vtiacademy.edu.vn'),
    ('Pham Tuan Minh', '1993-11-05', 'male', '14', '13', '38', '2', 'Good', 'phamtuanminh@vtiacademy.edu.vn'),
    ('Minh Pham Tuan', '1994-07-20', 'unknown', '16', '12', '42', '1', 'Bad', 'minhphamtuan@vtiacademy.edu.vn'),
    ('Bui Quang Long', '1995-01-18', 'male', '10', '11', '17', '2', 'Good', 'buiquanglong@vtiacademy.edu.vn'),
    ('Pham Khiet Minh', '1992-09-08', 'female', '18', '19', '47', '2', 'Good', 'phamkhietminh@vtiacademy.edu.vn'),
    ('Vu Nhat Long', '1991-06-30', 'male', '17', '16', '32', '1', 'Good', 'vunhatlong@vtiacademy.edu.vn'),
    ('Nguyen Minh Nhat', '1993-04-12', 'male', '13', '14', '32', '1', 'Bad', 'nguyenminhnhat@vtiacademy.edu.vn'),
    ('Vo Hoai An', '1994-12-28', 'male', '11', '13', '8', '2', 'Bad', 'vohoaian@vtiacademy.edu.vn');

-- Question 2
SELECT 
    MONTH(Birth_Date) AS Birth_Month,
    Full_Name,
    Gender,
    ET_IQ,
    ET_Gmath,
    ET_English,
    Training_Class,
    Evaluation_Notes,
    VTI_Account
FROM
    Fresher_management
GROUP BY Birth_Month , Full_Name , Gender , ET_IQ , ET_Gmath , ET_English , Training_Class , Evaluation_Notes , VTI_Account
ORDER BY Birth_Month ASC;

-- Question 3
SELECT 
    Full_Name,
    TIMESTAMPDIFF(YEAR,
        Birth_Date,
        CURDATE()) AS Age,
    Gender,
    ET_IQ,
    ET_Gmath,
    ET_English,
    Training_Class
FROM
    Fresher_management
ORDER BY LENGTH(Full_Name) DESC
LIMIT 1;

-- Question 4    
SELECT 
    *
FROM
    Fresher_management
WHERE
    ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8
        AND ET_Gmath >= 8
        AND ET_English >= 18;

-- Question 5
DELETE FROM Fresher_management 
WHERE
    TraineeID = 3;

-- Question 6
UPDATE Fresher_management 
SET 
    Training_Class = 2
WHERE
    TraineeID = 5;



