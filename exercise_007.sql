-- CREATING THE TABLES ‘SPRODUCTMASTERS’ AND ‘SOLDPRICES’
SQL> create table sproductmasters(pno varchar2(10), sellprice number(10));

Table created.

SQL> insert into sproductmasters values('p1',3200);

1 row created.

SQL> insert into sproductmasters values('p2',4000);

1 row created.

SQL> insert into sproductmasters values('p3',6000);

1 row created.

SQL> select * from sproductmasters;

PNO         SELLPRICE
---------- ----------
p1               3200
p2               4000
p3               6000

SQL> create table soldprices (pno varchar2(10), datechange varchar2(20), soldprices number(10));

Table created.

SQL> declare
  2  sellingprice number(10,2);
  3  begin
  4  select sellprice into sellingprice from sproductmasters where pno = 'p1';
  5  if sellingprice < 4000
  6  then
  7  goto add_old_price;
  8  else
  9  dbms_output.put_line(' Current price is '|| sellingprice);
 10  end if;
 11  <<add_old_price>>
 12  update sproductmasters set sellprice = 4000 where pno = 'p1';
 13  insert into soldprices values ('p1',sysdate,sellingprice);
 14  dbms_output.put_line(' The new price of p1 is 4000 ');
 15  end;
 16  /

/*
output:

PL/SQL procedure successfully completed.
*/

SQL> select * from soldprices;

PNO        DATECHANGE           SOLDPRICES
---------- -------------------- ----------
p1         23-JAN-22                  3200

-- TO CREATE THE TABLE ‘SSITEMS’ ON WHICH THE EXCEPTION HANDLING MECHANISMS ARE GOING TO BE PERFORMED
SQL> create table ssitems(id number(10), quantity number(10), actualprice number(10));

Table created.

SQL> insert into ssitems values (100,5,5000);

1 row created.

SQL> insert into ssitems values (101,6,9000);

1 row created.

SQL> insert into ssitems values (102,4,4000);

1 row created.

SQL> insert into ssitems values (103,2,2000);

1 row created.

SQL> select * from ssitems;

        ID   QUANTITY ACTUALPRICE
---------- ---------- -----------
       100          5        5000
       101          6        9000
       102          4        4000
       103          2        2000
       
SQL> set serveroutput on;
SQL> declare
  2  price ssitems.actualprice % type;
  3  begin
  4  select actualprice into price from ssitems where quantity = 10;
  5  exception
  6  when no_data_found then
  7  dbms_output.put_line ('ssitems missing');
  8  end;
  9  /
ssitems missing

/*
output:

PL/SQL procedure successfully completed.
*/

SQL> select * from ssitems;

        ID   QUANTITY ACTUALPRICE
---------- ---------- -----------
       100          5        5000
       101          6        9000
       102          4        4000
       103          2        2000

SQL> set serveroutput on;
SQL> declare
  2  zero_price exception;
  3  price number(8,2);
  4  begin
  5  select actualprice into price from ssitems where id = 103;
  6  if price=0 or price is null then
  7  raise zero_price;
  8  end if;
  9  exception
 10  when zero_price then
 11  dbms_output.put_line('Failed zero price');
 12  end;
 13  /

/*
output:

PL/SQL procedure successfully completed.
*/

SQL> select * from ssitems;

        ID   QUANTITY ACTUALPRICE
---------- ---------- -----------
       100          5        5000
       101          6        9000
       102          4        4000
       103          2        2000



