SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary;


SELECT * FROM employees ORDER BY commission_pct DESC;
SELECT * FROM employees ORDER BY commission_pct ASC;


SELECT * FROM employees ORDER BY job_id;
SELECT * FROM employees ORDER BY job_id, first_name;

-- ����1 : ��� ������� �μ���ȣ ���� ������������ ��ȸ
SELECT * FROM employees ORDER BY department_id;

-- ����2 : ��� ������� �ֱ� �Ի��� ������� ��ȸ
SELECT * FROM employees ORDER BY hire_date DESC;

--����3 : �̸��� i�� ���Ե� ������� ���� ���� ���� �޴� �������
SELECT * FROM employees WHERE first_name LIKE '%i%' ORDER BY salary DESC ;

--����4 : 80�� �μ��� 50�� �μ��� ������� �μ���ȣ ���� �������� ��ȸ�ϰ� 
-- �μ���ȣ�� ���ٸ� last_name �������� ���ĺ� ������ ��ȸ
SELECT * FROM employees WHERE department_id = 50 or department_id = 80 ORDER BY department_id, last_name;

