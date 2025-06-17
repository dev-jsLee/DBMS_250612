-- part4_DML_INSERT.sql
-- INSERT 문
-- 테이블에 새로운 데이터, 레코드, 행을 추가할 때 사용하는 DML 명령어다.
-- INSERT INTO [테이블명] (컬럼명1, 컬럼명2)
-- VALUES (컬럼1에 들어갈 값, 컬럼2에 들어갈 값);
-- INTO () 안에 들어가는 컬럼명의 개수와
-- VALUES() 안에 들어가는 값의 개수는 동일해야 오류가 나지 않는다.

-- 테스트용 테이블 생성
CREATE TABLE TBL_INSERT (
	NAME VARCHAR2(20),
	AGE INTEGER
);

-- 데이터 삽입
-- NULL값을 허용하는 열에는 값을 지정하여 넣지 않아도 된다.
-- 컬러명 중 해당 컬럼을 제외하고 입력하면 데이터는 자동으로 NULL로 들어간다.
INSERT INTO TBL_INSERT (NAME, AGE)
VALUES ('이준상2', 32);

-- 열 추가
ALTER TABLE TBL_INSERT ADD (SEAT_NUM INTEGER);

-- 여러 행 한꺼번에 삽입하기
-- INSERT ALL
-- INTO [테이블명] (컬럼명1, 컬럼명2,...)
-- VALUES ([값1], [값2],...)
-- INTO [테이블명] (컬럼명1, 컬럼명2,...)
-- VALUES ([값1], [값2],...)
-- ...
-- SELECT * FROM DUAL; -- 마지막에 반드시 있어야 한다.
INSERT ALL
	INTO TBL_INSERT (NAME, AGE)
	VALUES ('홍', 30)
	INTO TBL_INSERT (NAME, AGE)
	VALUES ('김', 20)
SELECT * FROM DUAL;
-- 더미 테이블 DUAL을 활용해야 한다.
-- SELECT 문이 필요하지만 아무 테이블이나 넣을 수 없을 때
-- 의미없는 테이블인 더미테이블 DUAL을 사용한다.
-- 혹은 SELECT문에서 테이블의 데이터를 사용하지 않는
-- 연산을 하는 경우에 DAUL 테이블이 사용된다. 

SELECT *
FROM DUAL;

-- 서브쿼리로 데이터 삽입하기
-- VALUES 절 대신에 SELECT문을 작성하여 데이터를 삽입할 수 있다.

-- 데이터를 복사받은 백업 테이블 생성
CREATE TABLE TBL_EMP_BACKUP (
	EMP_ID INTEGER, 
	FIRST_NAME VARCHAR2(50), 
	SALARY INTEGER
);

-- 백업 테이블로 기존 EMPLOYEES 테이블의 일부 데이터를
-- 서브쿼리를 이용하여 삽입해보자.
INSERT INTO TBL_EMP_BACKUP (EMP_ID, FIRST_NAME, SALARY)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
--, DEPARTMENT_ID -- 데이터 확인용 코드
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

SELECT *
FROM TBL_EMP_BACKUP;




