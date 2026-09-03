# SQL Analysis

This folder contains all SQL scripts developed for the **Hospital Management SQL Analytics** project.

The SQL analysis follows a structured workflow, beginning with database setup and data validation and progressing through data cleaning, exploratory analysis, advanced SQL techniques, views, and stored procedures.

---

##  SQL File Structure

```text
sql/
│
├── 01_database_setup.sql
├── 02_data_validation.sql
├── 03_data_cleaning.sql
├── 04_basic_analysis.sql
├── 05_aggregate_analysis.sql
├── 06_join_analysis.sql
├── 07_advanced_analysis.sql
├── 08_views.sql
├── 09_stored_procedures.sql
└── README.md
```

---

# 01 — Database Setup

**File:** `01_database_setup.sql`

This file contains the initial database setup required for the project.

### Includes

* Creating the `hospital_management` database.
* Selecting the database.
* Creating the required tables.
* Defining appropriate data types.
* Identifying primary keys.
* Defining foreign key relationships.
* Adding required constraints.
* Verifying table structures.
* Checking imported record counts.

### Main Tables

```text
patients
doctors
appointments
treatments
billing
```

### Key Relationships

```text
patients.patient_id
        ↓
appointments.patient_id

doctors.doctor_id
        ↓
appointments.doctor_id

appointments.appointment_id
        ↓
treatments.appointment_id

patients.patient_id
        ↓
billing.patient_id

treatments.treatment_id
        ↓
billing.treatment_id
```

---

# 02 — Data Validation

**File:** `02_data_validation.sql`

This file focuses on checking the quality and consistency of the imported dataset before analysis.

## Validation Areas

### Record Validation

* Check the total number of records in each table.
* Compare imported records with the source CSV files.

### Primary Key Validation

* Check for NULL primary keys.
* Check for duplicate IDs.
* Verify that identifiers are unique.

### Duplicate Validation

* Identify duplicate complete records.
* Identify duplicate records based on important identifiers.

### NULL Validation

Check for missing values in important columns, including:

* Patient information
* Doctor information
* Appointment information
* Treatment information
* Billing information

### Foreign Key Validation

Check for invalid references between related tables.

Examples:

* Appointments referencing non-existing patients.
* Appointments referencing non-existing doctors.
* Treatments referencing non-existing appointments.
* Billing records referencing non-existing patients.
* Billing records referencing non-existing treatments.

### Data Type Validation

Check whether columns contain appropriate values for their intended data types.

Examples:

* Dates
* Times
* Numeric values
* IDs
* Categorical values

---

# 03 — Data Cleaning

**File:** `03_data_cleaning.sql`

This file contains SQL queries used to prepare the dataset for analysis.

## Cleaning Activities

### Text Cleaning

Remove unnecessary leading and trailing spaces using:

```sql
TRIM()
```

### Standardizing Gender

Standardize inconsistent gender values into a consistent format.

Example:

```text
M
Male
m
male
```

can be standardized to:

```text
Male
```

Similarly:

```text
F
Female
f
female
```

can be standardized to:

```text
Female
```

### Standardizing Specializations

Clean and standardize doctor specialization values.

### Standardizing Appointment Status

Ensure appointment statuses use consistent values such as:

```text
Scheduled
Completed
Cancelled
No-Show
```

### Standardizing Payment Information

Standardize:

* Payment methods
* Payment statuses

### Date Conversion

Convert text-based date columns into proper SQL `DATE` values.

Examples include:

```text
date_of_birth
registration_date
appointment_date
treatment_date
bill_date
```

### Time Conversion

Convert appointment time values into the SQL `TIME` data type.

Example:

```text
14:30:00
```

### Numeric Validation

Validate and convert numeric fields such as:

* Years of experience
* Treatment cost
* Billing amount

### Missing Values

Identify and handle NULL or missing values where appropriate.

### Data Quality Checks

Validate:

* Invalid dates
* Invalid times
* Negative costs
* Invalid billing amounts
* Invalid years of experience
* Invalid categorical values

---

# 04 — Basic Analysis

**File:** `04_basic_analysis.sql`

This section focuses on fundamental SQL filtering, searching, sorting, and selection techniques.

## SQL Concepts

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

---

##  Patients Analysis

Questions addressed:

1. Display all patient details.
2. Find patients registered after a specified date.
3. Find patients by gender.
4. Find patients from a specific insurance provider.
5. Find patients whose first or last name matches a pattern.
6. Find patients registered within a specified date range.
7. Display unique insurance providers.
8. Display the 10 most recently registered patients.

