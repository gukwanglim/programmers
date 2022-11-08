-- https://school.programmers.co.kr/learn/courses/30/lessons/132202

-- APPOINTMENT 테이블에서 2022년 5월에 예약한 환자 수를 진료과코드 별로 조회하는 SQL문을 작성해주세요. 
-- 이때, 컬럼명은 '진료과 코드', '5월예약건수'로 지정해주시고 결과는 진료과별 예약한 환자 수를 기준으로 오름차순 정렬하고, 예약한 환자 수가 같다면 진료과 코드를 기준으로 오름차순 정렬해주세요.

SELECT      MCDP_CD as '진료과코드',
            count(APNT_YMD) as '5월예약건수'
from        APPOINTMENT 
where       date_format(APNT_YMD, '%Y-%m') = '2022-05'
group by    MCDP_CD
order by    5월예약건수 asc, 진료과코드 asc

-- 이 문제는 예약 취소 현황이 N인 데이터만 존재하는 듯 하다.
-- 그것보다 selcet에서  '진료과코드', '5월예약건수' 와 같이 선언했다면, order by에서는 ''을 제외하고 작성해야 한다.(만약, ''가 작성된 상태로 코드가 돌아가게 된다면 에러가 발생한다.)