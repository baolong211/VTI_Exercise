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
    Gender ENUM('Male', 'Female', 'Unknown'),
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
        REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountID)
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

INSERT INTO `Account` (Email, Username, Fullname, Gender, DepartmentID, PositionID, CreateDate)
VALUES
('klaus.hartl@stilbuero.de', 'klaushartl', 'Nguyen Van Anh', 'Male', '1', '1', '2022-11-20'),
('tinhocketoanatp@gmail.com', 'tinhocketoan', 'Pham Van Bach', 'Female', '1', '2', '2020-02-24'),
('cokhibinhdiep@gmail.com', 'cokhibinhdiep', 'Tran Van Cu', 'Male', '1', '3', '2021-03-10'),
('hoctaplongan@gmail.com', 'hoctaplongan', 'Phan Van Hung', 'Unknown', '4', '4', '2017-10-10'),
('l3duym4nh@gmail.com', 'l3duym4nh', 'Nguyen Thi Van', 'Male', '5', '5', '2019-11-20'),
('trung8kool_96@yahoo.com.vn', 'trung8kool', 'Tran Van Trung', 'Male', '6', '6', '2018-04-20'),
('sangtaolive@gmail.com', 'sangtaolive', 'Pham Hoang Tan', 'Male', '7', '7', '2020-02-11'),
('minhallenit@gmail.com', 'minhallenit', 'Tran Dai Loc', 'Male','8', '8', '2017-03-28'),
('quyrom10293@gmail.com', 'quyrom10293', 'Nguyen Thanh Dat', 'Female', '9', '9', '2019-05-05'),
('hieu3364@yahoo.com', 'hieu3364', 'Nguyen Minh Hieu', 'Unknown', '10', '10', '2022-01-27');

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
('2', '1', '2021-02-27'),
('3', '1', '2023-02-20'),
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
INNER JOIN `Position` ON `Account`.PositionID = Position.PositionID
WHERE `Position`.PositionName = 'Dev';

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
GROUP BY Question.Content
ORDER BY Number_Question DESC
LIMIT 1;
/*HAVING COUNT(Question.Content) = (SELECT MAX(Number_Question)
                                   FROM 
                                          (SELECT COUNT(Question.QuestionID) AS Number_Question
                                           FROM ExamQuestion
                                           INNER JOIN Question ON ExamQuestion.QuestionID = Question.QuestionID
                                           GROUP BY Question.QuestionID) AS Number_Question)*/

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
LIMIT 1SELECT 
    `Group`.GroupID,
    `Group`.GroupName,
    COUNT(GroupAccount.AccountID) AS Number_Account
FROM
    GroupAccount
        RIGHT JOIN
    `Group` ON GroupAccount.GroupID = `Group`.GroupID
GROUP BY `Group`.GroupID
ORDER BY `Group`.GroupIDQuestion 10
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
WHERE `Position`.PositionName = 'Dev' OR `Position`.PositionName = 'Test' OR `Position`.PositionName = 'Scrum Master' OR `Position`.PositionName = 'Production Manager'
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

-- LESSON 5

-- Question 1
DROP VIEW IF EXISTS Employees_List_Sale;
CREATE VIEW Employees_List_Sale AS
SELECT `Account`.AccountID AS EmployeeID, `Account`.Fullname
FROM `Account`
INNER JOIN Department ON `Account`.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName = 'sales';

-- Question 2
DROP VIEW IF EXISTS Accounts_List;
CREATE VIEW Accounts_List AS
WITH GroupCount AS (
    SELECT AccountID, COUNT(AccountID) AS GroupCount
    FROM GroupAccount
    GROUP BY AccountID
),
MaxGroupCount AS (
    SELECT MAX(GroupCount) AS MaxGroupCount
    FROM GroupCount
)
SELECT `Account`.AccountID, `Account`.Username, `Account`.Fullname
FROM `Account`
INNER JOIN GroupCount ON `Account`.AccountID = GroupCount.AccountID
INNER JOIN MaxGroupCount ON GroupCount.GroupCount = MaxGroupCount.MaxGroupCount;

-- Question 3
DROP VIEW IF EXISTS LongQuestions;
CREATE VIEW LongQuestions AS
SELECT *
FROM Question
WHERE LENGTH(Content) - LENGTH(REPLACE(Content, ' ', '')) + 1 > 14;

DELETE FROM Question
WHERE QuestionID IN (SELECT QuestionID FROM LongQuestions);

