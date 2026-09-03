-- 1. Create the database.
create database hospital_management;

-- 2. Import CSV Files
-- Import the patients.csv file into the patients table.
--  Import the doctors.csv file into the doctors table.
-- Import the appointments.csv file into the appointments table.
-- Import the treatments.csv file into the treatments table.
-- Import the billing.csv file into the billing table.
 
 -- 3. Verify Imported Tables
 show tables;
 
 -- 4. Verify Table Structures
 -- the structure of the patients table.
 describe patients;
 
  -- the structure of the doctors table.
  describe doctors;
  
  -- the structure of the appointments table.
  describe appointments;
  
  -- the structure of the treatments table.
  describe treatments;
  
  -- the structure of the billing table.
  describe billing;
  
  -- 5.Preview Imported Data
  select * from patients limit 10;
  select * from doctors limit 10;
  select * from appointments limit 10;
  select * from treatments limit 10;
  select * from billing limit 10;
  
  
  -- 6. Add the appropriate primary key to each imported table.
 -- Change the ID column to an appropriate type
 alter table patients
 modify patient_id varchar(20) not null ;
 -- add primary key
 alter table patients
 add primary key (patient_id);
 -- Verify
 describe patients;
 
 -- Change the ID column to an appropriate type
 alter table doctors 
 modify doctor_id varchar(20) not null;
 -- add primary key
 alter table doctors
 add primary key (doctor_id);
 -- Verify 
 describe doctors;
 
 -- Change the ID column to an appropriate type
 alter table appointments
 modify appointment_id varchar(20) not null,
 modify patient_id varchar(20) not null,
 modify doctor_id varchar(20) not null;
 
  -- add primary key
  alter table appointments
  add primary key (appointment_id);
  -- Verify 
  describe appointments;
  
   -- Change the ID column to an appropriate type
   alter table treatments
   modify treatment_id varchar(20) not null,
   modify appointment_id varchar(20) not null;
   -- add primary key
   alter table treatments
   add primary key(treatment_id);
   -- Verify
   describe treatments;
   
   -- Change the ID column to an appropriate type
   alter table billing
   modify bill_id varchar(20) not null,
   modify patient_id varchar(20) not null,
   modify treatment_id varchar(20) not null;
   
   -- add primary key
   alter table billing
   add primary key(bill_id);
   -- Verify
   describe billing;
   
   -- 7. Add Foreign keys
   -- foreign key to appointments column
   alter table appointments
   add constraint fk_appointment_patient
   foreign key (patient_id)
   references patients(patient_id),
   add constraint fk_appointment_doctor
   foreign key (doctor_id)
   references doctors(doctor_id);
   describe appointments;
   
   -- foreign key to treatments column
   alter table treatments
   add constraint fk_treatment_appointment
   foreign key (appointment_id)
   references appointments(appointment_id);
   describe treatments;
   
   -- foreign key to billing column
   alter table billing
   add constraint fk_billing_patient
   foreign key (patient_id)
   references patients(patient_id),
   add constraint fk_billing_treatment
   foreign key (treatment_id)
   references treatments(treatment_id);
   describe billing;
   
  
   
   
   
   
   
   
   
   
   
   
   
   
  
  
 
 
 
 
 
 
 
  
  
  
  
  
 
 






