-- https://school.programmers.co.kr/learn/courses/30/lessons/59408

-- image 파일 사진 2번

SELECT      count(distinct NAME)
from        ANIMAL_INS 

-- 단순하게 count(*)을 작성하면 null을 제외한 모든 데이터의 수를 출력하게 된다.(PK인 ID를 가지고 조회하게 된다.)
-- 즉, null을 제외하고 숫자를 세기 위해서는 조건(여기서는 NAME)을 설정해주고, 그곳에서 null을 제외한 값을 출력해야한다.
-- 그러기 위해서는 위 코드와 같이 distinct(단어 뜻 : 뚜렷한)를 사용해야 한다.