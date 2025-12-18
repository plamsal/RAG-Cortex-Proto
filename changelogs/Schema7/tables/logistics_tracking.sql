--liquibase formatted sql
--changeset PratikL:t012345678-def0-1234-5678-901234567890  runOnChange:true


CREATE OR REPLACE TABLE LOGISTICSDB.TRACKING_EVENTS (
    EVENT_ID VARCHAR(50) PRIMARY KEY,
    SHIPMENT_ID VARCHAR(50),
    EVENT_TIMESTAMP TIMESTAMP_NTZ,
    EVENT_TYPE VARCHAR(50),
    LOCATION VARCHAR(200),
    STATUS VARCHAR(50),
    DESCRIPTION VARCHAR(500),
    SCAN_BY VARCHAR(100)
);

INSERT INTO LOGISTICSDB.TRACKING_EVENTS VALUES
('EVT001', 'SHP001', '2025-12-16 08:00:00', 'PICKED_UP', 'Newark, NJ', 'IN_TRANSIT', 'Package picked up from warehouse', 'Driver001'),
('EVT002', 'SHP001', '2025-12-16 12:00:00', 'IN_TRANSIT', 'Jersey City Hub, NJ', 'IN_TRANSIT', 'Arrived at sorting facility', 'Scanner002'),
('EVT003', 'SHP001', '2025-12-17 09:00:00', 'OUT_FOR_DELIVERY', 'New York, NY', 'OUT_FOR_DELIVERY', 'Out for delivery', 'Driver003'),
('EVT004', 'SHP001', '2025-12-17 15:30:00', 'DELIVERED', 'New York, NY', 'DELIVERED', 'Delivered and signed by J. Smith', 'Driver003'),
('EVT005', 'SHP002', '2025-12-17 09:00:00', 'PICKED_UP', 'Newark, NJ', 'IN_TRANSIT', 'Package picked up from warehouse', 'Driver001'),
('EVT006', 'SHP002', '2025-12-17 16:00:00', 'IN_TRANSIT', 'Philadelphia Hub, PA', 'IN_TRANSIT', 'Arrived at regional hub', 'Scanner004'),
('EVT007', 'SHP003', '2025-12-15 10:00:00', 'PICKED_UP', 'Chicago, IL', 'IN_TRANSIT', 'Package picked up for international shipment', 'Driver005'),
('EVT008', 'SHP003', '2025-12-16 05:00:00', 'IN_TRANSIT', 'JFK Airport, NY', 'IN_TRANSIT', 'Arrived at international gateway', 'Scanner006'),
('EVT009', 'SHP003', '2025-12-18 12:00:00', 'CUSTOMS', 'Heathrow Airport, UK', 'CUSTOMS_CLEARANCE', 'Customs clearance in progress', 'Customs001');


CREATE OR REPLACE TABLE LOGISTICSDB.CARRIER_RATES (
    RATE_ID VARCHAR(50) PRIMARY KEY,
    CARRIER VARCHAR(100),
    SERVICE_TYPE VARCHAR(50),
    ORIGIN_ZONE VARCHAR(20),
    DESTINATION_ZONE VARCHAR(20),
    MIN_WEIGHT_KG DECIMAL(8,3),
    MAX_WEIGHT_KG DECIMAL(8,3),
    BASE_RATE DECIMAL(10,2),
    PER_KG_RATE DECIMAL(10,2)
);

INSERT INTO LOGISTICSDB.CARRIER_RATES VALUES
('RT001', 'FedEx', 'EXPRESS', 'US-EAST', 'US-EAST', 0.000, 5.000, 15.00, 2.50),
('RT002', 'FedEx', 'EXPRESS', 'US-EAST', 'US-WEST', 0.000, 5.000, 25.00, 3.50),
('RT003', 'UPS', 'GROUND', 'US-EAST', 'US-WEST', 0.000, 10.000, 18.00, 2.00),
('RT004', 'DHL International', 'INTERNATIONAL', 'US', 'EU', 0.000, 10.000, 75.00, 8.00),
('RT005', 'USPS', 'PRIORITY', 'US-EAST', 'US-CENTRAL', 0.000, 5.000, 12.00, 1.50);
