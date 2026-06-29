CREATE VIEW vw_StudentSummary
AS
SELECT

S.student_id,

S.Hours_Studied,
S.Attendance,
S.Sleep_Hours,
S.Previous_Scores,
S.Tutoring_Sessions,
S.Physical_Activity,
S.Exam_Score,

PI.involvement_name,
AR.resource_level AS Access_To_Resources,
M.motivation_level,
FI.income_level,
TQ.quality_level,
ST.school_type_name,
PE.influence_name,
IA.access_name,
EA.activity_name,
LD.disability_name,
PEL.education_level,
DFH.distance_level,
G.gender_name

FROM StudentPerformance S

JOIN Parental_Involvement PI
ON PI.involvement_id=S.parental_involvement_id

JOIN Access_To_Resources AR
ON AR.resource_id=S.access_resource_id

JOIN Motivation_Level M
ON M.motivation_id=S.motivation_id

JOIN Family_Income FI
ON FI.income_id=S.family_income_id

JOIN Teacher_Quality TQ
ON TQ.quality_id=S.teacher_quality_id

JOIN School_Type ST
ON ST.school_type_id=S.school_type_id

JOIN Peer_Influence PE
ON PE.influence_id=S.peer_influence_id

JOIN Internet_Access IA
ON IA.internet_access_id=S.internet_access_id

JOIN Extracurricular_Activities EA
ON EA.activity_id=S.extracurricular_activity_id

JOIN Learning_Disabilities LD
ON LD.disability_id=S.learning_disability_id

JOIN Parental_Education_Level PEL
ON PEL.education_id=S.parental_education_id

JOIN Distance_From_Home DFH
ON DFH.distance_id=S.distance_from_home_id

JOIN Gender G
ON G.gender_id=S.gender_id;
----------------------------------------------------------------------------------------

CREATE VIEW vw_HighPerformers
AS

SELECT *

FROM vw_StudentSummary

WHERE Exam_Score>=90;
----------------------------------------------------------------------------------------

CREATE VIEW vw_LowPerformers
AS

SELECT *

FROM vw_StudentSummary

WHERE Exam_Score<60;
----------------------------------------------------------------------------------------

CREATE VIEW vw_AcademicRisk
AS

SELECT

    S.student_id,

    S.Hours_Studied,

    S.Attendance,

    M.motivation_level,

    S.Exam_Score,

    CASE

        WHEN
            S.Hours_Studied < 10
            AND S.Attendance < 70
            AND M.motivation_level = 'Low'

        THEN 'High Risk'

        WHEN
            S.Hours_Studied < 10
            OR S.Attendance < 70

        THEN 'Medium Risk'

        ELSE 'Low Risk'

    END AS Risk_Level

FROM StudentPerformance S

JOIN Motivation_Level M
ON M.motivation_id = S.motivation_id;
----------------------------------------------------------------------------------------

CREATE VIEW vw_ImprovedStudents
AS

SELECT

student_id,

Previous_Scores,

Exam_Score,

Exam_Score-Previous_Scores AS Improvement

FROM StudentPerformance

WHERE Exam_Score>Previous_Scores;
----------------------------------------------------------------------------------------

CREATE VIEW vw_Dashboard
AS

SELECT

COUNT(*) AS Total_Students,

CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2))
AS Average_Exam_Score,

CAST(AVG(CAST(Previous_Scores AS FLOAT)) AS DECIMAL(5,2))
AS Average_Previous_Score,

CAST(AVG(CAST(Hours_Studied AS FLOAT)) AS DECIMAL(5,2))
AS Average_Study_Hours,

CAST(AVG(CAST(Attendance AS FLOAT)) AS DECIMAL(5,2))
AS Average_Attendance,

MAX(Exam_Score) AS Highest_Score,

MIN(Exam_Score) AS Lowest_Score

FROM StudentPerformance;
----------------------------------------------------------------------------------------

CREATE VIEW vw_StudyAttendanceAnalysis
AS

SELECT

student_id,

Hours_Studied,

Attendance,

Exam_Score,

CASE
WHEN Hours_Studied<10 THEN 'Low'
WHEN Hours_Studied<20 THEN 'Medium'
ELSE 'High'
END AS Study_Level,

CASE
WHEN Attendance<70 THEN 'Poor'
WHEN Attendance<90 THEN 'Good'
ELSE 'Excellent'
END AS Attendance_Level

FROM StudentPerformance;
----------------------------------------------------------------------------------------

CREATE VIEW vw_FamilyEnvironment
AS

SELECT

S.student_id,

FI.income_level,

PI.involvement_name,

PEL.education_level,

AR.resource_level,

S.Exam_Score

FROM StudentPerformance S

JOIN Family_Income FI
ON FI.income_id=S.family_income_id

JOIN Parental_Involvement PI
ON PI.involvement_id=S.parental_involvement_id

JOIN Parental_Education_Level PEL
ON PEL.education_id=S.parental_education_id

JOIN Access_To_Resources AR
ON AR.resource_id=S.access_resource_id;
----------------------------------------------------------------------------------------

CREATE VIEW vw_TeacherEffectiveness
AS

SELECT

S.student_id,

TQ.quality_level,

FI.income_level,

AR.resource_level,

S.Exam_Score,

S.Previous_Scores,

S.Exam_Score-S.Previous_Scores AS Improvement

FROM StudentPerformance S

JOIN Teacher_Quality TQ
ON TQ.quality_id=S.teacher_quality_id

JOIN Family_Income FI
ON FI.income_id=S.family_income_id

JOIN Access_To_Resources AR
ON AR.resource_id=S.access_resource_id;
----------------------------------------------------------------------------------------

CREATE VIEW vw_PerformanceRanking
AS

SELECT

student_id,

Exam_Score,

Hours_Studied,

Attendance,

RANK() OVER
(
ORDER BY Exam_Score DESC
) AS Student_Rank,

DENSE_RANK() OVER
(
ORDER BY Exam_Score DESC
) AS Dense_Rank

FROM StudentPerformance;
----------------------------------------------------------------------------------------
