declare
   v_avg  number;
   v_date varchar2(20);
   v_day  varchar2(10);
begin
  -- Calculate the average marks from the students table.
   select avg(marks)
     into v_avg
     from students;

  -- Print the class average.
   dbms_output.put_line('Class Average Marks: ' || to_char(
      v_avg,
      'FM999.00'
   ));

  -- Print message if the class average is less than 40.
   if v_avg < 40 then
      dbms_output.put_line('Need improvement');
   end if;

  -- Get today's date and day of the week.
   v_date := to_char(
      sysdate,
      'DD-MON-YYYY'
   );
   v_day := trim(to_char(
      sysdate,
      'Day'
   ));

  -- Print today's date and day.
   dbms_output.put_line('Today''s Date: '
                        || v_date
                        || ' ('
                        || v_day
                        || ')');

exception
   when no_data_found then
      dbms_output.put_line('No student marks found.');
   when others then
      dbms_output.put_line('Error: ' || sqlerrm);
end;
/



-- Create the students table with student_id, student_name, and marks columns.
create table students (
   student_id   number primary key,
   student_name varchar2(50),
   marks        number
);

-- Insert sample records into the students table.
insert into students values ( 1,
                              'Alice',
                              55 );
insert into students values ( 2,
                              'Bob',
                              35 );
insert into students values ( 3,
                              'Charlie',
                              45 );
insert into students values ( 4,
                              'David',
                              25 );
insert into students values ( 5,
                              'Eve',
                              65 );

-- Commit the changes to the database.
commit;