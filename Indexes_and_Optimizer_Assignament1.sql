-------  This the PERSON Table including id name salary address and Gender columns  --------------------- 
CREATE TABLE PERSONN (
id NUMBER PRIMARY KEY,
e_NAME VARCHAR2(34),
salary NUMBER(10,2) ,
address VARCHAR2(200),
GENDER VARCHAR2(12)
)
ORGANIZATION INDEX;
 ------------- To insert data using for loop ; ------------------
 
DECLARE 
i NUMBER ;
BEGIN
FOR i IN 1 .. 100000 LOOP 
   INSERT INTO PERSONN(id , e_NAME, salary , address , GENDER) 
   VALUES (i , 'AHMAD' || i , 5000.00, 'address' || i ||' MALE',i ); 
   END LOOP;
 COMMIT;
END;
 
SELECT * FROM personn;

------  creating CLUSTER ON TABLE PERSONS  -------------------------
CREATE CLUSTER PERSONN 
(e_NAME VARCHAR2(34));

--------- After the creating CLUATER now it must be created index on the PERSONN  -------
CREATE INDEX person_ind ON CLUSTER PERSONN;
-----  When we create the index it must be explianed -------------------------
EXPLAIN PLAN FOR 
SELECT * FROM PERSONN
WHERE e_NAME = 'PERSONN';

------    After the EXPLAINATION , it must be display and the result -------------------
------  must be like the size, name, Rows, Cost (CUP) Time and some others-------------

SELECT * FROM 
TABLE (DBMS_XPLAN.DISPLAY);
-------------------------------------------------------------------------------

------ Creaing NONCLUSTER INDEX on the above table . -----------------
CREATE INDEX idx_person_id ON PERSONN (id);


-----  When we create the index it must be explianed -------------------------
EXPLAIN PLAN FOR 
SELECT * FROM PERSONN
WHERE id = 3;

------    After the EXPLAINATION , it must be display and the result -------------------
------  must be like the size, name, Rows, Cost (CUP) Time and some others-------------

SELECT * FROM 
TABLE (DBMS_XPLAN.DISPLAY);

--------------------------------------------------------------------------------------------------
------------   B-Tree Index and BITMAP Indexes --------------

----- B-Tree index : This is the most common type of index in Oracle . -------------------
----- It stores the indexed values in a balanced tree strcuture, allowing for 
----- efficient searching, range scans, and sorting . ----------

CREATE INDEX ind_person_salary ON PERSONN (salary);

-----  When we create the B-Tree index it must be explianed -------------------------
EXPLAIN PLAN FOR 
SELECT * FROM PERSONN
WHERE id = 3;

------    After the EXPLAINATION , it must be display and the result -------------------
------  must be like the size, name, Rows, Cost (CUP) Time and some others-------------

SELECT * FROM 
TABLE (DBMS_XPLAN.DISPLAY);

----- Bitmap Index : A Bitmap index uses a bitmap for each distinct value in the indexed column .---------
----- This type of index is useful when the indexed column has a low cardinality (few distinct .--------------

CREATE BITMAP INDEX idx_person_address ON PERSON (address);

-----  When we create the Bitmap index it must be explianed -------------------------
EXPLAIN PLAN FOR 
SELECT * FROM PERSONN
WHERE address = 'KANDAHAR';

------    After the EXPLAINATION , it must be display and the result -------------------
------  must be like the size, name, Rows, Cost (CUP) Time and some others-------------

SELECT * FROM 
TABLE (DBMS_XPLAN.DISPLAY);

--------  This will be return the executiojn plan for EXPLAIN PLAN FOR statement . -------------------

EXPLAIN PLAN FOR 
SELECT * FROM PERSONS 
WHERE id = 4;

---- After taht this query will be retrieve the execution plan -----------------
SELECT * FROM PLAN_TABLE;