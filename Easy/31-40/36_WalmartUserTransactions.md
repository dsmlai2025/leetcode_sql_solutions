# Problem 36 - Walmart user transactions

## 📄 Problem Statement
Based on their most recent transaction date, write a query that retrieve the users along with the number of products they bought.
Output the user's most recent transaction date, user ID, and the number of products, 
sorted in chronological order by the transaction date.

**Table:** user_transactions

| product_id	|user_id	|spend		|transaction_date|
|------|-----|-----|----|
| 3673		|123		|68.90		|07/08/2022 12:00:00|
|9623		|123		|274.10		|07/08/2022 12:00:00|
|1467		|115		|19.90		|07/08/2022 12:00:00|
|2513		|159		|25.00		|07/08/2022 12:00:00|
|1452		|159		|74.50		|07/10/2022 12:00:00|

## 💡 Approach

## 💻 SQL Solution

```sql
WITH transactions_cte AS (
  SELECT 
    transaction_date, 
    user_id, 
    product_id, 
    RANK() OVER (
      PARTITION BY user_id 
      ORDER BY transaction_date DESC) AS transaction_rank 
  FROM user_transactions) 
SELECT 
  transaction_date, 
  user_id,
  COUNT(product_id) AS purchase_count
FROM transactions_cte
WHERE transaction_rank = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date;
