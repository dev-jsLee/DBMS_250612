-- part1_CONCAT.sql
-- 연산자
-- 연산자란 여러 데이터를 비교하거나 계산하여
-- 새로운 값을 도출해내는 특수한 기호를 가리킨다.
-- 1. 연결 연산자 ||
-- 연결 연산자는 두 개의 문자열을 앞뒤로 두어서
-- 하나의 연결된 문자열을 반환하는 연산자다.
-- 주로 SELECT문에서 가져오는 열의 문자열 값을
-- 꾸미거나 합칠 때 사용된다.
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME"
FROM EMPLOYEES;
-- SELECT에서 데이터를 Results에 표시할 때
-- 열 이름을 임의로 정할 수 있다.
-- 이를 알리아스(alias)라고 하며, 그러한 연산을 해주는 연산자를
-- AS 연산자라고 한다.
-- 기존열이름 AS "별칭"
-- 별칭을 부여하고 나면 해당 열은
-- 부여된 별칭으로 가리킬 수 있게 된다.
-- 특징1. 일반적으로 AS를 생략할 수 있다.
-- 특징2. 큰따옴표도 생략할 수 있지만
-- 별칭 안에 공백문자가 있다면 생략하면 안 된다.
-- 특징3. 혹은 예약어를 별칭으로 사용하는 경우에도
-- 반드시 큰따옴표로 별칭을 감싸주어야 한다.
SELECT FIRST_NAME "FULLS NAME"
FROM EMPLOYEES;
-- 예약어란
-- 디비버에서 작성했을 때 빨간색으로 변하는,
-- 특정 기능, 역할을 가진 단어를 말한다.
-- 예: SELECT, FROM, WHERE, POSITION, FULL,...

-- 산술 연산자 +, -, *, /
-- NUMBER 타입의 데이터에 대해서 수학적인 연산을 할 때
-- 사용되는 연산자를 가리킨다.
-- 사칙연산의 덧셈, 뺄셈, 곱셈, 나눗셈이 존재한다.
SELECT SALARY	"월급",
	SALARY * 12	"연봉",
	SALARY / 21	"일당"
--	기존값에서 나눗셈을 했을 때
--	소숫점까지 표현이 된다면 최대 소숫점 11번째에서 반올림한 값이
--	출력된다.
FROM EMPLOYEES;

-- 관계/비교 연산자(Comparison Operators)
-- 두 값의 크기나 동일 여부를 비교하여 그 결과
-- 참 혹은 거짓을 반환하는 연산자들을 가리킨다.
-- 같다 =
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';

-- 다르다 <> !=
SELECT *
FROM EMPLOYEES
--WHERE EMPLOYEE_ID <> 100
WHERE EMPLOYEE_ID != 100;

-- 크기 비교
-- 초과, 미만 >, <
-- 해당 값을 포함하지 않는 범위와 비교할 때 사용한다.
SELECT SALARY
FROM EMPLOYEES
WHERE SALARY > 4800;
-- 이상, 이하 >=, <=
-- 해당하는 값을 포함하는 범위와 비교할 때 사용한다.
SELECT SALARY
FROM EMPLOYEES
WHERE SALARY >= 4800
ORDER BY SALARY ASC; -- 4800부터 범위에 포함된 것을
-- 확인할 수 있다.

-- 논리 연산자
-- 참과 거짓에 대해서 합집합, 교집합을 나타낼 때 사용하는 연산자다.
-- 여러 조건을 조합해서 조건을 검사할 때 주로 사용된다.
-- 그리고 AND
-- 두 조건이 모두 참일 때 비로소 참이 되는 연산자다.
-- 하나라도 거짓이라면 결과는 거짓이 된다.
-- 이를 논리곱이라고도 부르며, 집합으로는 교집합에 해당한다.
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
AND SALARY >= 5000;

-- 또는 OR
-- 두 조건식의 결과값 중 하나라도 참이면 결과가 참이 나오고
-- 둘 다 거짓이어야 비로소 거짓이 되는 연산자다.
SELECT EMPLOYEE_ID, MANAGER_ID 
FROM EMPLOYEES
WHERE 
	EMPLOYEE_ID = 100 OR 
	MANAGER_ID = 100;

-- 부정 NOT
-- 논리값을 반전시키는 단항 연산자
-- 여집합에 해당하는 연산자
SELECT EMPLOYEE_ID, MANAGER_ID
FROM EMPLOYEES
WHERE NOT (EMPLOYEE_ID = 100 OR MANAGER_ID = 100);

-- 특수 연산자
-- 기호가 아닌, 단어로 이루어진 연산자들이 있다.
-- BETWEEN
-- 두 값 사이의 범위를 지정
-- 문자열의 경우 첫글자의 범위를 지정할 수 있다.
-- 뒤에 오는 문자를 포함하지 않는 범위를 가진다.
-- 이때 대소문자를 구분한다.
SELECT FIRST_NAME 
FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'A' AND 'D'
ORDER BY FIRST_NAME;

-- 숫자 BETWEEN
-- 두 값을 포함하는(이상, 이하) 범위를 나타낼 때 사용한다.
SELECT SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 4800 AND 9000
-- 4800 이상, 9000 이하의 SALARY를 가진 행 필터링
ORDER BY SALARY DESC;

-- IN
-- 특정 값 집합에 포함되는지 여부를 반환하는 연산자
-- 컬럼명 IN (A, B, C,..) -- 일반사용
-- 컬럼명 IN (SELECT ~~~) -- 서브쿼리
-- 해당 컬럼의 값이 여러 값 중 하나에 포함되는지 여부를
-- 반환하기 위한 OR 연산의 집합 형태라고 볼 수 있다.
-- 집합의 값들은 모두 같은 자료형이어야 한다.
SELECT DEPARTMENT_ID
FROM EMPLOYEES
--WHERE DEPARTMENT_ID IN (60, 90);
WHERE DEPARTMENT_ID = 60 OR DEPARTMENT_ID = 90;

-- LIKE : 문자열 패턴
-- 특정 문자열 패턴과 일치하는지 여부를 반환하는 연산자
-- 단순히 같거나 다른지 여부뿐만 아니라, 특정 알파벳으로 시작하거나
-- 끝나는 등의 패턴 여부를 검사할 수 있다.
-- WHERE 컬럼명 LIKE '%패턴%'
-- LIKE와 같이 쓰이는 문자열 패턴의 % 문자는
-- 어떤 문자든 등장할 수 있음을 나타내는 특수기호다.
-- 이를 와일드카드(wild card)라고도 부른다.
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
--WHERE FIRST_NAME LIKE 'S%a';
-- S로 시작하고 a로 끝나는 이름을 가진 행 추출
WHERE FIRST_NAME LIKE '%a';
-- 소문자a로 끝나는 이름을 가진 행 추출

-- IS NULL
-- NULL 값은 값이 없음을 명시적으로 표현하는 특수한 값이다.
-- 이러한 NULL값은 동등연산자= 혹은 부등 연산자!=로 
-- 그 값인지 여부를 판별할 수 없다.
SELECT EMPLOYEE_ID, MANAGER_ID 
FROM EMPLOYEES
--WHERE MANAGER_ID = NULL; -- = NULL을 하면 안 나온다.
--WHERE MANAGER_ID IS NULL; -- 100번 사원이 나온다.
WHERE MANAGER_ID IS NOT NULL; -- 여집합