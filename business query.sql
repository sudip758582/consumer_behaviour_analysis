USE consumer_behavior;
SELECT 
    Income_Level, AVG(purchase_amount_clean) AS avg_spending
FROM
    ecommerce_data
GROUP BY Income_Level
ORDER BY avg_spending DESC;
-- we have the customers having high and middle of income level

-- Q2: Which age group is most valuable?
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY age_group
ORDER BY avg_spending DESC;

-- according to the result all age group excluding 60+ are all valuable customer

-- Q3: Which locations generate most revenue?
SELECT 
    Location,
    SUM(purchase_amount_clean) AS total_revenue
FROM ecommerce_data
GROUP BY Location
ORDER BY total_revenue DESC
limit 10;
-- Göteborg	1161.29
-- Oslo	1021.55
-- Punta Gorda	820.45
-- Magdalena	804.74
-- Hoolt	780.60
-- Veiga	779.89
-- San Carlos	722.39
-- Týn nad Vltavou	682.59
-- Cimara	673.61
-- Seleuš	672.99
-- this are the top 10 location giving the highest reveneu and 
-- Göteborg	1161.29
-- Oslo	1021.55 
-- are contributinng the most 

-- Q4: Who are high-value + high-frequency customers?
SELECT 
    Customer_ID,
    purchase_amount_clean,
    Frequency_of_Purchase,
    location
FROM ecommerce_data
ORDER BY Frequency_of_Purchase DESC, purchase_amount_clean DESC;

-- Q5: Does loyalty increase spending?
SELECT 
    Brand_loyalty,
    COUNT(*) AS total_customers,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Brand_loyalty
ORDER BY Brand_loyalty DESC;
-- Mid-level loyalty (2 & 3) → highest spending
-- Highest loyalty (5) → lower spending

-- Q6: Loyalty segment distribution
SELECT 
    CASE 
        WHEN Frequency_of_Purchase >= 10 THEN 'High'
        WHEN Frequency_of_Purchase BETWEEN 5 AND 9 THEN 'Medium'
        ELSE 'Low'
    END AS loyalty_segment,
    COUNT(*) AS customers
FROM ecommerce_data
GROUP BY loyalty_segment;

-- the no of mediam loyalty segment customres are largest


-- Q7: Which purchase channel performs best?
SELECT 
    Purchase_Channel,
    SUM(purchase_amount_clean) AS total_revenue,
    AVG(purchase_amount_clean) AS avg_order_value
FROM ecommerce_data
GROUP BY Purchase_Channel
ORDER BY total_revenue DESC;
-- customers preffering more the mixed chanel for purchase 

-- Q8: Preferred payment methods
SELECT 
    Payment_Method,
    COUNT(*) AS usage_count
FROM ecommerce_data
GROUP BY Payment_Method
ORDER BY usage_count DESC;

-- Q9: Shipping preference impact
SELECT 
    Shipping_Preference,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Shipping_Preference
ORDER BY avg_spending DESC;

-- Q10: Do ads increase engagement?
SELECT 
    Engagement_with_Ads,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Engagement_with_Ads
ORDER BY avg_spending DESC;

-- select * from ecommerce_data;
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE ecommerce_data
-- SET Social_Media_Influence = (
--     SELECT mode_value FROM (
--         SELECT Social_Media_Influence AS mode_value
--         FROM ecommerce_data
--         WHERE Social_Media_Influence IS NOT NULL
--         GROUP BY Social_Media_Influence
--         ORDER BY COUNT(*) DESC
--         LIMIT 1
--     ) AS temp
-- )
-- WHERE Social_Media_Influence IS NULL;


-- UPDATE ecommerce_data
-- SET Engagement_with_Ads = (
--     SELECT mode_value FROM (
--         SELECT Engagement_with_Ads AS mode_value
--         FROM ecommerce_data
--         WHERE Engagement_with_Ads IS NOT NULL
--         GROUP BY Engagement_with_Ads
--         ORDER BY COUNT(*) DESC
--         LIMIT 1
--     ) AS temp
-- )
-- WHERE Engagement_with_Ads IS NULL;

-- Q11: Social media influence on spending
SELECT 
    Social_Media_Influence,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Social_Media_Influence
ORDER BY avg_spending DESC;

SELECT 
	Engagement_with_Ads,
    Social_Media_Influence,
    avg(purchase_amount_clean) as avg_spending
FROM ecommerce_data
group by Engagement_with_Ads, Social_Media_Influence
ORDER BY avg_spending DESC;
-- Q12: Discount impact on purchases
SELECT 
    Discount_Used,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Discount_Used;

-- Q13: Does satisfaction affect spending?
SELECT 
    Customer_Satisfaction,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Customer_Satisfaction
ORDER BY avg_spending DESC;

-- Q14: Return rate vs satisfaction
SELECT 
    Return_Rate,
    AVG(Customer_Satisfaction) AS avg_satisfaction
FROM ecommerce_data
GROUP BY Return_Rate
ORDER BY avg_satisfaction DESC;

-- Q15: Time spent vs spending
SELECT 
    Time_to_Decision, AVG(purchase_amount_clean) AS avg_spending
FROM
    ecommerce_data
GROUP BY Time_to_Decision
ORDER BY avg_spending DESC;

-- Q16: Time to decision impact
SELECT 
    Time_to_Decision,
    AVG(purchase_amount_clean) AS avg_spending
FROM ecommerce_data
GROUP BY Time_to_Decision
ORDER BY avg_spending DESC;