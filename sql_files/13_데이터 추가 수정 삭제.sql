desc coffees;

SELECT * FROM coffees ORDER BY coffee_id;

INSERT INTO coffees(coffee_id, cname, price) VALUES (1, '�Ƹ޸�ī��', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES (2, '���̽� �Ƹ޸�ī��', 2500);
INSERT INTO coffees(coffee_id, cname, price) VALUES (3, 'ī���', 3000);


-- �Ϻ� �÷����� ������ �߰�(�����͸� ���� ���� �÷��� null�� ��
INSERT INTO coffees(cname, price) VALUES ('�Ϻ���', 5500);
INSERT INTO coffees(cname) VALUES ('�������');

--�÷����� �����ϰ� ������ �߰�
INSERT INTO coffees VALUES (6, '���ɺ���', 6500);
INSERT INTO coffees VALUES (6, '�������');

INSERT INTO coffees(price, cname, coffee_id) VALUES (4000, 'ī���ī', 8);
INSERT INTO coffees(price, coffee_id, cname) VALUES (4000, 9, 'ī��� �����߶�');

INSERT INTO coffees (SELECT * FROM coffees);

UPDATE coffees SET price = 1000 WHERE price is null;
UPDATE coffees SET price = 2000 WHERE cname LIKE '%�Ƹ޸�ī��%';
UPDATE coffees SET price = price + 500 WHERE cname LIKE '%���̽�%';
UPDATE coffees SET price = 5000, coffee_id = 100 WHERE cname LIKE '%����';

--����1 : ������ �ƴϰ� �Ƹ޸�ī�뵵 �ƴ� ��� ��ǰ���� ������ 3õ������ ����

UPDATE coffees SET price = 3000 WHERE cname NOT LIKE '%����' AND cname NOT LIKE '%�Ƹ޸�ī��%' ;

COMMIT;

SELECT * FROM coffees;

DELETE FROM coffees WHERE cname LIKE '%����';

ROLLBACK;













