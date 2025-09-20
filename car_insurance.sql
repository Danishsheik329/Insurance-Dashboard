create database Car_Insurance;
use Car_Insurance;
select * from car_insurance;


alter table car_insurance change column ï»¿ID Id_no varchar(50);
-- Total claim Amt
select sum(Claim_Amount)/ 1000 as Total_claim_amt from car_insurance;


-- Total Policies
select count(Id_no)/1000 as total_policies from car_insurance;



-- Avg Claim Frequency
select avg(claim_freq) as Claim_freq from car_insurance;

-- Avg claim amount
select avg(claim_Amount)/1000 as Avg_claim_amt from car_insurance;

-- Total male count
select count(Id_no )/1000 as Male_count from car_insurance where Gender="Male";

-- Total Female count
select count(Id_no )/1000 as Male_count from car_insurance where Gender="Female";

-- Total claim amt by car use
select round(sum(Claim_Amount),2)as claim_amt,Car_use from car_insurance group by Car_use;


-- Total claim amt by car make
select sum(Claim_Amount) as claim_amt,Car_Make from car_insurance group by Car_Make order by claim_amt desc;

-- Total claim amt by car use
select round(sum(Claim_Amount),2)as claim_amt,Coverage_zone from car_insurance group by Coverage_zone;

-- Total claim amt by car year
select round(sum(Claim_Amount),2)as claim_amt,Car_Year from car_insurance group by Car_Year;

-- Total claim amt by Kids Driving
select round(sum(Claim_Amount),2)as claim_amt,Kids_Driving from car_insurance group by Kids_Driving;

-- Total claim amt by Education
select round(sum(Claim_Amount),2)as claim_amt,Education from car_insurance group by Education;

-- Total claim amt by Martial Status and Education
select round(sum(Claim_Amount),2)as claim_amt,Education,Marital_Status from car_insurance group by Education,Marital_Status;
-- By age Group
SELECT 
    CASE
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%d-%m-%Y'), CURDATE()) BETWEEN 15 AND 25 THEN '15-25'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%d-%m-%Y'), CURDATE()) BETWEEN 26 AND 35 THEN '25-35'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%d-%m-%Y'), CURDATE()) BETWEEN 36 AND 45 THEN '36-45'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%d-%m-%Y'), CURDATE()) BETWEEN 46 AND 55 THEN '46-55'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%d-%m-%Y'), CURDATE()) BETWEEN 56 AND 65 THEN '56-65'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(BirthDate, '%d-%m-%Y'), CURDATE()) BETWEEN 66 AND 75 THEN '66-75'
        ELSE '75+'
    END AS Age_Group,
    SUM(Claim_Amount) AS Total_Claim
FROM car_insurance
GROUP BY Age_Group
ORDER BY Age_Group;



