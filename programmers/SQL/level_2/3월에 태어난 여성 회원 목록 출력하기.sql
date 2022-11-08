-- https://school.programmers.co.kr/learn/courses/30/lessons/131120

-- MEMBER_PROFILE 테이블에서 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요. 
-- 이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고, 결과는 회원ID를 기준으로 오름차순 정렬해주세요.

SELECT      MEMBER_ID,
            MEMBER_NAME,
            GENDER,
            DATE_FORMAT(DATE_OF_BIRTH,'%Y-%m-%d')  as DATE_OF_BIRTH
from        MEMBER_PROFILE 
where       GENDER='W' and month(DATE_OF_BIRTH)='03' and TLNO != 'NULL'
order by    MEMBER_ID

-- where 구문에서 "TLNO != 'NULL'"이 아닌 "TLNO is not null"을 사용할 수 있다.