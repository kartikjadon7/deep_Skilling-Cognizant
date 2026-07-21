SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_source_account      IN Accounts.AccountID%TYPE,
    p_destination_account IN Accounts.AccountID%TYPE,
    p_amount              IN NUMBER
)
AS
    v_source_balance Accounts.Balance%TYPE;
    v_destination_count NUMBER;
BEGIN
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Transfer amount must be greater than zero.'
        );
    END IF;

    IF p_source_account = p_destination_account THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Source and destination accounts cannot be the same.'
        );
    END IF;

    SELECT Balance
    INTO v_source_balance
    FROM Accounts
    WHERE AccountID = p_source_account
    FOR UPDATE;

    SELECT COUNT(*)
    INTO v_destination_count
    FROM Accounts
    WHERE AccountID = p_destination_account;

    IF v_destination_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Destination account does not exist.'
        );
    END IF;

    IF v_source_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(
            -20005,
            'Insufficient balance in source account.'
        );
    END IF;

    UPDATE Accounts
    SET Balance = Balance - p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_source_account;

    UPDATE Accounts
    SET Balance = Balance + p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_destination_account;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Transfer completed successfully.'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Amount transferred: ' || p_amount
    );

    DBMS_OUTPUT.PUT_LINE(
        'Source account: ' || p_source_account
    );

    DBMS_OUTPUT.PUT_LINE(
        'Destination account: '
        || p_destination_account
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;

        DBMS_OUTPUT.PUT_LINE(
            'Source account does not exist.'
        );

    WHEN OTHERS THEN
        ROLLBACK;

        DBMS_OUTPUT.PUT_LINE(
            'Transfer failed: ' || SQLERRM
        );
END;
/
BEGIN
    TransferFunds(1, 2, 500);
END;
/
SELECT
    AccountID,
    Balance
FROM Accounts
WHERE AccountID IN (1, 2)
ORDER BY AccountID;