   SET SERVEROUTPUT ON;
declare
  -- Cursor to fetch details of students eligible for honours.
   cursor honours_cursor is
   select roll_no,
          student_name,
          s1,
          s2
     from students
    where ( s1 + s2 ) > 12
    order by roll_no;

   rec honours_cursor%rowtype;
begin
   dbms_output.put_line('Eligible Students for Honours:');
   dbms_output.put_line('--------------------------------');

  -- Loop through each record fetched by the cursor.
   for rec in honours_cursor loop
      dbms_output.put_line('Roll No: '
                           || rec.roll_no
                           || ', Name: '
                           || rec.student_name
                           || ', S1: '
                           || rec.s1
                           || ', S2: '
                           || rec.s2);
   end loop;
end;
/





create table students (
   roll_no      number primary key,
   student_name varchar2(50),
   s1           number,
   s2           number
);

-- 3. Insert sample records into the students table.
insert into students values ( 101,
                              'Alice',
                              7,
                              6 );    -- Total = 13, Eligible
insert into students values ( 102,
                              'Bob',
                              5,
                              5 );      -- Total = 10, Not eligible
insert into students values ( 103,
                              'Charlie',
                              8,
                              6 );  -- Total = 14, Eligible
insert into students values ( 104,
                              'David',
                              4,
                              5 );    -- Total = 9,  Not eligible
insert into students values ( 105,
                              'Eva',
                              7,
                              8 );      -- Total = 15, Eligible

commit;