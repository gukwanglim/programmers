-- https://school.programmers.co.kr/learn/courses/30/lessons/132204

-- PATIENT, DOCTOR 그리고 APPOINTMENT 테이블에서 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 SQL문을 작성해주세요.
-- 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 항목이 출력되도록 작성해주세요. 결과는 진료예약일시를 기준으로 오름차순 정렬해주세요.

SELECT      A.APNT_NO,
            P.PT_NAME,
            P.PT_NO,
            A.MCDP_CD,
            D.DR_NAME,
            A.APNT_YMD
from        APPOINTMENT as A,
            DOCTOR as D,
            PATIENT as P
where       A.MCDP_CD like 'CS' 
            and A.PT_NO = P.PT_NO 
            and A.MDDR_ID = D.DR_ID 
            and A.APNT_YMD like '2022-04-13%' 
            and A.APNT_CNCL_YN like 'N'
order by    A.APNT_YMD

-- 세 개의 테이블을 사용하는 sql으로 join을 여러 번 사용한 경험이 없어서 단순하게 from으로 세 테이블을 불러와 사용했다.(group by, having 등으로 사용해야 하는 조건이 없기 때문에 from으로 사용)
-- 단순히 세 개의 테이블을 가져와 사용하는 것으로 문제가 될만한 부분이 없지만, 다음부터는 join을 사용하기로 한다.
-- 추가로 날짜와 같은 데이터는 가능하면 DATE_FORMAT을 사용하는 것을 한다.

SELECT
            A.APNT_NO 
            ,P.PT_NAME
            ,P.PT_NO
            ,A.MCDP_CD
            ,D.DR_NAME
            ,A.APNT_YMD
FROM        APPOINTMENT AS A
LEFT JOIN   PATIENT AS P 
ON          A.PT_NO=P.PT_NO
LEFT JOIN   DOCTOR AS D
ON          A.MDDR_ID = D.DR_ID 
WHERE       A.MCDP_CD="CS"
            AND DATE_FORMAT(A.APNT_YMD ,'%Y-%m-%d') ='2022-04-13'
            AND A.APNT_CNCL_YN ='N'
ORDER BY    A.APNT_YMD;

-- join을 사용할 경우에는 두 개의 테이블을 사용할 때와 같이 join으로 사용하면 된다.
-- 하나의 join을 사용하여 main 테이블과 sub_1 테이블을 연결시켜주고, 다시 한번 join을 사용하여 main 테이블과 sub_2 테이블을 연결하면 된다.

SELECT      APNT_NO, PT_NAME, A.PT_NO, A.MCDP_CD, D.DR_NAME, APNT_YMD
FROM        PATIENT AS P
JOIN        (
            SELECT *
            FROM APPOINTMENT
            WHERE MCDP_CD = 'CS'
            AND DATE(APNT_YMD) = '2022-04-13'
            AND APNT_CNCL_YN = 'N'
            ) AS A
USING       (PT_NO)
JOIN        DOCTOR AS D
ON          A.MDDR_ID = D.DR_ID
ORDER BY    APNT_YMD;

-- 위 코드와 같이 using을 사용할 수 있다.
-- using은 두 개의 테이블이 내부 조인으로 조인 될 때 조인하고자 하는 두 테이블의 컬럼명이 같을 경우 조인 조건을 길게 적지 않고 간단하게 적을 수 있도록 하는 역할을 한다.

-- 쉽게 말해, 위의 코드에서 'USING   (PT_NO)'의 뜻은 A 테이블과 P 테이블에서 같은 이름을 가진 컬럼(PT_NO)을 FK라고 알려준 것이다.
-- 즉, 'USING   (PT_NO)'은 'on   A.PT_NO = P.PT_NO'이라고 사용할 수 있는 것이다.