-- Question 4
DROP VIEW IF EXISTS Departments_List;
CREATE VIEW Departments_List AS
WITH DepartmentCount AS (
	SELECT DepartmentID, COUNT(DepartmentID) AS DepartmentCount
    FROM `Account`
    GROUP BY DepartmentID
),
MaxDepartmentCount AS (
	SELECT MAX(DepartmentCount) AS MaxDepartmentCount
    FROM DepartmentCount
)
SELECT Department.DepartmentID, Department.DepartmentName
FROM Department
INNER JOIN DepartmentCount ON Department.DepartmentID = DepartmentCount.DepartmentID
INNER JOIN MaxDepartmentCount ON DepartmentCount.DepartmentCount = MaxDepartmentCount.MaxDepartmentCount;

-- Question 5
DROP VIEW IF EXISTS Questions_List;
CREATE VIEW Questions_List AS
SELECT Question.QuestionID, Question.Content
FROM Question
INNER JOIN `Account` ON Question.CreatorID = `Account`.AccountID
WHERE SUBSTRING_INDEX(`Account`.FullName, ' ', 1) = 'Nguyen';

-- Lesson 6

-- Question 1

DROP PROCEDURE IF EXISTS Accounts_Department;
DELIMITER //
CREATE PROCEDURE Accounts_Department(IN Param_DepartmentName VARCHAR(50))
BEGIN
    SELECT `Account`.*
    FROM `Account`
    INNER JOIN Department ON `Account`.DepartmentID = Department.DepartmentID
    WHERE Department.DepartmentName = Param_DepartmentName;
END //
DELIMITER ;

CALL Accounts_Department('sales');

-- Question 2

DROP PROCEDURE IF EXISTS Count_Accounts_Groups;
DELIMITER //
CREATE PROCEDURE Count_Accounts_Groups(IN Param_GroupID INT)
BEGIN
    SELECT COUNT(AccountID) AS CountAccounts
    FROM GroupAccount
    WHERE GroupID = Param_GroupID;
    
END //
DELIMITER ;

CALL Count_Accounts_Groups(2);

-- Question 3

DROP PROCEDURE IF EXISTS CountQuestions;
DELIMITER //
CREATE PROCEDURE CountQuestions()
BEGIN
    SELECT TypeName, COUNT(*) AS NumQuestions
    FROM Question
    INNER JOIN TypeQuestion ON Question.TypeID = TypeQuestion.TypeID
    WHERE MONTH(CreateDate) = MONTH(CURDATE()) AND YEAR(CreateDate) = YEAR(CURDATE())
    GROUP BY TypeName;
END //
DELIMITER ;

CALL CountQuestions();

-- Question 4

DROP PROCEDURE IF EXISTS TypeQuestion_Used;
DELIMITER //
CREATE PROCEDURE TypeQuestion_Used()
BEGIN
    SELECT TypeID
    FROM Question
    GROUP BY TypeID
    HAVING COUNT(*) = (SELECT MAX(`Count`)
                       FROM (SELECT COUNT(*) AS `Count`
							  FROM Question
                              GROUP BY TypeID) AS T);
END //
DELIMITER ;

CALL TypeQuestion_Used();

-- Question 5

SELECT TypeName
FROM TypeQuestion
WHERE TypeID = TypeQuestion_Used();

-- Question 6

DROP PROCEDURE IF EXISTS SearchGroup_User;
DELIMITER //
CREATE PROCEDURE SearchGroup_User(IN search_string VARCHAR(255))
BEGIN
    SELECT GroupName AS Name
    FROM `Group`
    WHERE GroupName LIKE CONCAT('%', search_string, '%')
    UNION
    SELECT 
    Username AS Name
FROM
    `Account`
WHERE
    Username LIKE CONCAT('%', search_string, '%');
END //
DELIMITER ;

CALL SearchGroup_User('sales');

-- Question 7

DROP PROCEDURE IF EXISTS AddUser;
DELIMITER //
CREATE PROCEDURE AddUser(
    IN p_fullname NVARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_positionID INT,
    IN p_departmentID INT
)
BEGIN
    DECLARE p_username VARCHAR(30);
    SET p_username = SUBSTRING_INDEX(p_email, '@gmail', 1);
    INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
    VALUES (p_email, p_username, p_fullname, p_departmentID, p_positionID, CURDATE());
    SELECT CONCAT('Thêm user thành công với ID: ', LAST_INSERT_ID()) AS Result;
END //
DELIMITER ;

CALL AddUser('Nguyen Van A', 'baolong@gmail.com', 1, 1);

