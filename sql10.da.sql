SELECT a.first_name, a.last_name,a.age,b.occupation,a.gender,
       AVG(b.salary) OVER (PARTITION BY a.gender) AS avg_salary_by_gender
FROM employee_demographics a
JOIN employee_salary b
  ON a.employee_id = b.employee_id;
  
  
SELECT a.first_name,a.gender,b.salary,
       sum(b.salary) OVER (PARTITION BY a.gender order by a.employee_id) rolling_total
FROM employee_demographics a
JOIN employee_salary b
  ON a.employee_id = b.employee_id;
  
  
SELECT a.first_name,a.gender,b.salary,
row_number() over(partition by a.gender order by salary DESC) row_num,
rank() over(partition by a.gender order by salary DESC) rank_num,
dense_rank() over(partition by a.gender order by salary DESC) dense_rank_num
FROM employee_demographics a
JOIN employee_salary b
ON a.employee_id = b.employee_id;