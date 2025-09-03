# Problem 04 - Compressed Mean

---

## 📄 Problem Statement
You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal place using tables which includes information on the count of items in each order (item_count table) and the corresponding number of orders for each item count (order_occurrences table).
**Table:** items_per_order

| item_count |	order_occurrences |
|--------------|---------|
| 	1 |	500 |
|	2 |	1000 |
|	3 |	800 |
|	4 |	1000 |

—

### Task

Your manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.

---

## 🧪 Example

**Output**


  
**Explanation:**
 

---

## 💡 Approach

- Use Aggregate function

---

## 💻 SQL Solution

```sql
SELECT
ROUND(SUM(item_count * order_occurrences) / SUM(order_occurrences) , 1) AS mean
FROM items_per_order
