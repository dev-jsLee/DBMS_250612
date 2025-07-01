-- part3_view.sql
-- 뷰 테이블
-- VIEW 테이블 객체는 기존 데이터 베이스의 테이블을 건드리지 않고
-- 단순히 내용을 조회하기 위한 임시, 가상 테이블의 일종이다.
-- SELECT문이나 서브쿼리로 호출한 결과 테이블도 가상 테이블의 일종이지만
-- 하나의 문장(;)에서 해당 테이블을 다시 호출하려면 같은 내용을 반복적으로
-- 작성해야 했다.
-- 이를 해결하기 위해 반복적으로 사용되는 SELECT문에 대해서 이름을 부여하여
-- 그 부여된 이름만으로 해당 쿼리 결과 테이블을 불러올 수 있게 된다.

-- 뷰 테이블 생성하기
-- CREATE VIEW 뷰테이블이름 AS SELECT ~~~
-- SELECT문 윗줄에 CREATE VIEW 뷰테이블이름만 입력하면
-- 해당 SELECT문의 결과 테이블을 해당 뷰테이블 이름으로 호출하여
-- 마치 실제 존재하는 테이블처럼 조회를 할 수 있게 된다.
CREATE VIEW VIEW_PLAYER_NAME AS -- 이 줄만 추가하면 뷰테이블 생성 완료
SELECT PLAYER_NAME, NICKNAME, E_PLAYER_NAME
FROM PLAYER
WHERE E_PLAYER_NAME IS NOT NULL;

-- 만들어진 뷰 테이블은 기존 결과 테이블의 순서까지 그대로 가져와서
-- 실제 있는 테이블처럼 순서를 바꾸고, WHERE절을 쓰는 등이 가능하다.
SELECT *
FROM VIEW_PLAYER_NAME
WHERE NICKNAME IS NOT NULL;