**5. Defining and Analyzing User Cohorts**

Cohorts group users based on a shared time-based event (e.g., signup week/month). 
This allows performance comparisons across generations of users.

```sql
SELECT user_id, DATE_TRUNC('month', signup_date) AS cohort_month
FROM users;
```

**8. Building Signup Cohorts**

```sql
WITH cohorts AS (
  SELECT user_id, DATE_TRUNC('month', signup_date) AS cohort_month
  FROM users
)
SELECT cohort_month, COUNT(*) AS new_users
FROM cohorts
GROUP BY cohort_month
ORDER BY cohort_month;
```

**9. Tracking Activity Across Time Buckets**

```sql
WITH user_logins AS (
  SELECT user_id,
         DATE_TRUNC('month', MIN(login_date)) AS cohort,
         DATE_TRUNC('month', login_date) AS active_month
  FROM logins
  GROUP BY user_id, login_date
)
SELECT cohort, active_month, COUNT(DISTINCT user_id) AS active_users
FROM user_logins
GROUP BY cohort, active_month
ORDER BY cohort, active_month;
```

**10. Cohort Retention Matrix (Week 0 to Week N)**

```sql
WITH base AS (
  SELECT user_id, MIN(login_date) AS signup_date
  FROM logins
  GROUP BY user_id
),
activity AS (
  SELECT l.user_id,
         DATE_TRUNC('week', b.signup_date) AS cohort_week,
         FLOOR(DATE_PART('day', l.login_date - b.signup_date)/7) AS week_number
  FROM logins l
  JOIN base b ON l.user_id = b.user_id
)
SELECT cohort_week, week_number, COUNT(DISTINCT user_id) AS retained
FROM activity
GROUP BY cohort_week, week_number
ORDER BY cohort_week, week_number;
```

**11. SQL Techniques for LTV (Lifetime Value)**

```sql
SELECT customer_id, SUM(order_total) AS ltv
FROM orders
GROUP BY customer_id;

Segment by cohort:
WITH cohorted_orders AS (
  SELECT o.customer_id, DATE_TRUNC('month', u.signup_date) AS cohort,
         o.order_total
  FROM orders o
  JOIN users u ON o.customer_id = u.user_id
)
SELECT cohort, AVG(order_total) AS avg_ltv
FROM cohorted_orders
GROUP BY cohort;
```
