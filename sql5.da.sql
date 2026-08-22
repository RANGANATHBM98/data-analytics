-- limit and aliasing
select *
from employee_salary;

select *
from employee_salary
limit 5
; 

select *
from employee_salary
limit 3,2
; 

-- aliasing 
select occupation,avg(salary)  as aa 
from employee_salary
group by occupation
having avg(salary)
;

select occupation,avg(salary) aa 
from employee_salary
group by occupation
having aa
;


