# Problem 26 - Immediate Delivery Orders

## 📄 Problem Statement
If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places. 
**Table:** 

Delivery table:
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
|---------------------|-----------|----------|-----------------------|
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |


## 🧪 Example

**Output**
| immediate_percentage |
|-----------|
| 50.00                |
+----------------------+


## 💡 Approach


## 💻 SQL Solution

```sql
WITH FirstOrders AS (
  SELECT customer_id, order_date, customer_pref_delivery_date,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
  FROM Delivery
),
FirstOrdersOnly AS (
  SELECT *
  FROM FirstOrders
  WHERE rn = 1
)
SELECT ROUND(
         100.0 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*)
       , 2) AS immediate_percentage
FROM FirstOrdersOnly;
