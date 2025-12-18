--liquibase formatted sql
--changeset RAML:n456789012-789a-bcde-f012-345678901234  runOnChange:true


CREATE OR REPLACE TABLE EDUDB.STUDENTS (
    STUDENT_ID VARCHAR(50) PRIMARY KEY,
    STUDENT_NUMBER VARCHAR(20) NOT NULL UNIQUE,
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100),
    EMAIL VARCHAR(150),
    PHONE_NUMBER VARCHAR(20),
    DATE_OF_BIRTH DATE,
    ENROLLMENT_DATE DATE,
    PROGRAM VARCHAR(100),
    YEAR_LEVEL INT,
    STATUS VARCHAR(30),
    GPA DECIMAL(3,2),
    TOTAL_CREDITS_EARNED INT,
    ADVISOR_ID VARCHAR(50),
    ADDRESS VARCHAR(300),
    EMERGENCY_CONTACT VARCHAR(200)
);

INSERT INTO EDUDB.STUDENTS VALUES
('STU001', 'S2023001', 'Emma', 'Thompson', 'emma.t@university.edu', '+1-555-2001', '2002-03-15', '2023-09-01', 'Computer Science', 2, 'ACTIVE', 3.75, 45, 'FAC001', '123 Campus Dr, Boston, MA', 'Linda Thompson +1-555-2002'),
('STU002', 'S2023002', 'Liam', 'Anderson', 'liam.a@university.edu', '+1-555-2003', '2003-07-22', '2023-09-01', 'Business Administration', 2, 'ACTIVE', 3.50, 48, 'FAC002', '456 University Ave, Boston, MA', 'Mark Anderson +1-555-2004'),
('STU003', 'S2024001', 'Olivia', 'Martinez', 'olivia.m@university.edu', '+1-555-2005', '2004-11-08', '2024-09-01', 'Engineering', 1, 'ACTIVE', 3.85, 15, 'FAC003', '789 College Rd, Cambridge, MA', 'Rosa Martinez +1-555-2006'),
('STU004', 'S2022005', 'Noah', 'Wilson', 'noah.w@university.edu', '+1-555-2007', '2001-05-30', '2022-09-01', 'Biology', 3, 'ACTIVE', 3.60, 75, 'FAC004', '321 Student Lane, Boston, MA', 'Sarah Wilson +1-555-2008'),
('STU005', 'S2023003', 'Ava', 'Garcia', 'ava.g@university.edu', '+1-555-2009', '2002-09-17', '2023-09-01', 'Psychology', 2, 'ACTIVE', 3.90, 50, 'FAC005', '654 Academic St, Cambridge, MA', 'Carlos Garcia +1-555-2010');


CREATE OR REPLACE TABLE EDUDB.COURSES (
    COURSE_ID VARCHAR(50) PRIMARY KEY,
    COURSE_CODE VARCHAR(20) NOT NULL UNIQUE,
    COURSE_NAME VARCHAR(200),
    DEPARTMENT VARCHAR(100),
    CREDITS INT,
    DESCRIPTION VARCHAR(1000),
    PREREQUISITES VARCHAR(200),
    INSTRUCTOR_ID VARCHAR(50),
    MAX_ENROLLMENT INT,
    SEMESTER VARCHAR(20),
    YEAR INT
);

INSERT INTO EDUDB.COURSES VALUES
('CRS001', 'CS101', 'Introduction to Programming', 'Computer Science', 3, 'Fundamentals of programming using Python', NULL, 'FAC001', 30, 'FALL', 2025),
('CRS002', 'BUS201', 'Marketing Principles', 'Business', 3, 'Core concepts of marketing and strategy', NULL, 'FAC002', 40, 'FALL', 2025),
('CRS003', 'ENG101', 'Engineering Mechanics', 'Engineering', 4, 'Introduction to statics and dynamics', 'MATH101', 'FAC003', 25, 'FALL', 2025),
('CRS004', 'BIO202', 'Molecular Biology', 'Biology', 4, 'DNA, RNA, and protein synthesis', 'BIO101', 'FAC004', 20, 'FALL', 2025),
('CRS005', 'PSY301', 'Cognitive Psychology', 'Psychology', 3, 'Study of mental processes', 'PSY101', 'FAC005', 35, 'FALL', 2025);
