-- TO DISPLAY HELLO MESSAGE
SQL> set serveroutput on;
SQL> declare
  2  a varchar(20);
  3  begin
  4  a:='Hello';
  5  dbms_output.put_line(a);
  6  end;
  7  /

/*
output:
Hello

PL/SQL procedure successfully completed.
*/

-- TO INPUT A VALUE FROM THE USER AND DISPLAY IT 
SQL> set serveroutput on;
SQL> declare
  2  a number(7);
  3  b number(7);
  4  begin
  5  a:=&a;
  6  b:=&b;
  7  if(a>b) then
  8  dbms_output.put_line ('The greatet of the two is' || a);
  9  else
 10  dbms_output.put_line ('The greatet of the two is' || b);
 11  end if;
 12  end;
 13  /

/*
output:
Enter value for a: 5
old   4: a:=&a;
new   4: a:=5;

PL/SQL procedure successfully completed.
5
*/

--  GREATEST OF TWO NUMBERS
SQL> set serveroutput on;
SQL> declare
  2  a varchar(7);
  3  b varchar(7);
  4  c varchar(7);
  5  begin
  6  a:=&a;
  7  b:=&b;
  8  c:=&c;
  9  if (a>b and a>c) then
 10  dbms_ouput.put_line('The greatest of three is '|| a);
 11  else if (b>c) then
 12  dbms_ouput.put_line('The greatest of three is '|| b);
 13  else
 14  dbms_ouput.put_line('The greatest of three is '|| c);
 15  end if;
 16  end if;
 17  end;
 18  /

/*
output:
Enter value for a: 5
old   5: a:=&a;
new   5: a:=5;
Enter value for b: 6
old   6: b:=&b;
new   6: b:=6;
The greatest of the two is 6

PL/SQL procedure successfully completed.
*/

--  GREATEST OF THREE NUMBERS
SQL> set serveroutput on;
SQL> declare
  2  a varchar(7);
  3  b varchar(7);
  4  c varchar(7);
  5  begin
  6  a:=&a;
  7  b:=&b;
  8  c:=&c;
  9  if (a>b and a>c) then
 10  dbms_output.put_line('The greatest of three is '|| a);
 11  else if (b>c) then
 12  dbms_output.put_line('The greatest of three is '|| b);
 13  else
 14  dbms_output.put_line('The greatest of three is '|| c);
 15  end if;
 16  end if;
 17  end;
 18  /
 
/*
output:
Enter value for a: 5
old   6: a:=&a;
new   6: a:=5;
Enter value for b: 6
old   7: b:=&b;
new   7: b:=6;
Enter value for c: 7
old   8: c:=&c;
new   8: c:=7;
The greatest of three is 7

PL/SQL procedure successfully completed.
*/

-- PRINT NUMBERS FROM 1 TO 5 USING SIMPLE LOOP
SQL> set serveroutput on;
SQL> declare
  2  a number:=1;
  3  begin
  4  loop
  5  dbms_output.put_line(a);
  6  a:=a+1;
  7  exit when a > 5;
  8  end loop;
  9  end;
 10  /
 
/*
ouput:
1
2
3
4
5

PL/SQL procedure successfully completed.
*/

-- PRINT NUMBERS FROM 1 TO 4 USING WHILE LOOP 
SQL> set serveroutput on;
SQL> declare
  2  a number:=1;
  3  begin
  4  while (a<5)
  5  loop
  6  dbms_output.put_line(a);
  7  a:=a+1;
  8  end loop;
  9  end;
 10  /
 
/*
output:
1
2
3
4

PL/SQL procedure successfully completed.
*/

--  PRINT NUMBERS FROM 1 TO 5 USING FOR LOOP
SQL> set serveroutput on;
SQL> declare
  2  a number:=1;
  3  begin
  4  for a in 1..5
  5  loop
  6  dbms_output.put_line(a);
  7  end loop;
  8  end;
  9  /
  
/*
output:
1
2
3
4
5

PL/SQL procedure successfully completed.
*/

-- PRINT NUMBERS FROM 1 TO 5 IN REVERSE ORDER USING FOR LOOP
SQL> set serveroutput on;
SQL> declare
  2  a number:=1;
  3  begin
  4  for a in reverse 1..5
  5  loop
  6  dbms_output.put_line(a);
  7  end loop;
  8  end;
  9  /
5
4
3
2
1

/*
ouput:
5
4
3
2
1

PL/SQL procedure successfully completed.
*/

--  PRINT NUMBERS FROM 1 TO 5 IN REVERSE ORDER USING WHILE LOOP
SQL> set serveroutput on;
SQL> declare
  2  a number:=5;
  3  begin
  4  while(a>0)
  5  loop
  6  dbms_output.put_line(a);
  7  a:=a-1;
  8  end loop;
  9  end;
 10  /
 
/*
output:
5
4
3
2
1

PL/SQL procedure successfully completed.
*/

-- TO CALCULATE AREA OF CIRCLE
SQL> set serveroutput on;
SQL> declare
  2  pi constant number(4,2):=3.14;
  3  a number(20);
  4  r number(20);
  5  begin
  6  r:=&r;
  7  a:=pi*power(r,2);
  8  dbms_output.put_line('The area of circle is '||a);
  9  end;
 10  /
 
