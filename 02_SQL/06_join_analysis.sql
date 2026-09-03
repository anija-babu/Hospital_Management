-- Patients + Appointments

-- 01.Display patient details along with appointment details
select p.patient_id,p.first_name,p.last_name,
a.appointment_id,a.appointment_date,a.appointment_time,
a.appointment_status from patients as p inner join
appointments as a on p.patient_id = a.patient_id;

-- 02.Find patients who have had multiple appointments
select p.patient_id, p.first_name,p.last_name,
count(a.appointment_id) as appointment_count
from patients as p inner join appointments as a
on p.patient_id = a.patient_id
group by p.patient_id,p.first_name,p.last_name having appointment_count > 1
order by appointment_count desc;

-- Doctors + Appointments

-- 03. Display doctor details along with appointments
select d.doctor_id,d.first_name,d.last_name,d.specialization,
a.appointment_id,a.appointment_date,a.appointment_status
from doctors as d inner join appointments as a
on d.doctor_id = a.doctor_id;

-- 04. Find doctors who have no appointments
select d.doctor_id,d.first_name,d.last_name,
d.specialization from doctors as d 
left join appointments as a on d.doctor_id = a.doctor_id
where a.appointment_id is null;

-- Patients + Doctors + Appointments

-- 05. Display patient name, doctor name, specialization,
-- appointment date, and appointment status

select p.patient_id,p.first_name as patient_first_name,p.last_name as patient_last_name,
d.doctor_id,d.first_name as doctor_first_name,d.last_name as doctor_last_name,d.specialization,
a.appointment_date, a.appointment_status 
from patients as p inner join appointments as a
on p.patient_id = a.patient_id
inner join doctors as d on 
d.doctor_id = a.doctor_id;

-- 06. Complete appointment history
select a.appointment_id,a.appointment_date,a.appointment_time,
a.appointment_status,p.patient_id,p.first_name as patient_first_name,
p.last_name as patient_last_name,d.doctor_id,d.first_name as doctor_first_name,
d.last_name as doctor_last_name,d.specialization
from appointments as a inner join patients as p 
on a.patient_id = p.patient_id
inner join doctors as d 
on a.doctor_id = d.doctor_id
order by a.appointment_date desc;

-- Patients + Treatments

-- 07. Display patient details along with treatment information

select p.patient_id,p.first_name,p.last_name,
t.treatment_id,t.treatment_type,t.cost,t.treatment_date
from patients as p inner join appointments as a
on p.patient_id = a.patient_id
inner join treatments as t on a.appointment_id = t.appointment_id;

-- 08. Find patients who received physiotherapy

select p.patient_id, p.first_name,p.last_name,t.treatment_type
from patients as p inner join appointments as a
on p.patient_id = a.patient_id
inner join treatments as t on a.appointment_id = t.appointment_id
where t.treatment_type = 'Physiotherapy';

-- Patients + Billing

-- 09. Display patient details along with billing information
select p.patient_id, p.first_name,p.last_name,
b.bill_id,b.bill_date,b.amount, b.payment_method,
b.payment_status from patients as p 
inner join billing as b 
on p.patient_id = b.patient_id;

