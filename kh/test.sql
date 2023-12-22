SELECT employee_id, first_name, e.job_id, job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE EXISTS (SELECT *
							FROM job_history
							WHERE e.employee_id = employee_id)
ORDER BY e.employee_id;