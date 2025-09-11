# Problem 17 - Loyal Customers


## 📄 Problem Statement
Write a solution to find loyal customers. A customer is considered loyal if they meet ALL the following criteria:
Made at least 3 purchase transactions.
Have been active for at least 30 days.
Their refund rate is less than 20% .
Return the result table ordered by customer_id in ascending order. 
**Table:** 

customer_transactions table:
 
| transaction_id | customer_id | transaction_date | amount | transaction_type |
|----------------|-------------|------------------|---------|------------------|
| 1              | 101         | 2024-01-05       | 150.00 | purchase         |
| 2              | 101         | 2024-01-15       | 200.00 | purchase         |
| 3              | 101         | 2024-02-10       | 180.00 | purchase         |
| 4              | 101         | 2024-02-20       | 250.00 | purchase         |
| 5              | 102         | 2024-01-10       | 100.00 | purchase         |
| 6              | 102         | 2024-01-12       | 120.00 | purchase         |
| 7              | 102         | 2024-01-15       | 80.00  | refund           |
| 8              | 102         | 2024-01-18       | 90.00  | refund           |
| 9              | 102         | 2024-02-15       | 130.00 | purchase         |
| 10             | 103         | 2024-01-01       | 500.00 | purchase         |
| 11             | 103         | 2024-01-02       | 450.00 | purchase         |
| 12             | 103         | 2024-01-03       | 400.00 | purchase         |
| 13             | 104         | 2024-01-01       | 200.00 | purchase         |
| 14             | 104         | 2024-02-01       | 250.00 | purchase         |
| 15             | 104         | 2024-02-15       | 300.00 | purchase         |
| 16             | 104         | 2024-03-01       | 350.00 | purchase         |
| 17             | 104         | 2024-03-10       | 280.00 | purchase         |
| 18             | 104         | 2024-03-15       | 100.00 | refund           |
## 🧪 Example

**Output**
| customer_id |
|-------------|
| 101         |
| 104         |

## 💡 Approach


## 💻 SQL Solution

```sql
SELECT 
customer_id
FROM customer_transactions
GROUP BY customer_id
HAVING SUM(CASE WHEN transaction_type='purchase' THEN 1 ELSE 0 END) >= 3
AND 
ROUND(100*SUM(CASE WHEN transaction_type='refund' THEN 1 ELSE 0 END)/COUNT(*), 2) < 20.00
AND
DATEDIFF(MAX(transaction_date) , MIN(transaction_date)) >= 30
ORDER BY customer_id
