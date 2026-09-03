# Hospital Management SQL Analytics

A SQL-based data analytics project using a synthetic Hospital Management dataset to analyze **patients, doctors, appointments, treatments, and billing**.

The project demonstrates a complete SQL workflow, from **data validation and cleaning to analysis using basic SQL, aggregate functions, joins, subqueries, CTEs, CASE statements, window functions, views, and stored procedures**.

---

##  Project Overview

The goal of this project is to explore hospital-related data and generate meaningful insights using SQL.

The analysis focuses on:

* Patient demographics and registration
* Doctor specializations and experience
* Appointment activity and status
* Treatment frequency and cost
* Billing amounts and payment status
* Relationships between patients, doctors, appointments, treatments, and billing

This project was created as part of my **SQL and Data Analytics portfolio** to demonstrate practical SQL skills using a relational dataset.

---

##  Project Objectives

* Import and validate CSV data.
* Identify and handle data quality issues.
* Clean and standardize the dataset.
* Perform basic and aggregate analysis.
* Analyze data across multiple related tables.
* Use advanced SQL techniques for deeper analysis.
* Create reusable SQL views.
* Create parameterized stored procedures.
* Document the complete SQL analysis workflow.

---

##  Dataset

The project uses a **synthetic Hospital Management dataset** containing five CSV files:

```text
patients.csv
doctors.csv
appointments.csv
treatments.csv
billing.csv
```

### Main Data Areas

Patients: 
Patient demographic, registration, and insurance information.

Doctors:
Doctor specialization, experience, and hospital branch information.

Appointments:
Patient appointments, dates, times, and appointment statuses.

Treatments:
Treatment types, dates, and treatment costs.

Billing:
Bill amounts, payment methods, and payment statuses.

---

##  Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* **SQL**
* **CSV**
* **GitHub**

---

##  Project Workflow

```text
CSV Dataset
     ↓
Data Import
     ↓
Data Validation
     ↓
Data Cleaning
     ↓
Basic Analysis
     ↓
Aggregate Analysis
     ↓
Join Analysis
     ↓
Advanced Analysis
     ↓
Views
     ↓
Stored Procedures
```

---

## SQL Analysis

### 01 — Database Setup

Database and table setup, including:

* Database creation
* Table creation
* Primary keys
* Foreign keys
* Constraints
* Data import verification

### 02 — Data Validation

Checks for:

* Record counts
* Duplicate records
* NULL values
* Primary key issues
* Foreign key issues
* Invalid references
* Invalid dates and numeric values

### 03 — Data Cleaning

Includes:

* Handling missing values
* Removing unnecessary spaces
* Standardizing categorical values
* Converting date and time data types
* Validating numeric fields
* Correcting data quality issues

### 04 — Basic Analysis

Uses SQL filtering and sorting techniques such as:

```text
SELECT
WHERE
AND
OR
IN
BETWEEN
LIKE
IS NULL
DISTINCT
ORDER BY
LIMIT
```

Analysis covers patients, doctors, appointments, treatments, and billing.

### 05 — Aggregate Analysis

Uses:

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
CASE
```

The analysis includes patient counts, doctor statistics, appointment status, treatment costs, and billing summaries.

### 06 — Join Analysis

Combines information from multiple related tables using:

```text
INNER JOIN
LEFT JOIN
Multiple-table JOINs
```

Examples include:

* Patients with appointments
* Doctors with appointments
* Patients with treatments
* Patients with billing
* Patient-doctor appointment history

### 07 — Advanced Analysis

Uses advanced SQL techniques including:

```text
Subqueries
CTEs
CASE
RANK()
ROW_NUMBER()
PARTITION BY
```

Examples include:

* Doctors above average experience
* Treatments above average cost
* Patients with above-average appointments
* Doctor appointment rankings
* Patient billing rankings
* Top doctors within each specialization

### 08 — Views

Creates reusable views for:

* Patient information
* Doctor information
* Appointment information
* Patient-doctor appointments
* Billing information
* Patient-wise billing summaries

### 09 — Stored Procedures

Creates reusable procedures for tasks such as:

* Finding appointments for a patient
* Finding appointments for a doctor
* Finding patients by insurance provider
* Finding doctors by specialization
* Finding high-value bills
* Summarizing a hospital branch

---

##  Repository Structure

```text
hospital-management-sql/
│
├── README.md
│
├── data/
│   |── patients.csv
│   ├── doctors.csv
│   ├── appointments.csv
│   ├── treatments.csv
│   ├── billing.csv
│   └── README.md
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_basic_analysis.sql
│   ├── 05_aggregate_analysis.sql
│   ├── 06_join_analysis.sql
│   ├── 07_advanced_analysis.sql
│   ├── 08_views.sql
│   ├── 09_stored_procedures.sql
│   └── README.md
│
└── screenshots/
    ├── README.md
    ├── query_01_patient_gender.png
    ├── query_02_doctor_workload.png
    ├── query_03_appointment_status.png
    ├── query_04_patient_treatment_information.png
    └── query_05_doctor_ranking.png
```

---

##  Screenshots

Selected SQL analysis results are included in the `screenshots` folder.

The screenshots demonstrate:

* Patient gender analysis
* Doctor workload analysis
* Appointment status analysis
* Patient treatment information analysis
* Doctor ranking using window functions

---

##  SQL Skills Demonstrated

This project demonstrates practical experience with:

* Data validation
* Data cleaning
* SELECT and filtering
* Sorting and limiting
* Aggregate functions
* GROUP BY and HAVING
* CASE statements
* INNER JOIN
* LEFT JOIN
* Subqueries
* Common Table Expressions (CTEs)
* Window functions
* RANK()
* ROW_NUMBER()
* PARTITION BY
* Primary and foreign keys
* Views
* Stored procedures

---

##  How to Use

### 1. Open MySQL Workbench

Connect to your MySQL server.

### 2. Create the Database

Run the database setup script:

```sql
CREATE DATABASE hospital_management;

USE hospital_management;
```

### 3. Import the CSV Files

Import:

```text
patients.csv
doctors.csv
appointments.csv
treatments.csv
billing.csv
```

### 4. Run the SQL Files

Execute the files in order:

```text
01_database_setup.sql
02_data_validation.sql
03_data_cleaning.sql
04_basic_analysis.sql
05_aggregate_analysis.sql
06_join_analysis.sql
07_advanced_analysis.sql
08_views.sql
09_stored_procedures.sql
```

Detailed analysis questions and SQL queries are available inside the `sql` folder.

---



## Author

**Anija Babu**

SQL & Data Analytics Portfolio Project
