-- maximim mark in the table
use user_db;

select max(totalmarks)
from student;


 SELECT sex,count(sex)
 FROM student
 Group BY sex;
 
SELECT sex, AVG(totalmarks) AvgScore
FROM student
GROUP BY sex;
 
 
 SELECT studentname FROM student 
 WHERE totalmarks > (SELECT AVG(TotalMarks) FROM Student);
 
 select *
 from student
 where studentname like '___';
 
 
 select max(totalmarks)-min(totalmarks)
 from student;
 
CREATE VIEW mytabb AS
SELECT studentid,studentname,sex,totalmarks
FROM student
where  totalmarks>100 with check option;
insert into mytabb values(60 ,'siva', 'male', 560),(70 ,'Mahi', 'male',540);

select *
from mytabb;


START TRANSACTION;
SAVEPOINT S3;
insert into student values(80 ,'aswin', 'male', 560),(90 ,'ajay', 'male',540);
DELETE FROM student WHERE studentid=80;
DELETE FROM student WHERE studentid=90;
ROLLBACK TO SAVEPOINT S3;
Commit;

 select * from student;

select studentname,totalmarks, avg(totalmarks) as average 
from student group by studentname 
having average >(select avg(totalmarks) from student);
