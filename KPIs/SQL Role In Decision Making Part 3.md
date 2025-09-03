Funnel Analysis Using SQL
WITH funnel AS (
  SELECT user_id,
         MAX(CASE WHEN event = 'visit' THEN 1 END) AS visited,
         MAX(CASE WHEN event = 'signup' THEN 1 END) AS signed_up,
         MAX(CASE WHEN event = 'purchase' THEN 1 END) AS purchased
  FROM events
  GROUP BY user_id
)
SELECT
  COUNT(*) AS total_users,
  COUNT(*) FILTER (WHERE signed_up = 1) AS signed_up,
  COUNT(*) FILTER (WHERE purchased = 1) AS purchased,
  ROUND(100.0 * COUNT(*) FILTER (WHERE signed_up = 1) / COUNT(*), 2) AS signup_rate,
  ROUND(100.0 * COUNT(*) FILTER (WHERE purchased = 1) / COUNT(*), 2) AS conversion_rate
FROM funnel;

13. Revenue Growth and Month-over-Month Trends
WITH monthly_revenue AS (
  SELECT DATE_TRUNC('month', order_date) AS month, SUM(total) AS revenue
  FROM orders
  GROUP BY month
)
SELECT month,
       revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month,
       revenue - LAG(revenue) OVER (ORDER BY month) AS mom_change,
       ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / LAG(revenue) OVER (ORDER BY month), 2) AS mom_growth
FROM monthly_revenue;

14. CAC vs LTV: SQL Computation
WITH customer_acquisition AS (
  SELECT customer_id, SUM(spend) AS cac
  FROM ad_spend
  GROUP BY customer_id
),
ltv AS (
  SELECT customer_id, SUM(order_total) AS ltv
  FROM orders
  GROUP BY customer_id
)
SELECT a.customer_id, a.cac, l.ltv,
       ROUND(l.ltv / NULLIF(a.cac, 0), 2) AS ltv_to_cac_ratio
FROM customer_acquisition a
JOIN ltv l ON a.customer_id = l.customer_id;

15. Feature Adoption & Usage Segments
SELECT feature_name, COUNT(DISTINCT user_id) AS users_used
FROM feature_usage
GROUP BY feature_name
ORDER BY users_used DESC;
Analyze adoption by segment:
SELECT segment, feature_name, COUNT(*) AS usage_count
FROM users u
JOIN feature_usage f ON u.user_id = f.user_id
GROUP BY segment, feature_name;
