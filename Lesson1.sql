DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL,
    Username VARCHAR(30) NOT NULL,
    Fullname NVARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    CreateDate DATE NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(50) NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupAccountID INT PRIMARY KEY AUTO_INCREMENT,
    GroupID INT,
    AccountID INT,
    JoinDate DATE NOT NULL,
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID)
        REFERENCES `Account` (AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID INT PRIMARY KEY AUTO_INCREMENT,
    Content NVARCHAR(1000) NOT NULL,
    CategoryID INT NOT NULL,
    TypeID INT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID INT PRIMARY KEY AUTO_INCREMENT,
    Content NVARCHAR(1000) NOT NULL,
    QuestionID INT NOT NULL,
    isCorrect BOOL NOT NULL,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    `Code` VARCHAR(10) NOT NULL,
    Title VARCHAR(30) NOT NULL,
    CategoryID INT NOT NULL,
    Duration INT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamQuestionID INT PRIMARY KEY AUTO_INCREMENT,
    ExamID INT,
    QuestionID INT,
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);

-- Question 1
INSERT INTO Department (DepartmentName)
VALUES ('sales'),
('marketing'),
('accounting'),
('audit'),
('administration'),
('human resources'),
('financial'),
('customer service'),
('research & development'),
('quality');

INSERT INTO `Position` (PositionName)
VALUES 
('CEO'),
('CFO'),
('Dev'),
('Test'),
('Scrum Master'),
('Production Manager'),
('Marketing Manager'),
('Personnel Manager'),
('Accounting Manager'),
('Intern');

INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
VALUES
('klaus.hartl@stilbuero.de', 'klaushartl', 'Nguyen Van Anh', '1', '1', '2022-11-20'),
('tinhocketoanatp@gmail.com', 'tinhocketoan', 'Pham Van Bach', '2', '2', '2020-02-24'),
('cokhibinhdiep@gmail.com', 'cokhibinhdiep', 'Tran Van Cu', '3', '3', '2021-03-10'),
('hoctaplongan@gmail.com', 'hoctaplongan', 'Phan Van Hung', '4', '4', '2017-10-10'),
('l3duym4nh@gmail.com', 'l3duym4nh', 'Nguyen Thi Van', '5', '5', '2019-11-20'),
('trung8kool_96@yahoo.com.vn', 'trung8kool', 'Tran Van Trung', '6', '6', '2018-04-20'),
('sangtaolive@gmail.com', 'sangtaolive', 'Pham Hoang Tan', '7', '7', '2020-02-11'),
('minhallenit@gmail.com', 'minhallenit', 'Tran Dai Loc', '8', '8', '2017-03-28'),
('quyrom10293@gmail.com', 'quyrom10293', 'Nguyen Thanh Dat', '9', '9', '2019-05-05'),
('hieu3364@yahoo.com', 'hieu3364', 'Nguyen Minh Hieu', '10', '10', '2022-01-27');

INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
VALUES
('Battlers', '1', '2015-02-11'),
('Blue Boys', '2', '2016-03-15'),
('Titans', '3', '2017-07-14'),
('Shooting Stars', '4', '2018-03-30'),
('Mutiny', '5', '2018-08-23'),
('Rangers', '6', '2019-09-21'),
('Goal Killers', '7', '2021-10-17'),
('Awesome Dynamos', '8', '2020-11-14'),
('Block Magic', '9', '2022-12-18'),
('Creative', '10', '2017-01-17');

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
('1', '1', '2021-01-21'),
('2', '2', '2021-02-27'),
('3', '3', '2023-02-20'),
('4', '4', '2022-03-04'),
('5', '5', '2019-05-20'),
('6', '6', '2018-04-12'),
('7', '7', '2019-06-16'),
('8', '8', '2021-08-13'),
('9', '9', '2021-11-27'),
('10', '10', '2022-10-25');

INSERT INTO TypeQuestion (TypeName)
VALUES
('Essay'),
('Multiple Choice'),
('Essay'),
('Multiple Choice'),
('Multiple Choice'),
('Essay'),
('Multiple Choice'),
('Multiple Choice'),
('Essay'),
('Multiple Choice');

