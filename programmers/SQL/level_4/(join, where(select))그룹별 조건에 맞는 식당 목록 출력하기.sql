-- https://school.programmers.co.kr/learn/courses/30/lessons/131124

-- MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요.
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.

SELECT      MEMBER.MEMBER_NAME,
            REVIEW.REVIEW_TEXT,
            date_format(REVIEW.REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
from        MEMBER_PROFILE as MEMBER
join        REST_REVIEW as REVIEW
on          MEMBER.MEMBER_ID = REVIEW.MEMBER_ID
where       MEMBER.MEMBER_NAME = (select        T1.MEMBER_NAME
                                 from           MEMBER_PROFILE as T1
                                 join           REST_REVIEW as T2
                                 on             T1.MEMBER_ID = T2.MEMBER_ID
                                 group by       T2.MEMBER_ID
                                 order by       count(T2.MEMBER_ID) desc
                                 limit          1)
order by    REVIEW_DATE,
            REVIEW.REVIEW_TEXT

-- REST_REVIEW 테이블에서 가장 많은 리뷰를 남긴 회원의 아이디를 가져와 그에 해당하는 회원이 작성한 리뷰만을 출력해야한다.

-- 단순하게 max(count(REVIEW.MEMBER_ID)) = count(REVIEW.MEMBER_ID)와 같은 구문을 사용하게 된다면 오류가 발생한다.
-- 때문에 where 구문을 조금 더 자세하게 작성할 필요가 있다.

-- 자세한 정보를 뽑아내기 위해서는 where 구문 안에 select 구문을 넣어 데이터를 가져오게 만든다.
-- where 안에서 select로 가져오는 데이터는 리뷰를 작성한 MEMBER_ID의 개수를 세고, desc로 정렬하여 가장 위에 존재하는 회원의 id를 출력하는 것이다.