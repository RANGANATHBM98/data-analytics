-- having
select *
from employee_demographics;

select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40
;

select * 
from employee_salary;

select occupation,salary
from employee_salary
where occupation like '%manager%' and salary > 30000;
