SET SERVEROUTPUT ON;

DECLARE
    v_age NUMBER;
BEGIN

    FOR customer_rec IN (
        SELECT CustomerID, Name, DOB
        FROM Customers
    )
    LOOP

        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, customer_rec.DOB) / 12);

        IF v_age > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = customer_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'Customer : ' || customer_rec.Name ||
                ' | Age : ' || v_age ||
                ' | Loan Interest Reduced by 1%'
            );

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Process Completed Successfully.');

END;