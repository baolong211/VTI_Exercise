DROP DATABASE IF EXISTS Lesson6extra;
CREATE DATABASE Lesson6extra;
USE Lesson6extra;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    EmployeeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeLastName NVARCHAR(30) NOT NULL,
    EmployeeFirstName NVARCHAR(30) NOT NULL,
    EmployeeHireDate DATETIME DEFAULT NOW (),
    EmployeeStatus BIT NOT NULL,
    SupervisorID TINYINT UNSIGNED NOT NULL,
    SocialSecurityNumber CHAR(5),
    FOREIGN KEY (SupervisorID)
        REFERENCES Employee (EmployeeID)
);

DROP TABLE IF EXISTS Project_Modules;
CREATE TABLE Project_Modules (
    ModuleID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ProjectID TINYINT UNSIGNED NOT NULL,
    EmployeeID TINYINT UNSIGNED NOT NULL,
    ProjectModulesDate DATETIME,
    ProjectModulesCompletedOn DATETIME,
    ProjectModulesDescription NVARCHAR(50),
    FOREIGN KEY (ProjectID)
        REFERENCES Employee (EmployeeID),
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID)
);

DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects (
    ProjectID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ManagerID TINYINT UNSIGNED NOT NULL,
    ProjectName NVARCHAR(50) NOT NULL,
    ProjectStartDate DATETIME,
    ProjectDescription NVARCHAR(50) NOT NULL,
    ProjectDetail NVARCHAR(50) NOT NULL,
    ProjectCompletedOn DATETIME,
    FOREIGN KEY (ManagerID)
        REFERENCES Employee (EmployeeID)
);

DROP TABLE IF EXISTS Work_Done;
CREATE TABLE Work_Done (
    WorkDoneID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeID TINYINT UNSIGNED NOT NULL,
    ModuleID TINYINT UNSIGNED NOT NULL,
    WorkDoneDate DATETIME,
    WorkDoneDescription NVARCHAR(50) NOT NULL,
    WorkDoneStatus BIT NOT NULL,
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID),
    FOREIGN KEY (ModuleID)
        REFERENCES Project_Modules (ModuleID)
) INSERT

INSERT INTO Employee		( EmployeeLastName	, EmployeeFirstName	, EmployeeHireDate	, EmployeeStatus, SupervisorID	, SocialSecurityNumber	)
VALUE						(N'Nguyễn Hải'		,N'Đăng'			,'2019-06-06'		, 		1		,		1		,'SS001'				),
							(N'Lê Thị'			,N'Thư'				,'2019-07-06'		, 		1		,		1		,'SS002'				),
                            (N'Nguyễn Hữu'		,N'Thắng'			,'2019-08-06'		, 		1		,		2		,'SS003'				),
                            (N'Dương Văn'		,N'Hữu'				,'2019-07-06'		, 		0		,		2		,'SS004'				);

INSERT INTO Projects		 ( ManagerID , ProjectName 		, ProjectStartDate	, ProjectDescription	, ProjectDetail		, ProjectCompletedOn	)
VALUE						(	1		,'Java'				,	'2019-06-06'	, 'Làm đúng vào'		,'Làm đúng hạn'		,	'2019-08-06'		),
							(	2		,'C#'				,	'2019-07-06'	, 'Làm nhanh lên'		,'Làm trước hạn'	,	'2019-09-06'		),
                            (	3		,'Android'			,	'2019-08-06'	, 'Nộp trước ngày 17/3'	,'Làm quá hạn'		,	'2019-10-06'		),
                            (	1		,'C++'				,	'2019-07-06'	, 'Không biết đừng làm'	,'Làm trước hạn'	,	'2019-11-06'		);
                            
