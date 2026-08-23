-- subqueries

select *
from employee_demographics
where employee_id in
					(select employee_id
                    from employee_salary
                    where dept_id=1);
                    
                    
select first_name,salary,
(select
avg(salary)
from employee_salary)
from employee_salary;


select gender,cc
from
(select gender, avg(age) as aa,max(age) as bb,min(age) as cc,count(age) as dd
from employee_demographics
group by gender)
as agg_table;

select avg(cc)
from
(select gender, avg(age) as aa,max(age) as bb,min(age) as cc,count(age) as dd
from employee_demographics
group by gender)
as agg_table;

SELECT gender, AVG(dd)
FROM (
    SELECT gender, 
           AVG(age) AS aa, 
           MAX(age) AS bb, 
           MIN(age) AS cc, 
           COUNT(age) AS dd
    FROM employee_demographics
    GROUP BY gender
) AS agg_table
GROUP BY gender;
