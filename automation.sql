CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    occupation VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees (name, occupation, salary, hire_date) VALUES 
('Aarav Patel', 'Software Engineer', 50000.00, '2023-01-15'),
('Priya Sharma', 'Data Analyst', 45000.00, '2022-08-22'),
('Rohan Desai', 'Project Manager', 70000.00, '2021-03-10'),
('Neha Gupta', 'HR Specialist', 40000.00, '2023-11-05'),
('Vikram Singh', 'System Administrator', 55000.00, '2020-07-19');

SET GLOBAL event_scheduler = ON;

CREATE EVENT apply_yearly_salary_hike
ON SCHEDULE EVERY 1 YEAR 
STARTS CURRENT_TIMESTAMP
DO
    UPDATE employees 
    SET salary = salary + 10000;