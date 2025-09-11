# Problem 8 - Score Improvement

## 📄 Problem Statement
Write a solution to find employees who have consistently improved their performance over their last three reviews.
An employee must have at least 3 review to be considered
The employee's last 3 reviews must show strictly increasing ratings (each review better than the previous)
Use the most recent 3 reviews based on review_date for each employee
Calculate the improvement score as the difference between the latest rating and the earliest rating among the last 3 reviews
Return the result table ordered by improvement score in descending order, then by name in ascending order. 

**Table:** 

employees table:
+-------------+----------------+
| employee_id | name           |
+-------------+----------------+
| 1           | Alice Johnson  |
| 2           | Bob Smith      |
| 3           | Carol Davis    |
| 4           | David Wilson   |
| 5           | Emma Brown     |
+-------------+----------------+
performance_reviews table:
+-----------+-------------+-------------+--------+
| review_id | employee_id | review_date | rating |
+-----------+-------------+-------------+--------+
| 1         | 1           | 2023-01-15  | 2      |
| 2         | 1           | 2023-04-15  | 3      |
| 3         | 1           | 2023-07-15  | 4      |
| 4         | 1           | 2023-10-15  | 5      |
| 5         | 2           | 2023-02-01  | 3      |
| 6         | 2           | 2023-05-01  | 2      |
| 7         | 2           | 2023-08-01  | 4      |
| 8         | 2           | 2023-11-01  | 5      |
| 9         | 3           | 2023-03-10  | 1      |
| 10        | 3           | 2023-06-10  | 2      |
| 11        | 3           | 2023-09-10  | 3      |
| 12        | 3           | 2023-12-10  | 4      |
| 13        | 4           | 2023-01-20  | 4      |
| 14        | 4           | 2023-04-20  | 4      |
| 15        | 4           | 2023-07-20  | 4      |
| 16        | 5           | 2023-02-15  | 3      |
| 17        | 5           | 2023-05-15  | 2      |
+-----------+-------------+-------------+--------+

## 🧪 Example

**Output**
+-------------+----------------+-------------------+
| employee_id | name           | improvement_score |
+-------------+----------------+-------------------+
| 2           | Bob Smith      | 3                 |
| 1           | Alice Johnson  | 2                 |
| 3           | Carol Davis    | 2                 |
+-------------+----------------+-------------------+

---

## 💡 Approach


## 💻 SQL Solution

```sql
WITH ranked_reviews AS (
  SELECT
    pr.employee_id,
    pr.review_date,
    pr.rating,
    ROW_NUMBER() OVER (
      PARTITION BY pr.employee_id
      ORDER BY pr.review_date DESC
    ) AS rn
  FROM performance_reviews pr
),
last_three_reviews AS (
  SELECT
    employee_id,
    rating,
    rn
  FROM ranked_reviews
  WHERE rn <= 3
),
pivoted_reviews AS (
  SELECT
    employee_id,
    MAX(CASE WHEN rn = 3 THEN rating END) AS rating1,
    MAX(CASE WHEN rn = 2 THEN rating END) AS rating2,
    MAX(CASE WHEN rn = 1 THEN rating END) AS rating3
  FROM last_three_reviews
  GROUP BY employee_id
  HAVING COUNT(*) = 3
  -- Ensure at least three reviews
),
improved_employees AS (
  SELECT
    p.employee_id,
    e.name,
    (p.rating3 - p.rating1) AS improvement_score
  FROM pivoted_reviews p
  JOIN employees e ON p.employee_id = e.employee_id
  WHERE
    p.rating1 < p.rating2 AND
    p.rating2 < p.rating3
)
SELECT
  employee_id,
  name,
  improvement_score
FROM improved_employees
ORDER BY improvement_score DESC, name ASC;
