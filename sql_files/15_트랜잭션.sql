COMMIT;

SELECT * FROM coffees;

TRUNCATE TABLE coffees; --���̺��� ��� ������ �ڸ���. DROP TABLE�� �ٸ��� ������ �����.

ROLLBACK;

-- ���� 1: coffees ���̺� ���ϴ� ���ο� �÷��� �߰��� ������.

ALTER TABLE coffees ADD (product_type_id NUMBER(4));
CREATE TABLE product_types(product_type_id NUMBER(4), product_type_name VARCHAR2(4), manager_id NUMBER(2));
desc product_types;
-- ���� 2: �÷��� �̸��� �� �� ������ ������
ALTER TABLE coffees RENAME COLUMN coffee_id TO product_number;

--���� 3 INSER���� ����� ����� �� �޴��� 5�� �̻� �־����.
INSERT
    INTO coffees (
        coffee_number,
        cname,
        price,
        product_type_id
    )
VALUES (1,
    '�Ƹ޸�ī��',
    2000,
    1001
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '�����ɟ�',
    6000,
    1002
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '�̻� �Һ�',
    10000,
    1003
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES (( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    'ī���',
    4000,
    1001
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '����� �Һ�',
    8000,
    1003
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '�ٳ����ɟ�',
    7500,
    1002
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '�ٳ����ɟ�',
    7500,
    1002
);

ALTER TABLE product_types MODIFY (product_type_name VARCHAR2(20));

INSERT INTO product_types (
    product_type_id,
    product_type_name,
    manager_id
) VALUES (
    1001,
    'Ŀ�� ������',
    10
);

INSERT INTO product_types (
    product_type_id,
    product_type_name,
    manager_id
) VALUES (
    1002,
    '�ɟ� ������',
    20
);

INSERT INTO product_types (
    product_type_id,
    product_type_name,
    manager_id
) VALUES (
    1003,
    '���� ������',
    30
);

INSERT INTO coffees VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '������', 8000, null, null);              
SAVEPOINT save01;

DELETE FROM coffees WHERE product_number BETWEEN 3 AND 10;
SAVEPOINT save02;

UPDATE coffees SET cname = replace(cname, '�Ƹ޸�', '��Ż��');
SAVEPOINT save03;

ROLLBACK TO save02;

ROLLBACK;




INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '���ν����', 8000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), 'īǪġ��', 6500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), 'ī�� �񿣳�', 7000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '����������', 1500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '�ݵ� ���', 5000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '���������� ���ĳ�', 5000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), 'ī�����', 4500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), 'īǪġ��', 4500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '��� �����', 7500, 1001);

INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), 'ũ�������Ƹ�� ���', 3500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '��ī����Ĩ ��Ű', 3500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '��������Ĩ ��Ű', 3500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), 'ġ�� ����ũ', 4500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '���ڹ��� ����ũ', 4500, 1001);

ALTER TABLE coffees ADD(bitter CHAR(15));
UPDATE coffees SET bitter = '�ڡڡڡ١�';

commit;


-- employees�� �������� �ڽ��� ���� �� �ִ� ���� ���� ������ 
-- �� �ۼ�Ʈ ������ ������ �ް� �ִ��� ���� ���� ���·� ��ȸ(Ŀ�̼ǵ� ����
-- (�� jobs�� ���� max_salary�� ����





