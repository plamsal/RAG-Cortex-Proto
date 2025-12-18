--liquibase formatted sql
--changeset RAML:d456789012-def0-1234-5678-9abcdef01234  runOnChange:true


CREATE OR REPLACE TABLE HRDB.EMPLOYEES (
    EMPLOYEE_ID VARCHAR(50) PRIMARY KEY,
    EMPLOYEE_NUMBER VARCHAR(20) NOT NULL UNIQUE,
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100),
    EMAIL VARCHAR(150),
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE,
    JOB_TITLE VARCHAR(100),
    DEPARTMENT_ID VARCHAR(50),
    MANAGER_ID VARCHAR(50),
    SALARY DECIMAL(12,2),
    EMPLOYMENT_STATUS VARCHAR(30),
    EMPLOYMENT_TYPE VARCHAR(30),
    LOCATION VARCHAR(100),
    DATE_OF_BIRTH DATE,
    EMERGENCY_CONTACT_NAME VARCHAR(100),
    EMERGENCY_CONTACT_PHONE VARCHAR(20),
    IS_ACTIVE BOOLEAN DEFAULT TRUE
);

INSERT INTO HRDB.EMPLOYEES VALUES
('EMP001', 'E001', 'John', 'Smith', 'john.smith@company.com', '+1-555-1001', '2020-01-15', 'Senior Software Engineer', 'DEPT001', 'EMP010', 95000.00, 'ACTIVE', 'FULL_TIME', 'New York', '1988-05-20', 'Jane Smith', '+1-555-1002', TRUE),
('EMP002', 'E002', 'Sarah', 'Johnson', 'sarah.johnson@company.com', '+1-555-1003', '2019-03-22', 'Product Manager', 'DEPT002', 'EMP011', 105000.00, 'ACTIVE', 'FULL_TIME', 'San Francisco', '1985-09-15', 'Mike Johnson', '+1-555-1004', TRUE),
('EMP003', 'E003', 'Michael', 'Williams', 'michael.williams@company.com', '+1-555-1005', '2021-07-10', 'Data Analyst', 'DEPT003', 'EMP012', 75000.00, 'ACTIVE', 'FULL_TIME', 'Chicago', '1992-12-03', 'Lisa Williams', '+1-555-1006', TRUE),
('EMP004', 'E004', 'Emily', 'Brown', 'emily.brown@company.com', '+1-555-1007', '2018-11-05', 'HR Manager', 'DEPT004', 'EMP013', 85000.00, 'ACTIVE', 'FULL_TIME', 'Boston', '1987-04-28', 'David Brown', '+1-555-1008', TRUE),
('EMP005', 'E005', 'David', 'Martinez', 'david.martinez@company.com', '+1-555-1009', '2022-02-14', 'Marketing Specialist', 'DEPT005', 'EMP014', 65000.00, 'ACTIVE', 'FULL_TIME', 'Austin', '1995-08-17', 'Maria Martinez', '+1-555-1010', TRUE);


CREATE OR REPLACE TABLE HRDB.DEPARTMENTS (
    DEPARTMENT_ID VARCHAR(50) PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(100),
    DEPARTMENT_CODE VARCHAR(20),
    MANAGER_ID VARCHAR(50),
    LOCATION VARCHAR(100),
    BUDGET DECIMAL(15,2),
    HEADCOUNT INT
);

INSERT INTO HRDB.DEPARTMENTS VALUES
('DEPT001', 'Engineering', 'ENG', 'EMP010', 'New York', 5000000.00, 45),
('DEPT002', 'Product Management', 'PROD', 'EMP011', 'San Francisco', 2000000.00, 15),
('DEPT003', 'Data & Analytics', 'DATA', 'EMP012', 'Chicago', 1500000.00, 20),
('DEPT004', 'Human Resources', 'HR', 'EMP013', 'Boston', 800000.00, 10),
('DEPT005', 'Marketing', 'MKTG', 'EMP014', 'Austin', 1200000.00, 18);
