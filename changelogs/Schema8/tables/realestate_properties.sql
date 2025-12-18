--liquibase formatted sql
--changeset RAML:x456789012-1234-5678-9abc-345678901234  runOnChange:true


CREATE OR REPLACE TABLE REALESTATEDB.PROPERTIES (
    PROPERTY_ID VARCHAR(50) PRIMARY KEY,
    LISTING_ID VARCHAR(30) NOT NULL UNIQUE,
    PROPERTY_TYPE VARCHAR(50),
    ADDRESS VARCHAR(500),
    CITY VARCHAR(100),
    STATE VARCHAR(50),
    ZIP_CODE VARCHAR(20),
    COUNTRY VARCHAR(50),
    BEDROOMS INT,
    BATHROOMS DECIMAL(3,1),
    SQUARE_FEET INT,
    LOT_SIZE_SQFT INT,
    YEAR_BUILT INT,
    LISTING_PRICE DECIMAL(15,2),
    STATUS VARCHAR(30),
    LISTING_DATE DATE,
    SOLD_DATE DATE,
    SOLD_PRICE DECIMAL(15,2),
    AGENT_ID VARCHAR(50),
    DESCRIPTION VARCHAR(2000),
    FEATURES VARCHAR(1000)
);

INSERT INTO REALESTATEDB.PROPERTIES VALUES
('PROP001', 'LIST-2025-001', 'SINGLE_FAMILY', '123 Oak Street', 'San Francisco', 'CA', '94102', 'USA', 3, 2.0, 2000, 5000, 2015, 1250000.00, 'ACTIVE', '2025-12-01', NULL, NULL, 'AGT001', 'Beautiful single family home in prime location', 'Hardwood floors, Updated kitchen, Large backyard'),
('PROP002', 'LIST-2025-002', 'CONDO', '456 Park Avenue Apt 5B', 'New York', 'NY', '10001', 'USA', 2, 2.0, 1200, 0, 2018, 950000.00, 'ACTIVE', '2025-12-05', NULL, NULL, 'AGT002', 'Modern condo with city views', 'Doorman, Gym, Rooftop terrace'),
('PROP003', 'LIST-2025-003', 'TOWNHOUSE', '789 Main Street', 'Boston', 'MA', '02101', 'USA', 4, 3.5, 2800, 2000, 2010, 875000.00, 'UNDER_CONTRACT', '2025-11-15', NULL, NULL, 'AGT003', 'Spacious townhouse near downtown', 'Garage, Finished basement, Patio'),
('PROP004', 'LIST-2024-045', 'SINGLE_FAMILY', '321 Elm Drive', 'Austin', 'TX', '78701', 'USA', 3, 2.5, 2200, 8000, 2020, 650000.00, 'SOLD', '2024-10-01', '2024-11-15', 640000.00, 'AGT001', 'Modern home with open floor plan', 'Smart home, Solar panels, Pool'),
('PROP005', 'LIST-2025-004', 'CONDO', '654 Beach Boulevard Unit 12', 'Miami', 'FL', '33139', 'USA', 2, 2.0, 1400, 0, 2019, 725000.00, 'ACTIVE', '2025-12-10', NULL, NULL, 'AGT004', 'Beachfront condo with ocean views', 'Concierge, Pool, Beach access');


CREATE OR REPLACE TABLE REALESTATEDB.AGENTS (
    AGENT_ID VARCHAR(50) PRIMARY KEY,
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100),
    EMAIL VARCHAR(150),
    PHONE_NUMBER VARCHAR(20),
    LICENSE_NUMBER VARCHAR(50),
    OFFICE_LOCATION VARCHAR(200),
    YEARS_EXPERIENCE INT,
    SPECIALIZATION VARCHAR(100),
    TOTAL_SALES INT,
    TOTAL_SALES_VOLUME DECIMAL(18,2)
);

INSERT INTO REALESTATEDB.AGENTS VALUES
('AGT001', 'Jennifer', 'Realtor', 'jennifer.r@realty.com', '+1-555-4001', 'CA-DRE-123456', 'San Francisco Office', 8, 'Luxury Homes', 45, 67500000.00),
('AGT002', 'Michael', 'Broker', 'michael.b@realty.com', '+1-555-4002', 'NY-LIC-789012', 'Manhattan Office', 12, 'Condos & Apartments', 78, 85000000.00),
('AGT003', 'Sarah', 'Property', 'sarah.p@realty.com', '+1-555-4003', 'MA-REG-345678', 'Boston Office', 6, 'Urban Properties', 32, 28000000.00),
('AGT004', 'David', 'Sales', 'david.s@realty.com', '+1-555-4004', 'FL-BRK-901234', 'Miami Office', 10, 'Waterfront Properties', 55, 42000000.00);
