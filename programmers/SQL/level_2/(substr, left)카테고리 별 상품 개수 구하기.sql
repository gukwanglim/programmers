-- https://school.programmers.co.kr/learn/courses/30/lessons/131529

-- PRODUCT 테이블에서 상품 카테고리 코드(PRODUCT_CODE 앞 2자리) 별 상품 개수를 출력하는 SQL문을 작성해주세요. 결과는 상품 카테고리 코드를 기준으로 오름차순 정렬해주세요.

SELECT      substr(PRODUCT_CODE, 1, 2) as CATEGORY,
            count(substr(PRODUCT_CODE, 1, 2)) as PRODUCTS
from        PRODUCT 
group by    CATEGORY
order by    CATEGORY

-- 테이블에 작성된 데이터의 일전 부분만을 가져오기 위해서는 substr(컬럼명, 가져오길 원하는 부분의 시작, 가져오길 원하는 부분의 마지막)을 사용한다.
-- 이때, 가져오길 원하는 범위는 int로 작성하지만 python에서 사용하는 index와 달리 1부터 시작한다.


SELECT      left(PRODUCT_CODE,2) as CATEGORY, COUNT(*) as PRODUCTS
FROM        PRODUCT
GROUP BY    CATEGORY
ORDER BY    CATEGORY

-- 추가로 left를 사용하여 왼쪽에서부터 범위를 지정하여 가져올 수 있다.