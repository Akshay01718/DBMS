create table employee (
   eid      number primary key,
   ename    varchar2(100),
   eaddress varchar2(200),
   esalary  number
);


--Package Specification
create or replace package emp_package as
   procedure add_employee (
      p_eid      number,
      p_ename    varchar2,
      p_eaddress varchar2,
      p_esalary  number
   );
   procedure delete_employee (
      p_eid number
   );
   procedure list_employees;
   function get_salary (
      p_eid number
   ) return number;
end emp_package;
/


--Package Body 
create or replace package body emp_package as

    -- Procedure to add a new employee
   procedure add_employee (
      p_eid      number,
      p_ename    varchar2,
      p_eaddress varchar2,
      p_esalary  number
   ) as
   begin
      insert into employee values ( p_eid,
                                    p_ename,
                                    p_eaddress,
                                    p_esalary );
      commit;
      dbms_output.put_line('Employee Added: ' || p_ename);
   end add_employee;

    -- Procedure to delete an employee
   procedure delete_employee (
      p_eid number
   ) as
   begin
      delete from employee
       where eid = p_eid;
      commit;
      dbms_output.put_line('Employee Deleted with ID: ' || p_eid);
   end delete_employee;

    -- Procedure to list all employees
   procedure list_employees as
   begin
      for emp in (
         select *
           from employee
      ) loop
         dbms_output.put_line(emp.eid
                              || ' - '
                              || emp.ename
                              || ' - '
                              || emp.eaddress
                              || ' - '
                              || emp.esalary);
      end loop;
   end list_employees;

    -- Function to get salary of an employee
   function get_salary (
      p_eid number
   ) return number as
      emp_salary number;
   begin
      select esalary
        into emp_salary
        from employee
       where eid = p_eid;
      return emp_salary;
   end get_salary;

end emp_package;
/

--Test Package Functions
begin
    -- Adding employees
   emp_package.add_employee(
      1,
      'John',
      'New York',
      50000
   );
   emp_package.add_employee(
      2,
      'Alice',
      'Los Angeles',
      60000
   );
    
    -- Listing employees
   emp_package.list_employees;

    -- Get salary of a specific employee
   dbms_output.put_line('Salary of Employee 1: ' || emp_package.get_salary(1));

    -- Deleting an employee
   emp_package.delete_employee(1);

    -- Listing employees again after deletion
   emp_package.list_employees;
end;
/