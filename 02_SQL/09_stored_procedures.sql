-- 1. Procedure to find appointments for a specific patient
DELIMITER //

create procedure get_patient_appointment(
in p_patient_id varchar(20)
)
begin
select appointment_id,patient_id,
doctor_id, appointment_date,
appointment_time,appointment_status
from appointments where patient_id = p_patient_id
order by appointment_date desc;
end //
DELIMITER ;

call get_patient_appointment('P001');

--  2. Procedure to find appointments for a specific doctor
DELIMITER //

create procedure get_doctor_appointment(
in p_doctor_id varchar(20)
)
begin
select appointment_id,patient_id,doctor_id,
appointment_date,appointment_time,appointment_status
from appointments where doctor_id = p_doctor_id
order by a.appointment_date desc;

end//
DELIMITER ;

call get_doctor_appointments('D001');

-- 3. Procedure to find patients by insurance provider
DELIMITER //
create procedure get_patients_by_insurance(
in p_insurance_provider varchar(100)
)
begin
select patient_id,first_name,last_name,
gender,insurance_provider,insurance_number
from patients where insurance_provider = p_insurance_provider;
end //

DELIMITER ;

call get_patients_by_insurance('WellnessCorp');

-- 4. Procedure to find doctors by specialization

DELIMITER //

create procedure get_doctor_by_specialization(
in p_specialization varchar(50)
)
begin 
select doctor_id, first_name,last_name,
specialization,years_experience,hospital_branch
from doctors where specialization = p_specialization
order by years_experience desc;
end //
DELIMITER ;

call get_doctor_by_specialization('oncology');

-- 5. Procedure to find bills above a specified amount

DELIMITER //

create procedure get_bills_above_amount(
in p_amount decimal(10,2)
)
begin
select bill_id,patient_id,treatment_id,bill_date,amount,
payment_method,payment_status from billing where amount> p_amount
order by amount desc;
end //
DELIMITER ;
call get_bills_above_amount(3000);

-- 6. Procedure to summarize information for a specific hospital branch

DELIMITER //

create procedure branch_summary(
in p_branch varchar(50)
)
begin

-- number of doctors
select count(*) as total_doctors from doctors 
where hospital_branch = p_branch;

-- doctors by specialization
select specialization, count(*) as doctor_count
from doctors where hospital_branch = p_branch
group by specialization 
order by doctor_count desc;

-- Average doctor experience
select round(avg(years_experience),2) as avg_doctor_experience
from doctors where hospital_branch = p_branch;

end//
DELIMITER ;

call branch_summary('Eastside Clinic');








