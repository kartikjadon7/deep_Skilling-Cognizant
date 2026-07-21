SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
    v_updated_accounts NUMBER;
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = SYSDATE
    WHERE UPPER(AccountType) = 'SAVINGS';

    v_updated_accounts := SQL%ROWCOUNT;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Monthly interest applied successfully.'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Accounts updated: ' || v_updated_accounts
    );

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;

        DBMS_OUTPUT.PUT_LINE(
            'Error while processing monthly interest: '
            || SQLERRM
        );
END;
/
BEGIN
    ProcessMonthlyInterest;
END;
/
SELECT
    AccountID,
    AccountType,
    Balance,
    LastModified
FROM Accounts
ORDER BY AccountID;