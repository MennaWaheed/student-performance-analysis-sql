use StudentPerformance

SELECT
    CASE
        WHEN Hours_Studied < 10 THEN 'Low'
        WHEN Hours_Studied BETWEEN 10 AND 19 THEN 'Medium'
        ELSE 'High'
    END AS Study_Level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST (Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Score,
    MIN(Exam_Score) AS Min_Score,
    MAX(Exam_Score) AS Max_Score
FROM StudentPerformance
GROUP BY
CASE
        WHEN Hours_Studied < 10 THEN 'Low'
        WHEN Hours_Studied BETWEEN 10 AND 19 THEN 'Medium'
        ELSE 'High'
END
ORDER BY Average_Score;
--------------------------------------

SELECT
CASE
WHEN Attendance <70 THEN 'Poor'
WHEN Attendance BETWEEN 70 AND 89 THEN 'Good'
ELSE 'Excellent'
END Attendance_Level,

COUNT(*) Students,
CAST(AVG(CAST (Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Score,
MIN(Exam_Score) AS Min_Score,
MAX(Exam_Score) AS Max_Score
FROM StudentPerformance

GROUP BY

CASE
WHEN Attendance <70 THEN 'Poor'
WHEN Attendance BETWEEN 70 AND 89 THEN 'Good'
ELSE 'Excellent'
END
ORDER BY Average_Score;
-----------------------------------------

SELECT
    CASE
        WHEN Previous_Scores < 60 THEN 'Low'
        WHEN Previous_Scores BETWEEN 60 AND 79 THEN 'Medium'
        ELSE 'High'
    END AS Previous_Performance,

    COUNT(*) AS Number_of_Students,

    CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,

    MIN(Exam_Score) AS Min_Score,
    MAX(Exam_Score) AS Max_Score

FROM StudentPerformance

GROUP BY
    CASE
        WHEN Previous_Scores < 60 THEN 'Low'
        WHEN Previous_Scores BETWEEN 60 AND 79 THEN 'Medium'
        ELSE 'High'
    END

ORDER BY Average_Exam_Score;
----------------------------------------
SELECT
    CASE
        WHEN (Exam_Score - Previous_Scores) >= 10 THEN 'Significant Improvement'
        WHEN (Exam_Score - Previous_Scores) BETWEEN 1 AND 9 THEN 'Improved'
        WHEN (Exam_Score - Previous_Scores) = 0 THEN 'No Change'
        ELSE 'Declined'
    END AS Performance_Change,

    COUNT(*) AS Students,

    CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Change

FROM StudentPerformance

GROUP BY
CASE
        WHEN (Exam_Score - Previous_Scores) >= 10 THEN 'Significant Improvement'
        WHEN (Exam_Score - Previous_Scores) BETWEEN 1 AND 9 THEN 'Improved'
        WHEN (Exam_Score - Previous_Scores) = 0 THEN 'No Change'
        ELSE 'Declined'
END;
------------------------------------------------------

SELECT
    Sleep_Hours,
    COUNT(*) AS Students,
    CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Avg_Improvement
FROM StudentPerformance
GROUP BY Sleep_Hours
ORDER BY Sleep_Hours;

-------------------------------------------
SELECT
    Physical_Activity,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(Exam_Score) AS Min_Score,
    MAX(Exam_Score) AS Max_Score
FROM StudentPerformance
GROUP BY Physical_Activity
ORDER BY Physical_Activity;
-------------------------------------------------

SELECT
    Tutoring_Sessions,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(Exam_Score) AS Min_Score,
    MAX(Exam_Score) AS Max_Score
FROM StudentPerformance
GROUP BY Tutoring_Sessions
ORDER BY Tutoring_Sessions;
-----------------------------------------------------

SELECT
    M.motivation_level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Motivation_Level M
ON S.motivation_id = M.motivation_id
GROUP BY M.motivation_level
ORDER BY Average_Exam_Score DESC;
-------------------------------------------------------

SELECT
    F.income_level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Family_Income F
ON S.family_income_id = F.income_id
GROUP BY F.income_level
ORDER BY Average_Exam_Score DESC;
------------------------------------------------------

SELECT
    T.quality_level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score
    
FROM StudentPerformance S
JOIN Teacher_Quality T
ON S.teacher_quality_id = T.quality_id
GROUP BY T.quality_level
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------

SELECT
    A.resource_level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score
    
FROM StudentPerformance S
JOIN Access_To_Resources A
ON S.access_resource_id = A.resource_id
GROUP BY A.resource_level
ORDER BY Average_Exam_Score DESC;






















---------------------------------------------------
SELECT
    F.income_level AS Family_Income,
    T.quality_level AS Teacher_Quality,

    COUNT(*) AS Number_of_Students,

    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,

    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement

FROM StudentPerformance S

JOIN Family_Income F
ON S.family_income_id = F.income_id

JOIN Teacher_Quality T
ON S.teacher_quality_id = T.quality_id

GROUP BY
    F.income_level,
    T.quality_level

ORDER BY
    F.income_level,
    T.quality_level;











