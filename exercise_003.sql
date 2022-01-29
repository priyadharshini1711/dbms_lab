-- not null constraint
create table empl (ename varchar2(30) not null, eid varchar2(20) not null);

insert into empl values ('abcde',11);

insert into empl values ('fghij',12);

insert into empl values ('klmno',null);

select * from empl;

-- check as a column constraint
create table depts ( dname varchar2(30) not null, did number(20) not null check (did<10000));

insert into depts values ('sales ',9876);

insert into depts values ('marketing',5432);

insert into depts values ('accounts',789645);

select * from depts;

-- check as a table constraint
create table airports (aname varchar2(30) not null , aid number(20) not null, acity varchar2(30) check( acity in ('chennai','hyderabad','bangalore')));

insert into airports values( 'abcde', 100,'chennai');

insert into airports values( 'fghij', 101,'hyderabad');

insert into airports values( 'klmno', 102,'bangalore');

insert into airports values( 'pqrst', 103,'mumbai');

select * from airports;

-- ENTITY INTEGRITY CONSTRAINTS
-- UNIQUE AS A COLUMN CONSTRAIN
create table book (bname varchar2(30) not null, bid number(20) not null unique);

insert into book values ('fairy tales',1000);

insert into book values ('bedtime stories',1001);

insert into book values ('comics',1001);

select * from book;

-- UNIQUE AS A TABLE CONSTRAINT
create table orders( oname varchar2(30) not null , oid number(20) not null , unique(oname,oid));

insert into orders values ('chair', 2005);

insert into orders values ('table',2006);

insert into orders values ('chair',2007);

insert into orders values ('chair', 2005);

select * from orders;

-- PRIMARY KEY AS A COLUMN CONSTRAINT
create table custo ( cname varchar2(30) not null , cid number(20) not null primary key);

insert into custo values ( 'jones', 506);

insert into custo values ('hayden',508);

insert into custo values ('ricky',506);

select * from custo;

-- PRIMARY KEY AS A TABLE CONSTRAINT
create table branches( bname varchar2(30) not null , bid number(20) not null , primary key(bname,bid));

insert into branches values ('anna nagar', 1005);

insert into branches values ('adyar',1006);

insert into branches values ('anna nagar',1007);

insert into branches values ('anna nagar', 1005);

select * from branches;

-- REFERENTIAL INTEGRITY CONSTRAINTS
-- TO CREATE DEPTS TABLE
create table depts(city varchar2(20), dno number(5) primary key);

insert into depts values('chennai', 11);

insert into depts values('hyderabad', 22);

select * from depts;

-- TO CREATE SEMP TABLE
create table semp(ename varchar2(20), dno number(5) references depts(dno));

insert into semp values('x', 11);

insert into semp values('y', 22);

select * from semp;

-- ALTER TABLE
alter table semp add(eddress varchar2(20));

update semp set eddress='10 gandhi road' where dno=11;

update semp set eddress='12 m.g. road' where dno=22;

select * from semp;

select city, ename from depts, semp where depts.dno = semp.dno;