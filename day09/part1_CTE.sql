-- part1_CTE.sql
-- CTE(Common Table Expressions)
-- CTE란 가상테이블의 일종으로, 뷰테이블처럼 이름만으로
-- 결과테이블을 일반 테이블처럼 사용할 수 있게 하지만
-- 문장이 종료(;)하면 이후엔 사용할 수 없는 임시 테이블을 가리킨다.
-- 단순하게 생각하면 서브쿼리로 작성하던 가상테이블을
-- 상단에 모아서 만들고 이름을 붙인 뒤, 아래에서 사용하는 것으로
-- 이해해도 무방하다.

-- 문법
-- WITH 임시테이블명 AS (서브쿼리)
-- SELECT 메인쿼리
CREATE VIEW TBL_CTE_VIEW AS -- 뷰테이블로도 만들 수 있다.
WITH 
	NVL_EMP AS (
		SELECT NVL(DEPARTMENT_ID, 0) DEPARTMENT_ID, SALARY
		FROM EMPLOYEES
	),
 	DEPARTMENT_AVG_SAL AS (
	 	SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 2) AVG_SAL
		FROM NVL_EMP E
		WHERE SALARY > (SELECT AVG(SALARY) AVG_SAL FROM EMPLOYEES)
		GROUP BY DEPARTMENT_ID
		ORDER BY DEPARTMENT_ID
	)
SELECT D.DEPARTMENT_NAME, A.*
FROM DEPARTMENT_AVG_SAL A
JOIN DEPARTMENTS D
ON A.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 전체 EMPLOYEES 테이블의 월급에 순위를 매겨서
-- 순위 계산 후 필터링하는 복잡한 쿼리
WITH RANKED_EMPLOYEES AS (
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
		DEPARTMENT_ID, SALARY,
		RANK() OVER (-- 랭크를 매길 때
			PARTITION BY DEPARTMENT_ID 
			-- 부서 ID를 기준으로 나눈다.
			ORDER BY SALARY DESC -- 월급을 기준으로 내림차순 정렬
		) SALARY_RANK
	FROM EMPLOYEES
)
SELECT *
FROM RANKED_EMPLOYEES
WHERE SALARY_RANK <= 3 -- 각 부서별 월급 상위 3명 선택
ORDER BY DEPARTMENT_ID;