-- GROUP BY
SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender
;

SELECT gender, age ,birth_date,
FROM employee_demographics
GROUP BY gender, age ,birth_date;

SELECT gender,birth_date, AVG (age)
FROM employee_demographics
GROUP BY gender,birth_date;

SELECT gender, AVG (age)
FROM employee_demographics
GROUP BY gender;

SELECT birth_date, AVG (age),COUNT(*) AS row_count
FROM employee_demographics
GROUP BY birth_date;

SELECT birth_date, AVG (age),ROW_NUMBER() OVER () AS row_num
FROM employee_demographics
GROUP BY birth_date;

SELECT *
FROM employee_salary;

SELECT occupation, ROW_NUMBER() OVER () AS row_num
FROM employee_salary
GROUP BY occupation
;

SELECT occupation
FROM employee_salary
GROUP BY occupation
;

SELECT dept_id,ROW_NUMBER() OVER () AS row_num
FROM employee_salary
GROUP BY dept_id
;

SELECT last_name,ROW_NUMBER() OVER () AS row_num
FROM employee_salary
GROUP BY last_name
;

SELECT *
FROM employee_salary;

SELECT first_name,last_name
FROM employee_salary
order by first_name  DESC,last_name ASC;
