--liquibase formatted sql
--changeset PratikL:j012345678-3456-789a-bcde-f01234567890  runOnChange:true


CREATE OR REPLACE TABLE MFGDB.QUALITY_INSPECTIONS (
    INSPECTION_ID VARCHAR(50) PRIMARY KEY,
    PRODUCTION_ORDER_ID VARCHAR(50),
    INSPECTION_DATE TIMESTAMP_NTZ,
    INSPECTOR_NAME VARCHAR(100),
    INSPECTION_TYPE VARCHAR(50),
    SAMPLE_SIZE INT,
    PASS_COUNT INT,
    FAIL_COUNT INT,
    PASS_RATE DECIMAL(5,2),
    OVERALL_STATUS VARCHAR(30),
    DEFECT_TYPES VARCHAR(500),
    CORRECTIVE_ACTION VARCHAR(1000),
    NOTES VARCHAR(1000)
);

INSERT INTO MFGDB.QUALITY_INSPECTIONS VALUES
('QI001', 'PO001', '2025-12-15 16:00:00', 'Alice QC Manager', 'FINAL_INSPECTION', 100, 95, 5, 95.00, 'PASS', 'Minor surface scratches', 'Additional polishing step added', 'Acceptable quality level achieved'),
('QI002', 'PO002', '2025-12-17 16:30:00', 'Bob Inspector', 'FINAL_INSPECTION', 50, 50, 0, 100.00, 'PASS', 'None', 'No action required', 'Perfect batch'),
('QI003', 'PO003', '2025-12-16 14:00:00', 'Carol QC Lead', 'IN_PROCESS_INSPECTION', 75, 70, 5, 93.33, 'PASS', 'Dimensional variance', 'Calibrated equipment', 'Within tolerance'),
('QI004', 'PO001', '2025-12-12 10:00:00', 'Alice QC Manager', 'FIRST_ARTICLE_INSPECTION', 10, 9, 1, 90.00, 'CONDITIONAL_PASS', 'Material impurity', 'Changed material batch', 'Required material verification');


CREATE OR REPLACE TABLE MFGDB.DEFECT_CATEGORIES (
    DEFECT_CODE VARCHAR(30) PRIMARY KEY,
    DEFECT_NAME VARCHAR(100),
    SEVERITY VARCHAR(20),
    CATEGORY VARCHAR(50),
    DESCRIPTION VARCHAR(500)
);

INSERT INTO MFGDB.DEFECT_CATEGORIES VALUES
('DEF-001', 'Surface Scratch', 'LOW', 'COSMETIC', 'Minor surface imperfections that do not affect functionality'),
('DEF-002', 'Dimensional Variance', 'MEDIUM', 'DIMENSIONAL', 'Measurements outside specified tolerance range'),
('DEF-003', 'Material Impurity', 'HIGH', 'MATERIAL', 'Contaminants or wrong material composition'),
('DEF-004', 'Structural Crack', 'CRITICAL', 'STRUCTURAL', 'Cracks or fractures that compromise integrity'),
('DEF-005', 'Assembly Error', 'HIGH', 'ASSEMBLY', 'Incorrect assembly or missing components');