INSERT INTO CategoryQuestion (CategoryName)
VALUES
('Java'),
('.NET'),
('Python'),
('Dart'),
('SQL'),
('Postman'),
('Ruby'),
('Golang'),
('C/C++'),
('Javascript');

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES
('Đâu không phải là một kiểu dữ liệu nguyên thủy trong Java?', '1', '1', '1', '2020-03-01'),
('Ngôn ngữ nào dưới đây có thể được dùng để viết các kịch bản đằng Servertrong ASP.NET?', '2', '2', '2', '2021-01-02'),
('Kí hiệu nào dùng để xác định các khối lệnh (khối lệnh của hàm, vòng lặp,...) trong Python?', '3', '3', '3', '2022-04-06'),
('Dart là gì?', '4', '4', '4', '2021-05-07'),
('Mệnh đề nào được sử dụng để tìm kiếm giá trị theo mẫu nhất định?', '5', '5', '5', '2020-07-08'),
('Postman được sử dụng để làm gì?', '6', '6', '6', '2022-09-12'),
('Làm thế nào để lấy ra danh sách các routes của một ứng dụng Rails?', '7', '7', '7', '2023-11-14'),
('Golang thừa hưởng những ý tưởng thiết kế từ ngôn ngữ nào?', '8', '8', '8', '2021-10-21'),
('Trong ngôn ngữ lập trình C++, cú pháp kiểu_dữ_liệu ds_các_biến dùng để?', '9', '9', '9', '2021-05-15'),
('Trong Javascript sự kiện OnUnload thực hiện khi nào?', '10', '10', '10', '2022-12-16');

INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES
('long float', '1', '1'),
('C++', '2', '0'),
('Thụt lề', '3', '1'),
('Dart là một ngôn ngữ lập trình hướng đối tượng', '4', '1'),
('FROM', '5', '0'),
('Để đơn giản hóa quy trình làm việc API trong thử nghiệm và phát triển.', '6', '1'),
('Mở terminal và chạy lệnh: $ rake routes', '7', '1'),
('Ngôn ngữ C', '8', '1'),
('Khai báo thư viện', '9', '0'),
('Khi kết thúc một chương trình', '10', '1');

INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
('J001', 'Interview Question', '1', '45', '1', '2023-01-01'),
('C#001', 'Technical Question', '2', '70', '2', '2020-01-02'),
('P001', 'Interview Question', '3', '60', '3', '2021-01-03'),
('D001', 'Interview Question', '4', '15', '4', '2018-01-04'),
('S001', 'Technical Question', '5', '30', '5', '2023-01-05'),
('PM001', 'Interview Question', '6', '120', '6', '2023-01-06'),
('R001', 'Interview Question', '7', '50', '7', '2022-01-07'),
('G001', 'Technical Question', '8', '90', '8', '2017-01-08'),
('C001', 'Interview Question', '9', '60', '9', '2023-01-09'),
('JS001', 'Technical Question', '10', '45', '10', '2023-01-10');

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10');

-- Question 2
SELECT * 
FROM Department;

-- Question 3
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'sales';

-- Question 4
SELECT *
FROM `Account`
ORDER BY LENGTH(Fullname) DESC
LIMIT 1;
-- WHERE LENGTH(Fullname) = SELECT MAX(LENGTH(Fullname)) FROM `Account`

-- Question 5
SELECT *
FROM `Account`
WHERE DepartmentID = 3 AND LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY Fullname DESC;

-- Question 6
SELECT GroupName
FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Question 7
SELECT QuestionID
FROM Answer
GROUP BY QuestionID
HAVING COUNT(QuestionID) >= 4;

-- Question 8
SELECT `Code`
FROM Exam
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Question 9
SELECT * 
FROM `Group`
ORDER BY DATEDIFF(CURDATE(), CreateDate) ASC
LIMIT 5;

-- Question 10
SELECT COUNT(Fullname)
FROM `Account`
WHERE DepartmentID = 2;

-- Question 11
SELECT Fullname
FROM `Account`
WHERE (SUBSTRING_INDEX(Fullname, ' ', -1)) LIKE 'D%o';

-- Question 12
DELETE FROM Exam
WHERE CreateDate < '2019-12-20';

-- Question 13
DELETE FROM Question
WHERE Content = 'Câu hỏi%';

-- Question 14
UPDATE `Account`
SET Fullname = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Question 15
UPDATE GroupAccount 
SET 
    GroupID = 4
WHERE
    AccountID = 5;
    
-- LESSON 4

-- Exercise 1
-- Question 1
SELECT `Account`.Fullname, Department.DepartmentName
FROM `Account`
INNER JOIN Department ON `Account`.DepartmentID = Department. DepartmentID;

-- Question 2
SELECT AccountID, Username, Fullname
FROM `Account`
WHERE CreateDate > '2010-12-20';

-- Question 3
SELECT `Account`.Fullname
FROM `Account`
INNER JOIN Position ON `Account`.PositionID = Position.PositionID
WHERE `Account`.PositionID = 3;

-- Question 4
SELECT Department.DepartmentName
FROM Department
INNER JOIN `Account` ON Department.DepartmentID = `Account`. DepartmentID
GROUP BY `Account`. DepartmentID
HAVING COUNT(`Account`. DepartmentID) > 3;

