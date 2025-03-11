-- Basic banking operations program
   SET SERVEROUTPUT ON

declare
   v_acc_no number := &account_number;
   v_option number := &operation;
   v_amount number;
   v_bal    number;
begin
    -- Get account balance
   select balance
     into v_bal
     from accounts
    where acc_no = v_acc_no;
    
    -- Menu options
   if v_option = 1 then
        -- Debit operation
      v_amount := &debit_amount;
      if v_bal >= v_amount then
         update accounts
            set
            balance = balance - v_amount
          where acc_no = v_acc_no;
         dbms_output.put_line('Rs. '
                              || v_amount
                              || ' debited. New balance: Rs. '
                              ||(v_bal - v_amount));
      else
         dbms_output.put_line('Insufficient balance');
      end if;

   elsif v_option = 2 then
        -- Credit operation
      v_amount := &credit_amount;
      update accounts
         set
         balance = balance + v_amount
       where acc_no = v_acc_no;
      dbms_output.put_line('Rs. '
                           || v_amount
                           || ' credited. New balance: Rs. '
                           ||(v_bal + v_amount));

   elsif v_option = 3 then
        -- Show balance
      dbms_output.put_line('Current balance: Rs. ' || v_bal);
   elsif v_option = 4 then
        -- Fixed debit of Rs 200 with minimum balance check
      if ( v_bal - 200 ) >= 500 then
         update accounts
            set
            balance = balance - 200
          where acc_no = v_acc_no;
         dbms_output.put_line('Rs. 200 debited. New balance: Rs. ' ||(v_bal - 200));
      else
         dbms_output.put_line('Cannot debit. Minimum balance of Rs. 500 must be maintained.');
      end if;
   end if;

   commit;
exception
   when no_data_found then
      dbms_output.put_line('Account not found');
   when others then
      dbms_output.put_line('Error: ' || sqlerrm);
      rollback;
end;
/



create table accounts (
   acc_no  number primary key,
   name    varchar2(50),
   balance number(10,2)
);



insert into accounts values ( 101,
                              'John',
                              1000 );
insert into accounts values ( 102,
                              'Mary',
                              600 );
insert into accounts values ( 103,
                              'Bob',
                              400 );
commit;