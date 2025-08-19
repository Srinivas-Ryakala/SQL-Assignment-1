--1
declare @st varchar(20)='Hel12loi';
declare @second varchar(20)='';
declare @i int=len(@st);
declare @ch char(1);
while(@i>0)
begin 
	set @ch=isNumeric(SUBSTRING(@st,@i,1));
	if @ch=1 begin set @ch=substring(@st,@i,1) end;;
	else set @ch='';
	
	set @second=@ch+@second;
	set @i=@i-1;
end
select @second as numeric;

--2
create table employe(emp_id int,emp_name varchar(20),mgr_id int,location varchar(20),manager_name varchar(20),salary int);
 INSERT INTO Employe  VALUES
(101, 'Alice', NULL, 'New York',null,9000),      
(102, 'Bob', 101, 'Chicago',null,98655),
(103, 'Charlie', 101, 'Dallas',null,737482),
(104, 'David', 102, 'Chicago',null,9263),
(105, 'Eva', 102, 'New York',null,29644),
(106, 'Frank', 103, 'Dallas',null,98236),
(107, 'Grace', 103, 'Houston',null,98264);
insert into employe values(109,'srinu',104,'hyderabad',null,987253);
select 
case

when
  day(dob)-day(getdate())<0 then year(getdate())-year(dob)-1
else year(getdate())-year(dob)
end as years,
case
when
  month(dob)-month(getdate())<=0 then 12+(month(dob)-month(getdate())-1)
else month(getdate())-month(dob) end as months
from asses;

--3

create table error_table(id int ,val int,name varchar(10), restricted_one as cast('error_string' as int));
insert into error_table(id,val) values(101,10),(102,20),(103,40),(104,30);
select * from error_table;
select restricted_one from error_table;
select id,val from error_table;

--4
create table asses(id int,name varchar(20),dob date);
insert into asses values(1,'srinu','2003-06-26');
insert into asses values(2,'ghxsd','2003-01-18');
insert into asses values(3,'prabhas','2025-08-18');
insert into asses values(4,'nag','2007-01-01');
insert into asses values(5,'nikhil','2003-09-12');
select datepart(dayofyear,dob) from asses;
select datepart(week,dob) from asses;
select datediff(day,cast(concat(year(dob),'/01','/01')as date ),dob)+1 from asses;--days between given date in a year day of the year--
select datediff(week,cast(year(dob)/01/01 as varchar),dob)+1 from asses;--week day of the year--
select datepart(weekday,dob) from asses;--day of week
select month(dob) from asses;--month of given date
select day(dob) from asses;--day of month

--5
with cte_name as(
select emp_id,emp_name,mgr_id,emp_name as manager_name,0 as level from employe   
where mgr_id is null

union all
 select e.emp_id,e.emp_name,e.mgr_id,c.emp_name as managers_name,
 c.level+1 as levels from employe e join cte_name c on c.emp_id=e.mgr_id join employe m on e.mgr_id=m.emp_id
)
select * from cte_name;