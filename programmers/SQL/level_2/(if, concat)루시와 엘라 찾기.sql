-- https://school.programmers.co.kr/learn/courses/30/lessons/59046

-- 동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요.

SELECT      ANIMAL_ID,
            NAME,
            SEX_UPON_INTAKE
from        ANIMAL_INS
where       NAME in ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
order by    ANIMAL_ID

-- 앞에서 사용했던 if 구문의 경우는 select에서 사용하게 되는데 이번 문제는 말 그대로 조건을 사용하여 해당 값만 반환하는 것으로 where을 사용했다고 생각하면 좋을 것 같다.


SELECT      ANIMAL_ID,
            NAME,
            SEX_UPON_INTAKE
from        ANIMAL_INS
where       'Lucy, Ella, Pickle, Rogan, Sabrina, Mitty' LIKE CONCAT('%', NAME, '%')
order by    ANIMAL_ID

-- 추가로 concat을 사용하여 값을 가져올 수 있다.
-- 원래 concat을 사용하는 방식은 "컬럼명 LIKE CONCAT('%', '검색할 문자열', '%')"이지만
-- 위의 코드와 같이 순서를 바꿔 사용해도 문제가 해결되는 것을 확인할 수 있다.