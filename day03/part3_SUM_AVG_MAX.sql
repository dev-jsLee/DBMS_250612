-- part3_SUM_AVG_MAX.sql
-- 1. 집계함수
-- 집계함수란 통계를 내기 위한 함수를 가리킨다.
-- 집계함수는 별다른 조치가 없으면 그 결과값이
-- 항상 한 행이다.
-- 만약 여러 행을 반환하는 다른 컬럼이 있다면
-- 오류를 발생시킨다.

-- 평균 AVG
-- AVG(컬럼명)
-- 전달된 값들의 평균값을 반환하는 함수
SELECT AVG(SALARY) AS "평균 급여"
FROM EMPLOYEES;

-- 합계 SUM
-- 합계를 구할 때 NULL 값은 무시한다.
SELECT SUM(COMMISSION_PCT) AS "커미션 총합"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 개수 세기 COUNT
-- NULL값을 제외한 해당 컬럼 값의 개수를 반환한다.
SELECT COUNT(MANAGER_ID) AS "사원수",-- CEO를 제외한 106개 행
COUNT(COMMISSION_PCT) AS "커미션 개수"
FROM EMPLOYEES;

-- 최대값, 최소값 MAX, MIN
SELECT MAX(SALARY) AS MAX_SAL, MIN(SALARY) AS MIN_SAL
, MAX(SALARY) - MIN(SALARY) AS "두 월급의 차이"
FROM EMPLOYEES;

-- 2. 그룹화
-- GROUP BY 컬럼명
-- WHERE와 ORDER BY 사이에 위치하는 GROUP BY는
-- 집계함수를 사용할 때 같이 올 수 있으며
-- 대상 컬럼의 값을 기준으로 그룹을 나누게 된다.
-- 나뉜 그룹에 대해서 집계함수를 사용하면
-- 각 그룹별 집계를 반환하게 된다.

-- 결론: SELECT 절에는 GROUP BY에 적은 컬럼과
-- 집계함수만 존재할 수 있다.
SELECT 
	DEPARTMENT_ID, 
	AVG(SALARY),
	MAX(COMMISSION_PCT),
	MIN(SALARY),
	SUM(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- 그룹화된 결과에 조건을 적용
-- HAVING 조건식
-- WHERE절은 GROUP BY와 SELECT를 하기 전에 조건을 주는 것이라면
-- HAVING은 그룹화된 결과에 대해서 조건을 주어 필터링을 하는 것이다.
SELECT DEPARTMENT_ID, AVG(SALARY) AS "AVG_SAL"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY) >= 10000 -- 별칭을 가져올 순 없다.
ORDER BY AVG_SAL;