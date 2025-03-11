-- 3. Create the function 'dc' to determine the customer category based on account balance
create or replace function dc (
   p_balance number
) return varchar2 is
begin
   if p_balance > 50000 then
      return 'Platinum';
   elsif p_balance > 10000 then  -- covers balance <= 50000 and > 10000
      return 'Gold';
   else
      return 'Silver';
   end if;
end;
/
  
-- 4. PL/SQL block to retrieve and print customer details along with their category
   SET SERVEROUTPUT ON;
declare
   cursor c_customers is
   select customer_id,
          customer_name,
          account_balance,
          dc(account_balance) as customer_category
     from customers;

   rec c_customers%rowtype;
begin
   for rec in c_customers loop
      dbms_output.put_line('Customer ID: '
                           || rec.customer_id
                           || ', Name: '
                           || rec.customer_name
                           || ', Balance: '
                           || rec.account_balance
                           || ', Category: '
                           || rec.customer_category);
   end loop;
end;
/



create table customers (
   customer_id     number primary key,
   customer_name   varchar2(100),
   account_balance number
);

insert into customers values ( 1,
                               'John Doe',
                               60000 );

insert into customers values ( 2,
                               'Jane Smith',
                               25000 );

insert into customers values ( 3,
                               'Alice Brown',
                               9000 );