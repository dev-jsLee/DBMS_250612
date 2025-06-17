-- part3_DML_SELECT.sql
-- SELECT문
-- DML 중 가장 많이, 자주 쓰이는 명령어로
-- 테이블에 저장된 데이터를 불러올 때 사용한다.
-- 이때 불러오는 데이터의 열 이름을 지정할 수도 있으며
-- 특정 조건을 가진 행(ROW)만 필터링하여 불러올 수도 있다.
-- SELECT [컬럼명], [컬럼명]
-- FROM [테이블명]
-- WHERE [조건식]; -- 조건식은 옵션이다.
-- SELECT 문에서 SELECT와 FROM은 필수다.

-- 수업 중에는 SELECT 문을 작성할 때
-- SELECT FROM;을 먼저 적어두고
-- 테이블명을 작성한 뒤 컬럼명을 작성하는 순서를 지킬 것이다.
SELECT * -- *은 모든 컬럼을 의미한다.
FROM EMPLOYEES e ;
-- SELECT * FROM [테이블명];은 해당 테이블의 모든 컬럼을
-- 보여주는 명령어다.

-- SELECT 문에 컬럼명을 콤마,로 구분하여 여러 개 작성하면
-- 작성된 순서대로 컬럼을 구성하여 가상의 테이블 형태로
-- 아래쪽에 출력되어 보여준다.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES;

-- WHERE절
-- SELECT문에 추가 옵션으로 사용할 수 있는 WHERE절은
-- 뒤따라오는 조건식을 만족하는 행을 골라서 출력한다.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY 
FROM EMPLOYEES
--WHERE SALARY > 5000
WHERE SALARY < 10000
;

-- 중복 데이터 제거
-- DISTINCT
-- SELECT문에서 SELECT 바로 뒤에 DISTINCT를 작성하면
-- SELECT한 컬럼에 대해서 모든 데이터가 일치하면
-- 중복을 제거하고 그 결과를 출력한다.
-- 중복 제거 전 107개 행
SELECT
DISTINCT
JOB_ID, SALARY
FROM EMPLOYEES; -- 중복 제거 후 82개 행

-- ORDER BY
-- 조회한 데이터의 정렬 명령문
-- SELECT ~~~ ORDER BY [컬럼명] [정렬방향], [컬럼명2] [정렬방향];
-- 여러 컬럼을 기준으로 정렬할 수 있으며, 먼저 작성된 컬럼을 기준으로
-- 정렬하되 같은 값을 가진 경우, 두번째 정렬 컬럼을 기준으로
-- 하위 정렬한다.
-- 정렬 방향은 두 가지로 ASC는 오름차순
-- DESC는 내림차순을 의미한다.
-- 이때 ASC는 기본값이기 때문에 생략이 가능하다.
SELECT EMPLOYEE_ID, SALARY 
FROM EMPLOYEES
ORDER BY SALARY ASC, EMPLOYEE_ID
;

-- ROWNUM
-- 출력되는 행의 개수 제한
-- WHERE ROWNUM <= [제한할 행 개수];
-- WHERE 절에서 ROWNUM을 사용하면 행의 개수를 제한할 수 있다.
-- 이때 주의할 점은 조건식에서 ROWNUM의 값으로 1이 반드시 포함되어야 한다.
SELECT *
FROM EMPLOYEES
--WHERE ROWNUM >= 5 
WHERE ROWNUM <= 10
;