/*
output:
Enter value for r: 2
old   6: r:=&r;
new   6: r:=2;
The area of circle is 13

PL/SQL procedure successfully completed.
*/

--  TO CREATE SACCOUNT TABLE
SQL> create table saccount (accno number(5), name varchar2(20), bal number(10));

Table created.

SQL> insert into saccount values ( 1,'mala',20000);

1 row created.

SQL> insert into saccount values (2,'kala',30000);

1 row created.

SQL> select * from saccount;

     ACCNO NAME                        BAL
---------- -------------------- ----------
         1 mala                      20000
         2 kala                      30000

SQL> set serveroutput on;
SQL> declare
  2  a_bal number(7);
  3  a_no varchar2(20);
  4  debit number(7):=2000;
  5  minamt number(7):=500;
  6  begin
  7  a_no:=&a_no;
  8  select bal into a_bal from saccount where accno = a_no;
  9  a_bal:=a_bal - debit;
 10  if (a_bal > minamt) then
 11  update saccount set bal = a_bal where accno = a_no;
 12  end if;
 13  end;
 14  /
 
/*
ouput:
Enter value for a_no: 1
old   7: a_no:=&a_no;
new   7: a_no:=1;

PL/SQL procedure successfully completed.
*/

SQL> select * from saccount;

     ACCNO NAME                        BAL
---------- -------------------- ----------
         1 mala                      18000
         2 kala                      30000
		
-- TO CREATE TABLE SROUTES
SQL> create table sroutes ( rno number(5), origin varchar2(20), destination varchar2(20), fare number(10), distance number(10));

Table created.

SQL> insert into sroutes values ( 2, 'chennai', 'dindugal', 400,230);

1 row created.

SQL> drop table sroutes;

Table dropped.

SQL> create table sroutes (rno number(5), origin varchar2(20), destination varchar2(20), fare number(10), distance number(10));

Table created.

SQL> insert into sroutes values (2, 'chennai', 'dindugal', 400, 230);

1 row created.

SQL> insert into sroutes values (3, 'chennai', 'madurai', 250, 300);

1 row created.

SQL> insert into sroutes values (6, 'thanjavur', 'palani', 350, 370);

1 row created.

SQL> select * from sroutes;

       RNO ORIGIN               DESTINATION                FARE   DISTANCE
---------- -------------------- -------------------- ---------- ----------
         2 chennai              dindugal                    400        230
         3 chennai              madurai                     250        300
         6 thanjavur            palani                      350        370
		
SQL> set serveroutput on;
SQL> declare
  2  route sroutes.rno % type;
  3  fares sroutes.fare % type;
  4  dist sroutes.distance % type;
  5  begin
  6  route:=&route;
  7  select fare, distance into fares , dist from sroutes where rno = route;
  8  if (dist < 250) then
  9  update sroutes set fare = 300 where rno = route;
 10  else if dist between 250 and 370 then
 11  update sroutes set fare = 400 where rno = route;
 12  else if (dist > 400) then
 13  dbms_output.put_line('Sorry');
 14  end if;
 15  end if;
 16  end if;
 17  end;
 18  /

/*
output:
Enter value for route: 3
old   6: route:=&route;
new   6: route:=3;

PL/SQL procedure successfully completed.
*/

SQL> select * from sroutes;

       RNO ORIGIN               DESTINATION                FARE   DISTANCE
---------- -------------------- -------------------- ---------- ----------
         2 chennai              dindugal                    400        230
         3 chennai              madurai                     400        300
         6 thanjavur            palani                      350        37
		
--  TO CREATE SCALCULATE TABLE
SQL> create table scalculate (radius number(3), area number(5,2));

Table created.

SQL> desc scalculate;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 RADIUS                                             NUMBER(3)
 AREA                                               NUMBER(5,2)

SQL> set serveroutput on;
SQL> declare
  2  pi constant number(4,2):= 3.14;
  3  area number(5,2);
  4  radius number(3);
  5  begin
  6  radius:=3;
  7  while (radius <= 7)
  8  loop
  9  area:= pi*power(radius,2);
 10  insert into scalculate values (radius, area);
 11  radius:=radius + 1;
 12  end loop;
 13  end;
 14  /

/*
output:

PL/SQL procedure successfully completed.
*/

SQL> select * from scalculate;

    RADIUS       AREA
---------- ----------

         3      28.26
         4      50.24
         5       78.5
         6     113.04
         7     153.86

-- TO CALCULATE FACTORIAL OF A GIVEN NUMBER         
SQL> set serveroutput on;
SQL> declare
  2  f number(4):=1;
  3  i number(4);
  4  begin
  5  i:= &i;
  6  while (i >= 1)
  7  loop
  8  f:= f * i;
  9  i:= i - 1;
 10  end loop;
 11  dbms_output.put_line('The value is ' || f);
 12  end;
 13  /

/*
output:
Enter value for i: 5
old   5: i:= &i;
new   5: i:= 5;
The value is 120

PL/SQL procedure successfully completed.
*/






 




