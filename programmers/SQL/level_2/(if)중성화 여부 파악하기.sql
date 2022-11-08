-- https://school.programmers.co.kr/learn/courses/30/lessons/59409

-- 보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 
-- 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.

SELECT      ANIMAL_ID,
            NAME,
            if(SEX_UPON_INTAKE like '%Neutered%' or SEX_UPON_INTAKE like '%Spayed%', 'O', 'X') as '중성화'
from        ANIMAL_INS 
order by    ANIMAL_ID

-- if문을 사용할 경우(이전 코드에서는 전부 null인 경우를 제외 시키기 위해 사용됐지만, 이번에는 특정 조건을 활용해야 한다.)
-- if(컬럼명 like '조건', '해당 조건에 일치할 경우', '조건에 일치하지 않을 경우')와 같은 방식으로 작성해야 한다.

-- 여기서 select에서 if를 사용하게 되는 이유는 해당 조건을 output의 컬럼명으로 사용하기 때문이라고 생각하면 좋을 것 같다. 