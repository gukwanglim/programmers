-- https://school.programmers.co.kr/learn/courses/30/lessons/131115

-- FOOD_PRODUCT 테이블에서 가격이 제일 비싼 식품의 식품 ID, 식품 이름, 식품 코드, 식품분류, 식품 가격을 조회하는 SQL문을 작성해주세요.

SELECT      PRODUCT_ID,
            PRODUCT_NAME,
            PRODUCT_CD,
            CATEGORY,
            PRICE
from        FOOD_PRODUCT 
order by    PRICE desc 
limit       1

-- 이전 코드에서 사용하던 limit를 활용하여 정답을 도출 할 수 있다.

select      *
from        food_product
where       price = (SELECT max(price) as price from food_product);

-- 또한, max() 함수를 사용하여 정답을 도출하는 방법도 존재한다.