SELECT salary_rank, first_name, salary
FROM (SELECT first_name, salary, RANK() OVER(ORDER BY salary DESC) salary_rank FROM employees)
WHERE salary_rank <= 5;