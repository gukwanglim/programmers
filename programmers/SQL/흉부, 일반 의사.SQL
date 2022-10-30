-- https://school.programmers.co.kr/learn/courses/30/lessons/132203

-- DOCTOR 테이블에서 진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.

-- 날짜 포맷은 예시와 동일하게 나와야합니다.(2020-03-01 00:00:00 가 아닌 2020-03-01으로 출력되게 한다.)

SELECT      DR_NAME,
            DR_ID,
            MCDP_CD,
            DATE_FORMAT(HIRE_YMD, '%Y-%m-%d')
from        DOCTOR 
where       MCDP_CD = 'CS' or MCDP_CD = 'GS'
order by    HIRE_YMD desc, 
            DR_NAME asc

-- 출력의 방식을 바꾸기 위해서는 위 코드와 같이 select 문에서 설정을 해줘야 한다.
-- 하지만 코드를 정확히 적어도 오류가 발생할 수 있다..