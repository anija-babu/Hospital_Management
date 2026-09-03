-- PATIENT ANALYSIS

-- 1. Total number of patients are registered in the hospital

select count(*) as total_number 
from patients;

-- 2.How many patients are there in each gender category

select gender,count(*) as patient_count from patients
group by gender;

-- 3.How many patients registered in the hospital each year

select year(registration_date) as registration_year,
count(*) as patient_count
from patients group by year(registration_date)
order by registration_year;

-- 4. How many patients are covered by each insurance provider

select insurance_provider,count(*) as patient_count
from patients group by insurance_provider order by patient_count desc;

-- 5. Patients with Missing Insurance Information

select * from patients
where insurance_number is null or insurance_provider is null;

-- DOCTORS ANALYSIS

-- 6. Total Number of Doctors

select count(*) as total_doctors 
from doctors;

-- 7. How many doctors are available in each medical specialization

select specialization, count(*) as doctor_count
from doctors group by specialization;

-- 8. Which medical specialization has the highest number of doctors

select specialization, count(*) as doctor_count
from doctors group by specialization order by doctor_count desc limit 1;

-- 9. Which doctors have the most years of professional experience

select * from doctors
order by years_experience desc limit 3;

-- 10. What is the average years of experience for doctors in each specialization

select specialization, round(avg(years_experience),2) as avg_experience
from doctors group by specialization;

-- APPOINTMENTS ANALYSIS

-- 11. How many appointments are scheduled, completed, cancelled, and marked as no-show

select appointment_status, count(*) as status_count
from appointments group by appointment_status
order by status_count desc;

-- 12. What percentage of appointments fall into each appointment status

select appointment_status, count(*) as appointment_count,
round(count(*) * 100 / (select count(*) from appointments),2) as percentage
from appointments group by appointment_status;

-- 13. Which doctors have handled the highest number of appointments

select d.doctor_id, d.first_name,d.last_name, count(a.appointment_id) as appointment_count
from doctors as d inner join appointments as a on d.doctor_id = a.doctor_id 
group by d.doctor_id,d.first_name,d.last_name order by appointment_count desc limit 6;

-- 14. Which doctors have the highest number of completed appointments

select d.doctor_id, d.first_name, d.last_name, count(a.appointment_id) as completed_count
from doctors as d inner join appointments as a on d.doctor_id = a.doctor_id
where a.appointment_status = 'Completed' group by d.doctor_id,d.first_name,d.last_name
order by completed_count desc ;

-- 15. Which patients have the highest number of appointments

select p.patient_id,p.first_name,p.last_name,count(a.appointment_id) as appointment_count
from patients as p inner join appointments as a
on p.patient_id = a.patient_id group by p.patient_id, p.first_name,p.last_name 
order by appointment_count desc limit 6;

-- TREATMENT ANALYSIS

-- 16.What is the total cost of all treatments recorded
select round(sum(cost),2) as total_cost from treatments;

-- 17. What is the average cost of a treatment
select round(avg(cost),2) as avg_cost from treatments;

-- 18. Which treatment types are performed most frequently

select treatment_type,count(*) as treatment_count
from treatments group by treatment_type order by treatment_count desc;

-- 19.Which treatment types generate the highest total treatment cost

select treatment_type, round(sum(cost),2) as total_cost 
from treatments group by treatment_type order by total_cost desc limit 3;

-- 20. Top 10 individual treatments with the highest cost

select treatment_id,treatment_type,cost
from treatments order by cost desc limit 10;

-- BILLING ANALYSIS

-- 21. What is the total amount billed to patients

select round(sum(amount),2) as total_amount from billing;

-- 22. What is the average amount per bill

select round(avg(amount),2) as avg_amount from billing;

-- 23. How much money was billed through each payment method

select payment_method, round(sum(amount),2) as total_amount
from billing group by payment_method;

-- 24. How many bills are in each payment status

select payment_status, count(*) as status_count
from billing group by payment_status;

-- 25. What is the total billing amount for each payment status

select payment_status, round(sum(amount),2) as total_amount
from billing group by payment_status;

-- 26. Top 10 bills have the highest billing amounts

select * from billing order by amount desc limit 10;






