
create table assignment2(emp_id int primary key,emp_name varchar(20) ,salary int,location varchar(20),dob date,dept_id int,dept_name varchar(20),mgr_id int );
INSERT INTO assignment2 VALUES
(1,'srinivas',25000,'hyderaad','2003-01-26',101,'developer',5),
(2,'suresh',46985,'delhi','2008-02-13',103,'testing',1),
(3,'ajay',98900,'mumbai','2001-03-01',101,'developer',5),
(4,'pramod',76000,'kolkate','2006-04-26',102,'hr',1),
(5,'suresh',1209,'benguluru','2000-05-12',103,'testing',1),
(6,'kathik',100000,'karimnagar','2003-05-19',104,'analyst',3),
(7,'mahesh',56434,'hyderaad','2001-01-30',102,'hr',1),
(8,'suresh',25000,'hyderaad','2038-06-11',103,'testing',1);
--2 write a query to find second highest salary in organisation without using subqueries and top
with max_sal as(
select salary,dense_rank() over(order by salary desc) as rnk from assignment2)
select salary from max_sal where rnk=2;
--3 write a query to find max salary and dep name from all the dept with out using top and limit
select  dept_name,salary from assignment2
where salary=(select max(salary) from assignment2);
--4 Write a SQL query to maximum number from a table without using MAX or MIN aggregate functions.

with new_cte as(select salary,dense_rank() over(order by salary desc) as rnk from assignment2) 
select salary from new_cte where rnk=1;
--another query
select top 1 salary from assignment2 order by salary desc;

--5 Write an SQL query to fetch all the Employees who are also managers from the Employee Details table.
create table company(emp_id int,emp_name varchar(20),mgr_id int,location varchar(20),salary int);
 INSERT INTO company  VALUES
(101, 'Alice', NULL, 'New York',9000),      
(102, 'Bob', 101, 'Chicago',98655),
(103, 'Charlie', 101, 'Dallas',737482),
(104, 'David', 102, 'Chicago',9263),
(105, 'Eva', 102, 'New York',29644),
(106, 'Frank', 103, 'Dallas',98236),
(107, 'Grace', 103, 'Houston',98264),
(109,'srinu',104,'hyderabad',987253);
select * from company;
select c1.emp_id,c1.mgr_id,c1.emp_name,c2.emp_name as manager_name
from company c1 join company c2
on c2.emp_id=c1.mgr_id;


--1)Write a query to find the all the names which are similar in pronouncing as suresh, sort the result in the order of similarity
create table simil(st_id int identity(1,1),st_name varchar(20));
insert into simil values('suresh'),('suraj'),('suresha'),('sureshchandra'),('sureshwar'),('sooresh'),('soresh');
insert into simil values('priya'),('arjun');
select * from simil;
with cte_name as(select st_id,st_name,difference(st_name,'suresh') as similarity from simil)
select * from cte_name 
where similarity>=3
order by similarity desc;


