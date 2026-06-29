
CREATE PROCEDURE sp_GetStudyHoursAnalysis
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CASE
            WHEN Hours_Studied < 10 THEN 'Low'
            WHEN Hours_Studied BETWEEN 10 AND 19 THEN 'Medium'
            ELSE 'High'
        END AS Study_Level,

        COUNT(*) AS Number_of_Students,
        CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
        CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
        MIN(Exam_Score) AS Min_Score,
        MAX(Exam_Score) AS Max_Score

    FROM StudentPerformance

    GROUP BY
        CASE
            WHEN Hours_Studied < 10 THEN 'Low'
            WHEN Hours_Studied BETWEEN 10 AND 19 THEN 'Medium'
            ELSE 'High'
        END

    ORDER BY Average_Exam_Score DESC;
END;
--------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetAttendanceAnalysis
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CASE
            WHEN Attendance < 70 THEN 'Poor'
            WHEN Attendance BETWEEN 70 AND 89 THEN 'Good'
            ELSE 'Excellent'
        END AS Attendance_Level,

        COUNT(*) AS Number_of_Students,
        CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
        CAST(AVG(CAST(Exam_Score - Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Improvement,
        MIN(Exam_Score) AS Min_Score,
        MAX(Exam_Score) AS Max_Score

    FROM StudentPerformance
    GROUP BY
        CASE
            WHEN Attendance < 70 THEN 'Poor'
            WHEN Attendance BETWEEN 70 AND 89 THEN 'Good'
            ELSE 'Excellent'
        END

    ORDER BY Average_Exam_Score DESC;
END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetPerformanceSummary
AS
BEGIN

    SET NOCOUNT ON;
    SELECT
        COUNT(*) AS Total_Students,
        CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2)) AS Average_Exam_Score,
        CAST(AVG(CAST(Previous_Scores AS FLOAT)) AS DECIMAL(5,2)) AS Average_Previous_Score,
        MAX(Exam_Score) AS Highest_Score,
        MIN(Exam_Score) AS Lowest_Score,
        CAST(AVG(CAST(Hours_Studied AS FLOAT)) AS DECIMAL(5,2)) AS Average_Study_Hours,
        CAST(AVG(CAST(Attendance AS FLOAT)) AS DECIMAL(5,2)) AS Average_Attendance,
        CAST(AVG(CAST(Sleep_Hours AS FLOAT)) AS DECIMAL(5,2)) AS Average_Sleep_Hours,
        CAST(AVG(CAST(Physical_Activity AS FLOAT)) AS DECIMAL(5,2)) AS Average_Physical_Activity

    FROM StudentPerformance;

END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetTopStudents
    @Top INT = 10
AS
BEGIN

    SET NOCOUNT ON;
    SELECT TOP (@Top)
        student_id,
        Hours_Studied,
        Attendance,
        Previous_Scores,
        Exam_Score,
        Exam_Score - Previous_Scores AS Improvement

    FROM StudentPerformance
    ORDER BY
        Exam_Score DESC,
        Attendance DESC,
        Hours_Studied DESC;

END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetStudentsByScoreRange

    @MinScore INT,
    @MaxScore INT

AS
BEGIN

    SET NOCOUNT ON;
    SELECT
        student_id,
        Exam_Score,
        Previous_Scores,
        Hours_Studied,
        Attendance,
        Exam_Score - Previous_Scores AS Improvement

    FROM StudentPerformance
    WHERE Exam_Score
    BETWEEN @MinScore AND @MaxScore
    ORDER BY Exam_Score DESC;
END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetStudentRiskReport
AS
BEGIN

    SET NOCOUNT ON;
    SELECT
        student_id,
        Hours_Studied,
        Attendance,
        Previous_Scores,
        Exam_Score,

        CASE
            WHEN Hours_Studied < 10
                AND Attendance < 70
                AND Motivation_ID = 1
            THEN 'High Risk'

            WHEN Hours_Studied < 10
                OR Attendance < 70
            THEN 'Medium Risk'

            ELSE 'Low Risk'

        END AS Risk_Level

    FROM StudentPerformance
    ORDER BY
        CASE
            WHEN Hours_Studied < 10
                AND Attendance < 70
                AND Motivation_ID = 1
            THEN 1

            WHEN Hours_Studied < 10
                OR Attendance < 70
            THEN 2

            ELSE 3
        END,
        Exam_Score;

END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_RankStudents
AS
BEGIN

    SET NOCOUNT ON;
    SELECT
        student_id,
        Exam_Score,
        Previous_Scores,
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

    FROM StudentPerformance

    ORDER BY Student_Rank;

END;

-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetTopImprovedStudents

    @Top INT = 20

AS
BEGIN

    SET NOCOUNT ON;
    SELECT TOP(@Top)
        student_id,
        Previous_Scores,
        Exam_Score,
        Exam_Score - Previous_Scores AS Improvement,

        ROW_NUMBER() OVER
        (
            ORDER BY Exam_Score-Previous_Scores DESC
        ) AS Rank_No

    FROM StudentPerformance

    ORDER BY Improvement DESC;

END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GetFactorAnalysis

    @Factor NVARCHAR(100)

AS
BEGIN

    SET NOCOUNT ON;
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL='

    SELECT
        '+QUOTENAME(@Factor)+' AS Factor,
        COUNT(*) AS Students,
        CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2))
            AS Average_Score,
        CAST(AVG(CAST(Exam_Score-Previous_Scores AS FLOAT))
            AS DECIMAL(5,2))
            AS Average_Improvement

    FROM StudentPerformance

    GROUP BY '+QUOTENAME(@Factor)+'
    ORDER BY Average_Score DESC';
    
    EXEC sp_executesql @SQL;

END;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_GenerateNightlyReport
AS
BEGIN

    SET NOCOUNT ON;

    PRINT '===== Student Performance Nightly Report =====';

    PRINT '';

    PRINT 'Overall Summary';

    SELECT

        COUNT(*) Total_Students,

        CAST(AVG(CAST(Exam_Score AS FLOAT)) AS DECIMAL(5,2))
            AS Average_Score,

        MAX(Exam_Score) Highest_Score,

        MIN(Exam_Score) Lowest_Score

    FROM StudentPerformance;

    PRINT '';

    PRINT 'Top 10 Students';

    SELECT TOP(10)

        student_id,

        Exam_Score,

        Hours_Studied,

        Attendance

    FROM StudentPerformance

    ORDER BY Exam_Score DESC;

    PRINT '';

    PRINT 'Students At Risk';

    SELECT

        student_id,

        Exam_Score,

        Hours_Studied,

        Attendance

    FROM StudentPerformance

    WHERE

        Attendance<70
        AND Hours_Studied<10;

END;
-----------------------------------------------------------------------------------------------

