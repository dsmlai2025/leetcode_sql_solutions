# Problem 20 - 6 Day Moving Average

## 📄 Problem Statement
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
Return the result table ordered by visited_on in ascending order. 
**Table:** 

Customer table:

| customer_id | name         | visited_on   | amount      |
|-------------|--------------|--------------|-------------|
| 1           | Jhon         | 2019-01-01   | 100         |
| 2           | Daniel       | 2019-01-02   | 110         |
| 3           | Jade         | 2019-01-03   | 120         |
| 4           | Khaled       | 2019-01-04   | 130         |
| 5           | Winston      | 2019-01-05   | 110         | 
| 6           | Elvis        | 2019-01-06   | 140         | 
| 7           | Anna         | 2019-01-07   | 150         |
| 8           | Maria        | 2019-01-08   | 80          |
| 9           | Jaze         | 2019-01-09   | 110         | 
| 1           | Jhon         | 2019-01-10   | 130         | 
| 3           | Jade         | 2019-01-10   | 150         | 

## 🧪 Example

**Output**
| visited_on   | amount       | average_amount |
|--------------|---------------|----------------|
| 2019-01-07   | 860          | 122.86         |
| 2019-01-08   | 840          | 120            |
| 2019-01-09   | 840          | 120            |
| 2019-01-10   | 1000         | 142.86         |

## 💡 Approach


## 💻 SQL Solution

```sql
WITH DailySales AS (
    SELECT
    visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
RankedDays AS (
  SELECT 
    visited_on,
    amount,
    ROW_NUMBER() OVER (ORDER BY visited_on) AS rn,
    SUM(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS sum_amount,
    ROUND(AVG(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount
  FROM DailySales
)
SELECT 
  visited_on,
  sum_amount AS amount,
  average_amount
FROM RankedDays
WHERE rn >= 7
ORDER BY visited_on;
