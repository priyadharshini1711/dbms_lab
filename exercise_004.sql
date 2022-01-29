-- TO CREATE THE TABLE FVIEWS 
create table fviews( name varchar2(20),no number(5), sal number(5), dno number(5));

insert into fviews values('xxx',1,19000,11);

insert into fviews values('aaa',2,19000,12);

insert into fviews values('yyy',3,40000,13);

select * from fviews;

-- TO CREATE THE TABLE DVIEWS
create table dviews( dno number(5), dname varchar2(20));

insert into dviews values(11,'x');

insert into dviews values(12,'y');

select * from dviews;

-- CREATING THE VIEW SVIEW ON FVIEWS TABLE
create view sview as select name,no,sal,dno from fviews where dno=11;

select * from sview;

-- UPDATES MADE ON THE VIEW ARE REFLECTED ONLY ON THE TABLE WHEN THE STRUTURE OF THE TABLE AND THE VIEW ARE NOT SIMILAR -- PROOF
insert into sview values ('zzz',4,20000,14);

select * from sview;

select * from fviews;

-- UPDATES MADE ON THE VIEW ARE REFLECTED ON BOTH THE VIEW AND THE TABLE WHEN THE STRUTURE OF THE TABLE AND THE VIEW ARE SIMILAR – PROOF
-- CREATING A VIEW ‘IVIEW’ FOR THE TABLE ‘FVIEWS’

create view iview as select * from fviews;

select * from iview;

-- PERFORMING UPDATE OPERATION
insert into iview values ('bbb',5,30000,15);

select * from iview;

select * from fviews;

-- CREATE A NEW VIEW ‘SSVIEW’ AND DROP THE VIEW
create view ssview( cusname,id) as select name, no from fviews where dno=12;

select * from ssview;

drop view ssview;

-- TO CREATE A VIEW  ‘COMBO’ USING BOTH THE TABLES ‘FVIEWS’ AND ‘DVIEWS’
create view combo as select name,no,sal,dviews.dno,dname from fviews,dviews where fviews.dno=dviews.dno;

select * from combo;

-- TO PERFORM MANIPULATIONS ON THIS VIEW
insert into combo values('ccc',12,1000,13,'x');
