#WHERE 
SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT * 
FROM employee_salary
WHERE  salary > 50000 AND dept_id <5
;

SELECT * 
FROM employee_salary
WHERE  (first_name = "Leslie" AND salary = 75000) OR dept_id > 5
;

SELECT *
FROM employee_demographics
WHERE gender != 'Male' AND age < 44
;
SELECT *
FROM employee_demographics
WHERE gender != 'Male' OR age < 44
;


#like 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'B__'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%n%' AND gender LIKE 'F_____'
;



