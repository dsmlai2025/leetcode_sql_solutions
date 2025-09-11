# Problem 24 - CustomerBoughtAllProducts

## 📄 Problem Statement
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table. Return the result table in any order. 
**Table:** 

Customer table:
| customer_id | product_key |
|-------------|-------------|
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |

Product table:
| product_key |
|-------------|
| 5           |
| 6           |

## 🧪 Example

**Output**
| id | stud| customer_id |
|-------------|
| 1           |
| 3           |

## 💡 Approach


## 💻 SQL Solution

```sql
SELECT 
customer_id
#COUNT(distinct product_key) AS num_prdts
FROM Customer
GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(distinct product_key) FROM Product)
