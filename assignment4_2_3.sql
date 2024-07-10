CREATE TABLE COURSE_INFO(
    courseID VARCHAR(20),
    classification VARCHAR(20),
    course_name VARCHAR(20),
    
    CONSTRAINT CI_pk
    PRIMARY KEY(courseID)
)
CREATE TABLE COURSE_TIMELINE(
    courseID VARCHAR(20),
    semester VARCHAR(20),
    CONSTRAINT CT_fk1
    FOREIGN KEY(courseID)
    REFERENCES COURSE_INFO(courseID)
)
CREATE TABLE PREREQUISITES(
    courseID VARCHAR(20),
    classification VARCHAR(20),
    prerequisite VARCHAR(20),
    
    CONSTRAINT P_fk1
    FOREIGN KEY(courseID)
    REFERENCES COURSE_INFO(courseID),
    CONSTRAINT P_fk2
    FOREIGN KEY (prerequisite)
    REFERENCES COURSE_INFO(courseID)
)
CREATE TABLE STAFF_CONTACT (
    staffID      VARCHAR(20),
    phone_number VARCHAR(20) NOT NULL,
    email        VARCHAR(30) NOT NULL,
    CONSTRAINT SC_pk
    PRIMARY KEY (staffID)
);
CREATE TABLE STAFF_INFO (
    staffID      VARCHAR(20),
    staff_name   VARCHAR(30) NOT NULL,
    office       VARCHAR(20) NOT NULL,
    
    CONSTRAINT ST_pk
    PRIMARY KEY (staffID)
);
CREATE TABLE COURSES_TAUGHT(
    courseID VARCHAR(20),
    staffID VARCHAR(20),
    
    CONSTRAINT C_fk1
    FOREIGN KEY(courseID)
    REFERENCES COURSE_INFO(courseID) ON DELETE CASCADE,
    
    CONSTRAINT C_fk2
    FOREIGN KEY(staffID)
    REFERENCES STAFF_INFO(staffID) ON DELETE CASCADE
);
CREATE TABLE PROGRAMS_OFFERED(
    programID             VARCHAR(20),
    degree_type           VARCHAR(20) NOT NULL,
    liberal_a_requirement INT NOT NULL,
    liberal_b_requirement INT NOT NULL,
    program_length        INT NOT NULL,
    CONSTRAINT PO_pk
    PRIMARY KEY (programID)
);
CREATE TABLE PROGRAM_REQUIREMENTS (
    programID             VARCHAR(20),
    mandatory_courses     VARCHAR(75) NOT NULL,    
    CONSTRAINT PR_fk1
    FOREIGN KEY (programID)
    REFERENCES PROGRAMS_OFFERED(programID) ON DELETE CASCADE
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
    semester VARCHAR(20),
    GPA DEC(3, 2),
    CONSTRAINT  T_fk1
    FOREIGN KEY (studentID)
    REFERENCES  STUDENT(studentID) ON DELETE CASCADE,
    CONSTRAINT T_fk2
    FOREIGN KEY(courseID)
    REFERENCES COURSE_INFO(courseID) ON DELETE CASCADE
);
CREATE TABLE CREDITS_RECIEVED(
    GPA DEC(3, 2),
    credits_recieved NUMBER,
    
    CONSTRAINT CR_pk1
    PRIMARY KEY(GPA)
);

CREATE TABLE EXPECTED_CREDITS(
    courseID VARCHAR(20),
    EXPECTED_CREDITS NUMBER,
    CONSTRAINT EC_fk1
    FOREIGN KEY(courseID)
    REFERENCES COURSE_INFO(courseID) ON DELETE CASCADE
);




ALTER TABLE STUDENT
    ADD CONSTRAINT S_fk1
    FOREIGN KEY(programID)
    REFERENCES PROGRAM(programID) ON DELETE CASCADE;

