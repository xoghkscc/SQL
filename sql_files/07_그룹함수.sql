SELECT SUM(salary) FROM employees;

--��å�� �� ����
SELECT job_id, SUM(salary) FROM employees GROUP BY job_id;
--��å�� ��� ����
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

SELECT department_id, sum(salary) FROM employees GROUP BY department_id;

SELECT department_id, max(salary) FROM employees GROUP BY department_id;


SELECT department_id, count(*) FROM employees GROUP BY department_id;

select distinct JOB_ID from employees;

--����1 : �μ����� ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� ������ִ� ������ �ۼ�
SELECT DEPARTMENT_ID, min(hire_date) as ����, max(hire_date) as �ֱ� FROM employees GROUP BY DEPARTMENT_ID;


--����2 : ���ʽ��� �޴� ����� �� �μ��� �� �� �ִ��� ������ִ� ������
SELECT DEPARTMENT_ID, count(COMMISSION_PCT) as ���ʽ� FROM employees GROUP BY DEPARTMENT_ID;

--����3 : �� ���޺� ��� ������ ���غ����� (���� �ƴ�, Ŀ�̼� ����, �Ҽ��� ��° �ڸ����� ����)
SELECT JOB_ID, trunc(AVG(SALARY*nvl(1+COMMISSION_PCT, 1))*12, 3) as "��� ����" FROM employees GROUP BY JOB_ID;

SELECT job_id, count(*) FROM employees WHERE salary <= 5000 GROUP BY job_id;

--ȸ�翡 5�� ���Ϲۿ� ���� ��å�� ��� ���
SELECT job_id, count(*) FROM employees GROUP BY job_id HAVING count(*) <= 5;

--����1 : �μ��� �ִ� �޿��� �ּ� �޿��� ����ϵ� �ִ� �޿��� 5000�̻��� �μ��� ���
SELECT DEPARTMENT_ID, MIN(salary) as "�ּ� �޿�", MAX(salary) as "�ִ� �޿�" FROM employees GROUP BY DEPARTMENT_ID HAVING max(salary) >=5000;

--����2 :  �μ��� ��� �޿��� ����ϵ� �ش� �μ��� �Ҽӵ� ����� 10�� �̻��� �μ��� �ҷ�
SELECT DEPARTMENT_ID, TRUNC(AVG(salary), 2) as "��� �޿�",  COUNT(*) AS "��� ��" FROM employees GROUP BY DEPARTMENT_ID HAVING COUNT(*) >=10;




