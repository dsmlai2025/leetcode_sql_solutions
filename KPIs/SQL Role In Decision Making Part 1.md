Data analysis is at the heart of business intelligence. 

- SQL allows analysts to compute critical KPIs, evaluate product impact, and understand user behavior at scale. 
- Advanced metrics like cohort analysis, LTV, retention, and feature adoption.

**1. SQL’s Role in Data-Driven Decision Making**
SQL enables:
- Fast, reproducible metric calculations
- Filtering and slicing for dynamic segments
- Integration with BI tools for real-time insights
- Customized views for teams (e.g., marketing, product, sales)

**2. Understanding KPIs in Business Context**
KPIs (Key Performance Indicators) must be:
Examples:
- DAU/MAU
- Churn Rate
- Average Revenue Per User (ARPU)
- Conversion Rate
- Lifetime Value (LTV)

**3. Designing KPIs with SQL**
1. Daily Active Users (DAU):

```sql
SELECT activity_date, COUNT(DISTINCT user_id) AS dau
FROM user_activity
GROUP BY activity_date
ORDER BY activity_date;
```

2. Average Revenue Per User (ARPU):
```sql
SELECT SUM(revenue)/COUNT(DISTINCT user_id) AS arpu
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';
```

3. Measuring Conversion Rates
Example: Landing → Signup → Purchase
```sql

WITH visited AS (
  SELECT DISTINCT user_id FROM events WHERE page = 'landing'
),
signed_up AS (
  SELECT DISTINCT user_id FROM events WHERE page = 'signup'
),
purchased AS (
  SELECT DISTINCT user_id FROM events WHERE page = 'checkout'
)
SELECT
  (SELECT COUNT(*) FROM visited) AS landing_visits,
  (SELECT COUNT(*) FROM signed_up) AS signups,
  (SELECT COUNT(*) FROM purchased) AS purchases,
  ROUND(100.0 * (SELECT COUNT(*) FROM signed_up) / (SELECT COUNT(*) FROM visited), 2) AS signup_rate,
  ROUND(100.0 * (SELECT COUNT(*) FROM purchased) / (SELECT COUNT(*) FROM signed_up), 2) AS purchase_rate;
```

4. Calculating Retention and Churn

Retention:
```sql
WITH first_seen AS (
  SELECT user_id, MIN(login_date) AS cohort_date
  FROM logins
  GROUP BY user_id
),
activity AS (
  SELECT user_id, login_date::date AS activity_day
# just date part is retained dropping the time part
  FROM logins
)
SELECT
  f.cohort_date,
  a.activity_day,
  COUNT(DISTINCT a.user_id) AS retained_users
FROM first_seen f
JOIN activity a ON f.user_id = a.user_id
WHERE a.activity_day >= f.cohort_date
GROUP BY f.cohort_date, a.activity_day;
```

Churn:
```SELECT
  SUM(CASE WHEN DATEDIFF('day', last_login, CURRENT_DATE) > 30 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate
FROM users;
```


