-- 1. View containing complete patient information
create view patient_information as
select patient_id,first_name,last_name,
gender,date_of_birth,contact_number,address,
registration_date,insurance_provider,insurance_number,
email from patients;

-- check view
select * from patient_information;

-- 2. View containing doctor information and specialization
create view doctor_information as
select doctor_id,first_name,last_name,
specialization,phone_number,years_experience,hospital_branch,
email from doctors;

-- check view
select * from doctor_information;

-- 3. View combining patients and appointments
create view patient_appointments as
select p.patient_id, p.first_name as patient_first_name,
p.last_name as patient_last_name, a.appointment_id,a.doctor_id,
a.appointment_date,a.appointment_time,a.appointment_status
from patients as p inner join appointments as a 
on p.patient_id = a.patient_id;

-- check view
select * from patient_appointments;

-- 4. View combining patients, doctors, and appointments
create view complete_appointments as
select a.appointment_id,a.appointment_date,
a.appointment_time,a.appointment_status,
p.patient_id,p.first_name as patient_first_name,
p.last_name as patient_last_name,d.doctor_id,
d.first_name as doctor_first_name,
d.last_name as doctor_last_name,
d.specialization
from appointments as a inner join
patients as p on a.patient_id = p.patient_id
inner join doctors as d on a.doctor_id= d.doctor_id;

-- check view
select * from complete_appointments;

-- 5. View containing patient billing information
create view patient_billing as
select p.patient_id,p.first_name,
p.last_name, b.bill_id,b.bill_date,
b.amount,b.payment_method,b.payment_status
from patients as p inner join billing as b 
on p.patient_id = b.patient_id;

-- check view
select * from patient_billing;

-- 6. View showing appointment summary information
create view appointment_summary as
select appointment_status,count(*) as appointment_count
from appointments group by appointment_status;

-- check view
select * from appointment_summary;

-- 7. View showing patient-wise billing information
create view patients_billing_summary as 
select p.patient_id,p.first_name,p.last_name,
count(b.bill_id) as bill_count, 
round(sum(b.amount),2) as total_billing,
round(avg(b.amount),2) as avg_bill_amount
from patients as p inner join billing as b
on p.patient_id=b.patient_id group by 
p.patient_id,p.first_name,p.last_name;

-- check view
select * from patients_billing_summary;

