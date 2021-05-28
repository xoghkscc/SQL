SELECT * FROM user_sequences;
SELECT * FROM all_sequences;


CREATE TABLE sodas(pid NUMBER(4) CONSTRAINT SODA_PID_PK PRIMARY KEY,
    pname VARCHAR2(30) CONSTRAINT SODA_PNAME_NN NOT NULL);

INSERT INTO sodas VALUES (1, '���̴�');
INSERT INTO sodas VALUES (2, 'û���� ���̵�');
INSERT INTO sodas VALUES (3, '�ڸ� ���̵�');
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;


INSERT INTO sodas VALUES (sodas_seq.nextval, '��Ʈ���ڶ�');
INSERT INTO sodas VALUES (sodas_seq.nextval, 'ȯŸ');
INSERT INTO sodas VALUES (sodas_seq.nextval, '��Ű��');
INSERT INTO sodas VALUES (sodas_seq.nextval, '�ϸ���');


CREATE TABLE soda_categories(cate_id NUMBER(4),
    cate_name VARCHAR2(40) CONSTRAINT SC_ID_PK PRIMARY KEY
    );

ALTER TABLE soda_categories DROP CONSTRAINT SC_ID_PK;

--soda_categories ���̺��� ����� ������ ���� ������ ����
--������ 10, 10�� ����, CACHE 10���� ����, ��ȯX, �ִ방�� 9000

CREATE SEQUENCE soda_categories_seq START WITH 10 
INCREMENT BY 10 CACHE S10 NOCYCLE MAXVALUE 9000;

SELECT sodas_seq.currval FROM dual;
COMMIT;
DROP SEQUENCE sodas_seq;
ROLLBACK;





