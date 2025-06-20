-- part2_casting.sql
-- 자료형의 형변환
-- 데이터를 다루다보면 문자형에서 숫자형으로, 혹은 그 반대로 바꿔야 하는
-- 일이 왕왕 있다.
-- 이럴 때 다른 자료형으로 바꾸는 것을 형변환이라고 하며
-- 일관성있는 데이터로의 변환을 보장하는 함수를 사용한다.
-- DBMS마다 데이터 타입이 통일되어 있지 않은 부분이 있기 때문에
-- 이 부분의 호환성을 보장하기 위해 사용되기도 한다.

-- 1. TO_CHAR()
-- 숫자나 날짜, 시간 타입을 문자열로 변환할 때 사용하는 함수로
-- 소괄호() 안에 [변환하려는 값]과 [변환하려는 문자열 형식]을 순서대로
-- 반점,을 구분자로 하여 전달하면 된다.
-- TO_CHAR(12345, '99,999') -> 숫자값을 3자리마다 콤마 넣기
-- TO_CHAR(SYSDATE, 'YYMMDD')
-- -> 현재 날짜를 연월일의 문자열 형식으로 변환
-- 소숫점의 개수를 제한
-- TO_CHAR(3.141592, '999.99')
-- -> 소숫점 아래 두자리까지만 표현한 문자열 값을 반환
SELECT TO_CHAR(123456789, '$999,999,999') AS "형식화된 숫자"
FROM DUAL; -- SELECT절에서 단순 연산을 할 때 더미테이블 사용

-- 소수점 아래 자리수 제한
-- 형식 문자열에서 소수점 아래 9의 개수만큼만 표현하되
-- 그 개수 다음번 숫자에서 반올림을 한 값으로 결과가 표현된다.
SELECT TO_CHAR(3.123456789, '9.99999') "소숫점제한" -- 소숫점 6번째 자리에서
-- 반올림한 값인 3.12346이 출력된다.(근삿값)
FROM DUAL;

-- 날짜값을 문자열로 변환
SELECT TO_CHAR(
	SYSDATE,
	'YYYY' || -- 4자리 연도 표현
	'-MM' || -- 2자리 월 표현
	'-MON' || -- 최대 3글자 월 표현(한국어로는 숫자월로 표현)
	'-DD' -- 2자리 일자 표현
) "문자형 날짜",
TO_CHAR(
	SYSDATE,
	'HH24' || -- 24시간제 시 표현
	'(HH)' ||
	'-MI' || -- 분 표현
	'-SS'  -- 초 표현
) "시분초 표현", TO_CHAR(SYSDATE, 'YYYY-MM-DD HH-MI-SS') "전체시간"
FROM DUAL;

-- TO_NUMBER 함수
-- 문자열을 숫자로 변환해주는 함수
-- 이때 문자열에서 형식을 나타내기 위해 쓰인 특수기호('.', ',', '$')을
-- 직접 표시하여 형변환할 때 숫자값만 추출하도록 유도할 수 있다.
SELECT TO_NUMBER('123,456.789', '999,999.999') "숫자로의 변환"
FROM DUAL;

-- 문자열로 작성된 숫자값을 NUMBER 형태로 변환한 뒤
-- 3을 곱한 값을 출력하는 내용
SELECT (
	SELECT TO_NUMBER('123,456.789', '999,999.999'
	) NUM
	FROM DUAL
) * 3 AS "RESULT"
FROM DUAL;

-- TO_DATE 함수
-- 날짜 형식으로 변환할 수 있는 문자열을 날짜 형식으로 변환할 수 있다.
-- 다양한 날짜 형식의 문자열 날짜를 표준화된 날짜 형식으로 변환하는 데
-- 매우 유용하다.
SELECT TO_DATE(
	'2025-20-06', -- 연 일 월 순서로 작성된 문자열
	'YYYY-DD-MM'  -- 앞의 날짜 문자열의 값을 해석하는 데 가이드라인을 주는
--	형식 문자열
) "날짜로의변경"
FROM DUAL;

-- 상세날짜로의 형변환
SELECT TO_DATE(
	'01-11월-2025 15:30:00',
	'DD-MON-YYYY HH24:MI:SS'
) "상세시간"
FROM DUAL;

-- 세션 언어 설정 방법
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'JAPANESE';
SELECT TO_CHAR(SYSDATE, 'MON') FROM DUAL;

-- 날짜 시간 관련 함수와 특정 예약어
-- SYSDATE: 서버의 날짜값을 시,분,초까지 정확하게 가져오는 예약어의 일종
SELECT SYSDATE
FROM DUAL;

-- ADD_MONTHS(기존날짜값, 더하려는개월수)
-- 날짜타입의 값에 개월 수를 더하여 그 결과 날짜값을 반환하는 함수
-- 양수를 넣으면 미래의 날짜값을, 음수를 넣으면 과거의 날짜값을 반환한다.
SELECT ADD_MONTHS(HIRE_DATE, 120) "입사 10년뒤", HIRE_DATE,
	ADD_MONTHS(HIRE_DATE, -3) "입사 3개월전"
FROM EMPLOYEES;

-- 두 날짜 사이의 개월수를 실수로 반환하는 함수
-- MONTHS_BETWEEN(날짜값1, 날짜값2)
SELECT HIRE_DATE,
	MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12 "근속년수"
FROM EMPLOYEES;

-- BETWEEN AND 연산을 날짜에 적용해보자.
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE 
FROM EMPLOYEES
WHERE HIRE_DATE
	BETWEEN TO_DATE('2001-01-01', 'YYYY-MM-DD')
	AND TO_DATE('2003-01-01', 'YYYY-MM-DD')
ORDER BY HIRE_DATE;