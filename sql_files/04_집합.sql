desc departments;
desc employees;
SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
UNION
SELECT * FROM departments WHERE employees BETWEEN 30 and 50;

SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
UNION ALL
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;

SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
INTERSECT
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;

SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
MINUS
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;

SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
INTERSECT
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;

SELECT department_id FROM employees WHERE job_id = 'IT_PROG'
UNION
SELECT department_id FROM departments WHERE department_id BETWEEN 30 and 50;
