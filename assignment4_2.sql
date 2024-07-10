CREATE TABLE COURSES_OFFERED (
    courseID         VARCHAR(20),
    classification   VARCHAR(20) NOT NULL,
    prerequisite     VARCHAR(75),
    course_name      VARCHAR(30) NOT NULL,
    antirequisite    VARCHAR(75),
    semester_offered VARCHAR(20) NOT NULL,
    
    CONSTRAINT C_pk
    PRIMARY KEY(courseID)
);

CREATE TABLE STAFF (
    staffID      VARCHAR(20),
    courses_taught  VARCHAR(20),
    phone_number VARCHAR(20) NOT NULL,
    email        VARCHAR(30) NOT NULL,
    staff_name   VARCHAR(30) NOT NULL,
    office       VARCHAR(20) NOT NULL,
    
    CONSTRAINT ST_pk
    PRIMARY KEY (staffID)
);

CREATE TABLE PROGRAM (
    programID             VARCHAR(20),
    courses               VARCHAR(75) NOT NULL,
    degree_type           VARCHAR(20) NOT NULL,
    liberal_a_requirement INT NOT NULL,
    liberal_b_requirement INT NOT NULL,
    program_length        INT NOT NULL,
    
    CONSTRAINT P_pk
    PRIMARY KEY (programID)
);

CREATE TABLE STUDENT (
    studentID     VARCHAR(20),
    programID     VARCHAR(20),
    first_name    VARCHAR(20) NOT NULL,
    last_name     VARCHAR(20) NOT NULL,
    pass          VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    CGPA          DEC(3, 2) NOT NULL,
    academic_standing VARCHAR(20) NOT NULL,
    
    CONSTRAINT S_pk
    PRIMARY KEY(studentID)
    
);

CREATE TABLE FEES (
    studentID   VARCHAR(20),
    meal_plan        DEC(7, 2),
    tuition_fees     DEC(7, 2) ,
    semester         VARCHAR(50),
    security_fees    DEC(7, 2),
    outstanding_fees DEC(7, 2) NOT NULL,
    CONSTRAINT F_fk1
    FOREIGN KEY(studentID)
    REFERENCES STUDENT(studentID)
);

CREATE TABLE TRANSCRIPT (
    studentID VARCHAR(20),
    courseID VARCHAR(20),
    staffID VARCHAR(20),
    semester VARCHAR(20),
    GPA DEC(3, 2),
    expected_credits NUMBER,
    credits_recieved NUMBER,
       
    CONSTRAINT  T_fk1
    FOREIGN KEY (studentID)
    REFERENCES  student(studentID) ON DELETE CASCADE,
    CONSTRAINT T_fk2
    FOREIGN KEY(courseID)
    REFERENCES courses_offered(courseID) ON DELETE CASCADE,
    CONSTRAINT T_fk3
    FOREIGN KEY(staffID)
    REFERENCES staff(staffID) ON DELETE CASCADE
    
);



ALTER TABLE STUDENT
    ADD CONSTRAINT S_fk1
    FOREIGN KEY(programID)
    REFERENCES PROGRAM(programID) ON DELETE CASCADE;

INSERT INTO program (programid, courses, degree_type, liberal_a_requirement,liberal_b_requirement, program_length)
VALUES ('COE', 'CEN199 COE318 ELE302 MTH312 MTH314 ELE404 COE428', 'Bachelors', 2, 2, 4);
INSERT INTO program (programid, courses, degree_type, liberal_a_requirement,liberal_b_requirement, program_length)
VALUES ('ELE', 'CEN199 ELE532 ELE302 MTH312 MTH314 ELE404 COE428', 'Bachelors', 2, 2, 4);
INSERT INTO program (programid, courses, degree_type, liberal_a_requirement,liberal_b_requirement, program_length)
VALUES ('CHE', 'CEN199 MEC511 CHE502', 'Bachelors', 2, 2, 4);

INSERT INTO student (studentid,programID, first_name,last_name,pass,date_of_birth, CGPA, academic_standing)
VALUES ('500826320','COE','Mahir','Faisal','ryersonIsC00L',TO_DATE('2000-09-14', 'YYYY-MM-DD'),3.67, 'Clear');
INSERT INTO student (studentid,programID, first_name,last_name,pass,date_of_birth, CGPA, academic_standing)
VALUES ('500947873','COE','Kurt','de Souza','abc123',TO_DATE('2001-12-16', 'YYYY-MM-DD'),3.33,'Clear');
INSERT INTO student (studentid,programID, first_name,last_name,pass,date_of_birth, CGPA, academic_standing)
VALUES ('500885647','ELE', 'Kasey','Chow','abcdef',TO_DATE('2000-04-12', 'YYYY-MM-DD'),3.67,'Clear');

INSERT INTO Staff (StaffID, courses_taught, Phone_Number, Email, Staff_Name, Office)
VALUES ('300200100', 'CPS510','4169796972', 'aabhari@cs.ryerson.ca', 'Abdolreza Abhari', 'ENG 225');
INSERT INTO Staff (StaffID, courses_taught, Phone_Number, Email, Staff_Name, Office)
VALUES ('300200101', 'COE538 MTH312','4169791234', 'sbtajali@ryerson.ca', 'Soheila Bashardoust-Tajali', 'ENG 225');
INSERT INTO Staff (StaffID, courses_taught, Phone_Number, Email, Staff_Name, Office)
VALUES ('300200102', 'ELE532 COE328','4159796088', 'vgeurkov@ryerson.ca', 'Vadim Geurkov', 'ENG 430');
INSERT INTO Staff (StaffID, courses_taught, Phone_Number, Email, Staff_Name, Office)
VALUES ('300200103', NULL,'4169796076','lkirish@ryerson.ca', 'Lev Kirischian', 'ENG 432');

