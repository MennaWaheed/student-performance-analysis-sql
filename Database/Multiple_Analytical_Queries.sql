SELECT
    CASE
        WHEN Hours_Studied < 10 THEN 'Low'
        WHEN Hours_Studied BETWEEN 10 AND 19 THEN 'Medium'
        ELSE 'High'
    END AS Study_Level,

    CASE
        WHEN Attendance < 70 THEN 'Poor'
        WHEN Attendance BETWEEN 70 AND 89 THEN 'Good'
        ELSE 'Excellent'
    END AS Attendance_Level,

    COUNT(*) AS Students,
    CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Avg_Exam,
    CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Avg_Improvement

FROM StudentPerformance
GROUP BY
CASE
        WHEN Hours_Studied < 10 THEN 'Low'
        WHEN Hours_Studied BETWEEN 10 AND 19 THEN 'Medium'
        ELSE 'High'
END,

CASE
        WHEN Attendance <70 THEN 'Poor'
        WHEN Attendance BETWEEN 70 AND 89 THEN 'Good'
        ELSE 'Excellent'
END

ORDER BY Avg_Exam DESC;
-----------------------------------------------------------

SELECT
	M.motivation_level,
CASE
		WHEN Hours_Studied<10 THEN 'Low'
		WHEN Hours_Studied<20 THEN 'Medium'
		ELSE 'High'
END AS Study_Level,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Motivation_Level M
ON S.motivation_id=M.motivation_id
GROUP BY
M.motivation_level,

CASE
WHEN Hours_Studied<10 THEN 'Low'
WHEN Hours_Studied<20 THEN 'Medium'
ELSE 'High'
END

ORDER BY Avg_Exam DESC;
----------------------------------------------------------

SELECT
	F.income_level,
	A.resource_level,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Family_Income F
ON S.family_income_id=F.income_id

JOIN Access_To_Resources A
ON S.access_resource_id=A.resource_id

GROUP BY
	F.income_level,	
	A.resource_level

ORDER BY Avg_Exam DESC;
----------------------------------------------------------

SELECT
	PE.education_level,
	PI.involvement_name,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Parental_Education_Level PE
ON S.parental_education_id=PE.education_id

JOIN Parental_Involvement PI
ON S.parental_involvement_id=PI.involvement_id

GROUP BY
	PE.education_level,
	PI.involvement_name

ORDER BY Avg_Exam DESC;
-------------------------------------------------------

SELECT
	T.quality_level,
	F.income_level,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Teacher_Quality T
ON S.teacher_quality_id=T.quality_id

JOIN Family_Income F
ON S.family_income_id=F.income_id

GROUP BY
	T.quality_level,
	F.income_level

ORDER BY Avg_Exam DESC;
---------------------------------------------------------

SELECT
	T.quality_level,
	A.resource_level,
COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Teacher_Quality T
ON S.teacher_quality_id=T.quality_id

JOIN Access_To_Resources A
ON S.access_resource_id=A.resource_id

GROUP BY
	T.quality_level,
	A.resource_level

ORDER BY Avg_Exam DESC;
-----------------------------------------------------------------

SELECT
	P.influence_name,
	M.motivation_level,

COUNT(*) Students,	
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Peer_Influence P
ON S.peer_influence_id=P.influence_id

JOIN Motivation_Level M
ON S.motivation_id=M.motivation_id

GROUP BY
	P.influence_name,
	M.motivation_level

ORDER BY Avg_Exam DESC;
-----------------------------------------------------------------

SELECT

CASE
	WHEN Previous_Scores<60 THEN 'Low'
	WHEN Previous_Scores<80 THEN 'Medium'
	ELSE 'High'
END Previous_Level,

CASE
	WHEN Hours_Studied<10 THEN 'Low'
	WHEN Hours_Studied<20 THEN 'Medium'
	ELSE 'High'
END Study_Level,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance
GROUP BY
CASE
	WHEN Previous_Scores<60 THEN 'Low'
	WHEN Previous_Scores<80 THEN 'Medium'
	ELSE 'High'
END,

CASE
	WHEN Hours_Studied<10 THEN 'Low'
	WHEN Hours_Studied<20 THEN 'Medium'
	ELSE 'High'
END

ORDER BY Avg_Improvement DESC;
-----------------------------------------------------------------

SELECT
	L.disability_name,
	T.quality_level,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Learning_Disabilities L
ON S.learning_disability_id=L.disability_id

JOIN Teacher_Quality T
ON S.teacher_quality_id=T.quality_id

GROUP BY
	L.disability_name,
	T.quality_level
ORDER BY Avg_Exam DESC;
------------------------------------------------------------------

SELECT
	D.distance_level,

CASE
	WHEN Attendance<70 THEN 'Poor'
	WHEN Attendance<90 THEN 'Good'
	ELSE 'Excellent'
END Attendance_Level,

COUNT(*) Students,
CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) Avg_Exam,
CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) Avg_Improvement

FROM StudentPerformance S
JOIN Distance_From_Home D
ON S.distance_from_home_id=D.distance_id

GROUP BY
	D.distance_level,
CASE
	WHEN Attendance<70 THEN 'Poor'
	WHEN Attendance<90 THEN 'Good'
	ELSE 'Excellent'
END
ORDER BY Avg_Exam DESC;
------------------------------------------------------------------


































