--EMPLOYEES�� �������� �ڽ��� ���� �� �ִ� ���� ���� ������ �� �ۼ�Ʈ ������ ������ �ް� �ִ���
--��ȸ(Ŀ�̼ǵ� ����)

SELECT
    first_name,
    job_title,
    nvl(commission_pct, 0)                       AS "Ŀ�̼�",
    salary * ( 1 + nvl(commission_pct, 0) )            AS "Ŀ�̼� ���� ����",
    max_salary,
    trunc(salary * ( 1 + nvl(commission_pct, 0) ) / max_salary, 2) *100 ||'%'  AS "����"
FROM
    employees
    INNER JOIN jobs USING(job_id);
    
    
--�Ŵ��� �̸��� Nancy(108)�� ������ ����鿡 ���ؼ� commission_pct�� 0.12�� �ٲ���
UPDATE employees
SET
    commission_pct = 0.12
WHERE 
   manager_id = (
    SELECT
        e1.manager_id
    FROM
        employees e1,
        employees e2
    WHERE
        e1.manager_id = e2.employee_id
        AND e2.first_name = 'Nancy'
     GROUP BY e1.manager_id
    );


--Ȯ��
SELECT 
    * 
FROM
    employees
    manager_id = 108;

ROLLBACK;



--�ٹ�����(city)  Seattle(�þ�Ʋ�� department_id �� 10, 30, 90, 100, 110)�� ������� ���� 1�� ���ϱ�(����Ǿ����� Ȯ�� �ϱ� ����)

UPDATE employees
SET
    salary = salary + 1
WHERE 
   department_id IN (
    SELECT
        department_id
    FROM
        employees
        INNER JOIN  departments USING (department_id)
        INNER JOIN  locations USING (location_id)
    WHERE
        city = 'Seattle'
    GROUP BY department_id
    );

--Ȯ��
SELECT
    *
FROM
    employees
WHERE
    department_id IN (10, 30, 90, 100, 110);
    
ROLLBACK;

--