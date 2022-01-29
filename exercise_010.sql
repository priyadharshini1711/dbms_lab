-- TO CREATE THE TABLE ‘ITEMPLS’
SQL> create table itempls (ename varchar2(10), eid number(5), salary number(10));

Table created.

SQL> insert into itempls values ('xxx',11,10000);

1 row created.

SQL> insert into itempls values ('yyy',12,10500);

1 row created.

SQL> insert into itempls values ('zzz',13,15500);

1 row created.

SQL> select * from itempls;

ENAME             EID     SALARY
---------- ---------- ----------
xxx                11      10000
yyy                12      10500
zzz                13      15500

-- TO CREATE A SIMPLE TRIGGER THAT DOES NOT ALLOW INSERT UPDATE AND DELETE OPERATIONS ON THE TABLE
SQL> create trigger ittrigg before insert or update or delete on itempls for each row
  2  begin
  3  raise_application_error(-20010,'You cannot do manipulation');
  4  end;
  5  /

Trigger created.

SQL> insert into itempls values ('aaa',14,34000);
insert into itempls values ('aaa',14,34000)
            *
ERROR at line 1:
ORA-20010: You cannot do manipulation
ORA-06512: at "C##SAMPLE.ITTRIGG", line 2
ORA-04088: error during execution of trigger 'C##SAMPLE.ITTRIGG'

SQL> delete from itempls where ename = 'xxx';
delete from itempls where ename = 'xxx'
            *
ERROR at line 1:
ORA-20010: You cannot do manipulation
ORA-06512: at "C##SAMPLE.ITTRIGG", line 2
ORA-04088: error during execution of trigger 'C##SAMPLE.ITTRIGG'

SQL> update itempls set eid = 15 where ename = 'yyy';
update itempls set eid = 15 where ename = 'yyy'
       *
ERROR at line 1:
ORA-20010: You cannot do manipulation
ORA-06512: at "C##SAMPLE.ITTRIGG", line 2
ORA-04088: error during execution of trigger 'C##SAMPLE.ITTRIGG'

-- TO DROP THE CREATED TRIGGER
SQL> drop trigger ittrigg;

Trigger dropped.

-- TO CREATE A TRIGGER THAT RAISES AN USER DEFINED ERROR MESSAGE AND DOES NOT ALLOW UPDATION AND INSERTION
SQL> create trigger ittriggs before insert or update of salary on itempls for each row
  2  declare
  3  triggsal itempls.salary%type;
  4  begin
  5  select salary into triggsal from itempls where eid = 12;
  6  if(:new.salary>triggsal or :new.salary<triggsal) then
  7  raise_application_error(-20100,'Salary has not been changed');
  8  end if;
  9  end;
 10  /

Trigger created.

SQL> insert into itempls values ('bbb',16,45000);
insert into itempls values ('bbb',16,45000)
            *
ERROR at line 1:
ORA-20100: Salary has not been changed
ORA-06512: at "C##SAMPLE.ITTRIGGS", line 6
ORA-04088: error during execution of trigger 'C##SAMPLE.ITTRIGGS'


SQL> update itempls set eid=18 where ename='zzz';

1 row updated.