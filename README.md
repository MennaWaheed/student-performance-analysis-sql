# 📊 Factors Influencing Student Performance with SQL

## 📌 Project Overview

This project analyzes the factors that influence students' academic performance using Microsoft SQL Server. The dataset contains information about students' study habits, attendance, family background, school environment, and personal characteristics.

The project focuses on designing a normalized relational database, performing exploratory and analytical SQL queries, creating reusable stored procedures and views, and documenting the insights obtained from the analysis.

---

# 🎯 Project Objectives

* Design a normalized SQL database.
* Import and organize educational data.
* Analyze factors affecting student performance.
* Test educational hypotheses using SQL.
* Develop reusable Stored Procedures and Views.
* Generate analytical reports for decision making.
* Demonstrate SQL Server features including joins, aggregations, window functions, and dynamic SQL.

---

# 📂 Dataset

The dataset contains **6,607 student records** with **20 attributes**.

### Features

| Category | Attributes                                                                                                                                                 |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Academic | Hours Studied, Attendance, Previous Scores, Exam Score, Tutoring Sessions                                                                                  |
| Family   | Family Income, Parental Involvement, Parental Education                                                                                                    |
| School   | Teacher Quality, School Type, Access to Resources                                                                                                          |
| Student  | Motivation, Sleep Hours, Physical Activity, Internet Access, Learning Disabilities, Distance from Home, Peer Influence, Gender, Extracurricular Activities |

---

# 🗄 Database Design

The database follows the principles of **Third Normal Form (3NF)**.

### Tables

### Lookup Tables

* Parental_Involvement
* Access_To_Resources
* Motivation_Level
* Family_Income
* Teacher_Quality
* Distance_From_Home
* Parental_Education_Level
* Gender
* Internet_Access
* Learning_Disabilities
* Extracurricular_Activities
* School_Type
* Peer_Influence

### Main Table

* StudentPerformance

The main table references all lookup tables through foreign keys to eliminate data redundancy and improve data consistency.

---

# 🧹 Data Preprocessing

Data preprocessing was performed using Python before importing the dataset into SQL Server.

The preprocessing steps included:

* Handling missing values using the mode.
* Encoding categorical variables into numeric values.
* Normalizing the dataset using lookup tables.
* Exporting the cleaned dataset as CSV.
* Importing the cleaned data into SQL Server.

---

# 📊 Analytical Queries

The project contains **29 analytical SQL queries**.

## Single-Factor Analysis

The following factors were analyzed individually:

* Study Hours
* Attendance
* Previous Scores
* Sleep Hours
* Physical Activity
* Tutoring Sessions
* Motivation Level
* Family Income
* Teacher Quality
* Access to Resources
* Distance from Home
* Gender
* School Type
* Internet Access
* Extracurricular Activities
* Learning Disabilities
* Parental Education Level
* Peer Influence
* Parental Involvement

Each analysis includes:

* Objective
* Hypothesis
* SQL Query
* Results
* Conclusion

---

## Multi-Factor Analysis

Ten multi-factor analyses were performed:

* Study Hours × Attendance
* Study Hours × Motivation
* Family Income × Access to Resources
* Parental Education × Parental Involvement
* Teacher Quality × Family Income
* Teacher Quality × Access to Resources
* Peer Influence × Motivation
* Previous Scores × Study Hours
* Learning Disabilities × Teacher Quality
* Distance from Home × Attendance

---

# 📈 Key Findings

The analysis identified several factors with the strongest influence on academic performance.

## Strong Factors

* Study Hours
* Attendance
* Parental Involvement
* Access to Educational Resources
* Parental Education Level

## Moderate Factors

* Teacher Quality
* Family Income
* Peer Influence
* Tutoring Sessions
* Motivation Level
* Internet Access
* Extracurricular Activities
* Learning Disabilities

## Weak Factors

* Distance from Home
* Physical Activity
* Sleep Hours
* School Type
* Gender
* Previous Academic Performance

---

# 🏗 Stored Procedures

The project includes **10 reusable Stored Procedures**, including:

* Study Hours Analysis
* Attendance Analysis
* Performance Summary
* Top Students Report
* Student Score Range
* Academic Risk Report
* Student Ranking
* Top Improved Students
* Dynamic Factor Analysis
* Nightly Performance Report

---

# 👁 Database Views

The project contains **10 SQL Views**, including:

* Student Summary
* Dashboard
* High Performers
* Low Performers
* Academic Risk
* Improved Students
* Study & Attendance Analysis
* Family Environment
* Teacher Effectiveness
* Performance Ranking

---

# ⚙ SQL Features Used

* Joins
* GROUP BY
* Aggregate Functions
* CASE Statements
* Foreign Keys
* Window Functions
* Ranking Functions
* Dynamic SQL
* Stored Procedures
* SQL Views

---

# 🤖 Automation

The project includes a reusable stored procedure (`sp_GenerateNightlyReport`) that can be scheduled to execute automatically using **SQL Server Agent**.

For SQL Server Express environments where SQL Server Agent is unavailable, the procedure can be scheduled using **Linux Cron Jobs** or **Windows Task Scheduler** together with `sqlcmd`.

---

# 🛠 Technologies Used

* Microsoft SQL Server
* SQL Server Management Studio / DBeaver
* Python
* Pandas
* Docker


---

# 🚀 Future Improvements

* Develop interactive Power BI dashboards.
* Apply statistical correlation analysis.
* Build predictive machine learning models.
* Integrate the database with a web application.
* Automate report generation and email notifications.


