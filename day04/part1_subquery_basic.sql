-- part1_subquery_basic.sql
-- 서브쿼리
-- 서브쿼리란 SELECT문의 결과를 외부의 다른 SELECT문에서
-- 사용하고자 할 때 내부에 작성하는 SELECT문을 가리킨다.
-- 주로 WHERE절에서 특정 값을 비교하거나
-- FROM절에서 SELECT문의 결과를 임시 테이블로 활용할 때
-- 사용된다.

-- WHERE절에서의 사용
-- 주로 집계함수의 결과값과 특정 컬럼의 값을 비교할 때 사용한다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);
-- 서브쿼리 사용 시 주의사항
-- 서브쿼리인 상태로 테스트 해보지 말고 외부에서 단독으로
-- 그 결과를 확인한 뒤에 서브쿼리에 활용하도록 하자.

-- FROM절에서의 서브쿼리 사용
-- SELECT문의 결과를 테이블처럼 조회대상으로 삼아서
-- 또다른 SELECT를 할 때 사용된다.

-- 각 부서별 평균급여 중 가장 그 값이 큰 평균급여를 출력
SELECT MAX(AVG_SAL)
FROM (
	-- 부서별 평균 급여를 반환하는 임시 테이블
	-- 서브쿼리의 컬럼명은 외부쿼리에서 컬럼명으로 가져다 쓸 수 있다.
	SELECT DEPARTMENT_ID, AVG(SALARY) AVG_SAL -- 함수를 쓴 경우
	-- 외부에서 사용하려면 반드시 별칭을 부여해 주어야 한다.
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID
);






