SET SERVEROUTPUT ON;

DECLARE
    v_count NUMBER := 0;
BEGIN

    FOR loan_rec IN (
        SELECT
            l.LoanID,
            l.LoanAmount,
            l.EndDate,
            c.CustomerID,
            c.Name
        FROM Loans l
        JOIN Customers c
            ON l.CustomerID = c.CustomerID
        WHERE TRUNC(l.EndDate)
              BETWEEN TRUNC(SYSDATE)
              AND TRUNC(SYSDATE + 30)
        ORDER BY l.EndDate
    )
    LOOP

        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear '
            || loan_rec.Name
            || ', your Loan ID '
            || loan_rec.LoanID
            || ' of amount '
            || loan_rec.LoanAmount
            || ' is due on '
            || TO_CHAR(loan_rec.EndDate, 'DD-MON-YYYY')
            || '.'
        );

    END LOOP;

    IF v_count = 0 THEN

        DBMS_OUTPUT.PUT_LINE(
            'No loans are due within the next 30 days.'
        );

    ELSE

        DBMS_OUTPUT.PUT_LINE(
            'Total reminders generated: '
            || v_count
        );

    END IF;

END;
/
SELECT
    l.LoanID,
    c.Name,
    l.LoanAmount,
    l.EndDate
FROM Loans l
JOIN Customers c
    ON l.CustomerID = c.CustomerID
WHERE TRUNC(l.EndDate)
      BETWEEN TRUNC(SYSDATE)
      AND TRUNC(SYSDATE + 30);