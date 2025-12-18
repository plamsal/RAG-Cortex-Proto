--liquibase formatted sql
--changeset RAML:c345678901-cdef-0123-4567-89abcdef0123  runOnChange:true


CREATE OR REPLACE PROCEDURE RETAILDB.SP_UPDATE_INVENTORY(
    PRODUCT_ID_PARAM VARCHAR,
    QUANTITY_CHANGE INT,
    OPERATION_TYPE VARCHAR
)
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
DECLARE
    CURRENT_STOCK INT;
    NEW_STOCK INT;
    REORDER_LVL INT;
    RESULT_MSG VARCHAR;
BEGIN
    -- Get current stock
    SELECT STOCK_QUANTITY, REORDER_LEVEL INTO CURRENT_STOCK, REORDER_LVL
    FROM RETAILDB.PRODUCTS
    WHERE PRODUCT_ID = :PRODUCT_ID_PARAM;

    -- Calculate new stock based on operation
    IF (:OPERATION_TYPE = 'ADD') THEN
        NEW_STOCK := :CURRENT_STOCK + :QUANTITY_CHANGE;
    ELSIF (:OPERATION_TYPE = 'REMOVE') THEN
        NEW_STOCK := :CURRENT_STOCK - :QUANTITY_CHANGE;
        IF (NEW_STOCK < 0) THEN
            RETURN 'ERROR: Insufficient stock. Current: ' || :CURRENT_STOCK || ', Requested: ' || :QUANTITY_CHANGE;
        END IF;
    ELSE
        RETURN 'ERROR: Invalid operation type. Use ADD or REMOVE';
    END IF;

    -- Update inventory
    UPDATE RETAILDB.PRODUCTS
    SET STOCK_QUANTITY = :NEW_STOCK
    WHERE PRODUCT_ID = :PRODUCT_ID_PARAM;

    -- Build result message
    RESULT_MSG := 'Inventory updated for product ' || :PRODUCT_ID_PARAM ||
                  '. Previous: ' || :CURRENT_STOCK ||
                  ', Change: ' || :QUANTITY_CHANGE ||
                  ', New: ' || :NEW_STOCK;

    -- Add reorder warning if needed
    IF (NEW_STOCK <= REORDER_LVL) THEN
        RESULT_MSG := :RESULT_MSG || ' WARNING: Stock below reorder level (' || :REORDER_LVL || ')';
    END IF;

    RETURN RESULT_MSG;
END;
$$;
