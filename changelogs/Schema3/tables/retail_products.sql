--liquibase formatted sql
--changeset RAML:8f901234-5678-90ab-cdef-0123456789ab  runOnChange:true


CREATE OR REPLACE TABLE RETAILDB.PRODUCTS (
    PRODUCT_ID VARCHAR(50) PRIMARY KEY,
    SKU VARCHAR(50) NOT NULL UNIQUE,
    PRODUCT_NAME VARCHAR(200),
    CATEGORY VARCHAR(50),
    SUBCATEGORY VARCHAR(50),
    BRAND VARCHAR(100),
    UNIT_PRICE DECIMAL(10,2),
    COST_PRICE DECIMAL(10,2),
    WEIGHT_KG DECIMAL(8,3),
    DIMENSIONS VARCHAR(50),
    COLOR VARCHAR(30),
    SIZE VARCHAR(20),
    STOCK_QUANTITY INT,
    REORDER_LEVEL INT,
    SUPPLIER_ID VARCHAR(50),
    IS_ACTIVE BOOLEAN DEFAULT TRUE,
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO RETAILDB.PRODUCTS VALUES
('PROD001', 'SKU-ELEC-001', 'Wireless Bluetooth Headphones', 'ELECTRONICS', 'AUDIO', 'SoundPro', 89.99, 45.00, 0.250, '20x18x8 cm', 'BLACK', 'STANDARD', 150, 30, 'SUPP001', TRUE, CURRENT_TIMESTAMP()),
('PROD002', 'SKU-CLTH-001', 'Cotton T-Shirt', 'CLOTHING', 'TOPS', 'FashionCo', 24.99, 12.00, 0.200, '30x40x2 cm', 'BLUE', 'LARGE', 500, 100, 'SUPP002', TRUE, CURRENT_TIMESTAMP()),
('PROD003', 'SKU-HOME-001', 'Ceramic Coffee Mug', 'HOME', 'KITCHEN', 'HomeEssentials', 12.99, 6.50, 0.350, '10x10x12 cm', 'WHITE', 'STANDARD', 300, 50, 'SUPP003', TRUE, CURRENT_TIMESTAMP()),
('PROD004', 'SKU-BOOK-001', 'Python Programming Guide', 'BOOKS', 'TECHNOLOGY', 'TechPress', 39.99, 20.00, 0.800, '23x15x3 cm', 'MULTICOLOR', 'STANDARD', 75, 15, 'SUPP004', TRUE, CURRENT_TIMESTAMP()),
('PROD005', 'SKU-SPRT-001', 'Yoga Mat Premium', 'SPORTS', 'FITNESS', 'ActiveLife', 34.99, 18.00, 1.200, '183x61x0.6 cm', 'PURPLE', 'STANDARD', 200, 40, 'SUPP005', TRUE, CURRENT_TIMESTAMP());


CREATE OR REPLACE TABLE RETAILDB.SUPPLIERS (
    SUPPLIER_ID VARCHAR(50) PRIMARY KEY,
    SUPPLIER_NAME VARCHAR(200),
    CONTACT_PERSON VARCHAR(100),
    EMAIL VARCHAR(150),
    PHONE VARCHAR(20),
    ADDRESS VARCHAR(300),
    COUNTRY VARCHAR(50),
    RATING DECIMAL(3,2),
    PAYMENT_TERMS VARCHAR(50)
);

INSERT INTO RETAILDB.SUPPLIERS VALUES
('SUPP001', 'Global Electronics Ltd', 'James Chen', 'james@globalelec.com', '+86-21-5555-0101', '123 Tech Park, Shanghai', 'CHINA', 4.5, 'NET 30'),
('SUPP002', 'Textile World Inc', 'Maria Garcia', 'maria@textileworld.com', '+91-22-5555-0102', '456 Fashion District, Mumbai', 'INDIA', 4.2, 'NET 45'),
('SUPP003', 'Home Goods Manufacturing', 'Robert Smith', 'robert@homegoods.com', '+1-555-0103', '789 Industrial Ave, Chicago', 'USA', 4.8, 'NET 30'),
('SUPP004', 'Academic Publishers Group', 'Dr. Sarah Johnson', 'sarah@academicpub.com', '+44-20-5555-0104', '321 Oxford Street, London', 'UK', 4.6, 'NET 60'),
('SUPP005', 'Sports Equipment Co', 'Michael Brown', 'michael@sportseq.com', '+49-30-5555-0105', '654 Sport Strasse, Berlin', 'GERMANY', 4.4, 'NET 30');