-- Question 8
DROP PROCEDURE IF EXISTS LongestQuestion;
DELIMITER //
CREATE PROCEDURE LongestQuestion(IN p_typeName ENUM('Essay', 'Multiple Choice'))
BEGIN
    SELECT Question.Content
    FROM Question
    INNER JOIN TypeQuestion ON Question.TypeID = TypeQuestion.TypeID
    WHERE TypeQuestion.TypeName = p_typeName AND LENGTH(Question.Content) = (
        SELECT MAX(LENGTH(Content))
        FROM Question
        INNER JOIN TypeQuestion ON Question.TypeID = TypeQuestion.TypeID
        WHERE TypeQuestion.TypeName = p_typeName
    );
END //
DELIMITER ;

CALL LongestQuestion('Essay');

CALL LongestQuestion('Multiple Choice');

-- Question 9

DROP PROCEDURE IF EXISTS DeleteExam;
DELIMITER //
CREATE PROCEDURE DeleteExam(IN p_examID INT)
BEGIN
    DELETE FROM Exam
    WHERE ExamID = p_examID;
END //
DELIMITER ;

CALL DeleteExam(1);

-- Question 10

-- Question 11

DROP PROCEDURE IF EXISTS DeleteDepartment;
DELIMITER //
CREATE PROCEDURE DeleteDepartment(IN departmentName VARCHAR(50))
BEGIN
    DECLARE defaultDepartmentID INT;
    DECLARE deleteDepartmentID INT;

    SET defaultDepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'Waiting for Work');
    SET deleteDepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = departmentName);

    UPDATE `Account` SET DepartmentID = defaultDepartmentID WHERE DepartmentID = deleteDepartmentID;
    DELETE FROM Department WHERE DepartmentID = deleteDepartmentID;
END //
DELIMITER ;

CALL DeleteDepartmentByName('sales');


-- Question 12

DROP PROCEDURE IF EXISTS CountQuestions_Month
DELIMITER //
CREATE PROCEDURE CountQuestions_Month()
BEGIN
    SELECT MONTH(CreateDate) AS 'Month', COUNT(*) AS 'Number of Questions'
    FROM Question
    WHERE YEAR(CreateDate) = YEAR(CURDATE())
    GROUP BY MONTH(CreateDate);
END //
DELIMITER ;

CALL CountQuestions_Month();

-- Question 13

-- Lesson 7

-- Question 1

DROP TRIGGER IF EXISTS check_group_create_date;
DELIMITER //
CREATE TRIGGER check_group_create_date
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
    IF NEW.CreateDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Du lieu nhap vao khong hop le!';
    END IF;
END //
DELIMITER ;

INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
VALUES ('Group1', '1', '2022-02-11');

-- Question 2

DROP TRIGGER IF EXISTS check_department_sale;
DELIMITER //
CREATE TRIGGER check_department_sale
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
    DECLARE department_name VARCHAR(50);
    SELECT DepartmentName INTO department_name 
    FROM Department 
    WHERE DepartmentID = NEW.DepartmentID;
    IF department_name = 'Sale' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khong the them nguoi dung vao phong ban sales';
    END IF;
END //
DELIMITER ;

-- Question 3

DROP TRIGGER IF EXISTS check_group_user_limit;
DELIMITER //
CREATE TRIGGER check_group_user_limit
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
    DECLARE user_count INT;
    SELECT COUNT(*) INTO user_count 
    FROM `Group` 
    WHERE GroupID = NEW.GroupID;
    IF user_count >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Group cannot have more than 5 users';
    END IF;
END //
DELIMITER ;

-- Question 4

DROP TRIGGER IF EXISTS check_exam_question_limit;
DELIMITER //
CREATE TRIGGER check_exam_question_limit
BEFORE INSERT ON ExamQuestion
FOR EACH ROW
BEGIN
    DECLARE question_count INT;
    SELECT COUNT(*) INTO question_count 
    FROM ExamQuestion 
    WHERE ExamID = NEW.ExamID;
    IF question_count >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bai thi co nhieu nhat 10 cau hoi';
    END IF;
END //
DELIMITER ;

-- Question 5 

DELIMITER //
CREATE TRIGGER check_account_delete
BEFORE DELETE ON `Account`
FOR EACH ROW
BEGIN
    IF OLD.Email = 'admin@gmail.com' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khong the xoa tai khoan admin';
    END IF;
END //
DELIMITER ;

-- Question 6

INSERT INTO Department (DepartmentName)
VALUES('waiting Department');

DROP TRIGGER IF EXISTS check_insert_account;
DELIMITER //
CREATE TRIGGER check_insert_account
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
    DECLARE waiting_department_id INT;
 SELECT 
    DepartmentID
