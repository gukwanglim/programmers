-- https://school.programmers.co.kr/learn/courses/30/lessons/131116

-- FOOD_PRODUCT 테이블에서 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성해주세요. 
-- 이때 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜 주시고 결과는 식품 가격을 기준으로 내림차순 정렬해주세요.

SELECT      T1.CATEGORY,
            T1.PRICE,
            T1.PRODUCT_NAME
from        FOOD_PRODUCT T1
join        (select     CATEGORY,
                        max(PRICE) as max_PRICE
            from        FOOD_PRODUCT 
            group by    CATEGORY
            ) T2
on          T1.CATEGORY = T2.CATEGORY and T1.PRICE = T2.max_PRICE
where       T1.CATEGORY in ('과자', '국', '김치', '식용유')
order by    T1.PRICE desc

-- 이전 즐겨찾기가 가장 많은 식당 문제와 똑같지만, 조건이 하나 더 추가된 것이다.

SELECT CATEGORY, PRICE MAX_PRICE, PRODUCT_NAME
FROM (
    SELECT *, RANK() OVER(PARTITION BY CATEGORY ORDER BY PRICE DESC) PR
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
) PRODUCT
WHERE PRODUCT.PR = 1
ORDER BY PRICE DESC

-- rank를 사용해서도 문제를 풀 수 있다.