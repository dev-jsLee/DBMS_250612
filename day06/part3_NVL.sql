-- part3_NVL.sql
-- 값이 없는 상태인 NULL은 어떤 비교연산자와 만나도
-- 그 결과는 항상 NULL이다.
-- 값이 NULL인 상태에서는 활용범위가 제한되기 때문에
-- 이를 다른 값을 대체하여 처리를 해야 한다.
-- 이것을 NULL값 처리라고 부른다.

-- NVL() 함수
-- 전달된 컬럼의 값을 확인하여(평가) 그 값이 NULL이라면
-- 두번째로 전달한 인수의 값으로 대체하여 내용을 채워넣는다.
-- 이 함수를 사용한 결과 컬럼은 NULL값이 존재하지 않게 된다.
SELECT EMPLOYEE_ID, FIRST_NAME,
	-- 해당 컬럼의 값이 NULL인 경우, 0으로 대체
	NVL(COMMISSION_PCT, 0) AS COMMISSION
FROM EMPLOYEES;
-- 해당 컬럼의 값이 NULL이면 두번째로 전달한 인수의 값으로 대체
-- NULL이 아니라면 기존 값 그대로 출력

-- 2. NVL2()함수
-- NVL 함수는 기존값이 NULL이 아닌 경우, 그대로 사용되었다면
-- NVL2 함수는 기존값이 NULL이 아닌 경우라도 다른 값으로 대체하는
-- 동작을 하는 함수다.
-- 목적: NULL여부에 따라 서로 다른 값 반환
-- NVL2(A, B, C)
-- A: 평가대상컬럼명
-- B: A가 NULL이 아니면 반환할 값
-- C: A가 NULL이면 반환할 값
SELECT 
	EMPLOYEE_ID,
	FIRST_NAME,
	NVL2(COMMISSION_PCT, 'IS NOT NULL', 'IS NULL') AS HAS_COMMISSION
FROM EMPLOYEES;