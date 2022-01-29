create table studs ( 
    sname varchar2(30), 
    sid varchar2(10), 
    sage number, 
    sarea varchar2(20) 
);


desc studs;


alter table studs modify (sage number(10));


alter table studs add (sdept varchar2(20));


desc studs;


alter table studs drop column sdept;


truncate table studs


desc studs;


drop table studs;