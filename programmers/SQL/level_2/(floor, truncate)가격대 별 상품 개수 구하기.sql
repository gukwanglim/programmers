-- https://school.programmers.co.kr/learn/courses/30/lessons/131530

-- PRODUCT 테이블에서 만원 단위의 가격대 별로 상품 개수를 출력하는 SQL 문을 작성해주세요. 
-- 이때 컬럼명은 각각 컬럼명은 PRICE_GROUP, PRODUCTS로 지정해주시고 가격대 정보는 각 구간의 최소금액(10,000원 이상 ~ 20,000 미만인 구간인 경우 10,000)으로 표시해주세요. 
-- 결과는 가격대를 기준으로 오름차순 정렬해주세요.

SELECT      floor(PRICE/10000)*10000 as PRICE_GROUP,
            count(PRODUCT_ID) as PRODUCTS
from        PRODUCT 
group by    PRICE_GROUP
order by    PRICE_GROUP

-- floor(숫자)는 버림을 뜻하는 것으로 가장 가까운 정수로 표현하하는 것이다.


SELECT      TRUNCATE(PRICE, -4) AS PRICE_GROUP, COUNT(PRODUCT_ID) AS PRODUCTS
FROM        PRODUCT
GROUP BY    TRUNCATE(PRICE, -4)
ORDER BY    PRICE_GROUP ASC;

-- 추가로 truncate(숫자, 버릴 자리)의 경우는 내가 버리고 싶은 자리수를 직접 작성하여 사용하는 것이다.
-- 만약, truncate(1234, -4)일 경우에는 1000으로 출력된다.

-- truncate(3456.1234567 ,1)의 경우에는 3456.1이 출력된다.

-- 추가로 round(숫자)를 사용하게 된다면 소수점 아래를 모두 버리고 정수로 표현된다.
-- 물론 round(3456.1234567 ,1)와 같이 사용하게 되면 3456.1과 같이 정해진 자리 이하의 수를 모두 버리게 된다.