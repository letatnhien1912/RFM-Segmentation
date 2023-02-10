-- USER SEGMENTATION using RFM model

/* 'Telco Card' is the most product in the Telco group (accounting for more than 99% of the total),
and the company wants to segment the customers of Telco Card for the next marketing strategy. */

-- Prepare the data of successful transactions for Telco Card
WITH telco_db AS (SELECT fact.*, DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY CONVERT(date,transaction_time)) AS cus_rank
    FROM (SELECT * FROM fact_transaction_2019 UNION SELECT * FROM fact_transaction_2020) AS fact
        LEFT JOIN dim_scenario AS scen 
        ON fact.scenario_id = scen.scenario_id
        LEFT JOIN dim_status AS sta 
        ON fact.status_id = sta.status_id
    WHERE status_description = 'Success')

-- Assign Recency, Frequency and Monetary values to each customer
-- Recency: Difference between each customer's last payment date and '2020-12-31'
-- Frequency: Number of successful payment days of each customer
-- Monetary: Total charged amount of each customer
, rfm_value AS (SELECT DISTINCT customer_id,
        DATEDIFF(day, MAX(transaction_time) OVER (PARTITION BY customer_id), '2020-12-31') AS recency,
        MAX(cus_rank) OVER (PARTITION BY customer_id) AS frequency,
        SUM(charged_amount*1.0) OVER (PARTITION BY customer_id) AS monetary
    FROM telco_db)

-- Categorize RFM tiers
, rfm_tier AS (SELECT *, 
        CASE WHEN PERCENT_RANK() OVER (ORDER BY recency DESC) > 0.75 THEN '1'
            WHEN  PERCENT_RANK() OVER (ORDER BY recency DESC) > 0.5 THEN '2'
            WHEN PERCENT_RANK() OVER (ORDER BY recency DESC) > 0.25 THEN '3'
            ELSE '4' END AS r_tier,
        CASE WHEN PERCENT_RANK() OVER (ORDER BY frequency ASC) > 0.75 THEN '1'
            WHEN  PERCENT_RANK() OVER (ORDER BY frequency ASC) > 0.5 THEN '2'
            WHEN PERCENT_RANK() OVER (ORDER BY frequency ASC) > 0.25 THEN '3'
            ELSE '4' END AS f_tier,
        CASE WHEN PERCENT_RANK() OVER (ORDER BY monetary ASC) > 0.75 THEN '1'
            WHEN  PERCENT_RANK() OVER (ORDER BY monetary ASC) > 0.5 THEN '2'
            WHEN PERCENT_RANK() OVER (ORDER BY monetary ASC) > 0.25 THEN '3'
            ELSE '4' END AS m_tier
    FROM rfm_value)

-- Segment the users of Billing category
, rfm_segment AS (SELECT *,
        CASE WHEN CONCAT(r_tier,f_tier,m_tier) = '111' THEN 'Best customers'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '[3-4][3-4]%' THEN 'Lost Bad customers'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '[3-4]2%' THEN 'Lost customer'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '21%' THEN 'Almost lost'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '11[2-4]' THEN 'Loyal customers'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '[1-2][1-3]1' THEN 'Big Spender'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '[1-2]4%' THEN 'New customers'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '[3-4]1%' THEN 'Hibernating'
            WHEN CONCAT(r_tier,f_tier,m_tier) LIKE '[1-2][2-3][2-4]' THEN 'Potential Loyalist'
        END AS rfm
    FROM rfm_tier)

SELECT DISTINCT rfm, COUNT(rfm) OVER (PARTITION BY rfm) AS count,
    FORMAT((COUNT(rfm) OVER (PARTITION BY rfm))*1.0 / COUNT(rfm) OVER(),'p') AS pct
FROM rfm_segment