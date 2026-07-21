SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department       IN Employees.Department%TYPE,
    p_bonus_percentage IN NUMBER
)
AS
    v_updated_employees NUMBER;
BEGIN
    IF p_bonus_percentage < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Bonus percentage cannot be negative.'
        );
    END IF;

    UPDATE Employees
    SET Salary = Salary
                 + (Salary * p_bonus_percentage / 100)
    WHERE UPPER(Department) = UPPER(p_department);

    v_updated_employees := SQL%ROWCOUNT;

    IF v_updated_employees = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employees found in department: '
            || p_department
        );
    ELSE
        COMMIT;

        DBMS_OUTPUT.PUT_LINE(
            'Bonus applied successfully to department: '
            || p_department
        );

        DBMS_OUTPUT.PUT_LINE(
            'Employees updated: '
            || v_updated_employees
        );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;

        DBMS_OUTPUT.PUT_LINE(
            'Error while updating employee bonus: '
            || SQLERRM
        );
END;
/
BEGIN
    UpdateEmployeeBonus('IT', 10);
END;
/
SELECT
    EmployeeID,
    Name,
    Department,
    Salary
FROM Employees
ORDER BY EmployeeID;