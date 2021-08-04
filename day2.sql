-- inserting data into table 
INSERT INTO depart
VALUES (10,'purchase',123),
(20,'inventory',345), (30,'sales',567),
 (40,'materials',789),(50,'prpduction',911)
;
-- inserting data into table
 INSERT INTO employee
VALUES (102,'somu','somu102@gmail.com','9448345678',20,10000),
(103,'ramu','ramu103@gmail.com','9448340989',40,15000),
 (104,'gobu','gobu104@gmail.com','9448340000',50,11500),
  (105,'anbu','anbu105@gmail.com','9448347654',40,22000)
;
-- materials dept
select *
from employee
where DEPT_ID=
(select DEPART_ID
from depart
where DEPART_NAME='materials');

-- like operator
select *
from employee
where EMP_NAME like 'R%';

-- sales
select DEPT_ID,EMP_NAME
from employee
where DEPT_ID=
(select DEPART_ID
from depart
where DEPART_NAME='sales');

-- salary more thn 15000
select EMP_NAME
from employee
where DEPT_ID=
(select DEPART_ID
from depart
where DEPART_NAME='materials') and salary>15000;

-- bonus
select emp_name , 5/100* salary as Bonus 
from employee;

-- 4)a
update employee set salary= salary + (salary * 10 / 100)  where dept_id = 30;

-- 4)b
update employee set salary= salary - ((salary*0.3))  where dept_id = 20;

-- ascending by salary
SELECT *
FROM employee e
ORDER BY e.salary ASC;

-- descending by name
SELECT *
FROM employee e
ORDER BY e.emp_name DESC;

-- deleting salary less tha 12000
DELETE FROM employee
WHERE salary < 12000;

-- updated employee table
CREATE TABLE UPDATEDEMPP
AS (SELECT EMP_ID,EMP_NAME,EMAIL,DEPT_ID,SALARY
    FROM employee
    WHERE DEPT_ID > 20);


-- creating view 
CREATE VIEW rest AS
SELECT EMP_ID,EMP_NAME,EMAIL,DEPT_ID,SALARY
FROM UPDATEDEMPP;
-- viewing the view tab
select *
from rest;
-- tab table with condition
CREATE VIEW tab AS
SELECT EMP_ID,EMP_NAME,EMAIL,DEPT_ID,SALARY
FROM UPDATEDEMPP
where salary>10000;

select *
from tab;
