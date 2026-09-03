-- PATIENTS DATA

-- 1. Display all patient details
select * from patients;

-- 2. Find patients registered after a specified date
select * from patients where registration_date > '2023-01-01';

-- 3. Find female patients 
select * from patients where gender ='Female';

-- 4. Find patients from a specific insurance provider
 select * from patients where insurance_provider ='WellnessCorp';
 
 -- 5. Find patients whose first or last name matches a pattern
 select * from patients 
 where first_name like 'A%';
 
 -- 6. Find patients registered within a specified date range
 select * from patients 
 where registration_date between '2022-01-01' and '2023-12-31';
 
 -- 7. Display unique insurance providers
 select distinct insurance_provider
 from patients where insurance_provider is not null;
 
 -- 8. Display the 10 most recently registered patients
 select * from patients
 order by registration_date desc limit 10;
 
-- DOCTORS DATA

-- 9. Display all doctor details
select * from doctors;

-- 10. Find doctors with a specific specialization
select * from doctors where specialization = 'Pediatrics';

-- 11. Find doctors with more than 10 of years of experience
select * from doctors 
where years_experience > 10 ;

-- 12. Display unique specializations
select distinct specialization from doctors;

-- 13. Find doctors whose name matches a pattern
select * from doctors where first_name like '%A';

-- 14. Display the 10 most experienced doctors
select * from doctors 
order by years_experience desc limit 10;

-- APPOINTMENTS DATA

-- 15. Display all appointment details
select * from appointments;

-- 16. Find scheduled appointments
select * from appointments where appointment_status = 'Scheduled';

-- 17. Find completed appointments
select * from appointments where appointment_status = 'Completed';

-- 18. Find cancelled appointments
select * from appointments where appointment_status ='Cancelled';

-- 19. Find no-show appointments
select * from appointments where appointment_status ='No-show';

-- 20. Find appointments for a specific doctor
select * from appointments where doctor_id = 'D010';

-- 21. Find appointments within a specified date range
select * from appointments 
where appointment_date between '2023-01-01' and '2023-12-01';

-- 22. Display unique appointment statuses
select distinct appointment_status from appointments;

-- 23. Display the 10 most recent appointments
select * from appointments 
order by appointment_date desc limit 10;

-- TREATMENTS DATA

-- 24. Display all treatment details
select * from treatments;

-- 25. Find treatments above 4000
select * from treatments
where cost > 4000;

-- 26. Find treatments within 1000 and 4000
select * from treatments
where cost between 1000 and 4000;

-- 27. Find a specific treatment type
select * from treatments 
where treatment_type ='Physiotherapy';

-- 28. Find treatments matching a specific pattern
select * from treatments
where treatment_type like '%therapy';

-- 29. Display unique treatment types
select distinct treatment_type from treatments;

-- 30. Display the 10 most expensive treatments
select * from treatments
order by cost desc limit 10;

-- BILLING DATA

-- 31.Display all billing details
select * from billing;

-- 32. Find bills above 4000
select * from billing where amount > 4000;

-- 33. Find bills within 1000 and 3000
select * from billing where amount between 1000 and 3000;

-- 34. Display unique payment methods
select distinct payment_method from billing;

-- 35. Display unique payment statuses
select distinct payment_status from billing;

-- 36. Display the 10 highest-value bills
select * from billing
order by amount desc limit 10;

