CREATE DATABASE StudentPerformance;

USE StudentPerformance

/* ============================
   Lookup Tables
============================ */

CREATE TABLE Parental_Involvement (
    involvement_id INT PRIMARY KEY,
    involvement_name VARCHAR(20) NOT NULL
);

INSERT INTO Parental_Involvement VALUES
(1,'Low'),
(2,'Medium'),
(3,'High');


CREATE TABLE Access_To_Resources (
    resource_id INT PRIMARY KEY,
    resource_level VARCHAR(20) NOT NULL
);

INSERT INTO Access_To_Resources VALUES
(1,'Low'),
(2,'Medium'),
(3,'High');


CREATE TABLE Motivation_Level (
    motivation_id INT PRIMARY KEY,
    motivation_level VARCHAR(20) NOT NULL
);

INSERT INTO Motivation_Level VALUES
(1,'Low'),
(2,'Medium'),
(3,'High');


CREATE TABLE Family_Income (
    income_id INT PRIMARY KEY,
    income_level VARCHAR(20) NOT NULL
);

INSERT INTO Family_Income VALUES
(1,'Low'),
(2,'Medium'),
(3,'High');


CREATE TABLE Teacher_Quality (
    quality_id INT PRIMARY KEY,
    quality_level VARCHAR(20) NOT NULL
);

INSERT INTO Teacher_Quality VALUES
(1,'Low'),
(2,'Medium'),
(3,'High');


CREATE TABLE Distance_From_Home (
    distance_id INT PRIMARY KEY,
    distance_level VARCHAR(20) NOT NULL
);

INSERT INTO Distance_From_Home VALUES
(1,'Near'),
(2,'Moderate'),
(3,'Far');


CREATE TABLE Parental_Education_Level (
    education_id INT PRIMARY KEY,
    education_level VARCHAR(20) NOT NULL
);

INSERT INTO Parental_Education_Level VALUES
(1,'High School'),
(2,'College'),
(3,'Postgraduate');


CREATE TABLE Gender (
    gender_id INT PRIMARY KEY,
    gender_name VARCHAR(20) NOT NULL
);

INSERT INTO Gender VALUES
(0,'Female'),
(1,'Male');


CREATE TABLE Internet_Access (
    internet_access_id INT PRIMARY KEY,
    access_name VARCHAR(20) NOT NULL
);

INSERT INTO Internet_Access VALUES
(0,'No'),
(1,'Yes');


CREATE TABLE Learning_Disabilities (
    disability_id INT PRIMARY KEY,
    disability_name VARCHAR(20) NOT NULL
);

INSERT INTO Learning_Disabilities VALUES
(0,'No'),
(1,'Yes');


CREATE TABLE Extracurricular_Activities (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(20) NOT NULL
);

INSERT INTO Extracurricular_Activities VALUES
(0,'No'),
(1,'Yes');


CREATE TABLE School_Type (
    school_type_id INT PRIMARY KEY,
    school_type_name VARCHAR(20) NOT NULL
);

INSERT INTO School_Type VALUES
(0,'Public'),
(1,'Private');


CREATE TABLE Peer_Influence (
    influence_id INT PRIMARY KEY,
    influence_name VARCHAR(20) NOT NULL
);

INSERT INTO Peer_Influence VALUES
(0,'Negative'),
(1,'Neutral'),
(2,'Positive');


/* ============================
   Main Table
============================ */

CREATE TABLE StudentPerformance(

    student_id INT IDENTITY(1,1) PRIMARY KEY,

    Hours_Studied INT NOT NULL,
    Attendance INT NOT NULL,

    parental_involvement_id INT NOT NULL,
    access_resource_id INT NOT NULL,
    extracurricular_activity_id INT NOT NULL,

    Sleep_Hours INT NOT NULL,
    Previous_Scores INT NOT NULL,

    motivation_id INT NOT NULL,
    internet_access_id INT NOT NULL,

    Tutoring_Sessions INT NOT NULL,

    family_income_id INT NOT NULL,
    teacher_quality_id INT NOT NULL,
    school_type_id INT NOT NULL,
    peer_influence_id INT NOT NULL,

    Physical_Activity INT NOT NULL,

    learning_disability_id INT NOT NULL,
    parental_education_id INT NOT NULL,
    distance_from_home_id INT NOT NULL,
    gender_id INT NOT NULL,

    Exam_Score INT NOT NULL,

    CONSTRAINT FK_Parental_Involvement
        FOREIGN KEY (parental_involvement_id)
        REFERENCES Parental_Involvement(involvement_id),

    CONSTRAINT FK_Access_To_Resources
        FOREIGN KEY (access_resource_id)
        REFERENCES Access_To_Resources(resource_id),

    CONSTRAINT FK_Extracurricular_Activities
        FOREIGN KEY (extracurricular_activity_id)
        REFERENCES Extracurricular_Activities(activity_id),

    CONSTRAINT FK_Motivation_Level
        FOREIGN KEY (motivation_id)
        REFERENCES Motivation_Level(motivation_id),

    CONSTRAINT FK_Internet_Access
        FOREIGN KEY (internet_access_id)
        REFERENCES Internet_Access(internet_access_id),

    CONSTRAINT FK_Family_Income
        FOREIGN KEY (family_income_id)
        REFERENCES Family_Income(income_id),

    CONSTRAINT FK_Teacher_Quality
        FOREIGN KEY (teacher_quality_id)
        REFERENCES Teacher_Quality(quality_id),

    CONSTRAINT FK_School_Type
        FOREIGN KEY (school_type_id)
        REFERENCES School_Type(school_type_id),

    CONSTRAINT FK_Peer_Influence
        FOREIGN KEY (peer_influence_id)
        REFERENCES Peer_Influence(influence_id),

    CONSTRAINT FK_Learning_Disabilities
        FOREIGN KEY (learning_disability_id)
        REFERENCES Learning_Disabilities(disability_id),

    CONSTRAINT FK_Parental_Education_Level
        FOREIGN KEY (parental_education_id)
        REFERENCES Parental_Education_Level(education_id),

    CONSTRAINT FK_Distance_From_Home
        FOREIGN KEY (distance_from_home_id)
        REFERENCES Distance_From_Home(distance_id),

    CONSTRAINT FK_Gender
        FOREIGN KEY (gender_id)
        REFERENCES Gender(gender_id)
);