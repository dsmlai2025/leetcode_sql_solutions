# Problem 25 - Product Price on Specific Date

## 📄 Problem Statement
Initially, all products have price 10.
Write a solution to find the prices of all products on the date 2019-08-16. Return the result table in any order. 
**Table:** 

Products table:
| product_id | new_price | change_date |
|----------|-----------|-------------|
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |


## 🧪 Example

**Output**
| product_id | price |
|------------|-------|
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |


## 💡 Approach


## 💻 SQL Solution

```sql

WITH CTE AS(
    SELECT * FROM (
        SELECT *,
        RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rnk
        FROM Products 
        WHERE change_date < '2019-08-17'
        ) t 
WHERE t.rnk = 1
)
SELECT distinct p.product_id, IFNULL(c.new_price, 10) AS price 
FROM Products p
LEFT JOIN CTE c
ON p.product_id = c.product_id
