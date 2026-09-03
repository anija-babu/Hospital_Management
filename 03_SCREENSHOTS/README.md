# Screenshots

This folder contains screenshots that provide visual evidence of the SQL analysis performed in the **Hospital Management SQL Analytics** project.

## Contents

### ER Diagram

**File:** `er_diagram.png`

Entity Relationship Diagram showing the database structure and relationships between the five database tables:

* Patients
* Doctors
* Appointments
* Treatments
* Billing

### Query 01 — Patient Gender Analysis

**File:** `query_01_patient_gender.png`

Shows the distribution of patients by gender.

### Query 02 — Doctor Workload Analysis

**File:** `query_02_doctor_workload.png`

Shows the doctor appointment workload based on the number of appointments handled by each doctor.

### Query 03 — Appointment Status Analysis

**File:** `query_03_appointment_status.png`

Shows the distribution of appointments based on their status, such as Scheduled, Completed, Cancelled, and No-Show.

### Query 04 — Patient Details

**File:** `query_04_patient_details.png`

Shows patient details along with their treatment information using related database tables.

### Query 05 — Doctor Ranking

**File:** `query_05_doctor_ranking.png`

Shows doctor rankings based on appointment volume using SQL window functions.

## ER Diagram

The ER diagram shows the database structure and relationships between:

* `patients`
* `doctors`
* `appointments`
* `treatments`
* `billing`

It demonstrates how the tables are connected using **Primary Keys and Foreign Keys**.

## Query Results

The query result screenshots correspond to selected business questions highlighted in the main project README.

These screenshots provide a visual representation of the results generated using **MySQL Workbench**.

## Screenshot Folder Structure

```text
screenshots/
│
├── README.md
├── er_diagram.png
├── query_01_patient_gender.png
├── query_02_doctor_workload.png
├── query_03_appointment_status.png
├── query_04_patient_details.png
└── query_05_doctor_ranking.png
```

**Tool Used:** MySQL Workbench
