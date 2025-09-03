**14. SQL for A/B Test Reporting**
```sql
WITH groups AS (
  SELECT user_id, experiment_group FROM ab_assignments
),
metrics AS (
  SELECT user_id, SUM(purchase_amount) AS revenue
  FROM orders
  GROUP BY user_id
)
SELECT g.experiment_group, COUNT(*) AS users,
       AVG(m.revenue) AS avg_revenue
FROM groups g
LEFT JOIN metrics m ON g.user_id = m.user_id
GROUP BY g.experiment_group;
```

**15. Segmentation by Geography, Plan, or Behavior**
```sql
SELECT plan_type, region, AVG(lifetime_value) AS avg_ltv
FROM customers
GROUP BY plan_type, region;
Or by behavioral metric:
SELECT CASE
         WHEN order_count >= 10 THEN 'high value'
         WHEN order_count >= 3 THEN 'medium value'
         ELSE 'low value'
       END AS segment,
       COUNT(*) AS users
FROM (
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id
) sub
GROUP BY segment;
```

**16. Rolling Averages and Smoothing Metrics**

```sql
SELECT date,
       AVG(revenue) OVER (
         ORDER BY date
         ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS revenue_7day_avg
FROM daily_revenue;
```

**17. Visualizing Metrics with SQL-Friendly Tables**
Power BI, Tableau etc
