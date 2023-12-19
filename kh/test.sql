SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id;