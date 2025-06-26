-- part2_sequence.sql
-- 시퀀스(SEQUENCE)
-- 고유한 숫자값을 생성하는 생성기 객체로
-- 등차수열처럼 등차값이나 시작값, 최댓값, 최솟값 등을 설정할 수 있다.
-- 그외에도 캐시되는 숫자의 개수나 최대, 최소에 도달했을 때
-- 시작값으로 돌아갈지 여부(CYCLE) 등도 설정할 수 있는 객체다.
-- 하나의 객체이기 때문에 여러 테이블에서 공유할 수 있으며
-- 동시에 여러 테이블에서 접근하더라도 순서를 지정하여
-- 값을 부여하는 방식을 통해 동시성 문제를 해결할 수 있다.
CREATE SEQUENCE SEQ_STUDENT_ID
--START WITH 1 -- 시작값 설정
--INCREMENT BY 1 -- 등차값 설정
--MAXVALUE 100 -- 최댓값 설정.
--NOMAXVALUE -- 최댓값 없음
--MINVALUE 1 -- 최솟값 설정
--CYCLE -- 최대, 최소에 도달했을 때 시작값으로 돌아갈지 여부
--CACHE 5 -- 미리 준비하는 숫자의 개수. 기본값 20
--NOCACHE
;
DROP SEQUENCE SEQ_STUDENT_ID;
-- 시퀀스의 기본값
-- 시작값과 최솟값은 1로 동일
-- 증가값은 1이 기본값
-- 최댓값을 NOMAXVALUE가 기본값
-- NOCYCLE이 기본값
-- CACHE는 20이 기본값

DROP TABLE TBL_STUDENT;

CREATE TABLE TBL_STUDENT(
	-- 12c 버전부터는 테이블생성시 default 값으로
	-- 시퀀스의 값을 사용할 수 있다.(11g에서는 불가)
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(20)
);
-- 시퀀스를 처음으로 사용하기 전에 값을 확인하는 절차가 필요하다.
-- 현재값 확인은 시퀀스명.CURRVAL
-- 다음값 가져오기는 시퀀스명.NEXTVAL
SELECT 
--	SEQ_STUDENT_ID.NEXTVAL, -- 맨 처음에는 NEXTVAL을 통해
-- 값을 한번 만들어준 뒤부터 CURRVAL의 사용이 가능하다.
	SEQ_STUDENT_ID.CURRVAL
FROM DUAL;


-- 데이터 삽입 시 ID 값을 시퀀스 활용하여 삽입
INSERT INTO TBL_STUDENT(ID, NAME)
VALUES(SEQ_STUDENT_ID.NEXTVAL, '홍길동');

SELECT *
FROM TBL_STUDENT;











