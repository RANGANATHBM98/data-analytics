SELECT * FROM employee_demographics;

SELECT first_name,
age,
gender,
(age + 10) * 5 / POWER(2,2) - 6
#PEMDAS
FROM employee_demographics;
 
SELECT DISTINCT age,gender,birth_date
FROM employee_demographics;