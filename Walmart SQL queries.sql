SHOW databases;
use walmart_db;
--
select * from walmart;
/*
DROP TABLE WALMART;
*/
--
select count(*) from walmart; 
--
select distinct payment_method from walmart;
--
select 
     payment_method,
     count(*)
from walmart
group by payment_method; 
--
select count(distinct branch)
from walmart;
--
Select max(quantity) from walmart;
--
Select min(quantity) from walmart;
/*
Business Problems*/
/*Q1  What are the different payment methods, and how many transactions and
 items were sold with each method?*/
 --
select 
	payment_method,
	count(*) as no_payments,
	SUM(quantity) as no_qty_sold
from walmart
group by payment_method;

/* Q2  Which category received the highest average rating in each branch? */

WITH avg_ratings AS (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating
    FROM walmart
    GROUP BY branch, category
),
ranked AS (
    SELECT 
        branch,
        category,
        avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY avg_rating DESC) AS branch_rank
    FROM avg_ratings
)
SELECT 
    branch,
    category,
    avg_rating
FROM ranked
WHERE branch_rank = 1;

/* : What is the busiest day of the week for each branch based on transaction
 volume?*/

SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
    FROM walmart
    GROUP BY branch, day_name
) AS ranked
WHERE rnk = 1;

/* How many items were sold through each payment method? */

select 
	payment_method,
	SUM(quantity) as no_qty_sold
from walmart
group by payment_method;

/* What are the average, minimum, and maximum ratings for each category in
 each city? */
 
 SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM walmart
GROUP BY city, category;

/*  What is the total profit for each category, ranked from highest to lowest? */
WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER (
            PARTITION BY branch 
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM walmart
    GROUP BY branch, payment_method
)
SELECT 
    branch, 
    payment_method AS preferred_payment_method,
    total_trans
FROM cte
WHERE rnk = 1;

/*Q8: Categorize sales into Morning, Afternoon, and Evening shifts*/

SELECT
    branch,
    CASE 
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

/*Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)*/

WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;