INSERT INTO Courses_Offered (CourseID, Classification, Prerequisite, Course_Name, Antirequisite, Semester_Offered)
VALUES ('CPS510', 'Required', 'CPS305 or COE428 COE528', 'Database Systems I', 'ITM500', 'FALL2021');
INSERT INTO Courses_Offered (CourseID, Classification, Prerequisite, Course_Name, Semester_Offered)
VALUES ('COE538', 'Required', 'COE328 ELE404 MTH314 CEN199', 'Microprocessor Systems',  'FALL2021');
INSERT INTO Courses_Offered (CourseID, Classification, Prerequisite, Course_Name, Semester_Offered)
VALUES ('ELE532', 'Required', 'CEN199 COE318 ELE302 MTH312 MTH314 ELE404 COE428', 'Signals and Systems I', 'FALL2021');
INSERT INTO Courses_Offered (CourseID, Classification, Course_Name, Semester_Offered)
VALUES ('ENG503', 'Required', 'Science Fiction', 'FALL2021, WINTER2022');

INSERT INTO Fees(studentID, meal_plan,tuition_fees, semester, security_fees, outstanding_fees)
VALUES ('500826320', 8000.67, 5348.00, 'FALL2021', 0.0, 0.0);
INSERT INTO Fees(studentID, meal_plan,tuition_fees, semester, security_fees, outstanding_fees)
VALUES ('500947873', 0.0, 5348.00, 'FALL2021', 100.00, 100.00);
INSERT INTO Fees(studentID, meal_plan,tuition_fees, semester, security_fees, outstanding_fees)
VALUES ('500885647', 0.0, 5348.00, 'FALL2021', 100.00, 5348.50);

INSERT INTO Transcript(studentID, courseID, staffID, semester, GPA, expected_credits, credits_recieved)
VALUES ('500947873', 'CPS510', '300200100', 'FALL2021', 4.33, 1, 1);
INSERT INTO Transcript(studentID, courseID, staffID, semester, GPA, expected_credits, credits_recieved)
VALUES ('500947873', 'COE538', '300200101', 'FALL2021', 2.67, 1, 1);
INSERT INTO Transcript(studentID, courseID, staffID, semester, GPA, expected_credits, credits_recieved)
VALUES ('500947873', 'ELE532', '300200102', 'FALL2021', 1.00, 1, 0);

SELECT DISTINCT transcript.studentid, courseID, GPA FROM 
    transcript
    INNER JOIN student
    ON student.studentID = transcript.studentId;
    
SELECT DISTINCT fees.studentid, outstanding_fees FROM 
    FEES
    INNER JOIN student
    ON student.studentID = fees.studentId;

SELECT programid, courses, program_length
FROM program
WHERE courses LIKE '%MTH312%'
ORDER BY programid;

SELECT studentid, semester, outstanding_fees
FROM Fees
WHERE outstanding_fees > 0.0
ORDER BY studentid;

SELECT studentid, first_name, last_name
FROM student
WHERE programid = 'COE'
ORDER BY first_name;
       
SELECT * FROM Staff
ORDER BY StaffID ASC;

UPDATE Staff
SET Phone_Number = 4169796828
WHERE StaffID = 'sbtajali';

SELECT DISTINCT Office
FROM Staff;
       
SELECT * FROM Courses_Offered
ORDER BY Course_Name ASC;

UPDATE Courses_Offered
SET Classification = 'Liberal B'
WHERE CourseID = 'ENG503';

SELECT studentID, courseID, semester, GPA
FROM Transcript
WHERE credits_recieved > 0
ORDER BY studentID;

SELECT studentID, courseID, semester, GPA 
FROM Transcript
WHERE studentID = '500947873'
AND gpa > 3.00;

CREATE VIEW course_complete AS
SELECT courseid, gpa
FROM transcript
WHERE credits_recieved = 1;

CREATE VIEW required_courses AS
SELECT courseid, course_name
FROM courses_offered
WHERE classification = 'required';

CREATE VIEW deansList AS
SELECT first_name,last_name,cgpa
FROM student WHERE CGPA > 3.00
;

CREATE VIEW programsOffered AS
SELECT * FROM program
WHERE programID = 'COE'
OR programID = 'ELE';


CREATE VIEW students_with_charges AS
SELECT * FROM Fees
WHERE outstanding_fees > 0;

CREATE VIEW specific_building AS
SELECT * FROM Staff
WHERE office = 'ENG 225';

SELECT * FROM course_complete;
SELECT * FROM required_courses;
SELECT * FROM deansList;
SELECT * FROM programsOffered;
SELECT * FROM students_with_charges;
/*
DROP VIEW course_complete;
DROP VIEW required_courses;
DROP VIEW specific_building;
DROP VIEW deansList;
DROP VIEW programsOffered;
DROP VIEW students_with_charges;


drop table "K2DESOUZ"."COURSES_OFFERED" cascade constraints PURGE;
drop table "K2DESOUZ"."STAFF" cascade constraints PURGE;
drop table "K2DESOUZ"."STUDENT" cascade constraints PURGE;
drop table "K2DESOUZ"."PROGRAM" cascade constraints PURGE;
drop table "K2DESOUZ"."FEES" cascade constraints PURGE;
drop table "K2DESOUZ"."TRANSCRIPT" cascade constraints PURGE; 
*/