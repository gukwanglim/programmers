--https://school.programmers.co.kr/learn/courses/30/lessons/131112

SELECT FACTORY_ID, FACTORY_NAME, ADDRESS from FOOD_FACTORY where ADDRESS like '%강원도%' order by FACTORY_ID asc    

-- 특정 문구가 들어간 데이터를 뽑아내기 위해서는 where 절에 is가 아닌 like를 사용하고, %를 이용하여 다른 문자도 포함 될 수 있음을 표시한다.