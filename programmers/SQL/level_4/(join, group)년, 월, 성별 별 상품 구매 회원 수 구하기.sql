-- https://school.programmers.co.kr/learn/courses/30/lessons/131532

-- USER_INFO 테이블과 ONLINE_SALE 테이블에서 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성해주세요.
-- 결과는 년, 월, 성별을 기준으로 오름차순 정렬해주세요. 이때, 성별 정보가 없는 경우 결과에서 제외해주세요.

SELECT      year(SALE.SALES_DATE) as YEAR,
            month(SALE.SALES_DATE) as MONTH,
            INFO.GENDER,
            count(DISTINCT SALE.USER_ID) as USERS
from        ONLINE_SALE as SALE
join        USER_INFO as INFO
on          SALE.USER_ID = INFO.USER_ID
group by    INFO.GENDER,
            MONTH
having      INFO.GENDER is not null
order by    YEAR,
            MONTH,
            INFO.GENDER

-- 두 개의 테이블을 사용해야하며 group by를 사용해야 한다면 from에서 두 테이블을 동시에 가져와 사용하는 것이 아닌 join을 사용하는 것이 맞다.
-- 개인적으로 코드를 간단하게 하겠다며 두 개의 테이블을 from으로 가져오는 것보다 join을 활용하는 것이 더 깔끔하게 사용하는 방법이라고 생각한다.