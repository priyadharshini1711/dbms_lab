-- creation of table
create table stud ( 
    sname varchar2(30), 
    sid varchar2(10), 
    sage number(10), 
    sarea varchar2(20),
    sdept varchar2(20)
);


--inserting values into table
insert into stud values ('ashwin',101,19,'anna nagar','aeronautical');

insert into stud values ('bhavesh',102,18,'nungambakkam','marine');

insert into stud values ('pruthvik',103,20,'anna nagar','aerospace');

insert into stud values ('charith',104,20,'kilpauk','mechanical');

select * from stud;


-- renaming table
rename stud to studs;


-- arthimetic operation
select sname, sid+100 "stid" from studs;


--concatenation operator
select sname || ' is a ' || sdept || ' engineer. ' as profession from studs;

-- distinct values
select distinct sarea from studs;

-- where clause
select sname, sage from studs where sage <= 19;

-- between operator
select sname, sarea, sid from studs where sid between 102 and 104;

--in predicate
select sname, sarea, sid from studs where sid in (102,104);

--pattern matching
select sname, sarea from studs where sarea like '%g%';

-- logical operator
select sname, sid from studs where sid > 102 and sarea='anna nagar';

--not in predicate
select sname, sid from studs where sid not in (102,104);

--updating the table
alter table studs add (spocket varchar2(20));

update studs set spocket = 750 where sid = 101;

update studs set spocket = 500 where sid = 102;

update studs set spocket = 250 where sid = 103;

update studs set spocket = 100 where sid = 104;

select * from studs;

-- aggregate functions
select avg(spocket) result from studs;

select min(spocket) result from studs;

select count(*) result from studs;

select count(spocket) result from studs where sarea='anna nagar';

select max(spocket) result from studs;

select sum(spocket) result from studs;

--number functions
select abs(-20) result from dual;

select power(2,10) result from dual;

select round(15.359,2) result from dual;

select sqrt(36) result from dual;

-- string functions
select lower('ORACLE') result from dual;

select upper('oracle') result from dual;

select initcap('oracle') result from dual;

select substr('oracle',2,5) result from dual;

select upper('oracle') result from dual;

select lpad('oracle',10,'#') result from dual;

select rpad('oracle',10,'^') result from dual;

-- conversion functions
update studs set sage = to_number(substr(118,2,3));

select * from studs;

select to_char(17145,'099,999') result from dual;

select to_char(sysdate,'dd-mon-yyyy') result from dual;

-- date functions
select sysdate from dual;

select sysdate,add_months(sysdate,4) result from dual;

select sysdate,last_day(sysdate) result from dual;

select sysdate,next_day(sysdate, 'sunday') result from dual;

select months_between('09-aug-91','11-mar-90') result from dual;

-- group by clause
select sarea, sum(spocket) result from studs group by sarea;

-- having caluse
select count(*) result from studs having spocket < 600;

-- deletion
delete from studs where sid = 101;

select * from studs;

-- set operations
create table product(prodname varchar2(30), prodno varchar2(10));

insert into product values ('table', 10001);

insert into product values ('chair', 10010);

insert into product values ('desk', 10110);

insert into product values ('cot', 11110);

insert into product values ('sofa', 10010);

insert into product values ('tvstand', 11010);

select * from product;

--to create sale table
create table sale(prodname varchar2(30), orderno number(10), prodno varchar2(10));

insert into sale values('table', 801, 10001);

insert into sale values('chair', 805, 10010);

insert into sale values('desk', 809, 10110);

insert into sale values('cot', 813, 11110);

insert into sale values('sofa', 817, 10010);

select * from sale;

-- set operations
select prodname from product where prodno=10010 union select prodname from sale where prodno=10010;

select prodname from product where prodno=11110 intersect select prodname from sale where prodno=11110;

-- join and nested query operations
-- to create table sstud1

create table sstud1 (sname varchar2(20), place varchar2(20));

insert into sstud1 values ('prajan', 'chennai');

insert into sstud1 values ('anand', 'chennai');

insert into sstud1 values ('kumar', 'chennai');

insert into sstud1 values ('ravi', 'chennai');

select * from sstud1;

-- to create table sstud2
create table sstud2 (sname varchar2(20), dept varchar2(20), marks number(10));

insert into sstud2 values ('prajan', 'cse', 700);

insert into sstud2 values ('anand', 'it', 650);

insert into sstud2 values ('vasu', 'cse', 680);

insert into sstud2 values ('ravi', 'it', 600);

select * from sstud2;

-- join operations
select sstud1.sname, dept from sstud1 inner join sstud2 on (sstud1.sname = sstud2.sname);

select sstud1.sname, dept from sstud1 join sstud2 on (sstud1.sname = sstud2.sname);

select sstud1.sname, dept from sstud1 left outer join sstud2 on (sstud1.sname = sstud2.sname);

select sstud1.sname, dept from sstud1 right outer join sstud2 on (sstud1.sname = sstud2.sname);

select sstud1.sname, dept from sstud1 full outer join sstud2 on (sstud1.sname = sstud2.sname);

--nested queries
select sname from sstud1 where sstud1.sname in (select sstud2.sname from sstud2);

select sname from sstud1 where sstud1.sname not in (select sstud2.sname from sstud2);

select sname from sstud2 where marks > some (select marks from sstud2 where dept='cse');

select sname from sstud2 where marks >= some (select marks from sstud2 where dept='cse');

select sname from sstud2 where marks > any (select marks from sstud2 where dept='cse');

select sname from sstud2 where marks >= any (select marks from sstud2 where dept='cse');

select sname from sstud2 where marks < all (select marks from sstud2 where dept='cse')

select sname from sstud1 where exists (select sstud2.sname from sstud2 where sstud1.sname = sstud2.sname);

select sname from sstud1 where not exists (select sstud2.sname from sstud2 where sstud1.sname = sstud2.sname);