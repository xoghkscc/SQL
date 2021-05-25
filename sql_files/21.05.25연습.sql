--2005�� �Ի��� ������ ��� first_name�� Lisa�� �������� ���� �Ի��� ������ ���
--1�� ���
SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    jobs;

SELECT
    employee_id,
    first_name,
    last_name AS "name",
    hire_date
FROM
    employees
WHERE
        hire_date < (
            SELECT
                hire_date
            FROM
                employees
            WHERE
                first_name = 'Lisa'
        )
    AND to_char(hire_date, 'yymmdd') BETWEEN 050101 AND 051231;

--2�� ���
SELECT
    *
FROM
    employees;

SELECT
    e1.employee_id,
    e1.first_name,
    e1.last_name AS "name",
    e1.hire_date
FROM
    employees  e1,
    employees  e2
WHERE
        e2.first_name = 'Lisa'
    AND e1.hire_date < e2.hire_date
    AND to_char(e1.hire_date, 'yymmdd') BETWEEN 050101 AND 051231;


--Sales'�μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)��ȸ
--�� �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ���

SELECT
    first_name,
    salary,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            department_id = 100
    );

--De Haan ����� ������ �����ȣ, ������ �̸�(last_name), ������ �Ի��� �� ������ �޿��� ǥ��
SELECT
    e1.last_name,
    e2.last_name AS "�������� �̸�",
    e2.employee_id,
    e2.last_name,
    e2.hire_date,
    e2.salary
FROM
    employees  e1,
    employees  e2
WHERE
        e1.manager_id = e2.employee_id
    AND e1.last_name = 'De Haan';
    
--�̸��� 'T'�� �����ϰ� �ִ� ����� ���� �μ��� �ٹ��ϴ� ����� �̸��� ��� ��ȣ, �μ��̸�

SELECT
    first_name,
    employee_id,
    department_id,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name LIKE '%T%'
    );

--20�� �μ��� �ְ� �޿����� �޿��� ���� ������� �����, �μ��ڵ�, �޿�
--1�� ���
SELECT
    first_name,
    department_id,
    salary
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 20
    );
--2�� ���
SELECT
    first_name,
    department_id,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            department_id = 20
    );

--2002�⿡ �Ի��� ������ ��� �޿����� �޿��� ���� ������� �����, �Ի���, �޿�
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            to_char(hire_date, 'yyyy') = 2002
    );

--�� ��å ��(job_title)�� �޿��� ����, ��å�� Representative�� ����
--��, �޿� ������ 30000 �ʰ��� ��å�� ��Ÿ���� �������� ���� ����� JOB, �޿�

SELECT
    job_title,
    SUM(salary)
FROM
         employees
    INNER JOIN jobs USING ( job_id )
WHERE
    job_title NOT LIKE '%Representative%'
GROUP BY
    job_title
HAVING
    SUM(salary) > 30000
ORDER BY
    SUM(salary);

--�� �μ� �̸� ���� 2005�� ������ �Ի��� �������� �ο��� ��ȸ
SELECT
    department_name,
    COUNT(*)
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    to_char(hire_date, 'yyyy') < 2005 
GROUP BY
    department_name
ORDER BY department_name;

--������� 3�� �̻��� �μ��� �μ���ȣ, �μ��̸�, ��� ��, �ְ�޿�, �����޿�, ��ձ޿�, �޿��Ѿ�
--��� ����� ��� ���� ���� �������, ��ձ޿� ���� �Ҽ��� ���ϴ� ������

SELECT
    department_id,
    department_name,
    max(salary),
    min(salary),
    trunc(avg(salary), 0),
    sum(salary),
    count(*)
FROM
    employees e1
    INNER JOIN departments USING (department_id)
GROUP BY
    department_name,
    department_id
HAVING 
    count(*) >= 3
ORDER BY count(*) desc;

--Seattle�� �ٹ��ϴ� ��� �� �޿� 9000 �̻��� ����� �̸�, �޿�, �μ�, �Ի���, ���ʽ�
SELECT
    first_name,
    salary,
    department_name,
    hire_date,
    nvl(commission_pct, 0),
    city
FROM
    employees
    INNER JOIN departments USING (department_id)
    INNER JOIN locations USING (location_id)
WHERE
    city = 'Seattle'
    And salary >= 9000;







   
    