---

##  Doctors Analysis

Questions addressed:

9. Display all doctor details.
10. Find doctors with a specific specialization.
11. Find doctors with more than a specified number of years of experience.
12. Find doctors working at a specific hospital branch.
13. Find doctors whose name matches a pattern.
14. Display unique specializations.
15. Display the 10 most experienced doctors.

---

##  Appointments Analysis

Questions addressed:

16. Display all appointment details.
17. Find scheduled appointments.
18. Find completed appointments.
19. Find cancelled appointments.
20. Find no-show appointments.
21. Find appointments for a specific doctor.
22. Find appointments within a specified date range.
23. Display unique appointment statuses.
24. Display the 10 most recent appointments.

---

##  Treatments Analysis

Questions addressed:

25. Display all treatment details.
26. Find treatments above a specified cost.
27. Find treatments within a specified cost range.
28. Find a specific treatment type.
29. Find treatments matching a specific pattern.
30. Display unique treatment types.
31. Display the 10 most expensive treatments.

---

##  Billing Analysis

Questions addressed:

32. Display all billing details.
33. Find bills above a specified amount.
34. Find bills within a specified amount range.
35. Find bills using a specific payment method.
36. Find bills with a specific payment status.
37. Display unique payment methods.
38. Display unique payment statuses.
39. Display the 10 highest-value bills.

---

# 05 — Aggregate Analysis

**File:** `05_aggregate_analysis.sql`

This section focuses on summarizing data using aggregate functions and grouped analysis.

## SQL Concepts

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

---

##  Patients Analysis

1. What is the total number of patients?
2. How many patients are there by gender?
3. How many patients registered in each year?
4. How many patients are there by insurance provider?
5. How many patients have missing insurance information?

---

##  Doctors Analysis

6. What is the total number of doctors?
7. How many doctors are there by specialization?
8. Which specialization has the most doctors?
9. Which doctors have the highest years of experience?
10. What is the average experience by specialization?
11. How many doctors work at each hospital branch?

---

##  Appointments Analysis

12. What is the total number of appointments?
13. How many appointments are there by status?
14. What percentage of appointments fall under each status?

---

##  Treatments Analysis

15. What is the total treatment cost?
16. What is the average treatment cost?
17. Which treatments are performed most frequently?
18. Which treatments generate the highest total cost?
19. What are the top 10 most expensive treatments?

---

##  Billing Analysis

20. What is the total billed amount?
21. What is the average bill amount?
22. What is the total billing amount by payment method?
23. How many bills are there by payment status?
24. What is the total billed amount by payment status?
25. What are the top 10 highest-value bills?

---

# 06 — Join Analysis

**File:** `06_join_analysis.sql`

This section demonstrates how related tables can be combined to create meaningful multi-table analysis.

## SQL Concepts

```text
INNER JOIN
LEFT JOIN
Multiple-table JOINs
```

---

##  Patients + Appointments

1. Display patient details along with appointment details.
2. Display patient names and their appointment dates.
3. Find patients with their appointment statuses.
4. Find patients who have had multiple appointments.

---

##  Doctors + Appointments

5. Display doctor details along with their appointments.
6. Display doctor names, specializations, and appointment dates.
7. Find doctors with their appointment statuses.
8. Find doctors who have no appointments.

The `LEFT JOIN` approach is important for identifying doctors who do not have matching appointments.

---

##  Patients + Doctors + Appointments

9. Display patient name, doctor name, specialization, appointment date, and appointment status.
10. Display the complete appointment history showing both patient and doctor information.

---

##  Patients + Treatments

11. Display patient details along with their treatment information.
12. Find patients who received a specific treatment.

---

##  Patients + Billing

13. Display patient details along with their billing information.
14. Find patients with their bill amount and payment status.
15. Find patients who have unpaid or pending bills.

---

# 07 — Advanced Analysis

**File:** `07_advanced_analysis.sql`

This section demonstrates advanced SQL techniques for solving more complex analytical questions.

##  Subqueries

Questions addressed:

1. Find doctors whose experience is above the average doctor experience.
2. Find treatments that cost more than the average treatment cost.
3. Find bills that are higher than the average bill amount.
4. Find patients who have more appointments than the average patient.
5. Find the doctor with the highest number of appointments.

---

##  Common Table Expressions

CTEs are used to make complex queries easier to read and manage.

Questions addressed:

6. Calculate appointment counts by doctor using a CTE.
7. Identify doctors whose appointment count is above the average appointment count.
8. Calculate total billing by patient using a CTE.
9. Identify patients whose total billing is above the average patient billing.

