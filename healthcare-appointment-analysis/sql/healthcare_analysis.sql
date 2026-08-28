-- ============================================================
-- Healthcare Appointment Analysis
-- Tool: Databricks SQL
-- Database: workspace.healthcaredb
-- Purpose:
-- Analyse appointment activity, attendance, waiting times,
-- departmental performance, doctor workload, costs,
-- follow-up requirements and appointment outcomes.
-- ============================================================


-- ============================================================
-- 1. OVERALL APPOINTMENT ACTIVITY
-- Business question:
-- What is the overall volume of appointments and patients?
-- ============================================================

SELECT COUNT(*) AS TotalAppointments
FROM workspace.healthcaredb.fact_appointment;

SELECT COUNT(DISTINCT PatientID) AS UniquePatients
FROM workspace.healthcaredb.fact_appointment;

-- Answer:
-- Total appointments: 110
-- Unique patients with at least one appointment: 24


-- ============================================================
-- 2. ATTENDANCE PERFORMANCE
-- Business question:
-- How are appointments distributed by status, and what are
-- the overall attendance, DNA and cancellation rates?
-- ============================================================

SELECT Status, COUNT(*) AS NumberOfAppointments
FROM workspace.healthcaredb.fact_appointment
GROUP BY Status
ORDER BY NumberOfAppointments DESC;

SELECT ROUND(100 * SUM(CASE WHEN Status = 'Attended' THEN 1 ELSE 0 END) / COUNT(*),2) AS AttendanceRate
FROM workspace.healthcaredb.fact_appointment;

SELECT ROUND(100 * SUM(CASE WHEN Status = 'Did Not Attend' THEN 1 ELSE 0 END) / COUNT(*),2) AS DNARate
FROM workspace.healthcaredb.fact_appointment;

SELECT ROUND(100 * SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*),2) AS CancellationRate
FROM workspace.healthcaredb.fact_appointment;

-- Answer / Insight:
-- Attended: 90 appointments
-- Did Not Attend: 13 appointments
-- Cancelled: 7 appointments
-- Attendance rate: 81.82%
-- DNA rate: 11.82%
-- Cancellation rate: 6.36%
-- DNA was a larger issue than cancellation.


-- ============================================================
-- 3. WAITING TIME AND APPOINTMENT DURATION
-- Business question:
-- What are the typical patient waiting time and appointment
-- duration across the service?
-- ============================================================

SELECT
    ROUND(AVG(WaitMinutes), 2) AS AverageWaitMinutes,
    ROUND(AVG(DurationMinutes), 2) AS AverageAppointmentDuration
FROM workspace.healthcaredb.fact_appointment;

-- Answer:
-- Average wait time: 39.63 minutes.
-- Average appointment duration: 34.91 minutes.


-- ============================================================
-- 4. DEPARTMENT PERFORMANCE
-- Business question:
-- Which departments handle the most appointments, how do
-- waiting times vary, and where are attendance issues highest?
-- ============================================================

WITH DepartmentSummary AS 
(SELECT d.DepartmentName,COUNT(*) AS TotalAppointments,
ROUND(100 * SUM(CASE WHEN f.Status = 'Attended' THEN 1 ELSE 0 END) / COUNT(*),2) AS AttendanceRate,
ROUND(100 * SUM(CASE WHEN f.Status = 'Did Not Attend' THEN 1 ELSE 0 END) / COUNT(*),2) AS DNARate,
ROUND(AVG(f.WaitMinutes), 2) AS AverageWaitMinutes,
ROUND(SUM(f.AppointmentCost), 2) AS TotalAppointmentCost
FROM workspace.healthcaredb.fact_appointment f
JOIN workspace.healthcaredb.dim_department d
ON f.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName)
SELECT *
FROM DepartmentSummary
ORDER BY TotalAppointments DESC;

-- Answer / Insight:
-- Orthopaedics had the highest appointment volume (35), the highest
-- attendance rate (85.71%), the longest average wait (42.06 minutes),
-- and the highest total appointment cost (£2,855).
-- Dermatology had the lowest attendance rate (78.26%).
-- Cardiology had the shortest average wait (35.68 minutes).
-- General Medicine had the highest DNA rate (14.81%).
-- Department-level average costs were relatively similar, suggesting
-- Orthopaedics' higher total cost was mainly associated with volume.


