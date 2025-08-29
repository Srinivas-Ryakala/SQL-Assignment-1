--functions

create function SalaryIncrement(@salary int)  
returns int
as
begin

return @salary*10
end;


select emp_name,location,emp_id,salary,dbo.SalaryIncrement(salary) as bonus from employe;
drop function salaryincrement;

--Increment function MTVE's(Multi statements table valued finction)

alter function Increment(@factor int)
returns @Employee Table
(Emp_id int,Emp_name varchar(20),location varchar(20),salary int,bonus int)
as

    begin
    --declare @factor int=10;
    insert into @Employee
    select Emp_id,Emp_name,location,salary,salary*@factor from employe;
    delete from @employee where bonus<100000;
    return;
    end;
    select * from dbo.Increment(10);

    select * from employe;
    drop function dbo.increment;

    --scalar function which return single value
alter function salaryincrement(@salary int)
returns int
--declare @id
as 
begin
    return @salary*10 ;
     
      end;
           
 select  dbo.salaryincrement(salary) as bonus from employe; 
 

 --inline table valued function

 create function salaryhike(@salary int)
 returns table 
 as
 return(select emp_name,emp_id,salary,salary*@salary as bonus from employe);
 drop function salaryhike;

 create synonym salaryhikenn for employe;--it is not working because synonym is only work for tables,views,stored procedures
 drop synonym salaryhiken;
 select * from salaryhikenn;
exec sp_rename 'employe','temp';
exec sp_rename 'temp','employe';
 select * from salar,yhiken(10);
 select * into #temp from employe;

 select dbo.salaryincrement(salary) from employe;
  
  
  select dbo.salaryincrement(salary) from #temp;--generally functoons wont work for temp tables only scalar functions work and tvfs wont work
  
  create function salaryhiketemp(@salary int)
 returns table 
 as
 return(select emp_name,emp_id,salary,salary*@salary as bonus from #temp);
 --Cannot access temporary tables from within a function.

  select * from dbo.salaryhiketemp (10);
  --create a function that if find employes who have more than given min salary like amount
  --inline

  create function minsalary(@salary int)
  returns table
  as
    return(select emp_id,emp_name,salary,location from employe
    where salary>@salary);
  select * from dbo.minsalary(100000);

  --after adding bonus and check who have lessthan 50000

 
 
 create function salaryhike(@salary int)
 returns table 
 as
 return(select emp_name,emp_id,salary,salary*@salary as bonus from employe);
 --drop function salaryhike;
 --drop synonym salaryhike;
 select * from dbo.salaryhike(10);
 select emp_name,emp_id,salary,salary*10 as bonus from employe;

 create synonym salaryhikennn for dbo.salaryhike;--it is  working because synonym is only work for tables,views,stored procedures and functions
 drop synonym salaryhiken;
 select * from salaryhikennn(10);
exec sp_rename 'employe','temp';
exec sp_rename 'temp','employe';
 select * from salar,yhiken(10);
 select * into #temp from employe;

 select dbo.salaryincrement(salary) from employe;
  
  
  select dbo.salaryincrement(salary) from #temp;--generally functoons wont work for temp tables only scalar functions work and tvfs wont work
  
  create function salaryhiketemp(@salary int)
 returns table 
 as
 return(select emp_name,emp_id,salary,salary*@salary as bonus from #temp);
 --Cannot access temporary tables from within a function.

  select * from dbo.salaryhiketemp (10);

  alter function maxi(@num int)
  returns table
  as return(select max(@num) as maxsalary from employe);
  select * from dbo.maxi(10000) ;
  select max(salary) from employe;

  alter function maximum(@nax int)
  returns table
  --@nax=isnull(@nax,0);
  as
 return(
  select top 1 isnull(@nax,0)*10 as maxi from employe
  order by emp_name desc);
  select  * from  maximum('srinu');