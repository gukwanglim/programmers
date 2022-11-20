-- https://school.programmers.co.kr/learn/courses/30/lessons/131117

-- FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.

SELECT      T1.PRODUCT_ID,
            T1.PRODUCT_NAME,
            (T1.PRICE * T2.sumAMOUNT) as 'TOTAL_SALES'
from        FOOD_PRODUCT T1
join        (SELECT      PRODUCT_ID,
                        sum(AMOUNT) as sumAMOUNT
            from        FOOD_ORDER 
            where       year(PRODUCE_DATE) = '2022' and month(PRODUCE_DATE) = '05'
            group by    PRODUCT_ID
            ) as T2
on          T1.PRODUCT_ID = T2.PRODUCT_ID
order by    TOTAL_SALES desc,
            T1.PRODUCT_ID

-- having과 where을 동시에 사용할 때는 where을 먼저 사용한다.

-- join을 사용해야할 때, 만약, join 안에 select를 사용해야한다면 join 안의 select 문을 따로 작성하여 확인한 후, 나머지 코드를 작성하는 것이 편하다. 