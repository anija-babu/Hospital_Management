-- Subqueries

--  1. Doctors whose experience is above average

select * from doctors
where years_experience > (
select avg(years_experience)
from doctors);

-- 2. Treatments costing more than average
select * from treatments
where cost > (select avg(cost) from treatments);

-- 3. Bills higher than average
select * from billing
where amount > (select avg(amount) from billing);

-- 4. Patients who have more appointments than the average patient
select p.patient_id, p.first_name,p.last_name,
count(a.appointment_id) as appointment_count
from patients as p inner join appointments as a
on p.patient_id = a.patient_id
group by p.patient_id,p.first_name,p.last_name
having appointment_count > (select avg(appointment_count) from 
(select patient_id, count(*) as appointment_count from appointments
group by patient_id ) as patient_counts );

-- 5. Doctor with the highest number of appointments
select d.doctor_id,d.first_name,d.last_name,count(a.appointment_id)
as appointment_count from doctors as d inner join appointments as a
on d.doctor_id = a. doctor_id group by d.doctor_id,d.first_name,d.last_name
having appointment_count =(select max(appointment_count) from
 (select doctor_id, count(*) as appointment_count
from appointments group by doctor_id) as doctor_counts);

-- CTEs

-- 6.Calculate appointment counts by doctor using a CTE
with doctor_appointments as (
select doctor_id, count(*) as appointment_count
from appointments group by doctor_id)

select * from doctor_appointments
order by appointment_count desc;

-- 7. Doctors whose appointment count is above average
with doctor_appointments as(
select 
doctor_id,count(*) as appointment_count
from appointments group by doctor_id)

select d.doctor_id,
d.first_name, d.last_name,da.appointment_count
from doctor_appointments as da inner join 
doctors as d on da.doctor_id = d.doctor_id
where da.appointment_count > (select avg(appointment_count)
from doctor_appointments);

-- 8. Calculate total billing by patient

with patient_billing as(
select patient_id, round(sum(amount),2) as total_amount
from billing group by patient_id)

select * from patient_billing
order by total_amount desc;

-- 9.Patients whose total billing is above average

with patient_billing as(
select patient_id, round(sum(amount),2)as total_billing
from billing group by patient_id)

select p.patient_id,
p.first_name,p.last_name,
pb.total_billing
from patients as p inner join 
patient_billing as pb on p.patient_id = pb.patient_id
where pb.total_billing > (select avg(total_billing) from patient_billing)
order by pb.total_billing desc;

-- CASE

-- 10. Categorize doctors based on experience
select doctor_id, first_name,last_name,years_experience,
case 
when years_experience between 0 and 5 then 'Junior'
when years_experience between 6 and 15 then 'Experienced'
when years_experience >= 16 then 'Senior'
else 'unknown'
end as experience_category
from doctors;

-- 11. Categorize treatments based on cost
select treatment_id,treatment_type, cost,
case
when cost < 1000 then 'low cost'
when cost between 1000 and 5000 then 'medium cost'
when cost > 5000 then 'high cost'
else 'unknown'
end as treatment_category
from treatments;

-- 12. Categorize bills based on amount
select bill_id, amount,
case
when amount < 1000 then 'low'
when amount between 1000 and 4000 then 'medium'
when amount >= 4000 then 'high'
else 'unknown'
end as bill_category
from billing;

-- 13. Create a readable appointment status category
select appointment_id,appointment_status,
case
when appointment_status = 'Completed' then 'Completed Appointment'
when appointment_status = 'Scheduled' then 'Upcoming Appointment'
when appointment_status = 'Cancelled' then 'Cancelled Appointment'
when appointment_status = 'No show' then 'Missed Appointment'
else 'Other'
end as status_category
from appointments;

-- WINDOW FUNCTIONS
-- 14. Rank doctors based on number of appointments
select d.doctor_id,d.first_name, d.last_name,
count(a.appointment_id) as appointment_count,
rank() over (
order by count(a.appointment_id) desc) as appointment_rank
from doctors as d inner join appointments as a
on d.doctor_id = a.doctor_id group by
d.doctor_id,d.first_name,d.last_name;

-- 15. Rank treatments based on treatment cost
select treatment_id, treatment_type,cost,
rank()over(order by cost desc) as cost_rank
from treatments;

-- 16. Rank patients based on total billing amount
select p.patient_id,p.first_name,p.last_name,
round(sum(b.amount),2) as total_amount,
rank() over(order by round(sum(b.amount)) desc)
as billing_rank
from patients as p inner join 
billing as b on p.patient_id = b.patient_id
group by p.patient_id, p.first_name,p.last_name;

-- 17. Top 3 doctors in each specialization
select * from(
select d.doctor_id,d.first_name,d.last_name,
d.specialization,d.years_experience,
rank()over(
partition by d.specialization
order by d.years_experience desc) as specialization_rank
from doctors d) as ranked_doctors
where specialization_rank <= 3;

-- 18. Assign row numbers to appointments for each patient
select appointment_id, patient_id, doctor_id,appointment_date,
appointment_status, row_number()over(partition by patient_id 
order by appointment_date) as appointment_number from appointments;





