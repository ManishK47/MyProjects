CREATE DATABASE ECOM
USE ECOM
SELECT * FROM products
SELECT * FROM orders
Select * from customers
select * from order_details

--Objective: Segment customers based on their purchase history.

--Calculate the total purchase amount for each customer.

select customerID, sum(OrderAmount) Total_order_value from orders group by CustomerID ORDER BY CustomerID

--Classify customers into segments (low-value, mid-value, high-value) based on their total purchase amount.
--Define segments based on TotalPurchaseAmount. For example:
--Low-value customers: TotalPurchaseAmount < $500
--Mid-value customers: $500 <= TotalPurchaseAmount < $2000
--High-value customers: TotalPurchaseAmount >= $2000

select customerId, TotalOrderAmount, case when TotalOrderAmount<500 then 'LowValues' 
when TotalOrderAmount<2000 and TotalOrderAmount>=5000  then 'MidValues' else 'HighValues' end as Segment 
from (select customerID, sum(OrderAmount) TotalOrderAmount from orders group by CustomerID ) as rknd order by TotalOrderAmount desc

--Calculate the average order value for each customer.
select customerID, avg(OrderAmount) AverageOrderValues from orders group by customerID order by CustomerID

--Objective: Identify the most popular products based on sales volume.
--Calculate the total quantity sold for each product.

select ProductID, sum(Quantity) Total_Quantity_Sold from order_details group by ProductID order by Total_Quantity_Sold Desc 
select ProductID, sum(Quantity) Total_Quantity_Sold from order_details group by ProductID order by ProductID 


--Merge the result with product details to get product names and categories.
select P.ProductName, P.Category, od.Total_Quantity_Sold from (select ProductID, sum(Quantity) Total_Quantity_Sold from order_details 
group by ProductID ) od Join products P on od.ProductID=P.ProductID order by Total_Quantity_Sold Desc

--Calculate Monthly Sales:
select DATENAME(month,OrderDate) as monthly, sum(OrderAmount) TotalInMonth from orders group by DATENAME(month,OrderDate)

select DATENAME(month,OrderDate) as monthly from orders 

--Objective: Calculate the lifetime value of each customer.

select customerID, sum(OrderAmount) as CLV from orders group by customerID

