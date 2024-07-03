CREATE DATABASE ECOMMERCE
USE ECOMMERCE
SELECT * FROM ecommerce_data

--Find the total sales amount by product category.
SELECT Category, SUM(TotalAmount)TOTAL_SALES_AMOUNT_BY_CATEGORY FROM ecommerce_data GROUP BY Category

--Determine the top 10 products by sales quantity.
SELECT TOP 10 ProductName,SUM(Quantity) SALES_QUANTITY FROM ecommerce_data GROUP BY ProductName ORDER BY SALES_QUANTITY DESC

--Analyze the monthly sales trend.
SELECT DATENAME(MONTH,ORDERDATE) AS MONTH, SUM(Quantity) TOTAL_Q_SOLD FROM ecommerce_data GROUP BY DATENAME(MONTH,ORDERDATE), DATEPART(MONTH, ORDERDATE)
 ORDER BY  DATEPART(MONTH, ORDERDATE)

--Identify the top 10 cities by total sales amount.
SELECT TOP 10 CITY,SUM(TotalAmount) TOTAL_AMOUNT_OF_SALES FROM ecommerce_data GROUP BY City ORDER BY TOTAL_AMOUNT_OF_SALES DESC
