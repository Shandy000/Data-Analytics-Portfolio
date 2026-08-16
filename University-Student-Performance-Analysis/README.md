# University-Student-Performance-Analysis
##📊 Power BI Portfolio Project

An end-to-end Power BI project analysing student enrolment, academic performance and attendance across courses, programmes and study terms.

The project demonstrates the full Power BI workflow, including data cleaning in Power Query, data modelling, DAX calculations, interactive dashboard development and student-level analysis.

---

##🎯 Project Objectives

The dashboard was designed to help a university understand student performance and answer key questions such as:

- How many students, enrolments and courses are currently represented in the data?
- What is the overall average student score and attendance rate?
- How many students achieved a distinction?
- Which courses have the highest and lowest enrolment levels?
- How do enrolments change across Autumn, Spring and Summer terms?
- How does student participation differ by fee status and study mode?
- How are students distributed across different study levels?
- How does student attendance and academic performance vary by lecturer?
- Who are the top-performing students?
- Who are the lowest-performing students and may require additional support?
- Which students have low attendance?
- Who are the highest-performing students within each course or programme?

---

##🛠️ Tools & Technologies

- Power BI Desktop
- Power Query
- DAX
- Data Modelling
- GitHub

---

##🧹 Data Cleaning & Transformation

The source data was reviewed and transformed using Power Query before being loaded into the Power BI data model.

The preparation process included:

1. Reviewing each source table before loading.
2. Using Column Quality and data profiling to check the quality of the data.
3. Checking columns for valid, empty or error values.
4. Promoting the first row to column headers where required.
5. Reviewing column names and structure.
6. Assigning the correct data types to each field.
7. Preparing the tables for use within the data model.

This ensured that the dataset was structured consistently before calculations and visualisations were created.

---

##🔗 Data Modelling

The dataset was organised using a star-schema style model, with the central enrolment fact table connected to supporting dimension tables.

Fact Table

Fact_Enrolment

Contains transactional student enrolment and performance information, including:

- Enrolment ID
- Student ID
- Course ID
- Lecturer ID
- Enrolment Date
- Assignment Score
- Exam Score
- Final Mark
- Final Grade
- Attendance %

Dimension Tables

Dim_Student

- Student information
- Fee status
- Study mode
- Study level
- Programme information

Dim_Course

- Course ID
- Course name
- Course type
- Credits
- Subject area

Dim_Lecturer

- Lecturer ID
- Lecturer name
- Academic title
- Department

Dim_Term

- Term ID
- Term name
- Academic year
- Start date
- End date

The dimension tables have one-to-many relationships with "Fact_Enrolment", allowing the dashboard to analyse enrolment and performance from multiple perspectives.

---

##📐 DAX Measures

The following DAX measures were created to support dashboard analysis.

Total Students

Total Students =
COUNT(Dim_Student[StudentID])

Total Enrolments

Total Enrolments =
COUNT(Fact_Enrolment[EnrolmentID])

Total Courses

Total Courses =
COUNT(Dim_Course[CourseID])

Total Lecturers

Total Lecturer =
COUNT(Dim_Lecturer[LecturerID])

Average Student Score

Avg Score of Students =
AVERAGE(Fact_Enrolment[FinalMark])

Average Student Attendance

Avg Student Attendance =
AVERAGE(Fact_Enrolment[AttendancePct])

Total Distinctions

Total Distinctions =
CALCULATE(COUNTROWS(Fact_Enrolment),Fact_Enrolment[FinalMark] >= 75)

Total Distinction Students

Total Distinction Students =
CALCULATE(DISTINCTCOUNT(Fact_Enrolment[StudentID]),Fact_Enrolment[FinalGrade] = "Distinction")

Student Ranking

Rank Student =
RANKX(ALL(Dim_Student[StudentName]),CALCULATE(MAX(Fact_Enrolment[FinalMark])),DESC)

The ranking measure is used to dynamically compare students according to their academic performance.

---

📊 Dashboard Pages

1. Summary Page

The main dashboard provides a high-level overview of university student performance.

Key KPIs include:

- Total Students
- Total Enrolments
- Total Distinctions
- Average Student Score
- Average Student Attendance
- Total Courses

Additional analysis includes:

- Enrolments by course and academic term
- Student numbers by fee status and study mode
- Student distribution by study level
- Lecturer-level enrolment, performance and attendance
- Programme filtering
- Navigation to detailed student performance analysis

The page provides management with a quick overview of both academic performance and student engagement.

---

2. Student & Performance Analysis

The second dashboard page provides more detailed student-level analysis.

The page allows users to investigate:

- Top students by course
- Top students by programme
- Top 10 students by final mark
- Bottom 10 students by final mark
- Students with low attendance

Interactive navigation buttons allow users to move between the different performance views.

This page is designed to help identify both high-performing students and students who may require additional academic or attendance support.

---

💡 Business Questions Answered

The dashboard can be used to answer questions such as:

Enrolment

- Which courses attract the most students?
- Which courses have lower enrolment?
- How do enrolment levels differ between Autumn, Spring and Summer?
- Are particular programmes attracting more students than others?

Academic Performance

- What is the university's overall average final mark?
- How many distinction results have been achieved?
- Which students achieve the highest final marks?
- Which students are performing below their peers?
- Who are the strongest-performing students within individual courses?
- Who are the strongest-performing students within each programme?

Attendance

- What is the overall student attendance rate?
- Which students have low attendance?
- Are there patterns between attendance and academic performance?
- How does average attendance vary between lecturers?

Student Demographics

- How are students distributed between different study levels?
- What is the split between full-time and part-time students?
- How does the student population differ between home and international fee status?

Lecturer Performance

- How many enrolments are associated with each lecturer?
- What is the average final mark for students taught by each lecturer?
- What is the average attendance rate for each lecturer?

---

##🧭 Dashboard Features

The report includes:

- KPI cards
- Interactive slicers
- Programme filtering
- Bar charts
- Column charts
- Donut charts
- Conditional formatting
- Detailed student tables
- Dynamic DAX ranking
- Page navigation
- Bookmark navigation 
- Student-performance drill-down analysis
- Last refresh information

---
##📌 Summary

This project demonstrates my ability to take raw university data through the complete Power BI development process — from data preparation and modelling through to DAX calculations and interactive dashboard development.The finished report provides both a high-level view of university performance and detailed analysis that can be used to identify enrolment trends, high-performing students, low-performing students and potential attendance concerns.
