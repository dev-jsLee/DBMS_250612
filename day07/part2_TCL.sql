-- part2_TCL.sql
-- 트랜젝션
-- 트랜젝션이란, 데이터베이스에서 어떤 동작을 수행했을 때
-- 이를 마지막으로 저장한 시점부터 현재 저장하지 않은 시점까지
-- 실행했던 문장들의 집합을 가리킨다.(문장의 단위는 ;으로 나눈다.)
-- 현재 데이터베이스 상태를 저장하거나, 이전 저장시점으로 되돌리는
-- 두 가지의 명령어만 존재한다.

-- 디비버에서는 기본적으로 트랜젝션이 Auto로 되어 있다.
-- 즉, 모든 실행은 즉시 데이터베이스에 영구적으로 저장되는 상태인 것이다.
-- 때문에, 실무적으로 봤을 때 굉장히 위험한 상태인 것이다.
-- 디비버 상단에 보이는 T라는 단어가 Transaction을 가리킨다.
-- 이를 클릭하면 손(manual)그림 위에 T가 올라간 형태로 바뀐다.
-- 즉, 수동으로 트랜젝션을 수행하겠다는 의미가 된다.

SELECT *
FROM PLAYER;

DROP TABLE TBL_MEMBER;
CREATE TABLE TBL_MEMBER (
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(50)
);

INSERT INTO TBL_MEMBER(ID, NAME)
VALUES(1, '홍길동');

SELECT *
FROM TBL_MEMBER;

-- 데이터 롤백
-- 마지막으로 커밋했던 시점, 즉 오토커밋을 풀었던 시점으로
-- 돌아가려면 ROLLBACK;을 사용하면 된다.
ROLLBACK;

-- 데이터 저장 확정
-- 현재 트랜젝션의 행동을 데이터베이스에 영구적으로 적용하려면
-- COMMIT;을 사용하면 된다.
COMMIT;