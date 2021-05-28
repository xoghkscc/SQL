SELECT * FROM user_sequences;
SELECT * FROM all_sequences;


CREATE TABLE sodas(pid NUMBER(4) CONSTRAINT SODA_PID_PK PRIMARY KEY,
    pname VARCHAR2(30) CONSTRAINT SODA_PNAME_NN NOT NULL);

INSERT INTO sodas VALUES (1, '사이다');
INSERT INTO sodas VALUES (2, '청포토 에이드');
INSERT INTO sodas VALUES (3, '자몽 에이드');
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;


INSERT INTO sodas VALUES (sodas_seq.nextval, '민트초코라떼');
INSERT INTO sodas VALUES (sodas_seq.nextval, '환타');
INSERT INTO sodas VALUES (sodas_seq.nextval, '밀키스');
INSERT INTO sodas VALUES (sodas_seq.nextval, '암마바');


CREATE TABLE soda_categories(cate_id NUMBER(4),
    cate_name VARCHAR2(40) CONSTRAINT SC_ID_PK PRIMARY KEY
    );

ALTER TABLE soda_categories DROP CONSTRAINT SC_ID_PK;

--soda_categories 테이블에서 사용할 다음과 같은 시퀀스 생성
--시작은 10, 10씩 증가, CACHE 10으로 설정, 순환X, 최대갑승 9000

CREATE SEQUENCE soda_categories_seq START WITH 10 
INCREMENT BY 10 CACHE S10 NOCYCLE MAXVALUE 9000;

SELECT sodas_seq.currval FROM dual;
COMMIT;
DROP SEQUENCE sodas_seq;
ROLLBACK;





