package TestingSystem_1;

import java.util.Date;

public class Program {
    public static void main(String[] args) {
        // Create Department object
        Department department1 = new Department();
        department1.departmentId = 1;
        department1.departmentName = "sales";

        System.out.println("Department Object: ");
        System.out.println("DepartmentID: " + department1.departmentId);
        System.out.println("Department Name: " + department1.departmentName);
        System.out.println("================================");

        Department department2 = new Department();
        department2.departmentId = 2;
        department2.departmentName = "marketing";

        Department department3 = new Department();
        department3.departmentId = 3;
        department3.departmentName = "accounting";

        // Create Position object
        Position position1 = new Position();
        position1.positionId = 1;
        position1.positionName = "CEO";

        System.out.println("Position Object: ");
        System.out.println("PositionID: " + position1.positionId);
        System.out.println("Position Name: " + position1.positionName);
        System.out.println("================================");

        Position position2 = new Position();
        position2.positionId = 2;
        position2.positionName = "CFO";

        Position position3 = new Position();
        position3.positionId = 3;
        position3.positionName = "CFO";

        // Create Account object
        Account account1 = new Account();
        account1.accountId = 1;
        account1.email = "klaus.hartl@stilbuero.de";
        account1.username = "klaushartl";
        account1.fullName = "Nguyen Van Anh";
        account1.gender = "Male";
        account1.departmentId = department1.departmentId;
        account1.positionId = position1.positionId;
        account1.createDate = new Date();

        System.out.println("Account Object: ");
        System.out.println("AccountID: " + account1.accountId);
        System.out.println("Email: " + account1.email);
        System.out.println("Username: " + account1.username);
        System.out.println("Full name: " + account1.fullName);
        System.out.println("Gender: " + account1.gender);
        System.out.println("DepartmentID: " + account1.departmentId);
        System.out.println("PositionID: " + account1.positionId);
        System.out.println("Create date: " + account1.createDate);
        System.out.println("================================");

        Account account2 = new Account();
        account2.accountId = 2;
        account2.email = "tinhocketoanatp@gmail.com";
        account2.username = "tinhocketoan";
        account2.fullName = "Pham Van Bach";
        account2.gender = "Female";
        account2.departmentId = department1.departmentId;
        account2.positionId = position2.positionId;
        account2.createDate = new Date();

        Account account3 = new Account();
        account3.accountId = 3;
        account3.email = "cokhibinhdiep@gmail.com";
        account3.username = "cokhibinhdiep";
        account3.fullName = "Tran Van Cu";
        account3.gender = "Male";
        account3.departmentId = department1.departmentId;
        account3.positionId = position3.positionId;
        account3.createDate = new Date();

        // Create Group object
        Group group1 = new Group();
        group1.groupId = 1;
        group1.groupName = "Battlers";
        group1.creatorId = account1.accountId;
        group1.createDate = new Date();

        System.out.println("Group Object: ");
        System.out.println("GroupID: " + group1.groupId);
        System.out.println("Group name: " + group1.groupName);
        System.out.println("CreatorID: " + group1.creatorId);
        System.out.println("Create date: " + group1.createDate);
        System.out.println("================================");

        Group group2 = new Group();
        group2.groupId = 2;
        group2.groupName = "Blue Boys";
        group2.creatorId = account2.accountId;
        group2.createDate = new Date();

        Group group3 = new Group();
        group3.groupId = 3;
        group3.groupName = "Titans";
        group3.creatorId = account3.accountId;
        group3.createDate = new Date();

        // Create GroupAccount object
        GroupAccount groupAccount1 = new GroupAccount();
        groupAccount1.groupAccountId = 1;
        groupAccount1.groupId = group1;
        groupAccount1.accountId = account1.accountId;
        groupAccount1.joinDate = new Date();

        System.out.println("GroupAccount Object: ");
        System.out.println("GroupAccountID: " + groupAccount1.groupAccountId);
        System.out.println("GroupID: " + groupAccount1.groupId);
        System.out.println("AccountID: " + groupAccount1.accountId);
        System.out.println("Join Date: " + groupAccount1.joinDate);
        System.out.println("================================");

        GroupAccount groupAccount2 = new GroupAccount();
        groupAccount2.groupAccountId = 2;
        groupAccount2.groupId = group2;
        groupAccount2.accountId = account1.accountId;
        groupAccount2.joinDate = new Date();

        GroupAccount groupAccount3 = new GroupAccount();
        groupAccount3.groupAccountId = 3;
        groupAccount3.groupId = group3;
        groupAccount3.accountId = account1.accountId;
        groupAccount3.joinDate = new Date();

        // Create TypeQuestion object
        TypeQuestion typeQuestion1 = new TypeQuestion();
        typeQuestion1.typeId = 1;
        typeQuestion1.typeName = "Essay";

        System.out.println("TypeQuestion Object: ");
        System.out.println("TypeID: " + typeQuestion1.typeId);
        System.out.println("Type Name: " + typeQuestion1.typeName);
        System.out.println("================================");

        TypeQuestion typeQuestion2 = new TypeQuestion();
        typeQuestion2.typeId = 2;
        typeQuestion2.typeName = "Multiple Choice";

        TypeQuestion typeQuestion3 = new TypeQuestion();
        typeQuestion3.typeId = 3;
        typeQuestion3.typeName = "Essay";

        // Create CategoryQuestion object
        CategoryQuestion categoryQuestion1 = new CategoryQuestion();
        categoryQuestion1.categoryId = 1;
        categoryQuestion1.categoryName = "Java";

        System.out.println("CategoryQuestion Object: ");
        System.out.println("CategoryID: " + categoryQuestion1.categoryId);
        System.out.println("CategoryName: " + categoryQuestion1.categoryName);
        System.out.println("================================");

        CategoryQuestion categoryQuestion2 = new CategoryQuestion();
        categoryQuestion2.categoryId = 2;
        categoryQuestion2.categoryName = ".NET";

        CategoryQuestion categoryQuestion3 = new CategoryQuestion();
        categoryQuestion3.categoryId = 3;
        categoryQuestion3.categoryName = "Python";

        // Create Question object
        Question question1 = new Question();
        question1.questionId = 1;
        question1.content = "Đâu không phải là một kiểu dữ liệu nguyên thủy trong Java?";
        question1.categoryId = categoryQuestion1.categoryId;
        question1.typeId = typeQuestion1.typeId;
        question1.creatorId = account1.accountId;
        question1.createDate = new Date();

        System.out.println("Question Object: ");
        System.out.println("QuestionID: " + question1.questionId);
        System.out.println("Content: " + question1.content);
        System.out.println("CategoryID: " + question1.categoryId);
        System.out.println("TypeID: " + question1.typeId);
        System.out.println("CreatorID: " + question1.creatorId);
        System.out.println("Create date: " + question1.createDate);
        System.out.println("================================");

        Question question2 = new Question();
        question2.questionId = 2;
        question2.content = "Ngôn ngữ nào dưới đây có thể được dùng để viết các kịch bản đằng Servertrong ASP.NET?";
        question2.categoryId = categoryQuestion2.categoryId;
        question2.typeId = typeQuestion2.typeId;
        question2.creatorId = account2.accountId;
        question2.createDate = new Date();

        Question question3 = new Question();
        question3.questionId = 1;
        question3.content = "Kí hiệu nào dùng để xác định các khối lệnh (khối lệnh của hàm, vòng lặp,...) trong Python?";
        question3.categoryId = categoryQuestion3.categoryId;
        question3.typeId = typeQuestion3.typeId;
        question3.creatorId = account3.accountId;
        question3.createDate = new Date();

        // Create Answer object
        Answer answer1 = new Answer();
        answer1.answerId = 1;
        answer1.content = "long float";
        answer1.questionId = question1.questionId;
        answer1.isCorrect = true;
        System.out.println("Answer Object: ");

        System.out.println("AnswerID: " + answer1.answerId);
        System.out.println("Content: " + answer1.content);
        System.out.println("QuestionID: " + answer1.questionId);
        System.out.println("True or False: " + answer1.isCorrect);
        System.out.println("================================");

        Answer answer2 = new Answer();
        answer2.answerId = 2;
        answer2.content = "C++";
        answer2.questionId = question2.questionId;
        answer2.isCorrect = false;

        Answer answer3 = new Answer();
        answer3.answerId = 3;
        answer3.content = "Thụt lề";
        answer3.questionId = question3.questionId;
        answer3.isCorrect = true;

        // Create Exam object
        Exam exam1 = new Exam();
        exam1.examId = 1;
        exam1.code = "J001";
        exam1.title = "Interview Question";
        exam1.categoryId = categoryQuestion1.categoryId;
        exam1.duration = 45; // in minutes
        exam1.creatorId  = 1;
        exam1.createDate = new Date();

        System.out.println("Exam Object: ");
        System.out.println("ExamID: " + exam1.examId);
        System.out.println("Code: " + exam1.code);
        System.out.println("Title: " + exam1.title);
        System.out.println("CategoryID: " + exam1.categoryId);
        System.out.println("Duration: " + exam1.duration);
        System.out.println("CreatorID: " + exam1.creatorId);
        System.out.println("Create date: " + exam1.createDate);
        System.out.println("================================");

        Exam exam2 = new Exam();
        exam2.examId = 2;
        exam2.code = "C#001";
        exam2.title = "Technical Question";
        exam2.categoryId = categoryQuestion2.categoryId;
        exam2.duration = 70; // in minutes
        exam2.creatorId  = 2;
        exam2.createDate = new Date();

        Exam exam3 = new Exam();
        exam3.examId = 3;
        exam3.code = "P001";
        exam3.title = "Interview Question";
        exam3.categoryId = categoryQuestion3.categoryId;
        exam3.duration = 60; // in minutes
        exam3.creatorId  = 3;
        exam3.createDate = new Date();

        // Create ExamQuestion object
        ExamQuestion examQuestion1 = new ExamQuestion();
        examQuestion1.examQuestionId = 1;
        examQuestion1.examId = exam1.examId;
        examQuestion1.questionId = question1.questionId;

        System.out.println("ExamQuestion Object: ");
        System.out.println("ExamQuestionID: " + examQuestion1.examQuestionId);
        System.out.println("ExamID: " + examQuestion1.examId);
        System.out.println("QuestionID: " + examQuestion1.questionId);

        ExamQuestion examQuestion2 = new ExamQuestion();
        examQuestion2.examQuestionId = 2;
        examQuestion2.examId = exam2.examId;
        examQuestion2.questionId = question2.questionId;

        ExamQuestion examQuestion3 = new ExamQuestion();
        examQuestion3.examQuestionId = 3;
        examQuestion3.examId = exam3.examId;
        examQuestion3.questionId = question3.questionId;
    }
}
