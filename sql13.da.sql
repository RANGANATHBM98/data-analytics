SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;

DROP PROCEDURE IF EXISTS large_salaries2;

DELIMITER $$

CREATE PROCEDURE large_salaries2() 
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
    
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000; 
END $$

DELIMITER ;