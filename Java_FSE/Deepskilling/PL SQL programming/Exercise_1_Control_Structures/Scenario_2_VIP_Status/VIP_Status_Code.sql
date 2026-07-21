SET SERVEROUTPUT ON;

BEGIN

    FOR customer_rec IN (
        SELECT CustomerID,
               Name,
               Balance
        FROM Customers
    )
    LOOP

        IF customer_rec.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'Y',
                LastModified = SYSDATE
            WHERE CustomerID = customer_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                customer_rec.Name ||
                ' promoted to VIP.'
            );

        ELSE

            UPDATE Customers
            SET IsVIP = 'N',
                LastModified = SYSDATE
            WHERE CustomerID = customer_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                customer_rec.Name ||
                ' is not eligible for VIP.'
            );

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'VIP Status Updated Successfully.'
    );

END;
/

SELECT
    CustomerID,
    Name,
    Balance,
    IsVIP
FROM Customers;