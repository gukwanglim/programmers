-- https://school.programmers.co.kr/learn/courses/30/lessons/131114     

-- FOOD_WAREHOUSE 테이블에서 경기도에 위치한 창고의 ID, 이름, 주소, 냉동시설 여부를 조회하는 SQL문을 작성해주세요.
-- 이때 냉동시설 여부가 NULL인 경우, 'N'으로 출력시켜 주시고 결과는 창고 ID를 기준으로 오름차순 정렬해주세요.

-- 경기도에 위치하고 냉동시설 여부가 N인 것을 골라야 한다.
SELECT      WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, FREEZER_YN
from        FOOD_WAREHOUSE 
where       ADDRESS like '%경기도%', FREEZER_YN like 'N'
order by    WAREHOUSE_ID asc
-- 이런 경우에는 where 구문에서 두 가지 조건의 ,를 사용하여 작성하게 되면 오류가 발생한다.
-- (인기있는 아이스크림 문제에서 order by의 조건 두 가지를 사용할 때는 ,를 사용했지만 where의 경우에는 불가능하다)


-- 문제를 해결하기 위해서는 where 구문의 경우는 '경기도%'를 포함한 조건만 작성한다.
-- FREEZER_YN이 'N'일 경우의 조건은 select를 할 때, 조건문을 사용하는 것으로 해결한다.


-- IFNULL 함수 사용
SELECT
    WAREHOUSE_ID,
    WAREHOUSE_NAME,
    ADDRESS,
    IFNULL(FREEZER_YN, "N") AS FREEZER_YN        -- IFNULL을 사용할 경우, 가져와야 하는 컬럼명과 조건을 작성한다.
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE "경기도%"
ORDER BY WAREHOUSE_ID ASC;

-- IF 함수 사용
SELECT
    WAREHOUSE_ID,
    WAREHOUSE_NAME,
    ADDRESS,
    IF(FREEZER_YN IS NULL, "N", FREEZER_YN) AS FREEZER_YN  -- IF만 사용하는 경우, 가져와야 하는 컬럼명과 IS NULL을 사용하고, 조건을 작성한다. 그 후, 다시 컬럼명을 작성한다.
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE "경기도%"
ORDER BY WAREHOUSE_ID ASC;

-- CASE 사용
SELECT
    WAREHOUSE_ID,
    WAREHOUSE_NAME,
    ADDRESS,
    CASE                                     
        WHEN FREEZER_YN IS NULL THEN "N"         -- case 사용의 경우, 컬럼이 null 일 경우에 then을 사용하여 변경할 내용을 작성하고,
        ELSE FREEZER_YN                          -- else를 사용하여 null이 아닌 경우 무엇을 출력할지 결정한다.
    END AS FREEZER_YN                            -- 마지막으로는 end를 사용하여 끝맺는다
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE "경기도%"
ORDER BY WAREHOUSE_ID ASC;