-- Question 5
SELECT Question.Content, COUNT(ExamQuestion.QuestionID) AS Number_Question
FROM Question
INNER JOIN ExamQuestion ON Question.QuestionID = ExamQuestion.QuestionID
INNER JOIN Exam ON Exam.ExamID = ExamQuestion.ExamID
GROUP BY Question.Content
ORDER BY Number_Question DESC
LIMIT 1;

-- Question 6
SELECT CategoryQuestion.CategoryID, CategoryQuestion.CategoryName, COUNT(Question.QuestionID) AS Number_Question
FROM CategoryQuestion
INNER JOIN Question ON CategoryQuestion.CategoryID = Question.CategoryID
GROUP BY CategoryQuestion.CategoryID, CategoryQuestion.CategoryName;

-- Question 7
SELECT Question.QuestionID, Question.Content, COUNT(ExamQuestion.ExamID) AS Number_Exam	
FROM Question
INNER JOIN ExamQuestion ON Question.QuestionID = ExamQuestion.QuestionID
GROUP BY Question.QuestionID, Question.Content;

-- Question 8
SELECT Question.QuestionID, Question.Content, COUNT(Answer.QuestionID) AS Number_Answer
FROM Question
INNER JOIN Answer ON Question.QuestionID = Answer.QuestionID
GROUP BY Question.QuestionID, Question.Content
ORDER BY Number_Answer DESC
LIMIT 1;

-- Question 9
SELECT `Group`.GroupID, `Group`.GroupName, COUNT(GroupAccount.AccountID) AS Number_Account
FROM `Group`
INNER JOIN GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
GROUP BY `Group`.GroupID;

-- Question 10
SELECT `Position`.PositionID, `Position`.PositionName, COUNT(`Account`.PositionID) AS Number_Person
FROM `Position`
INNER JOIN `Account` ON `Position`.PositionID = `Account`.PositionID
GROUP BY `Position`.PositionID, `Position`.PositionName
ORDER BY Number_Person ASC
LIMIT 1;

-- Question 11
SELECT `Account`.DepartmentID, Department.DepartmentName, `Position`.PositionName, COUNT(`Account`.PositionID) AS Number_Position
FROM `Account`
INNER JOIN Department ON `Account`.DepartmentID = Department.DepartmentID
INNER JOIN `Position` ON `Account`.PositionID = `Position`.PositionID
WHERE `Position`.PositionName = 'Dev' OR 'Test' OR 'Scrum Master' OR 'Production Manager'
GROUP BY `Account`.DepartmentID, Department.DepartmentName, `Position`.PositionName;

-- Question 12
SELECT Question.QuestionID, Question.Content, TypeQuestion.TypeName, Question.CreatorID, Answer.Content
FROM Question
INNER JOIN TypeQuestion ON Question.TypeID = TypeQuestion.TypeID
INNER JOIN Answer ON Question.QuestionID = Answer.QuestionID;

-- Question 13
SELECT DISTINCT(TypeQuestion.TypeName), COUNT(Question.TypeID) AS Number_Question
FROM TypeQuestion
INNER JOIN Question ON TypeQuestion.TypeID = Question.TypeID
GROUP BY TypeQuestion.TypeName;

-- Question 14
SELECT `Group`.GroupName
FROM `Group`
INNER JOIN GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
WHERE `Group`.GroupID NOT IN (SELECT GroupID FROM GroupAccount);

-- Question 15
-- Question 16
SELECT Question.Content
FROM Question
INNER JOIN Answer ON Question.QuestionID = Answer.QuestionID
WHERE Question.QuestionID NOT IN (SELECT QuestionID FROM Answer);

-- Exercise 2
-- Question 17
SELECT GroupAccount.GroupID, `Account`.Username
FROM GroupAccount
INNER JOIN `Account` ON GroupAccount.AccountID = `Account`.AccountID
WHERE GroupAccount.GroupID = 1

UNION

SELECT GroupAccount.GroupID, `Account`.Username
FROM GroupAccount
INNER JOIN `Account` ON GroupAccount.AccountID = `Account`.AccountID
WHERE GroupAccount.GroupID = 2;

-- Question 18
SELECT `Group`.GroupID, `Group`.GroupName
FROM `Group`
INNER JOIN GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
GROUP BY GroupAccount.GroupID
HAVING COUNT(*) > 5

UNION

SELECT `Group`.GroupID, `Group`.GroupName
FROM `Group`
INNER JOIN GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
GROUP BY GroupAccount.GroupID
HAVING COUNT(*) < 7;











