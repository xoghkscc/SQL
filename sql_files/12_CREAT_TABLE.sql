CREATE TABLE coffees(
    coffee_id NUMBER(5),
    cname VARCHAR2(50),
    price NUMBER(5)
);
--������ ����
show recyclebin;

--������ ���̺� �ǵ�����
flashback table coffees to before drop;

--������ ����
purge recyclebin;

SELECT * FROM user_tables;

SELECT * FROM all_tables 
