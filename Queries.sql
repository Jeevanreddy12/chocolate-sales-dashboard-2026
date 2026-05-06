use chocolate_sales;
show databases;
use chocolate_sales;
select * from chocolates_table;
select * from chocolates_table limit 10;
DESCRIBE chocolates_table;
select count(*) from chocolates_table;
SELECT * 
FROM chocolates_table
WHERE shipmentID IS NULL OR profit IS NULL;
SELECT 
    SUM(Amount) AS total_sales,
    SUM(Boxes) AS total_boxes,
    COUNT(*) AS total_shipments
FROM chocolates_table;
SELECT 
    Salesperson,
    SUM(Amount) AS total_sales,
    SUM(Boxes) AS total_boxes
FROM chocolates_table
GROUP BY Salesperson
ORDER BY total_sales DESC;
DESCRIBE chocolates_table;
SELECT 
    Order_Status,
    COUNT(*) AS total_orders,
    SUM(Amount) AS total_sales
FROM chocolates_table
GROUP BY Order_Status;
SELECT 
    PID,
    SUM(Amount) AS total_sales,
    SUM(Boxes) AS total_boxes
FROM chocolates_table
GROUP BY PID
ORDER BY total_sales DESC;
-- This query evaluates salesperson performance
-- GROUP BY SPID → groups data by each salesperson
-- SUM(Amount) → total sales handled by each salesperson
-- COUNT(*) → number of orders handled
-- ORDER BY total_sales DESC → ranks best performers first

SELECT 
    SPID,
    SUM(Amount) AS total_sales,
    COUNT(*) AS total_orders
FROM chocolates_table
GROUP BY SPID
ORDER BY total_sales DESC;
-- This query analyzes performance by region (GID)
-- GROUP BY GID → groups data by region
-- SUM(Amount) → total sales per region
-- COUNT(*) → number of orders per region
-- ORDER BY total_sales DESC → best regions first

SELECT 
    GID,
    SUM(Amount) AS total_sales,
    COUNT(*) AS total_orders
FROM chocolates_table
GROUP BY GID
ORDER BY total_sales DESC;
-- This query analyzes sales trend over time (monthly)
-- MONTH(Shipdate) → extracts month from date
-- SUM(Amount) → total sales per month
-- GROUP BY month → groups data by each month
-- ORDER BY month → ensures correct time order

SELECT 
    MONTH(Shipdate) AS month,
    SUM(Amount) AS total_sales
FROM chocolates_table
GROUP BY month
ORDER BY month;
-- This query finds top 5 products based on sales
-- GROUP BY PID → groups by product
-- SUM(Amount) → calculates total sales per product
-- ORDER BY total_sales DESC → highest sales first
-- LIMIT 5 → returns only top 5 products

SELECT 
    PID, 
    SUM(Amount) AS total_sales
FROM chocolates_table
GROUP BY PID
ORDER BY total_sales DESC
LIMIT 5;
-- This query calculates average revenue per order
-- AVG(Amount) → average sales value of each shipment

SELECT 
    AVG(Amount) AS avg_order_value
FROM chocolates_table;
