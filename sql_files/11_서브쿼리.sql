SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM jobs;
SELECT * FROM job_history;
--Sigal�� ���� �μ��� �ٹ��ϴ� ��� ��� ��ȸ�غ���
SELECT
    *
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name = 'Sigal'
    );


--����1: email�� DRAPHEAL�� ������� �޿��� ���� �޴� ������� �̸�/��å/�޿��� ��ȸ

SELECT
    first_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary > (
    SELECT
            salary
        FROM
            employees
        WHERE
            email = 'DRAPHEAL'
    );


--����2 : Purchasing �μ����� �ٹ��ϴ� ������� �̸��� ��å�� �μ���ȣ�� ��ȸ

SELECT
    first_name,
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = (
    SELECT
            department_id
        FROM
            departments
        WHERE
            department_name = 'Purchasing'
    );
--���� �� ���� ����

SELECT * FROM employees ORDER BY salary desc;

SELECT DISTINCT department_id FROM employees WHERE salary >= 13000;

-- �޿��� 13000 �̻��� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ��� ����� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    department_id IN (
        SELECT DISTINCT
            department_id
        FROM
            employees
        WHERE
            salary >= 13000
    )
ORDER BY department_id;

SELECT 
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING (job_id)
WHERE
    salary > ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG');
    --IT_PROG�� ���� ������� ��� ���޺��� �� ū ������ �޴� ����� ���

SELECT 
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING (job_id)
WHERE
    salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG');
    --IT_PROG�� ���� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���

SELECT 
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING (job_id)
WHERE
    salary < SOME(SELECT salary FROM employees WHERE job_id = 'IT_PROG');
    --IT_PROG�� ���� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���


SELECT
    *
FROM
    employees e1
WHERE
   NOT EXISTS (
        SELECT
            *
        FROM
            employees e2
        WHERE
            e1.salary < e2.salary
    );

