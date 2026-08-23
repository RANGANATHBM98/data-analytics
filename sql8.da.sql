-- case statements
select *
from employee_salary;

select *
from employee_demographics;

select first_name,last_name,
age,
case
   when age < 40 then 'genz'
   when age between 40 and 50 then 'old'
   when age >50 then 'final stage'
end as new
from employee_demographics;

select age,
case
   when age < 40 then 'genz'
   when age between 40 and 50 then 'old'
   when age >50 then 'final stage'
end as new
from employee_demographics;



--- we calculate based on the increment
-- < 50000 =5%
-- >50000=7%
-- finance=10%


select *
from employee_salary;

select first_name,last_name,salary,
case
  when salary <= 50000 then salary * 1.05
  when salary > 50000 then salary * 1.07
end as new_id,
    case
     when dept_id = 6 then salary * 0.10
    end as bonus
from employee_salary;

select * 
from parks_departments;


