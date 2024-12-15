create database EV_Vehicle

/* 1)filter the vehicels make by tesla
2)count the total number of vehicels
3)filter the vehicels by model year after 2020
4)retrive vehicels by city ="SEATTLE"
5)group by make and count vehicels 
6)calculate the electric range for "BEVS"
7)find the most common electric utility
8)select vehicals with a specific postal code 98199
9)filter vehicals with electric range greater than  200 miles
10)calculate the percentage of eligible for "CAFV"
11)find the maximum , minimum ,and average for "MSRP"
12)get the top 5 most expensive vehicels based on"MSRP"
13)rank vehical by electric range with in each make
14)find the AVERAGE range per make and rank the manifacture */


use EV_Vehicle
--select * from Electric_Vehicle_Population_Data
select * from EV_Vehicle

--1)filter the vehicels make by tesla

SELECT *
FROM EV_Vehicle
WHERE make = 'Tesla';

--2)count the total number of vehicels
select count(Make) as total_vehicel 
from EV_Vehicle
or
SELECT COUNT(*) AS total_vehicles
FROM EV_Vehicle;

--3)filter the vehicels by model year after 2020

select * from EV_Vehicle
where Model_Year > 2020;

--4)retrive vehicels by city ="SEATTLE"
select * from EV_Vehicle 
where City = 'seattle'

--5)group by make and count vehicels 
select * from EV_Vehicle

SELECT Make, COUNT(*) AS vehicle_count
FROM EV_Vehicle
GROUP BY Make
ORDER BY vehicle_count ASC

-- 6)calculate the electric range for "BEVS"
select * from EV_Vehicle

/*SELECT count (Electric_vehicle_Type) as ev_range  ,Electric_Range from EV_Vehicle
where Electric_vehicle_Type = 'Battery electric Vehicle (BEV)';*/

SELECT SUM(Electric_Range) AS total_electric_range
FROM EV_Vehicle
WHERE Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)';

 --7)find the most common electric_utility
SELECT electric_utility, COUNT(*) AS frequency
FROM EV_Vehicle
GROUP BY electric_utility
ORDER BY frequency DESC
LIMIT 1;

--8)select vehicals with a specific postal code 98199

select Make , Postal_Code  from EV_Vehicle
where Postal_Code= 98199

select * from EV_Vehicle
where Postal_Code= 98199

--9)filter vehicals with electric range greater than  200 miles

SELECT * 
FROM EV_Vehicle
WHERE electric_range > 200;

--10)calculate the percentage of eligible for "CAFV"
SELECT 
    (COUNT(CASE WHEN Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Eligible' THEN 1 END) * 100.0) / COUNT(*) AS Percentage_Eligible
FROM EV_Vehicle;
 
--11)find the maximum , minimum ,and average for "MSRP"
select min (Base_MSRP) as minimum , max (Base_MSRP) as maximum ,  avg (Base_MSRP) as average 
from EV_Vehicle
--14)Find Average Range per Make and Rank the Manufacturers
    
SELECT Make, AVG(Electric_Range) AS Avg_Range,
RANK() OVER (ORDER BY AVG(Electric_Range) DESC) AS Make_Rank
FROM  EV_Vehicle
GROUP BY Make;

