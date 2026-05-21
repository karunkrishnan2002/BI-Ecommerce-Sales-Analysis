CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
SELECT * FROM sales_data
LIMIT 5 ;
SELECT COUNT(*)
FROM sales_data;

SELECT category_english,
ROUND(SUM(total_revenue),2) AS total_revenue,
COUNT(DISTINCT order_id) AS order_id
FROM sales_data
GROUP BY category_english
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    DATE_FORMAT(
        STR_TO_DATE(order_purchase_timestamp, '%Y-%m-%d %H:%i:%s'),
        '%Y-%m'
    ) AS order_month,

    ROUND(SUM(total_revenue), 2) AS monthly_revenue,

    COUNT(DISTINCT order_id) AS order_volume

FROM sales_data

GROUP BY order_month
ORDER BY order_month;
SELECT
    COUNT(*) AS orders_in_2016_11

FROM sales_data

WHERE DATE_FORMAT(
    STR_TO_DATE(order_purchase_timestamp, '%Y-%m-%d %H:%i:%s'),
    '%Y-%m'
) = '2016-11';


SELECT customer_state,
ROUND(SUM(total_revenue),2) AS total_revenue,
COUNT(DISTINCT order_id) AS order_volume
FROM sales_data
GROUP BY customer_state
ORDER BY total_revenue DESC;

SELECT order_status,
ROUND(SUM(total_revenue),2) AS lost_revenue,
COUNT(DISTINCT order_id) AS total_orders
FROM sales_data
WHERE order_status = 'canceled'
GROUP BY order_status
ORDER BY lost_revenue DESC;

SELECT category_english,
ROUND(SUM(total_revenue),2) AS total_revenue,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(
SUM(total_revenue) /
COUNT(DISTINCT order_id),2) AS avg_revenue_per_order
FROM sales_data
GROUP BY category_english 
HAVING COUNT(DISTINCT order_id) > 50
ORDER BY avg_revenue_per_order DESC
LIMIT 10;

