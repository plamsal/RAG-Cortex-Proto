--liquibase formatted sql
--changeset RAML:ac901234567-6789-abcd-ef01-890123456789  runOnChange:true


CREATE OR REPLACE TABLE TELECOMDB.SUBSCRIBERS (
    SUBSCRIBER_ID VARCHAR(50) PRIMARY KEY,
    ACCOUNT_NUMBER VARCHAR(30) NOT NULL UNIQUE,
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100),
    EMAIL VARCHAR(150),
    PHONE_NUMBER VARCHAR(20) UNIQUE,
    BILLING_ADDRESS VARCHAR(500),
    CITY VARCHAR(100),
    STATE VARCHAR(50),
    ZIP_CODE VARCHAR(20),
    ACTIVATION_DATE DATE,
    STATUS VARCHAR(30),
    PLAN_ID VARCHAR(50),
    AUTO_PAY_ENABLED BOOLEAN,
    PAPERLESS_BILLING BOOLEAN,
    CREDIT_SCORE_RANGE VARCHAR(20)
);

INSERT INTO TELECOMDB.SUBSCRIBERS VALUES
('SUB001', 'ACC-2023-001', 'James', 'Anderson', 'james.a@email.com', '+1-555-6001', '123 Wireless Way', 'New York', 'NY', '10001', '2023-03-15', 'ACTIVE', 'PLAN001', TRUE, TRUE, '750-800'),
('SUB002', 'ACC-2023-002', 'Maria', 'Garcia', 'maria.g@email.com', '+1-555-6002', '456 Network Ave', 'Los Angeles', 'CA', '90001', '2023-05-22', 'ACTIVE', 'PLAN002', TRUE, TRUE, '700-749'),
('SUB003', 'ACC-2024-001', 'Robert', 'Johnson', 'robert.j@email.com', '+1-555-6003', '789 Tower St', 'Chicago', 'IL', '60601', '2024-01-10', 'ACTIVE', 'PLAN003', FALSE, TRUE, '650-699'),
('SUB004', 'ACC-2022-045', 'Linda', 'Martinez', 'linda.m@email.com', '+1-555-6004', '321 Signal Rd', 'Houston', 'TX', '77001', '2022-11-05', 'ACTIVE', 'PLAN001', TRUE, FALSE, '800+'),
('SUB005', 'ACC-2024-002', 'William', 'Davis', 'william.d@email.com', '+1-555-6005', '654 Connect Dr', 'Phoenix', 'AZ', '85001', '2024-08-20', 'SUSPENDED', 'PLAN002', FALSE, TRUE, '600-649');


CREATE OR REPLACE TABLE TELECOMDB.SERVICE_PLANS (
    PLAN_ID VARCHAR(50) PRIMARY KEY,
    PLAN_NAME VARCHAR(100),
    PLAN_TYPE VARCHAR(50),
    MONTHLY_FEE DECIMAL(10,2),
    DATA_GB INT,
    TALK_MINUTES INT,
    TEXT_MESSAGES INT,
    INTERNATIONAL_CALLING BOOLEAN,
    HOTSPOT_INCLUDED BOOLEAN,
    STREAMING_INCLUDED VARCHAR(100),
    OVERAGE_RATE_PER_GB DECIMAL(10,2),
    CONTRACT_TERM_MONTHS INT,
    DESCRIPTION VARCHAR(1000)
);

INSERT INTO TELECOMDB.SERVICE_PLANS VALUES
('PLAN001', 'Ultimate Unlimited', 'POSTPAID', 80.00, 9999, 9999, 9999, TRUE, TRUE, 'HD Video, Music', 0.00, 0, 'Unlimited everything with premium features'),
('PLAN002', 'Premium Plus', 'POSTPAID', 60.00, 50, 9999, 9999, FALSE, TRUE, 'SD Video', 10.00, 0, 'High data allowance with unlimited talk and text'),
('PLAN003', 'Basic Value', 'PREPAID', 35.00, 10, 500, 9999, FALSE, FALSE, 'None', 15.00, 0, 'Budget-friendly with essential features'),
('PLAN004', 'Business Pro', 'POSTPAID', 100.00, 9999, 9999, 9999, TRUE, TRUE, 'Business Apps', 0.00, 24, 'Enterprise-grade plan with priority support');
