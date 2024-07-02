CREATE DATABASE UBERDATA
USE UBERDATA

SELECT * FROM rides
SELECT * FROM employee
SELECT * FROM payments
--Total Rides and Distance Traveled by Each Employee:
--Calculate the total number of rides and the total distance traveled by each employee.
SELECT employee_id ,COUNT(ride_id) TOTAL_RIDE, SUM(distance) TOTAL_DISTANCE FROM rides GROUP BY employee_id

--Employee with the Highest Total Payments:
--Find the employee who has the highest total payments from the rides.

SELECT TOP 1 R.employee_id,SUM(P.amount) TOTAL_AMOUNT_PAID FROM rides R JOIN payments P ON R.ride_id=P.ride_id 
GROUP BY R.employee_id
ORDER BY TOTAL_AMOUNT_PAID DESC


--Average Rating of Rides for Each Employee:
--Compute the average rating of rides for each employee.
SELECT R.employee_id,E.name, AVG(R.rating) AVERAGE_RATING, CASE WHEN AVG(R.rating)>=5 THEN '*****' WHEN AVG(R.rating)<=4 AND AVG(R.rating)>=3 THEN '***' ELSE '*' END AS RATINGS
FROM rides R JOIN employee E ON E.employee_id=R.employee_id GROUP BY R.employee_id,E.name

--List of Rides in June 2023:
--Retrieve all rides that occurred in June 2023.
SELECT ride_id,DATENAME(MONTH,start_time) RIDES_IN_JUNE_MONTH FROM rides WHERE DATENAME(MONTH,start_time)='JUNE'


--Total Amount Paid for Each Employee:
--Calculate the total amount paid for Each Employee
SELECT E.name,E.employee_id,SUM(P.amount) TOTAL_AMOUNT_PAID FROM payments P JOIN rides R ON R.ride_id=P.ride_id JOIN employee E ON E.employee_id=R.employee_id
GROUP BY E.name, E.employee_id