INSERT INTO Project_Modules (ProjectID	, EmployeeID, ProjectModulesDate, ProjectModulesCompletedOn	, ProjectModulesDescription	)
VALUE						(	1		,	1		,	'2019-06-06'	, '2019-06-06'		,	'Làm đúng hạn'			),
							(	2		,	2		,	'2019-07-06'	, '2019-06-06'		,	'Làm trước hạn'			),
                            (	3		,	3		,	'2019-08-06'	, '2019-09-06'		,	'Làm quá hạn'			),
                            (	4		,	1		,	'2019-07-06'	, '2019-06-06'		,	'Làm trước hạn'			);

INSERT INTO Work_Done		( EmployeeID, ModuleID	, WorkDoneDate	, WorkDoneDescription	, WorkDoneStatus	)
VALUE						(	1		,	1		,'2019-06-06'	, 'Làm được phết'		,		1			),
							(	2		,	2		,'2019-07-06'	, 'Làm ổn phết'			,		1			),
                            (	3		,	3		,'2019-08-06'	, 'Không biết làm'		,		0			),
                            (	1		,	4		,'2019-07-06'	, 'Không biết ko làm'	,		0			);


-- Question

-- Question b

DROP PROCEDURE IF EXISTS RemoveProjects;
DELIMITER //
CREATE PROCEDURE RemoveProjects()
BEGIN
	DECLARE project_remove_count INT;
    DELETE FROM Projects WHERE ProjectCompletedOn IS NOT NULL AND ProjectCompletedOn < DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
    SET project_remove_count = (SELECT COUNT(*)
                               FROM Projects 
                               WHERE ProjectCompletedOn IS NOT NULL AND ProjectCompletedOn < DATE_SUB(CURDATE(), INTERVAL 3 MONTH));
	SELECT CONCAT('Removed', project_remove_count, 'projects records');
END //
DELIMITER ;

CALL RemoveProjects();

-- Question c

DROP PROCEDURE IF EXISTS CurrentModules;
DELIMITER //
CREATE PROCEDURE CurrentModules(IN Param_ProjectID TINYINT UNSIGNED)
BEGIN
	SELECT ModuleID, ProjectModulesDescription
    FROM Project_Modules
    WHERE ProjectID = Param_ProjectID AND ProjectModulesCompletedOn IS NULL;
END //
DELIMITER ;

CALL CurrentModules(1);

-- Question d

DROP FUNCTION IF EXISTS EmployeeJoined;
DELIMITER //
CREATE FUNCTION EmployeeJoined(Param_EmployeeID TINYINT UNSIGNED)
RETURNS NVARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE EmployeeName NVARCHAR(50);
	SELECT CONCAT(EmployeeLastName, ' ', EmployeeFirstName) INTO EmployeeName
    FROM Employee
    WHERE Param_EmployeeID = EmployeeID AND Param_EmployeeID NOT IN (SELECT DISTINCT(EmployeeID) FROM Work_Done);
    RETURN EmployeeName;
END //
DELIMITER ;

SELECT EmployeeJoined(2);

-- Extra Assignment 7

DROP TRIGGER IF EXISTS check_project_modules_date;
DELIMITER //
CREATE TRIGGER check_project_modules_date
BEFORE INSERT ON Project_Modules
FOR EACH ROW
BEGIN
    DECLARE project_start_date DATETIME;
    DECLARE project_completed_on DATETIME;
    SELECT ProjectStartDate, ProjectCompletedOn INTO project_start_date, project_completed_on 
    FROM Projects 
    WHERE ProjectID = NEW.ProjectID;
    IF NEW.ProjectModulesDate < project_start_date OR (project_completed_on IS NOT NULL AND NEW.ProjectModulesCompletedOn > project_completed_on) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Du lieu nhap vao khong hop le!';
    END IF;
END //
DELIMITER ;

INSERT INTO Project_Modules (ProjectID, EmployeeID, ProjectModulesDate, ProjectModulesCompletedOn, ProjectModulesDescription)
VALUES (1, 2, '2019-06-01', '2019-08-26', 'Làm đúng hạn');

  