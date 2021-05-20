--������ 15000�޷� ������ ����鸸 ��ȸ�ϱ�

SELECT
    *
FROM
    employees
WHERE
    salary >= 15000;

SELECT
    *
FROM
    employees
WHERE
    salary != 17000;

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Steven';

SELECT
    *
FROM
    employees
WHERE
    hire_date < '2004/01/01';

SELECT
    *
FROM
    employees
WHERE
        hire_date < '2007/01/01'
    AND hire_date >= '2006/01/01';

SELECT
    *
FROM
    employees
WHERE
    job_id = 'IT_PROG'
    OR job_id = 'ST_CLERK';

-- ����1 : 2000~ 3000������ ������ �޴� ��� ������� ��� ���� ��ȸ

SELECT
    *
FROM
    employees
WHERE
        salary >= 2000
    AND salary <= 3000;

-- ����2 : �μ���ȣ�� 30 or 60 or 90�� ��� ������� �̸�, ��å, ��ȭ��ȣ ��ȸ

SELECT
    first_name,
    phone_number,
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = 30
    OR department_id = 60
    OR department_id = 90;

-- ����� ¦���� ����� ��ȸ�غ���

SELECT
    *
FROM
    employees
WHERE
    mod(employee_id, 2) = 0;

SELECT
    *
FROM
    employees
WHERE
    salary BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    employees
WHERE
    department_id IN ( 30, 60, 90 );

SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NULL;
    
SELECT * FROM employees WHERE not department_id in (30, 60, 90);

SELECT * FROM employees WHERE salary not BETWEEN 2000 and 3000;

SELECT * FROM employees WHERE commission_pct is not null;--��
SELECT * FROM employees WHERE not commission_pct is null;--��

--�̸��� J�� �����ϴ� ��� ����� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE 'J%';

--�̸��� �ι�° ���ڰ� u�� ��� ����� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '_u%';

--�̸��� ����° ���ڰ� e�� ��� ����� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '__e%';

--�̸��� x�� ���ԵǾ� �ִ� ��� ����� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '%x%';


--����1 : �̸��� �ڿ��� �� ��° ���ڰ� a�� ��� ����� ��ȸ

SELECT first_name FROM employees WHERE first_name LIKE '%a__';

--����2 : �̸��� e�� �ΰ� �̻� ���Ե� ��� ����� ��ȸ

SELECT first_name FROM employees WHERE first_name LIKE '%e%e%';

--����3 : �̸��� �ټ� �����̸鼭 a�� ������ ��� ����� ��ȸ

SELECT first_name FROM employees WHERE first_name LIKE '____a';


