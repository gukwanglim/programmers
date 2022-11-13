-- https://school.programmers.co.kr/learn/courses/30/lessons/59042

-- 천재지변으로 인해 일부 데이터가 유실되었습니다. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.

SELECT      T2.ANIMAL_ID,
            T2.NAME
from        ANIMAL_OUTS T2
left join   ANIMAL_INS T1
on          T1.ANIMAL_ID = T2.ANIMAL_ID
where       T1.ANIMAL_ID is null

-- 입양 보낸 정보를 가지고 있는 테이블 T2를 기준으로 보호를 시작한 데이터를 가지고 있는 T1을 left join하여 T1의 데이터가 null이 되는 동물을 찾으면 된다.


SELECT      B.ANIMAL_ID AS ANIMAL_ID, B.NAME AS NAME FROM ANIMAL_OUTS B
MINUS
SELECT      A.ANIMAL_ID AS ANIMAL_ID, A.NAME AS NAME FROM ANIMAL_INS A
ORDER BY    ANIMAL_ID

-- minus를 사용하여 T2에 존재하는 내용에서 T1에 존재하는 내용을 뺀 후, 남은 값을 출력해도 된다.


SELECT ANIMAL_ID,name from ANIMAL_OUTS
where ANIMAL_ID not in (select animal_id from ANIMAL_INS) order by ANIMAL_ID;

-- pyhton과 마찬가지로 not in 을 사용하는 방법도 존재한다.