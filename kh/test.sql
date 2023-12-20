SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE first_name = 'Guy');