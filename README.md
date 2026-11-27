
# Retail Sales Analysis Using SQL

## 📌 Project Overview

The **Retail Sales Analysis** project focuses on analyzing retail transaction data using SQL to understand sales performance, customer purchasing behavior, and product category trends.

The objective is to identify high-performing product categories, valuable customers, monthly sales trends, and purchasing patterns to support data-driven business decisions.

## Business Objectives

- Analyze sales revenue and transaction performance across product categories.
- Understand customer purchasing behavior and demographics.
- Identify high-value customers based on total spending.
- Explore monthly sales trends and best-performing months.
- Analyze transaction patterns across different time shifts.

## 🗂️ Dataset Description

The dataset contains retail transaction records with the following columns:

| Column | Description |
|---|---|
| Transaction ID | Unique transaction identifier |
| Sale Date | Date of the transaction |
| Sale Time | Time of the transaction |
| Customer ID | Unique customer identifier |
| Gender | Customer gender |
| Age | Customer age |
| Category | Purchased product category |
| Quantity | Number of units purchased |
| Price per Unit | Price of one product unit |
| COGS | Cost of goods sold |
| Total Sale | Total transaction sales amount |

## Data Cleaning

Performed data cleaning using SQL:

- Identified records containing NULL values.
- Removed records containing NULL values.
- Standardized gender values by replacing `M` with `Male` and `F` with `Female`.
- Verified the cleaned data before analysis.

## Business Questions & SQL Analysis

This project includes 10 business questions:

1. Retrieve all transactions made on November 5, 2022.
2. Identify Clothing transactions with quantities greater than 2 during November 2022.
3. Calculate total sales revenue and transaction counts for each product category.
4. Find the average age of customers purchasing Beauty products.
5. Identify high-value transactions where total sales exceeded 1,000.
6. Compare transaction counts by gender and product category.
7. Identify the best-selling month in each year based on total revenue.
8. Find the top 5 customers based on total spending.
9. Calculate the number of unique customers purchasing from each category.
10. Analyze transactions across Morning, Afternoon, and Evening shifts.

## 🛠️ Tools & Technologies

- SQL
- PostgreSQL-compatible SQL syntax

## 💡 Key Learning Outcomes

Through this project, I strengthened my practical understanding of:

- SQL data cleaning and data manipulation.
- Aggregate functions such as SUM(), COUNT(), and AVG().
- GROUP BY, ORDER BY, and WHERE clauses.
- Common Table Expressions (CTEs).
- Window functions such as RANK().
- CASE statements for conditional analysis.
- Solving business problems using SQL queries.

## 👩‍💻 About This Project

I worked on translating business questions into SQL queries and exploring retail sales data to understand customer and sales patterns.

**Thank you for visiting my project!**

**Author:**
**Prachi Vaishkiyar**
