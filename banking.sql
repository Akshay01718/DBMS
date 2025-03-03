DECLARE
    V_BALANCE NUMBER := 500; -- Initial balance
    V_AMOUNT  NUMBER;
    V_CHOICE  NUMBER;

    PROCEDURE CREDIT(
        P_AMOUNT NUMBER
    ) IS
    BEGIN
        V_BALANCE := V_BALANCE + P_AMOUNT;
        DBMS_OUTPUT.PUT_LINE('Amount Credited: '
                             || P_AMOUNT);
        DBMS_OUTPUT.PUT_LINE('Updated Balance: '
                             || V_BALANCE);
    END CREDIT;

    PROCEDURE DEBIT(
        P_AMOUNT NUMBER
    ) IS
    BEGIN
        IF V_BALANCE - P_AMOUNT >= 500 THEN
            V_BALANCE := V_BALANCE - P_AMOUNT;
            DBMS_OUTPUT.PUT_LINE('Amount Debited: '
                                 || P_AMOUNT);
            DBMS_OUTPUT.PUT_LINE('Updated Balance: '
                                 || V_BALANCE);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Insufficient balance! Minimum balance of 500 must be maintained.');
        END IF;
    END DEBIT;

    PROCEDURE SHOW_BALANCE IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Current Balance: '
                             || V_BALANCE);
    END SHOW_BALANCE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter operation: 1 for Credit, 2 for Debit, 3 for Balance Inquiry');
    V_CHOICE := 1; -- Change based on user input simulation
    IF V_CHOICE = 1 THEN
        V_AMOUNT := 2000; -- Simulated input
        CREDIT(V_AMOUNT);
    ELSIF V_CHOICE = 2 THEN
        V_AMOUNT := 200; -- Simulated input
        DEBIT(V_AMOUNT);
    ELSIF V_CHOICE = 3 THEN
        SHOW_BALANCE;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid Choice!');
    END IF;
END;
/