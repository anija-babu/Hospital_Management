-- PRIMARY / FOREIGN KEY VALIDATION

 -- 1. Check for duplicate patient IDs.
 select patient_id,count(*) as duplicate_count 
 from patients group by patient_id having duplicate_count > 1;
 
 -- 2.  Check for duplicate doctor IDs.
 select doctor_id, count(*) as duplicate_count
 from doctors group by doctor_id having duplicate_count > 1;
 
 -- 3. Check for duplicate appointment IDs.
 select appointment_id, count(*) as duplicate_count
 from appointments group by appointment_id having duplicate_count > 1;
 
 -- 4. Check for duplicate treatment IDs.
 select treatment_id, count(*) as duplicate_count 
 from treatments group by treatment_id having duplicate_count > 1;
 
 -- 5. Check for duplicate biling IDs.
 select bill_id, count(*) as duplicate_count
 from billing group by bill_id having duplicate_count > 1;
 
 -- 6. Check ID NULL Values
 select count(*) as null_patient_id
 from patients 
 where patient_id is null;
 
 select count(*) as null_doctor_id
 from doctors 
 where doctor_id is null;
 
 select count(*) as null_appointments_id 
 from appointments 
 where appointment_id is null;
 
 select count(*) as null_treatment_id
 from treatments 
 where treatment_id is null;
 
 select count(*) as null_bill_id 
 from billing 
 where bill_id is null;

 -- 7.Verify that foreign keys actually match parent records
   
   -- for appointments --> patients
   select a.patient_id,a.appointment_id from appointments as a
   left join patients as p on a.patient_id = p.patient_id
   where p.patient_id is null;
   
   -- for appointments --> doctors
   select a.doctor_id from appointments as a
   left join doctors as d on a.doctor_id = d.doctor_id
   where d.doctor_id is null;
   
  -- for treatments --> appointments
  select t.appointment_id from treatments as t
  left join appointments as a on t.appointment_id = a.appointment_id
  where a.appointment_id is null;
  
  -- for billing --> patients
  select b.patient_id from billing as b
  left join patients as p on b.patient_id = p.patient_id
  where p.patient_id is null;
  
  -- for billing --> treatment
  select b.treatment_id from billing b
  left join treatments as t on b.treatment_id = t.treatment_id
  where t.treatment_id is null;
  
  
  -- PATIENT DATA VALIDATION

describe patients;
select *from patients limit 3;

-- 8. total number of records in the patients table.
  select count(*) as total_patients
  from patients;
  
-- 9.Check for NULL values in important patient information
select 
   sum(patient_id is null) as patient_id_nulls,
   sum(first_name is null) as first_name_nulls,
   sum(last_name is null) as last_name_nulls,
   sum(gender is null) as gender_nulls,
   sum(date_of_birth is null) as dob_nulls,
   sum(contact_number is null) as contact_nulls,
   sum(registration_date is null) as registration_nulls
from patients;

-- 10. check duplicate count in patient table
 select patient_id,first_name, last_name,gender,date_of_birth,contact_number,address,registration_date,
 insurance_provider,insurance_number,email,count(*) as duplicate_count  from patients 
 group by patient_id,first_name, last_name,gender,date_of_birth,contact_number,address,registration_date,
 insurance_provider,insurance_number,email having duplicate_count > 1;
 
 -- DOCTOR DATA VALIDATION
 describe doctors;
 select * from doctors limit 3;
 
 -- 11. total number of records in the doctors table.
select count(*) as total_doctors 
from doctors;

 -- 12.check NULL values in important doctor columns
 select 
    sum(doctor_id is null) as doctor_id_nulls,
    sum(first_name is null) as first_name_nulls,
    sum(last_name is null) as last_name_nulls,
    sum(specialization is null) as specialization_nulls,
    sum(phone_number is null) as phone_nulls,
    sum(years_experience is null) as years_experience,
    sum(hospital_branch is null) as hospital_branch
from doctors;

-- 13.check duplicate records in doctor table
 select doctor_id,first_name,last_name,specialization,phone_number,years_experience,
hospital_branch,email,count(*) as duplicate_count from doctors group by doctor_id,first_name,last_name,
specialization,phone_number,years_experience,
hospital_branch,email having duplicate_count >1;


-- APPOINTMENT DATA VALIDATION

describe appointments;
select * from appointments limit 3;

-- 14. total number of records in the appointments table.
select count(*) as total_appointments 
from appointments;

-- 15. check null values in appointments
select 
   sum(appointment_id is null) as appointment_id_null,
   sum(patient_id is null) as patient_id_null,
   sum(doctor_id is null) as doctor_id_null,
   sum(appointment_date is null) as appointment_date_null,
   sum(appointment_time is null) as appointment_time_null,
   sum(reason_for_visit is null) as reason_null,
   sum(appointment_status is null) as status_null
from appointments;

-- 16. check duplicate records in appointment table
   
select appointment_id,patient_id,doctor_id,appointment_date,appointment_time,
reason_for_visit, appointment_status,count(*) as duplicate_count 
from appointments group by appointment_id,patient_id,doctor_id,appointment_date,appointment_time,
reason_for_visit, appointment_status having duplicate_count>1;


-- TREATMENT DATA VALIDATION
describe treatments;
select * from treatments limit 3;


-- 17. total number of records in the treatments table.
 select count(*) as total_treatments 
 from treatments;
 
-- 18. check null values in treatments
select 
   sum(treatment_id is null) as treatment_id_null,
   sum(appointment_id is null) as appointment_id_null,
   sum(treatment_type is null) as treatment_type_null,
   sum(description is null) as description_null,
   sum(cost is null) as cost_null,
   sum(treatment_date is null) as date_null
from treatments;

-- 19. check duplicate records in treatment table
select treatment_id,appointment_id,treatment_type,description,
cost,treatment_date,count(*) as duplicate_count 
from treatments group by treatment_id,appointment_id,treatment_type,description,
cost,treatment_date having duplicate_count>1;


-- BILLING DATA VALIDATION

describe billing;
select * from billing limit 2;

-- 20. total number of records in the billing table.
  select count(*) as total_billing 
  from billing;
  
--  21. check null values in treatments
select
   sum(bill_id is null) as bill_id_null,
   sum(patient_id is null) as patient_id_null,
   sum(treatment_id is null) as treatment_id_null,
   sum(bill_date is null) bill_date_null,
   sum(amount is null) amount_null,
   sum(payment_method is null) payment_method_null,
   sum(payment_status is null) status_null
from billing;

-- 22. check duplicate records in billing
select bill_id,patient_id,treatment_id,bill_date,amount,payment_method,
payment_status,count(*) as duplicate_count from billing 
group by bill_id,patient_id,treatment_id,bill_date,amount,payment_method,
payment_status having duplicate_count > 1;


   

  

  

 

   
   



	


   



 
 
 

 

  