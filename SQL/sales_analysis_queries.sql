-- Sales Analysis Project
-- Database: PostgreSQL
-- Author: Cyril M George

--------------------------------------------------
-- 1. View all sales records
--------------------------------------------------
SELECT * FROM sales;

--------------------------------------------------
-- 2. Total Sales Revenue
--------------------------------------------------
SELECT
    SUM(sales_amount) AS total_revenue
FROM sales;

--------------------------------------------------
-- 3. Total Sales by Region
--------------------------------------------------
SELECT
    c.region,
    SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

--------------------------------------------------
-- 4. Sales by Product
--------------------------------------------------
SELECT
    p.product_name,
    SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

--------------------------------------------------
-- 5. Daily Sales Trend
--------------------------------------------------
SELECT
    sale_date,
    SUM(sales_amount) AS daily_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

--------------------------------------------------
-- 6. Best Customers by Sales
--------------------------------------------------
SELECT
    c.customer_name,
    SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

