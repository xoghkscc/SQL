CREATE TABLE coffees2 AS (SELECT * FROM coffees);--Ŀ�� ���̺� ����

CREATE TABLE bingsu AS (SELECT * FROM coffees WHERE cname LIKE '%����');--Ŀ�� ���̺� �� cname�� ������ �����͸� ����

RENAME bingsu TO bingsoo;

INSERT INTO bingsoo(cname) VALUES('��Ʈ����ī������ξ��ð����������');
--������ �߰� �Ұ���(���ʿ� cname�� var50���� �����߱� ����)
ALTER TABLE bingsoo MODIFY (cname VARCHAR2(60));
--���� ����

UPDATE bingsoo SET coffee_id = 101, price = 7500 WHERE cname = '��Ʈ����ī������ξ��ð����������';

ALTER TABLE bingsoo DROP COLUMN syrup;

INSERT INTO bingsoo (coffee_id,cname,price) VALUES ((SELECT max(coffee_id)+1 FROM bingsoo ),'������ Ŀ��',2500);
        



        
       
    

    

