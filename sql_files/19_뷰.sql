CREATE OR REPLACE VIEW dept30_view AS 
    SELECT * 
    FROM employees 
    WHERE department_id = 50
    WITH CHECK OPTION;
    
SELECT * FROM dept30_view;

INSERT INTO dept30_view VALUES(1, 'Gildong', 'Hong', 'GHong', 
'515.127.4444', sysdate, 
'WHITE_HAND', 1000, null, 120, 50);

