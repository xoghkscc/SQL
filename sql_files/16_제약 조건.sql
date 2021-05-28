CREATE TABLE fruits (fid NUMBER(2) PRIMARY KEY, fname VARCHAR2(20) NOT NULL);
--UNIQUE
ALTER TABLE fruits MODIFY (fname VARCHAR2(20) UNIQUE);
--CHECK() ���ο� ���ϴ� ������ �߰�
ALTER TABLE fruits ADD (fcolor VARCHAR2(5) CHECK(fcolor IN ('RED', 'GREEN', 'BLUE')));
SELECT * FROM user_constraints;

INSERT INTO fruits VALUES (2, 'Apple', 'RED');
INSERT INTO fruits VALUES (3, 'Banana', 'BLUE');

ALTER TABLE fruits DROP CONSTRAINT sys_c007042;
ALTER TABLE fruits DROP CONSTRAINT SYS_C007040;
ALTER TABLE fruits MODIFY (fcolor VARCHAR(10));

UPDATE fruits SET fcolor = 'Yellow' WHERE fname = 'Banana';

ALTER TABLE fruits ADD CONSTRAINT FRUITS_FID_PK PRIMARY KEY(fid);

ALTER TABLE fruits3 ADD (fprice NUMBER(7) DEFAULT 0);
ALTER TABLE fruits3 MODIFY (fprice NUMBER(7) DEFAULT 10);

ALTER TABLE fruits3 DROP CONSTRAINT FRUITS3_FSIZE_NN;

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';
fruit_locations(lid);
CREATE TABLE fruit_locations (
    lid NUMBER(2),
    addr VARCHAR2(200),
    city VARCHAR2(40)
);
INSERT INTO fruit_locations VALUES (10, '��û�ϵ� û�ֽ�', 'û��');
INSERT INTO fruit_locations VALUES (20, '���ϵ� �ȵ���', '�ȵ�');
INSERT INTO fruit_locations VALUES (30, '���󳲵� ���ﱺ', '����');
INSERT INTO fruit_locations VALUES (40, '��û���� ���', '���');
--ALTER TABLE fruits3 ADD CONSTRAINT FRUITS2_LID_FK FOREIGN KEY (lid);
ALTER TABLE fruit_locations ADD CONSTRAINT FLO_LID_UK UNIQUE(lid);
--fruit_locations�� lid �÷��� UNIQUE �������� �ޱ�
ALTER TABLE fruits3 ADD (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));
--fruits3�� lid��� �÷��� ����� FRUITS3_LID_FK�̶�� �������� �̸��� fruit_locations�� lid��� �÷��� �����Ѵٴ� ��
--fruit_locations�� lid �÷��� UNIQUE ���������� ������ ������ ����

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(1, 'Apple', 'Red', 'L', 10);
INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(2, 'Banana', 'Red', 'N', 20);

ALTER TABLE fruits3 MODIFY (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';




CREATE TABLE fruits4 (
    fid NUMBER(4),
    fname VARCHAR2(20) CONSTRAINT F4_FNAME_NN NOT NULL,
    fcolor VARCHAR2(10) CONSTRAINT F4_FCOLOR_NN NOT NULL,
    fsize CHAR(1),
    fprice NUMBER(7) DEFAULT 0,
    lid NUMBER(2),
    CONSTRAINT F4_FID_PK PRIMARY KEY (fid),
    CONSTRAINT F4_FNAME_UK UNIQUE (fname),
    CONSTRAINT F4_FISZE_CHK CHECK(fsize IN ('L', 'N', 'S')),
    CONSTRAINT F4_LID_FK FOREIGN KEY (lid) REFERENCES fruit_locations (lid) 
);
desc fruits4;

-- ���� 1 : N ���踦 ������ �� ���̺��� ������ �� �����غ�����
--��� ���� ������ �ּ� �ѹ� �̻� ����� ��, �� ���̺� ������ 3���� �־ ��

CREATE TABLE customer_Info (
    cid NUMBER(4),--OK
    cname VARCHAR2(20) CONSTRAINT CI_CNAME_NN NOT NULL,
    cnum VARCHAR2(20) CONSTRAINT CI_CNUM_UK UNIQUE,
    cadrr VARCHAR2(20),--OK
    crank NUMBER(2),--ok
    CONSTRAINT CI_CID_PK PRIMARY KEY (cid)
);

ALTER TABLE customerInfo MODIFY (cadrr VARCHAR2(20) DEFAULT 0);

ALTER TABLE customerInfo ADD CONSTRAINT CI_CRANK_CHK CHECK ( crank IN (10, 20, 30));

INSERT INTO customerinfo VALUES (1, '����ȯ', '010-5625-7327', '����', '10');
INSERT INTO customerinfo VALUES (2, '������', '010-7777-7777', '���ֵ�', '20');
INSERT INTO customerinfo VALUES (3, '�̰�', '010-7777-7778', '�̱�', '30');


CREATE TABLE customer_rank (
    crank NUMBER(4) CONSTRAINT CR_CRANK_UK UNIQUE,
    caccumulate NUMBER(2,2) CONSTRAINT CR_CACCUMULATE_NN NOT NULL,
    csale NUMBER(2,2) CONSTRAINT CR_CSALE_NN NOT NULL
    CONSTRAINT CR_CACCUMULATE_UK UNIQUE
);

ALTER TABLE customer_rank MODIFY (crank NUMBER(2));

INSERT INTO customer_rank VALUES (10, 0.2, 0.3);
INSERT INTO customer_rank VALUES (20, 0.3, 0.4);
INSERT INTO customer_rank VALUES (30, 0.4, 0.5);

ALTER TABLE customer_info MODIFY (crank NUMBER(2) CONSTRAINT CI_CRANK_FK REFERENCES customer_rank(crank));

SELECT * FROM customer_rank;

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) 
VALUES(3, 'Kiwi', 'Olive', 'S', 10);
DELETE FROM fruit_locations WHERE lid = 40;--��� ������ �����ϳ�
DELETE FROM fruit_locations WHERE lid = 10;--��� ���� �Ұ���

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';

ALTER TABLE fruits3 DROP CONSTRAINT FRUITS3_LID_FK;
commit;
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_LID_FK FOREIGN KEY (lid) REFERENCES
    fruit_locations(lid) ON DELETE CASCADE;
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_LID_FK FOREIGN KEY (lid) REFERENCES
    fruit_locations(lid) ON DELETE SET NULL;

ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_LID_FK FOREIGN KEY (lid) REFERENCES
    fruit_locations(lid) ON DELETE SET NULL;

DELETE FROM fruit_locations WHERE lid = 10;

ROLLBACK;