-- ============================================================
-- 5. APPOINTMENT TYPE PERFORMANCE
-- Business question:
-- Which appointment types are most common and how do their
-- attendance and cost patterns compare?
-- ============================================================

SELECT AppointmentType,COUNT(*) AS TotalAppointments,
SUM(CASE WHEN Status = 'Attended' THEN 1 ELSE 0 END) AS AttendedAppointments,
SUM(CASE WHEN Status = 'Did Not Attend' THEN 1 ELSE 0 END) AS DNAAppointments,
SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledAppointments,
ROUND(100 * SUM(CASE WHEN Status = 'Did Not Attend' THEN 1 ELSE 0 END) / COUNT(*),2) AS DNARate,
ROUND(AVG(AppointmentCost), 2) AS AverageAppointmentCost,
ROUND(SUM(AppointmentCost), 2) AS TotalAppointmentCost
FROM workspace.healthcaredb.fact_appointment
GROUP BY AppointmentType
ORDER BY TotalAppointments DESC;

-- Answer / Insight:
-- Follow Up was the most common appointment type with 43 appointments,
-- followed by Routine Check (36), New Patient (24), and Urgent (7).
-- Follow Up generated the highest total cost (£3,400), largely because
-- it had the highest volume.
-- New Patient had the highest average appointment cost (£86.46).


-- ============================================================
-- 6. PATIENT PRIORITY GROUP
-- Business question:
-- How do appointment volume, waiting time and DNA rates differ
-- between patient priority groups?
-- ============================================================

SELECT p.PriorityGroup,COUNT(*) AS TotalAppointments,
ROUND(AVG(f.WaitMinutes), 2) AS AverageWaitMinutes,
ROUND(100 * SUM(CASE WHEN f.Status = 'Did Not Attend' THEN 1 ELSE 0 END) / COUNT(*),2) AS DNARate
FROM workspace.healthcaredb.fact_appointment f
JOIN workspace.healthcaredb.dim_patient p
ON f.PatientID = p.PatientID
GROUP BY p.PriorityGroup
ORDER BY TotalAppointments DESC;

-- Answer / Insight:
-- Standard: 87 appointments, average wait approximately 40.0 minutes.
-- Priority: 23 appointments, average wait approximately 38.3 minutes.
-- Standard patients accounted for most appointment activity, while
-- average waiting times were broadly similar between the two groups.
-- The SQL result also calculates DNA rate by priority group for direct
-- comparison without implying that priority status caused the difference.


-- ============================================================
-- 7. APPOINTMENT TRENDS OVER TIME
-- Business question:
-- How does appointment activity change over time and between
-- weekdays and weekends?
-- ============================================================

SELECT d.Year,d.MonthNumber,d.MonthName,COUNT(*) AS TotalAppointments
FROM workspace.healthcaredb.fact_appointment f
JOIN workspace.healthcaredb.dim_date d
ON f.DateKey = d.DateKey
GROUP BY d.Year, d.MonthNumber, d.MonthName
ORDER BY d.Year, d.MonthNumber;

SELECT CASE WHEN d.IsWeekend = true THEN 'Weekend'ELSE 'Weekday'END AS DayType,
COUNT(*) AS TotalAppointments,
ROUND(AVG(f.WaitMinutes), 2) AS AverageWaitMinutes,
ROUND(100 * SUM(CASE WHEN f.Status = 'Did Not Attend' THEN 1 ELSE 0 END) / COUNT(*),2) AS DNARate
FROM workspace.healthcaredb.fact_appointment f
JOIN workspace.healthcaredb.dim_date d
ON f.DateKey = d.DateKey
GROUP BY CASE WHEN d.IsWeekend = true THEN 'Weekend'ELSE 'Weekday'END;

-- Answer:
-- The result compares weekday and weekend appointment volume,
-- average waiting time and DNA rate to identify operational differences
-- between the two day types.


-- ============================================================
-- 8. APPOINTMENT COST ANALYSIS
-- Business question:
-- Which departments and appointment types generate the highest
-- appointment costs?
-- ============================================================

