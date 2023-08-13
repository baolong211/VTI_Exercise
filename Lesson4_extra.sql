DROP DATABASE IF EXISTS Extra_Assignment_4;
CREATE DATABASE IF NOT EXISTS Extra_Assignment_4;
USE Extra_Assignment_4;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    Department_Number INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table (
    Employee_Number INT PRIMARY KEY AUTO_INCREMENT,
    Employee_Name NVARCHAR(50) NOT NULL,
    Department_Number INT NOT NULL,
    FOREIGN KEY (Department_Number)
        REFERENCES Department (Department_Number)
);

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table (
    Skill_Code INT PRIMARY KEY AUTO_INCREMENT,
    Skill_Name VARCHAR(50) NOT NULL,
    Employee_Number INT NOT NULL,
    Date_Register DATE NOT NULL
);

-- Question 2
INSERT INTO Department (Department_Name)
VALUES 
('sales'),
('marketing'),
('accounting'),
('audit'),
('administration'),
('human resources'),
('financial'),
('customer service'),
('research & development'),
('quality');

INSERT INTO Employee_Table (Employee_Name, Department_Number)
VALUES
('Nguyen Van Anh', '1'),
('Pham Van Bach', '2'),
('Tran Van Cu', '3'),
('Phan Van Hung', '4'),
('Nguyen Thi Van', '5'),
('Tran Van Trung', '6'),
('Pham Hoang Tan', '7'),
('Tran Dai Loc', '8'),
('Nguyen Thanh Dat', '9'),
('Nguyen Minh Hieu', '10');

INSERT INTO Employee_Skill_Table (Skill_Name, Employee_Number, Date_Register)
VALUES
('Java', '1', '2021-01-21'),
('.NET', '2', '2021-02-27'),
('Python', '3', '2023-02-20'),
('Dart', '4', '2022-03-04'),
('SQL', '5', '2019-05-20'),
('Postman', '6', '2018-04-12'),
('Ruby', '7', '2019-06-16'),
('Golang', '8', '2021-08-13'),
('C/C++', '9', '2021-11-27'),
('Javascript', '10', '2022-10-25');

-- Question 3
SELECT 
    Employee_Table.Employee_Name
FROM
    Employee_Table
        LEFT JOIN
    Employee_Skill_Table ON Employee_Table.Employee_Number = Employee_Skill_Table.Employee_Number
WHERE
    Employee_Skill_Table.Skill_Name = 'Java';

-- Question 4
SELECT 
    Department.Department_Name
FROM
    Department
        INNER JOIN
    Employee_Table ON Department.Department_Number = Employee_Table.Department_Number
GROUP BY Employee_Table.Department_Number
HAVING COUNT(Employee_Table.Department_Number) > 3;

-- Question 5
SELECT 
    Department.Department_Name, GROUP_CONCAT(Employee_Table.Employee_Name) AS Employee_Name
FROM
    Department
        LEFT JOIN
    Employee_Table ON Department.Department_Number = Employee_Table.Department_Number
GROUP BY Department.Department_Name;

-- Question 6
SELECT 
    Employee_Table.Employee_Name
FROM
    Employee_Table
        INNER JOIN
    Employee_Skill_Table ON Employee_Table.Employee_Number = Employee_Skill_Table.Employee_Number
GROUP BY Employee_Skill_Table.Employee_Number
HAVING COUNT(Employee_Skill_Table.Employee_Number) > 1;