Main concept:

```sql
WITH
```

---

##  CASE Statements

`CASE` is used to create meaningful categories from numerical and categorical data.

### Doctor Experience

```text
0–5 years       → Junior
6–15 years      → Experienced
16+ years       → Senior
```

### Treatment Cost

Treatments can be classified into:

```text
Low Cost
Medium Cost
High Cost
```

### Billing Amount

Bills can be classified into:

```text
Low
Medium
High
```

### Appointment Status

Appointment statuses can be transformed into readable analytical categories.

---

##  Window Functions

Window functions are used for ranking and row-level analytical calculations.

Questions addressed:

14. Rank doctors based on their number of appointments.
15. Rank treatments based on treatment cost.
16. Rank patients based on total billing amount.
17. Find the top 3 doctors in each specialization.
18. Assign row numbers to appointments for each patient.

Main concepts:

```text
RANK()
ROW_NUMBER()
PARTITION BY
ORDER BY
```

---

# 08 — Views

**File:** `08_views.sql`

This file contains reusable SQL views created from frequently used queries.

## Views Created

### Patient Information View

Provides a reusable dataset containing patient information.

### Doctor Information View

Provides doctor information along with specialization.

### Patient Appointment View

Combines patient and appointment information.

### Patient-Doctor Appointment View

Combines:

```text
Patient
Doctor
Specialization
Appointment
Status
```

### Patient Billing View

Provides patient billing information.

### Appointment Summary View

Provides summarized appointment information.

### Patient-wise Billing View

Provides billing information summarized at the patient level.

---

# 09 — Stored Procedures

**File:** `09_stored_procedures.sql`

This file demonstrates the use of parameterized stored procedures for reusable SQL operations.

## Procedures Created

### 1. Patient Appointment Procedure

Find appointments for a specific patient.

### 2. Doctor Appointment Procedure

Find appointments for a specific doctor.

### 3. Insurance Provider Procedure

Find patients belonging to a specific insurance provider.

### 4. Doctor Specialization Procedure

Find doctors belonging to a specific specialization.

### 5. Billing Procedure

Find bills above a specified amount.

### 6. Hospital Branch Summary Procedure

Generate summary information for a specific hospital branch.

The procedures demonstrate:

```text
CREATE PROCEDURE
IN Parameters
BEGIN
END
DELIMITER
CALL
```

---

#  SQL Concepts Covered

The complete SQL analysis demonstrates the following concepts:

## Basic SQL

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

## Aggregate Analysis

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
```

## Data Transformation

```text
CASE
TRIM()
Date Conversion
Time Conversion
Data Type Conversion
```

## Joins

```text
INNER JOIN
LEFT JOIN
Multiple-table JOINs
```

## Advanced SQL

```text
Subqueries
CTEs
Window Functions
RANK()
ROW_NUMBER()
PARTITION BY
```

## Database Objects

```text
Views
Stored Procedures
```

## Database Relationships

```text
Primary Keys
Foreign Keys
Constraints
```

---

#  Analysis Workflow

The SQL scripts are designed to be executed in the following order:

```text
01_database_setup.sql
        ↓
02_data_validation.sql
        ↓
03_data_cleaning.sql
        ↓
04_basic_analysis.sql
        ↓
05_aggregate_analysis.sql
        ↓
06_join_analysis.sql
        ↓
07_advanced_analysis.sql
        ↓
08_views.sql
        ↓
09_stored_procedures.sql
```

Following this order ensures that the database is prepared and validated before analytical queries are performed.

---

#  Purpose of This SQL Folder

The purpose of this folder is to demonstrate the complete SQL development and analysis process using a relational healthcare dataset.

The scripts demonstrate the ability to:

* Work with multiple related tables.
* Validate imported data.
* Clean and standardize data.
* Write analytical SQL queries.
* Aggregate and summarize data.
* Combine tables using joins.
* Solve complex problems using subqueries and CTEs.
* Perform ranking using window functions.
* Build reusable views.
* Create parameterized stored procedures.

---

##  Portfolio Skills Demonstrated

This SQL project demonstrates practical skills relevant to a **Data Analyst** role, including:

* SQL querying
* Data cleaning
* Data validation
* Relational database concepts
* Exploratory data analysis
* Aggregation
* Multi-table analysis
* Advanced SQL
* Query organization
* Analytical problem solving
* Database objects
* SQL documentation

---

**Part of the [Hospital Management SQL Analytics](../README.md) portfolio project.**
