-- TO CREATE THE TABLE ‘SSEMPP’
SQL> create table ssempp (eid number(10), ename varchar2(20), job varchar2(20), sal number(10),dno number(5));

Table created.

SQL> insert into ssempp values (1,'nala','lecturer',34000,11);

1 row created.

SQL> insert into ssempp values (2,'kala','seniorlecturer',20000,12);

1 row created.

SQL> insert into ssempp values (5,'ajay','lecturer',30000,11);

1 row created.

SQL> insert into ssempp values (6,'vijay','lecturer',18000,11);

1 row created.

SQL> insert into ssempp values (3,'nila','professor',60000,12);

1 row created.

SQL> select * from ssempp;

       EID ENAME                JOB                         SAL        DNO
---------- -------------------- -------------------- ---------- ----------
         1 nala                 lecturer                  34000         11
         2 kala                 seniorlecturer            20000         12
         5 ajay                 lecturer                  30000         11
         6 vijay                lecturer                  18000         11
         3 nila                 professor                 60000         12

-- TO WRITE A PL/SQL BLOCK TO DISPLAY THE EMPOYEE ID AND EMPLOYEE NAME USING CURSOR FOR LOOP
SQL> set serveroutput on;
SQL> declare
  2  begin
  3  for emy in (select eid, ename from ssempp)
  4  loop
  5  dbms_output.put_line('Employee id and employee name are ' || emy.eid || ' and ' || emy.ename);
  6  end loop;
  7  end;
  8  /
Employee id and employee name are 1 and nala
Employee id and employee name are 2 and kala
Employee id and employee name are 5 and ajay
Employee id and employee name are 6 and vijay
Employee id and employee name are 3 and nila

PL/SQL procedure successfully completed.

--  TO WRITE A PL/SQL BLOCK TO UPDATE THE SALARY OF ALL EMPLOYEES WHERE DEPARTMENT NO IS 11 BY 5000 USING CURSOR FOR LOOP AND TO DISPLAY THE UPDATED TABLE
SQL> set serveroutput on;
SQL> declare
  2  cursor cem is select eid, ename, sal, dno from ssempp where dno = 11;
  3  begin
  4  --open cem;
  5  for rem in cem
  6  loop
  7  update ssempp set sal = rem.sal + 5000 where eid = rem.eid;
  8  end loop;
  9  --close cem;
 10  end;
 11  /

PL/SQL procedure successfully completed.

SQL> select * from ssempp;

       EID ENAME                JOB                         SAL        DNO
---------- -------------------- -------------------- ---------- ----------
         1 nala                 lecturer                  39000         11
         2 kala                 seniorlecturer            20000         12
         5 ajay                 lecturer                  35000         11
         6 vijay                lecturer                  23000         11
         3 nila                 professor                 60000         12

-- TO WRITE A PL/SQL BLOCK TO DISPLAY THE EMPLOYEE ID AND EMPLOYEE NAME WHERE DEPARTMENT NUMBER IS 11 USING EXPLICIT CURSORS
SQL> declare
  2  cursor cenl is select eid, sal from ssempp where dno = 11;
  3  ecode ssempp.eid%type;
  4  esal ssempp.sal%type;
  5  begin
  6  open cenl;
  7  loop
  8  fetch cenl into ecode, esal;
  9  exit when cenl%notfound;
 10  dbms_output.put_line('Employee code and employee salary are ' || ecode  || ' and ' || esal);
 11  end loop;
 12  close cenl;
 13  end;
 14  /
Employee code and employee salary are 1 and 39000
Employee code and employee salary are 5 and 35000
Employee code and employee salary are 6 and 23000

PL/SQL procedure successfully completed.

-- TO WRITE A PL/SQL BLOCK TO UPDATE THE SALARY BY 5000 WHERE THE JOB IS LECTURER , TO CHECK IF UPDATES ARE MADE USING IMPLICIT CURSORS AND TO DISPLAY THE UPDATED TABLE
SQL> declare
  2  county number;
  3  begin
  4  update ssempp set sal = sal + 10000 where job = 'lecturer';
  5  county:= sql%rowcount;
  6  if county > 0 then
  7  dbms_output.put_line('The number of rows are '|| county);
  8  end if;
  9  if sql%found then
 10  dbms_output.put_line('Employee record modification successful');
 11  else if sql%notfound then
 12  dbms_output.put_line('Employee record is not found');
 13  end if;
 14  end if;
 15  end;
 16  /
The number of rows are 3
Employee record modification successful

PL/SQL procedure successfully completed.


