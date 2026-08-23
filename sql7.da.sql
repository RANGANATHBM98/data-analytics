select *
from employee_demographics;

select first_name, upper(first_name)
from employee_demographics;


select first_name, lower(first_name)
from employee_demographics;

select first_name, 
right(first_name,4)
from employee_demographics;

select first_name, 
left(first_name,4)
from employee_demographics;

select first_name, 
substring(first_name,3,2)
from employee_demographics;

select first_name,
replace(first_name,'r','l')
from employee_demographics;

select first_name, 
locate ('r',first_name)
from employee_demographics;

select first_name,last_name,
concat(first_name," " ,last_name) 
from employee_demographics;
