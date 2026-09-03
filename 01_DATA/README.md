# Dataset Documentation

## Overview

This directory contains the dataset used for the **Hospital Management SQL Analytics** project.

The dataset represents a synthetic hospital management system and consists of five related datasets covering patient information, doctor information, appointments, treatments, and billing.

The data is used to demonstrate a complete SQL analytics workflow, including data validation, data cleaning, exploratory analysis, aggregation, joins, advanced SQL techniques, views, and stored procedures.

---

## Dataset Structure

The dataset contains the following CSV files:

### `patients.csv`

Contains patient demographic, registration, contact, and insurance information.

### `doctors.csv`

Contains doctor information, including specialization, experience, and hospital branch.

### `appointments.csv`

Contains appointment records linking patients with doctors, along with appointment dates, times, and statuses.

### `treatments.csv`

Contains treatment records associated with patients and doctors, including treatment details and costs.

### `billing.csv`

Contains billing and payment information associated with patients and treatments.

---

## Data Relationships

The datasets are connected through key identifiers:

* `patient_id` — links patients with appointments, treatments, and billing records.
* `doctor_id` — links doctors with appointments and treatments.
* `treatment_id` — links treatments with billing records.

These relationships enable relational analysis across multiple tables using SQL joins.

---

## Data Preparation

Before analysis, the datasets were imported into MySQL and subjected to validation and cleaning.

The preparation process included:

* Identifying missing values
* Checking duplicate records and IDs
* Validating primary and foreign key relationships
* Identifying invalid patient and doctor references
* Standardizing categorical values
* Removing unnecessary whitespace
* Converting date and time fields to appropriate data types
* Validating numeric fields
* Handling inconsistent or invalid values

The cleaned data was then used for the subsequent SQL analysis stages.

---

## Analytical Use

The dataset supports analysis across the following areas:

* Patient demographics and registration
* Doctor specializations and experience
* Appointment activity and status
* Treatment frequency and costs
* Billing amounts and payment methods
* Patient, doctor, treatment, and billing relationships

---

## Dataset Source

The dataset was obtained from **Kaggle**.

**Source:** [Kaggle Hospital Management Dataset — (https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset)]

---

## Dataset Disclaimer

This dataset is **synthetic** and is intended for educational, practice, and portfolio development purposes.

It does not contain real patient information and should not be used for medical, clinical, or healthcare decision-making.

---

## Related Project Files

The dataset is used by the SQL scripts located in the [`sql`](../sql) directory.

The SQL workflow progresses through:

```text
Database Setup
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