SELECT d.DepartmentName,COUNT(*) AS TotalAppointments,
ROUND(AVG(f.AppointmentCost), 2) AS AverageAppointmentCost,
ROUND(SUM(f.AppointmentCost), 2) AS TotalAppointmentCost
FROM workspace.healthcaredb.fact_appointment f
JOIN workspace.healthcaredb.dim_department d
ON f.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalAppointmentCost DESC;

SELECT AppointmentType,COUNT(*) AS TotalAppointments,
ROUND(AVG(AppointmentCost), 2) AS AverageAppointmentCost,
ROUND(SUM(AppointmentCost), 2) AS TotalAppointmentCost
FROM workspace.healthcaredb.fact_appointment
GROUP BY AppointmentType
ORDER BY TotalAppointmentCost DESC;

-- Answer / Insight:
-- By department:
-- Orthopaedics generated the highest total appointment cost: £2,855.
-- Average costs per appointment were relatively similar across
-- departments, so Orthopaedics' higher total cost was mainly associated
-- with its higher appointment volume.
--
-- By appointment type:
-- Follow Up: 43 appointments, £79.07 average cost, £3,400 total cost.
-- Routine Check: 36 appointments, £85.42 average cost, £3,075 total cost.
-- New Patient: 24 appointments, £86.46 average cost, £2,075 total cost.
-- Urgent: 7 appointments, £72.14 average cost, £505 total cost.
-- Follow Up generated the highest total cost, while New Patient had
-- the highest average cost per appointment.


-- ============================================================
-- 9. FOLLOW-UP REQUIREMENTS AND OUTCOMES
-- Business question:
-- How often is follow-up required and what outcomes are
-- recorded after appointments?
-- ============================================================

SELECT FollowUpRequired,COUNT(*) AS TotalAppointments,
ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (),2) AS PercentageOfAppointments
FROM workspace.healthcaredb.fact_appointment
GROUP BY FollowUpRequired;

SELECT COALESCE(Outcome, 'No Outcome Recorded') AS Outcome,COUNT(*) AS TotalAppointments
FROM workspace.healthcaredb.fact_appointment
GROUP BY COALESCE(Outcome, 'No Outcome Recorded')
ORDER BY TotalAppointments DESC;

-- Answer / Insight:
-- Follow-up required:
-- Yes: 36 appointments (32.73%)
-- No: 74 appointments (67.27%)
--
-- Recorded outcomes:
-- Medication Prescribed: 30
-- Discharged: 24
-- Follow Up Booked: 22
-- No Outcome Recorded: 20
-- Tests Requested: 14
--
-- 20 appointments had no recorded outcome. This was treated as a
-- data-quality / record-completeness issue rather than a clinical outcome.


-- ============================================================
-- 10. DATA QUALITY CHECKS
-- Purpose:
-- Validate uniqueness of appointment IDs and identify missing
-- key fields or incomplete outcome records.
-- ============================================================

SELECT AppointmentID,COUNT(*) AS DuplicateCount
FROM workspace.healthcaredb.fact_appointment
GROUP BY AppointmentID
HAVING COUNT(*) > 1;

SELECT
    SUM(CASE WHEN AppointmentID IS NULL THEN 1 ELSE 0 END) AS MissingAppointmentID,
    SUM(CASE WHEN PatientID IS NULL THEN 1 ELSE 0 END) AS MissingPatientID,
    SUM(CASE WHEN DoctorID IS NULL THEN 1 ELSE 0 END) AS MissingDoctorID,
    SUM(CASE WHEN DepartmentID IS NULL THEN 1 ELSE 0 END) AS MissingDepartmentID,
    SUM(CASE WHEN DateKey IS NULL THEN 1 ELSE 0 END) AS MissingDateKey,
    SUM(CASE WHEN Outcome IS NULL THEN 1 ELSE 0 END) AS MissingOutcome
FROM workspace.healthcaredb.fact_appointment;

-- Answer / Insight:
-- The analysis identified 20 missing Outcome values.
-- Missing outcomes were retained and labelled "No Outcome Recorded"
-- in the reporting layer so the data-quality issue remained visible.
