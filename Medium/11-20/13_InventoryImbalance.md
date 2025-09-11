# Problem 13 - Inventory Imbalance


## 📄 Problem Statement
Write a solution to find stores that have inventory imbalance - stores where the most expensive product has lower stock than the cheapest product.
For each store, identify the most expensive product (highest price) and its quantity
For each store, identify the cheapest product (lowest price) and its quantity
A store has inventory imbalance if the most expensive product's quantity is less than the cheapest product's quantity
Calculate the imbalance ratio as (cheapest_quantity / most_expensive_quantity)
Round the imbalance ratio to 2 decimal places
Only include stores that have at least 3 different products
Return the result table ordered by imbalance ratio in descending order, then by store name in ascending order.
The result format is in the following example.

**Table:** 

stores table:
+----------+----------------+-------------+
| store_id | store_name     | location    |
+----------+----------------+-------------+
| 1        | Downtown Tech  | New York    |
| 2        | Suburb Mall    | Chicago     |
| 3        | City Center    | Los Angeles |
| 4        | Corner Shop    | Miami       |
| 5        | Plaza Store    | Seattle     |
+----------+----------------+-------------+
inventory table:
+--------------+----------+--------------+----------+--------+
| inventory_id | store_id | product_name | quantity | price  |
+--------------+----------+--------------+----------+--------+
| 1            | 1        | Laptop       | 5        | 999.99 |
| 2            | 1        | Mouse        | 50       | 19.99  |
| 3            | 1        | Keyboard     | 25       | 79.99  |
| 4            | 1        | Monitor      | 15       | 299.99 |
| 5            | 2        | Phone        | 3        | 699.99 |
| 6            | 2        | Charger      | 100      | 25.99  |
| 7            | 2        | Case         | 75       | 15.99  |
| 8            | 2        | Headphones   | 20       | 149.99 |
| 9            | 3        | Tablet       | 2        | 499.99 |
| 10           | 3        | Stylus       | 80       | 29.99  |
| 11           | 3        | Cover        | 60       | 39.99  |
| 12           | 4        | Watch        | 10       | 299.99 |
| 13           | 4        | Band         | 25       | 49.99  |
| 14           | 5        | Camera       | 8        | 599.99 |
| 15           | 5        | Lens         | 12       | 199.99 |
+--------------+----------+--------------+----------+--------+
## 🧪 Example

**Output**
+----------+----------------+-------------+------------------+--------------------+------------------+
| store_id | store_name     | location    | most_exp_product | cheapest_product   | imbalance_ratio  |
+----------+----------------+-------------+------------------+--------------------+------------------+
| 3        | City Center    | Los Angeles | Tablet           | Stylus             | 40.00            |
| 1        | Downtown Tech  | New York    | Laptop           | Mouse              | 10.00            |
| 2        | Suburb Mall    | Chicago     | Phone            | Case               | 25.00            |
+----------+----------------+-------------+------------------+--------------------+------------------+
---
Explanation: The folowing table is ordered by the turn for simplicity.
+------+----+-----------+--------+--------------+
| Turn | ID | Name      | Weight | Total Weight |
+------+----+-----------+--------+--------------+
| 1    | 5  | Alice     | 250    | 250          |
| 2    | 3  | Alex      | 350    | 600          |
| 3    | 6  | John Cena | 400    | 1000         | (last person to board)
| 4    | 2  | Marie     | 200    | 1200         | (cannot board)
| 5    | 4  | Bob       | 175    | ___          |
| 6    | 1  | Winston   | 500    | ___          |
+------+----+-----------+--------+--------------+

## 💡 Approach


## 💻 SQL Solution

```sql
WITH store_with_3or_more_products AS (
    SELECT 
    store_id
    FROM inventory
    GROUP BY store_id
    HAVING COUNT(*) >= 3
),
ranked_items AS (
    SELECT 
    i.*, 
    DENSE_RANK() OVER(PARTITION BY s3.store_id ORDER BY price DESC) as d1_rnk,
    DENSE_RANK() OVER(PARTITION BY s3.store_id ORDER BY price ASC) as d2_rnk
    FROM inventory i 
    JOIN store_with_3or_more_products s3
    ON s3.store_id = i.store_id
),
store_wise_exp_items AS (
    SELECT 
    r.store_id, r.product_name AS most_exp_product,
    r.quantity AS most_exp_quantity
    FROM ranked_items r
    WHERE r.d1_rnk = 1 
), 
store_wise_cheap_items AS (
    SELECT 
    r.store_id, r.product_name AS cheapest_product,
    r.quantity AS cheapest_quantity
    FROM ranked_items r
    WHERE r.d2_rnk = 1 
)
SELECT
s.store_id, s.store_name, s.location, se.most_exp_product,
sc.cheapest_product,
ROUND((sc.cheapest_quantity/se.most_exp_quantity), 2) AS imbalance_ratio
FROM stores s
JOIN store_wise_exp_items se
ON s.store_id = se.store_id
JOIN store_wise_cheap_items sc
ON s.store_id = sc.store_id
WHERE se.most_exp_quantity < sc.cheapest_quantity
ORDER BY imbalance_ratio DESC, s.store_name ASC;
