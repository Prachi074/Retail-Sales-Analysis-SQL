-- ==================================================================================================================
-- SQL RETAIL SALES ANALYSIS PROJECT
-- ==================================================================================================================

--1.CREATE TABLE

DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales
(
   transaction_id INT PRIMARY KEY,
   sales_date DATE,
   sales_time TIME,
   customer_id INT,
   gender VARCHAR(10),
   age INT,
   category VARCHAR(20),
   price_per_unit FLOAT,
   quantity INT,
   cogs FLOAT,
   total_sales FLOAT
);

-- VIEW THE DATA

SELECT * FROM retail_sales;

--2.DATA CLEANING
-- ===================================================================================================================

--CHECK RECORDS CONTAING NULL VALUES

SELECT * FROM retail_sales
WHERE transaction_id is null
    OR sales_date is null
    OR sales_time is null
    OR customer_id is null
    OR gender is null
    OR age is null
    OR category is null
    OR price_per_unit is null
    OR quantity is null
    OR cogs is null
	OR total_sales is null;

--DELETE ROWS CONTAINING NULL VALUES OR BLANK STRINGS
--IN TEXT COLUMNS

DELETE FROM retail_sales
WHERE transaction_id is null
    OR sales_date is null
    OR sales_time is null
    OR customer_id is null
    OR gender is null
    OR age is null
    OR category is null
    OR price_per_unit is null
    OR quantity is null
    OR cogs is null
	OR total_sales is null;

SELECT * FROM retail_sales;

--REPLACE M WITH MALE AND F WITH FEMALE

SELECT DISTINCT gender 
FROM retail_sales;

UPDATE retail_sales
SET gender='Male'
WHERE gender='M';

UPDATE retail_sales
SET gender='Female'
WHERE gender='F';

--VERIFY CLEANED DATA

SELECT * FROM retail_sales;

-- ===================================================================================================================
-- DATA ANALYSIS & BUSSINESS QUESTIONS --
-- ===================================================================================================================

-- Q1. Retrive all columns for sales made on November 5, 2022.

SELECT * FROM retail_sales
WHERE sales_date = '2022-11-05';

-- Q2. Retrieve all transactions where the category is
-- Clothing, quantity sold is greater than 2,
-- and the transaction occurred in November 2022.

SELECT * FROM retail_sales
WHERE category='Clothing'
AND quantity > 2
AND sales_date >='2022-11-01'
AND sales_date <= '2022-11-30'
ORDER BY quantity;

-- Q3. Calculate total sales revenue and the total number
-- of transactions for each product category.

SELECT category,
   SUM(total_sales) as Total_Revenue,
   COUNT(transaction_id) as Total_Orders
   FROM retail_sales
   GROUP BY category;

-- Q4. Find the average age of customers who purchased
-- products from the Beauty category.

SELECT
   ROUND(AVG(age),2) as Avg_Age
   FROM retail_sales
   WHERE category = 'Beauty';
   
-- Q5. Retrieve all transactions where total sales
-- exceeded 1000.

SELECT * FROM retail_sales
WHERE total_sales > 1000;

-- Q6. Calculate the total number of transactions
-- made by each gender in each product category.

SELECT COUNT(transaction_id), gender, category
FROM retail_sales
GROUP BY gender,category;
	
-- Q7. Calculate total monthly sales for each year
-- and identify the best-selling month in each year

WITH monthly_sales AS (
    SELECT
		EXTRACT (YEAR FROM sales_date) AS year,
		EXTRACT (MONTH FROM sales_date) AS month,
		SUM(total_sales) as total_sales,
		RANK() OVER(PARTITION BY EXTRACT (YEAR FROM sales_date) ORDER BY SUM(total_sales) DESC) AS RANK
		FROM retail_sales
		GROUP BY year, month
		)
SELECT * FROM monthly_sales
WHERE RANK = 1;

-- Q8. Identify the top 5 customers based on
-- their highest total sales.

SELECT customer_id , sum(total_sales) AS total_sales
FROM retail_sales
GROUP BY customer_id
order by total_sales desc
limit 5;


-- Q9. Calculate the number of unique customers
-- who purchased products from each category.

SELECT COUNT(DISTINCT(customer_id)) as unique_customer, category
FROM retail_sales
GROUP BY category;


-- Q10. Categorize transactions into Morning, Afternoon,
-- and Evening shifts and count the orders in each shift.
--
-- Morning: Before 12:00 PM
-- Afternoon: 12:00 PM to before 6:00 PM
-- Evening: 6:00 PM onward

SELECT 
	CASE
		WHEN sales_time<'12:00:00' THEN 'Morning'
		WHEN sales_time<'18:00:00' THEN 'Afternoon'
		ELSE 'Evening'
		END
		AS shift,
		COUNT(*) AS total_orders
		FROM retail_sales
		GROUP BY shift;
	














