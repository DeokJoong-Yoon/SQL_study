SELECT first_name, salary, department_id
FROM employees
WHERE department_id IN (SELECT DISTINCT department_id 
												FROM employees 
												WHERE salary >= 15000)
ORDER BY department_id;