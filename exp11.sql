create or replace trigger student_changes after
   insert or update or delete on students
   for each row
begin
    -- If a student is deleted
   if deleting then
      dbms_output.put_line('Deleting ' || :old.name);
    
    -- If a new student is inserted
   elsif inserting then
      dbms_output.put_line('Inserting ' || :new.name);
    
    -- If a student's name is updated
   elsif updating('name') then
      dbms_output.put_line('Updated to ' || :new.name);
    
    -- If roll number or grades are updated
   elsif updating('roll')
   or updating('grd_s1')
   or updating('grd_s2') then
      dbms_output.put_line('Updating ' || :new.name);
   end if;
end;
/


create table students (
   roll   number primary key,
   name   varchar2(100),
   grd_s1 number,
   grd_s2 number
);



insert into students (
   roll,
   name,
   grd_s1,
   grd_s2
) values ( 101,
           'John',
           85,
           90 );