--liquibase formatted sql
--changeset PratikL:ai567890123-cdef-0123-4567-456789012345  runOnChange:true


CREATE OR REPLACE TABLE INSURANCEDB.CLAIMS (
    CLAIM_ID VARCHAR(50) PRIMARY KEY,
    CLAIM_NUMBER VARCHAR(30) NOT NULL UNIQUE,
    POLICY_ID VARCHAR(50),
    CLAIM_DATE DATE,
    INCIDENT_DATE DATE,
    CLAIM_TYPE VARCHAR(50),
    CLAIM_STATUS VARCHAR(30),
    CLAIMED_AMOUNT DECIMAL(12,2),
    APPROVED_AMOUNT DECIMAL(12,2),
    PAID_AMOUNT DECIMAL(12,2),
    DEDUCTIBLE_APPLIED DECIMAL(10,2),
    ADJUSTER_ID VARCHAR(50),
    DESCRIPTION VARCHAR(2000),
    RESOLUTION_DATE DATE,
    RESOLUTION_NOTES VARCHAR(1000)
);

INSERT INTO INSURANCEDB.CLAIMS VALUES
('CLM001', 'CLAIM-2025-001', 'POL001', '2025-10-15', '2025-10-14', 'AUTO_ACCIDENT', 'PAID', 8500.00, 7500.00, 6500.00, 1000.00, 'ADJ001', 'Rear-end collision on highway, vehicle repairs needed', '2025-11-20', 'Claim approved and paid'),
('CLM002', 'CLAIM-2025-002', 'POL002', '2025-11-01', '2025-10-30', 'PROPERTY_DAMAGE', 'APPROVED', 15000.00, 12500.00, 0.00, 2500.00, 'ADJ002', 'Water damage from burst pipe, repairs to kitchen and bathroom', '2025-11-25', 'Approved pending completion of repairs'),
('CLM003', 'CLAIM-2025-003', 'POL004', '2025-12-01', '2025-11-28', 'MEDICAL', 'PENDING', 4500.00, NULL, 0.00, NULL, 'ADJ003', 'Emergency room visit and follow-up care', NULL, 'Under review by medical team'),
('CLM004', 'CLAIM-2024-089', 'POL001', '2024-08-10', '2024-08-08', 'AUTO_VANDALISM', 'DENIED', 2000.00, 0.00, 0.00, 0.00, 'ADJ001', 'Broken windows reported', '2024-08-25', 'Denied - incident occurred before policy effective date'),
('CLM005', 'CLAIM-2025-004', 'POL005', '2025-12-10', '2025-12-09', 'AUTO_ACCIDENT', 'IN_REVIEW', 5500.00, NULL, 0.00, NULL, 'ADJ001', 'Side-impact collision, liability determination pending', NULL, 'Police report and witness statements being reviewed');


CREATE OR REPLACE TABLE INSURANCEDB.CLAIM_DOCUMENTS (
    DOCUMENT_ID VARCHAR(50) PRIMARY KEY,
    CLAIM_ID VARCHAR(50),
    DOCUMENT_TYPE VARCHAR(50),
    DOCUMENT_NAME VARCHAR(200),
    UPLOAD_DATE TIMESTAMP_NTZ,
    UPLOADED_BY VARCHAR(100),
    FILE_SIZE_KB INT,
    VERIFIED BOOLEAN
);

INSERT INTO INSURANCEDB.CLAIM_DOCUMENTS VALUES
('DOC001', 'CLM001', 'POLICE_REPORT', 'accident_report_101425.pdf', '2025-10-15 14:30:00', 'John Johnson', 256, TRUE),
('DOC002', 'CLM001', 'PHOTO', 'vehicle_damage_front.jpg', '2025-10-15 14:35:00', 'John Johnson', 1024, TRUE),
('DOC003', 'CLM002', 'REPAIR_ESTIMATE', 'plumber_estimate.pdf', '2025-11-01 09:00:00', 'Patricia Davis', 512, TRUE),
('DOC004', 'CLM003', 'MEDICAL_BILL', 'er_invoice_112825.pdf', '2025-12-01 10:15:00', 'Linda Anderson', 128, FALSE);
