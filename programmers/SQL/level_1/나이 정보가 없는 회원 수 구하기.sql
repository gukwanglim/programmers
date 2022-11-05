-- 상세 설명 https://school.programmers.co.kr/questions/38186

SELECT count(*) as USERS from USER_INFO where AGE is NULL

-- 다른 방식 사용

select
    sum(case when age is null then 1 else 0 end) as users
from user_info


-- count(*)의 경우에는 NULL 값을 포함하여 수를 세고, count(age)와 같이 특정 컬럼을 지정할 경우에는 NULL 값을 제외한 수를 세게 된다

SELECT COUNT(USER_ID) AS USERS
FROM USER_INFO
WHERE AGE IS NULL;

-- 위 코드는 where 절로 조건을 붙여서 문제가 없다.

SELECT COUNT(*) AS USERS
FROM USER_INFO;

-- 

SELECT COUNT(AGE) AS USERS
FROM USER_INFO

-- 하지만 두 코드의 경우에는 반환하는 결과가 다르다



-- sum()을 사용하여 문제를 풀 수 있다.

SELECT SUM(AGE IS NULL) AS USERS
FROM USER_INFO;

-- True가 들어오게 되면 1을 반환하고 False가 들어오게 되면 0을 반환하게 되는데 SUM(AGE IS NULL)과 같이 AGE IS NULL을 충족하는 경우에만 1로 변환되어 변환된 값이 더해진다.