-- part4_join.sql
-- 조인(JOIN)이란?
-- 두 개의 테이블에서 관련된 데이터를 중심으로
-- 하나의 테이블로 결합하는 방법을 가리킨다.
-- 이때, 주로 PK와 FK를 중심으로 결합을 많이 한다.

-- 이러한 JOIN은 크게 4가지의 종류가 있는데
-- 1. INNER JOIN
--	이너 조인은 두 개 테이블에서 해당 컬럼의 값이 존재하는 경우에만
--  해당 행을 결과 테이블에 표시한다.
--  INNER 혹은 OUTER를 명시적으로 작성하지 않은 경우,
--  자동으로 INNER JOIN이 선택된다.
SELECT P.PLAYER_NAME, P."POSITION",
	T.TEAM_ID, T.TEAM_NAME 
FROM PLAYER P -- 첫번째 테이블
INNER JOIN TEAM T -- 두번째 테이블
ON P.TEAM_ID = T.TEAM_ID -- 두 테이블의 어떤 컬럼끼리 같은 값일 경우 합칠 건지를 정하는 부분
;

-- 2. OUTER JOIN
-- 두 테이블에서 JOIN ON 뒤의 조건을 만족하지 않는 행도 추가하는
-- 포괄적이고 유연한 조인 방식이다.
-- 이때, 조인의 대상이 되는 두 테이블 중 어떤 테이블의 모든 데이터를
-- 포함할 것인지를 선택할 수 있다.
-- FROM 뒤에 적은 테이블이 LEFT 테이블에 해당하며
-- JOIN 뒤에 적은 테이블이 RIGHT 테이블이다.
-- 혹은 서로 겹치지 않는 모든 행을 보고자 한다면
-- FULL OUTER JOIN으로 모든 행을 확인할 수 있다.

-- 왼쪽 테이블의 모든 데이터를 표시하는 LEFT OUTER JOIN
SELECT E.FIRST_NAME, E.SALARY,
	D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- RIGHT OUTER JOIN은 테이블명을 작성하는 위치만 바꾸면
-- 같은 동작을 취하므로 실습은 생략

-- FULL OUTER JOIN
-- 풀 아우터 조인은 두 테이블에서 일치시킨 컬럼의 값이 없더라도
-- 양쪽 테이블의 모든 데이터를 행으로 포함시키는 합집합과 비슷한 느낌이다.
-- 주로 양쪽 테이블의 관계를 확인하면서도 빈 값을 식별하는 용도로 쓰인다.
-- 두 데이터테이블(데이터셋) 간의 불일치를 찾거나 완전한 뷰를 얻고자 할 때
-- 특히 유용하다.

SELECT T.TEAM_NAME, S.STADIUM_NAME
FROM TEAM T
FULL OUTER JOIN STADIUM S
ON T.TEAM_ID = S.HOMETEAM_ID;
--ON T.STADIUM_ID = S.STADIUM_ID;

-- CROSS JOIN
-- 자주 사용되는 조인 방식은 아니다.
-- 가능한 모든 조합을 생성하는 특별한 조인 방식이다.
-- 실제로 데이터 상에 존재하지 않는 조합도 만들어버리기 때문에
-- 가상의 데이터, 테스트용 데이터, 학습용 데이터셋 등을 만들 때
-- 사용한다.
-- 조건을 필요로 하는 방식이 아니기 때문에 ON과 조건식을 쓰지 않는다.

-- AI 학습을 위해서 실제로 존재하지 않지만 가능한 조합들에 대해서
-- 학습용 데이터셋을 만들기 위해 사용되곤 한다.
SELECT E1.FIRST_NAME, E2.LAST_NAME
FROM EMPLOYEES E1
CROSS JOIN EMPLOYEES E2;

-- 셀프 JOIN
-- 자기자신 테이블과 JOIN을 통해서 계층 구조를 표현할 때
-- 사용되는 조인 방식이다.
-- 특별히 특정 키워드를 사용하는 것은 아니지만,
-- 자기자신 테이블과 조합을 한다는 부분에서 하나의 방식으로 취급한다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME,
	E2.EMPLOYEE_ID, E2.FIRST_NAME
FROM EMPLOYEES E
JOIN EMPLOYEES E2
ON E.MANAGER_ID = E2.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID;
-- E 테이블의 매니저ID가 E2테이블의 직원ID와 같으면
-- 하나의 테이블로 병합해 보여줘.

SELECT *
FROM STADIUM;
SELECT *
FROM TEAM;

--INSERT INTO TEAM(TEAM_ID, REGION_NAME, TEAM_NAME, STADIUM_ID)
--VALUES('K99', '독도', '독도팀', 'F01');



SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;







