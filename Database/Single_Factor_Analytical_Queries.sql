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
    CASE
        WHEN Sleep_Hours < 6 THEN 'Insufficient Sleep (<6 Hours)'
        WHEN Sleep_Hours BETWEEN 6 AND 8 THEN 'Recommended Sleep (6-8 Hours)'
        ELSE 'Extended Sleep (>8 Hours)'
    END AS Sleep_Category,

    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(Exam_Score) AS Min_Score,
    MAX(Exam_Score) AS Max_Score

FROM StudentPerformance
GROUP BY
    CASE
        WHEN Sleep_Hours < 6 THEN 'Insufficient Sleep (<6 Hours)'
        WHEN Sleep_Hours BETWEEN 6 AND 8 THEN 'Recommended Sleep (6-8 Hours)'
        ELSE 'Extended Sleep (>8 Hours)'
    END
ORDER BY Average_Exam_Score DESC;

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
-------------------------------------------------------

SELECT
    D.distance_level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Distance_From_Home D
ON S.distance_from_home_id=D.distance_id
GROUP BY D.distance_level
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    G.gender_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Gender G
ON S.gender_id=G.gender_id
GROUP BY G.gender_name
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    ST.school_type_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN School_Type ST
ON S.school_type_id=ST.school_type_id
GROUP BY ST.school_type_name
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    I.access_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Internet_Access I
ON S.internet_access_id=I.internet_access_id
GROUP BY I.access_name
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    E.activity_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Extracurricular_Activities E
ON S.extracurricular_activity_id=E.activity_id
GROUP BY E.activity_name
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    L.disability_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Learning_Disabilities L
ON S.learning_disability_id=L.disability_id
GROUP BY L.disability_name
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    P.education_level,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Parental_Education_Level P
ON S.parental_education_id=P.education_id
GROUP BY P.education_level
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    P.influence_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score-S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Peer_Influence P
ON S.peer_influence_id=P.influence_id
GROUP BY P.influence_name
ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    PI.involvement_name,

    COUNT(*) AS Number_of_Students,

    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,

    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,

    MIN(S.Exam_Score) AS Min_Score,

    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S

JOIN Parental_Involvement PI
ON S.parental_involvement_id = PI.involvement_id

GROUP BY PI.involvement_name

ORDER BY Average_Exam_Score DESC;
--------------------------------------------------------

SELECT
    PI.involvement_name,
    COUNT(*) AS Number_of_Students,
    CAST(AVG(CAST(S.Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
    CAST(AVG(CAST(S.Exam_Score - S.Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
    MIN(S.Exam_Score) AS Min_Score,
    MAX(S.Exam_Score) AS Max_Score

FROM StudentPerformance S
JOIN Parental_Involvement PI
ON S.parental_involvement_id = PI.involvement_id

GROUP BY PI.involvement_name
ORDER BY Average_Exam_Score DESC;
-----------------------------------------------------------------------------------



















