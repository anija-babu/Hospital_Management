
--  STANDARDIZE CATEGORICAL VALUES

-- 1. Standardize gender values in patient data.
-- check the existing values
select  distinct gender from patients;

update patients
  set gender = case
      when lower(trim(gender)) in ('male','m') then 'Male'
      when lower(trim(gender)) in ('female','f') then 'Female'
      else gender
end;

-- verify
select *from patients limit 3;

--  DATE AND TIME CONVERSION
 
 -- 2.Convert date_of_birth and registration_date from TEXT to DATE format (YYYY-MM-DD) in patient data.
update patients 
set date_of_birth = str_to_date(date_of_birth,'%d-%m-%Y'),
    registration_date = str_to_date(registration_date,'%d-%m-%Y');

alter table patients
modify date_of_birth date,
modify registration_date date;

-- verify the format
describe patients;
select *from patients limit 2;

-- 3.Convert appointment date from TEXT to DATE format (YYYY-MM-DD) in appointment data
update appointments
   set appointment_date = str_to_date(appointment_date,'%d-%m-%Y');
   
   alter table appointments 
   modify appointment_date date;
   
   -- verify
   select * from appointments limit 2;
   
-- 4. Convert appointment_time from TEXT to TIME format (HH:MM:SS) in appointment data.
   alter table appointments
   modify appointment_time time;
   
-- 5.Convert treatment date from TEXT to DATE format (YYYY-MM-DD) in treatment data
alter table treatments
modify treatment_date date;

-- 6.Convert bill_date from TEXT to DATE format (YYYY-MM-DD) in billing data.
update billing
   set bill_date = str_to_date(bill_date,'%d-%m-%Y');
alter table billing
modify bill_date date;

-- verify
select * from billing limit 2;