INTO waiting_department_id FROM
    Department
WHERE
    DepartmentName = 'waiting Department';
    IF NEW.DepartmentID IS NULL THEN
        SET NEW.DepartmentID = waiting_department_id;
    END IF;
END //
DELIMITER ;

-- Question 7

DROP TRIGGER IF EXISTS check_answer_limit;
DELIMITER //
CREATE TRIGGER check_answer_limit
BEFORE INSERT ON Answer
FOR EACH ROW
BEGIN
    DECLARE answer_count INT;
    DECLARE correct_answer_count INT;
    SELECT COUNT(*), COUNT(isCorrect) INTO answer_count, correct_answer_count 
    FROM Answer 
    WHERE QuestionID = NEW.QuestionID;
    IF answer_count >= 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Question cannot have more than 4 answers';
	END IF;
    IF correct_answer_count >= 2 AND NEW.isCorrect = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Question cannot have more than 2 correct answers';
    END IF;
END //
DELIMITER ;

-- Question 8

DROP TRIGGER IF EXISTS set_gender_value;
DELIMITER //
CREATE TRIGGER set_gender_value
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
-- 	-- IF NEW.Gender NOT IN ('Male', 'Female', 'Unknown', 'nam', 'nữ', 'chưa xác định')
-- --     THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Gia tri khong hop le!';
-- --     END IF;
--     -- SET NEW.Gender = CASE NEW.Gender
-- --         WHEN 'nam' THEN 'Male'
-- --         WHEN 'nữ' THEN 'Female'
-- --         WHEN 'chưa xác định' THEN 'Unknown'
-- --         ELSE NEW.Gender
-- --     END;
END //
DELIMITER ;

INSERT INTO `Account` (Email, Username, Fullname, Gender, DepartmentID, PositionID, CreateDate)
VALUES ('klaus.hartl@stilb222uero.de', 'klaus2hartl', 'Nguyen Van Anhh', 'nam', '2', '3', '2022-11-20');
SELECT * FROM `Account`;
-- Question 9

DROP TRIGGER IF EXISTS check_exam_delete;
DELIMITER //
CREATE TRIGGER check_exam_delete
BEFORE DELETE ON Exam
FOR EACH ROW
BEGIN
    IF DATEDIFF(CURDATE(), CreateDate) < 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khong the xoa bai thi moi duoc tao 2 ngay';
    END IF;
END //
DELIMITER ;

-- Question 10

DROP TRIGGER IF EXISTS check_question_update;
DROP TRIGGER IF EXISTS check_question_delete;
DELIMITER //
CREATE TRIGGER check_question_update
BEFORE UPDATE ON Question
FOR EACH ROW
BEGIN
    DECLARE exam_count INT;
    SELECT COUNT(*) INTO exam_count FROM ExamQuestion WHERE QuestionID = OLD.QuestionID;
    IF exam_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khong the update cau hoi khi da co trong bai thi!';
    END IF;
END //

CREATE TRIGGER check_question_delete
BEFORE DELETE ON Question
FOR EACH ROW
BEGIN
    DECLARE exam_count INT;
    SELECT COUNT(*) INTO exam_count FROM ExamQuestion WHERE QuestionID = OLD.QuestionID;
    IF exam_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khong the xoa cau hoi khi da co trong bai thi!';
    END IF;
END //
DELIMITER ;

-- Question 11

SELECT ExamID, `Code`, Title, CategoryID,
    CASE
        WHEN Duration <= 30 THEN 'Short time'
        WHEN Duration > 30 AND Duration <= 60 THEN 'Medium time'
        ELSE 'Long time'
    END AS DurationText,
    CreatorID, CreateDate
FROM Exam;

-- Question 12

SELECT `Group`.GroupID, `Group`.GroupName, COUNT(AccountID) AS UserCount,
    CASE
        WHEN COUNT(AccountID) <= 5 THEN 'few'
        WHEN COUNT(AccountID) > 5 AND COUNT(AccountID) <= 20 THEN 'normal'
        ELSE 'higher'
    END AS the_number_user_amount
FROM `Group`
INNER JOIN GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
GROUP BY `Group`.GroupID, `Group`.GroupName;

-- Question 13

SELECT Department.DepartmentID, Department.DepartmentName,
    CASE
        WHEN COUNT(Account.AccountID) = 0 THEN 'Không có User'
        ELSE COUNT(Account.AccountID)
    END AS UserCount
FROM Department
LEFT JOIN `Account` ON Department.DepartmentID = `Account`.DepartmentID
GROUP BY Department.DepartmentID, Department.DepartmentName;


