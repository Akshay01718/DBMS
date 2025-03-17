create or replace trigger calculate_total_avg before
   insert on student
   for each row
begin
    -- Calculate total and average before inserting the record
   :new.total := :new.subj1 + :new.subj2 + :new.subj3;
   :new.avg := :new.total / 3;
end;
/



create table student (
   sid   number primary key,
   name  varchar2(100),
   subj1 number,
   subj2 number,
   subj3 number,
   total number,
   avg   number
);


insert into student (
   sid,
   name,
   subj1,
   subj2,
   subj3
) values ( 1,
           'Alice',
           80,
           90,
           70 );


select *
  from student
 where sid = 1;