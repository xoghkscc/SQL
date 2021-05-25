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
    locations;

SELECT
    *
FROM
    jobs;


--����1 : first_name�� Valli�� ����� �����ȣ/Ǯ����/�μ��� ��ȸ
SELECT
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    departments.department_name
FROM
    employees,
    departments
WHERE
        departments.department_id = employees.department_id
    AND first_name = 'Valli';

--����2 : job_id��  IT_PROG�� ������� �̸�/�μ���ȣ/�μ��� ��ȸ
SELECT
    employees.first_name,
    employees.department_id,
    departments.department_name,
    employees.job_id
FROM
    employees,
    departments
WHERE
        departments.department_id = employees.department_id
    AND job_id = 'IT_PROG';

--����3 : �þ�Ʋ�� �ٹ��ϴ� ��� ����� �̸�, ��å, �޿�

SELECT
    e.first_name,
    d.department_name,
    e.salary,
    l.city AS "�ٹ��ϴ� ����"
FROM
    employees    e,
    departments  d,
    locations    l
WHERE
        d.department_id = e.department_id
    AND d.location_id = l.location_id
    AND l.city = 'Seattle';
    
--���� : �� ���� ������� ��� �޿�

SELECT
    locations.city,
    trunc(AVG(employees.salary), 2) AS "��� �޿�"
FROM
    employees,
    departments,
    locations
WHERE
        departments.department_id = employees.department_id
    AND departments.location_id = locations.location_id
GROUP BY
    locations.city;

SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.manager_id,
    e2.first_name AS "�Ŵ��� �̸�"
FROM
    employees  e1,
    employees  e2
WHERE
    e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;

--����1: �Ŵ��� �̸��� Nancy�� ������� ���, �̸�, job_title�� ��ȸ(job_title�� jobs ���̺� ����)
SELECT
    *
FROM
    jobs;

SELECT
    e1.employee_id,
    e1.first_name,
    e2.first_name AS "�Ŵ��� �̸�",
    j.job_title
FROM
    employees  e1,
    employees  e2,
    jobs       j
WHERE
        e1.manager_id = e2.employee_id
    AND e2.first_name = 'Nancy'
    AND e1.job_id = j.job_id;

--����2: Curtis�� ������ ��å�� ���� ������� ��� ������ ��ȸ

SELECT
    e1.*
FROM
    employees  e1,
    employees  e2
WHERE
        e2.first_name = 'Curtis'
    AND e2.job_id = e1.job_id;
    

--���� : Curtis ���� �Ŵ����� ���� ������� ������ 10% �λ�
--���/�̸�/���� �ݿ��� ����/�Ŵ��� �̸� ���

SELECT
    e1.employee_id,
    e1.first_name,
    e1.salary            AS "���� ����",
    e1.salary * 1.1      AS "������ ����",
    e2.first_name
FROM
    employees  e1,
    employees  e2
WHERE
        e1.manager_id = e2.employee_id
    AND e2.first_name = 'Nancy';

--���� : Nancy ���� �Ŵ����� ���� ������� ������ 10% �λ�
--Steven �Ŵ����� ���� ����� ������ 10% �谨
--���/�̸�/���� �ݿ��� ����/�Ŵ��� �̸� ���(������ �״���� ����� ��� X)

SELECT
    e1.employee_id,
    e1.first_name,
    e2.first_name    AS "�Ŵ���",
    e1.salary        AS "�ݿ� �� ����",
    CASE
        WHEN e2.first_name = 'Nancy'     THEN
            e1.salary * 1.1
        WHEN e2.first_name = 'Steven'    THEN
            e1.salary * 0.9
    END              AS "�ݿ� �� ����"
FROM
    employees  e1,
    employees  e2
WHERE
        e1.manager_id = e2.employee_id
    AND
    CASE
            WHEN e2.first_name = 'Nancy'     THEN
                e1.salary * 1.1
            WHEN e2.first_name = 'Steven'    THEN
                e1.salary * 0.9
    END
    - e1.salary != 0;

SELECT
    employee_id,
    first_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id = d.department_id (+);

SELECT
    e1.*,
    e2.first_name
FROM
    employees  e1,
    employees  e2
WHERE
    e1.manager_id = e2.employee_id (+);

--�����ʿ� ���̴� ��쿡�� e1.manager_id�� ������ e2�� ��ġ�ϴ� ���� ��� ��µ��� ���ϴ� ���� ���
--manager_id�� �߸��� ��� �Ǵ� null, �Ŵ����� �������� ���� ���

SELECT
    e1.*,
    e2.first_name
FROM
    employees  e1,
    employees  e2
WHERE
    e1.manager_id (+) = e2.employee_id;

--���ʿ� ���̴� ��쿡�� e2.emplyee_id�� ������ e1�� ��ġ�ϴ� ���� ��� ��µ��� ���ϴ� ���� ���
--���������� ���������� ���� ��찡 ��µ�

--����1 : �����/�μ���ȣ/�μ��̸��� ����ϵ� ����� �Ѹ� ������ ���� �μ��� ��ȸ
SELECT
    e.first_name,
    e.department_id    AS "employess department_id",
    d.department_id    AS "departments department_id",
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id (+) = d.department_id;--�� departments�� �ִ� �μ��� ��ġ���� �ʴ� �����
    --��µ��� �����Ƿ� employees�� ���� ��ŭ �߰�

--����2 : �����/��åID/��å���� ����ϵ� ����� �Ѹ� ������ ���� ��å�� ��ȸ
SELECT
    e.first_name,
    e.job_id,
    j.job_title
FROM
    employees  e,
    jobs       j
WHERE
    e.job_id (+) = j.job_id;--�� jobs�� �ִ� ��å�� ��ġ���� �ʴ� �����
    --��µ��� �����Ƿ� employees�� ���� ��ŭ �߰�
    
--����3 : �μ���/�ּ�/���ø��� ����ϵ� �Ҽӵ� �μ��� ���� ���õ� �Բ� ��ȸ
SELECT
    d.department_name,
    l.street_address,
    l.city
FROM
    departments  d,
    locations    l
WHERE
    d.location_id(+) = l.location_id;--�� locations�� �ִ� ���ÿ� ��ġ���� �ʴ� �μ���
    --��µ��� �����Ƿ� departments ���� ��ŭ �߰�
    

    
    
    
    
    
    
    