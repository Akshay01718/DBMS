create table train (
   tno         number
      generated always as identity
   primary key,
   tname       varchar2(100),
   tdate       date,
   destination varchar2(100),
   seats       number
);


insert into train (
   tname,
   tdate,
   destination,
   seats
) values ( 'Express1',
           to_date('2025-03-18','YYYY-MM-DD'),
           'Delhi',
           200 );

commit;


insert into train (
   tname,
   tdate,
   destination,
   seats
) values ( 'Express2',
           to_date('2025-03-19','YYYY-MM-DD'),
           'Mumbai',
           150 );

rollback;

select *
  from train;