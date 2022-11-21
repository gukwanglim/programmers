-- https://school.programmers.co.kr/learn/courses/30/lessons/131118

-- REST_INFO와 REST_REVIEW 테이블에서 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문을 작성해주세요.
-- 이때 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고 결과는 평균점수를 기준으로 내림차순 정렬해주시고, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬해주세요.

SELECT      INFO.REST_ID,
            INFO.REST_NAME,
            INFO.FOOD_TYPE,
            INFO.FAVORITES,
            INFO.ADDRESS,
            REVIEW.avgREVIEW_SCORE as SCORE
from        REST_INFO as INFO
join        (SELECT     REST_ID,
                        round(avg(REVIEW_SCORE), 2) as avgREVIEW_SCORE
            from        REST_REVIEW 
            group by    REST_ID
            ) as REVIEW
on          INFO.REST_ID = REVIEW.REST_ID
where       INFO.ADDRESS like '서울%'
order by    SCORE desc,
            INFO.FAVORITES desc

-- 시간이 오래 걸린 이유가 where 구문에서 조건을 '%서울%'으로 사용했기 때문에 오래 걸렸다.
-- 만약, 서울로 시작하는 지역이 아닌 중간에 서울이 포함된 주소가 존재한다면 오류가 발생하기 때문이다.

SELECT      INFO.REST_ID,
            INFO.REST_NAME,
            INFO.FOOD_TYPE,
            INFO.FAVORITES,
            INFO.ADDRESS,
            round(avg(REVIEW.REVIEW_SCORE), 2) as SCORE
from        REST_INFO as INFO,
            REST_REVIEW as REVIEW
where       INFO.ADDRESS like '서울%' and INFO.REST_ID = REVIEW.REST_ID
group by    INFO.REST_NAME
order by    SCORE desc,
            INFO.FAVORITES desc

-- join을 사용하지 않은 상태에서도 위 문제를 풀 수 있다.
-- from으로 한 번에 두 테이블의 값을 가져온 상태에서, select 부분에 round(avg(), )를 사용한다.
-- select에서 round(avg(), )를 사용해도 오류가 발생하지 않는 이유는 아래에 group by가 존재하기 때문이다.(만약, group by가 존재하지 않는다면 오류가 발생한다.)