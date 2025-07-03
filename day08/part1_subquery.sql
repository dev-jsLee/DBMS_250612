-- part1_subquery.sql
-- 서브쿼리와 조인의 조합
-- 조인은 두 개의 테이블을 하나의 열을 기준으로 결합하는
-- 반정규화 행동이었다.
-- 이를 통해 관련성 있는 두 개 테이블을 한눈에 파악할 수 있게 한다.
-- 그런데, 실제로 존재하는 테이블 아닌
-- 가상 테이블(서브쿼리, 뷰 테이블, CTE)과 조인하여
-- 그 결과를 출력해낼 수도 있다.
-- 이를 통해 더 다양하고 복잡한 결과를 만들어낼 수 있다.

SELECT *
FROM PLAYER;

-- WHERE절에서 서브쿼리 사용
-- 몸무게가 가장 큰 선수의 이름과 팀명을 조인하여 결과 도출
SELECT P2.PLAYER_NAME, T.TEAM_NAME, P2.WEIGHT
FROM TEAM T
JOIN PLAYER P2
ON T.TEAM_ID = P2.TEAM_ID
-- 몸무게가 가장 많이 나가는 선수의 정보를 추출
WHERE P2.WEIGHT = (SELECT MAX(WEIGHT) FROM PLAYER);

-- BACK_NO가 가장 큰 사람들의 몸무게와 키를 출력
--SELECT PLAYER_NAME, BACK_NO, WEIGHT, HEIGHT
-- BACK_NO가 가장 큰 사람들의 평균 몸무게와 인원 수
SELECT AVG(WEIGHT) AVG_WEIGHT, COUNT(PLAYER_NAME) "COUNT"
FROM PLAYER
WHERE BACK_NO = (
	SELECT MAX(BACK_NO)
	FROM PLAYER
);