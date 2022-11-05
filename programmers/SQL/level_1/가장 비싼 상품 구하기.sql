-- https://school.programmers.co.kr/learn/courses/30/lessons/131697

SELECT PRICE as MAX_PRICE from PRODUCT order by PRICE desc limit 1

-- 가장 상단의 데이터를 가져오면 되는 것으로 limit 1을 사용하여 제일 위의 제품만 가져온다.