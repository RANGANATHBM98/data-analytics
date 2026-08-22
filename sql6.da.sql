select *
from employee_demographics;

select *
from employee_salary;


select *
from employee_demographics d
inner join employee_salary a
on d.employee_id = a.employee_id
;


select d.employee_id,age,occupation
from employee_demographics d
inner join employee_salary a
on d.employee_id = a.employee_id
;

-- outer join
select *
from employee_demographics d
right join employee_salary a
on d.employee_id = a.employee_id
;

-- self join
select *
from employee_salary a
join employee_salary b
on a.employee_id = b.employee_id
;

select *
from employee_salary a
join employee_salary b
on a.employee_id + 1 = b.employee_id
;

select a.employee_id as newid,
a.first_name as newname,
a.last_name as newlast,
b.employee_id as newid,
b.first_name as newname,
b.last_name as newlast
from employee_salary a
join employee_salary b
on a.employee_id  = b.employee_id
;


-- join multiple table tgthr
select *
from employee_demographics as a
inner join employee_salary as b
on a.employee_id = b.employee_id
inner join parks_departments pd
on b.dept_id = pd.department_id
;

select *
from parks_departments;