# Problem 02 - SALES QUOTA

---

## 📄 Problem Statement
As a data analyst on the Oracle Sales Operations team, you are given a list of salespeople’s deals, and the annual quota they need to hit.

**Table:** deals

| employee_id | deal_size |
|--------------|---------|
|	101 | 400000 |
|	101 | 300000 |
|	201 | 500000 |
|	301 | 500000 |

**Table:** sales_quotas

| employee_id | quota |
|--------------|---------|
|	101 | 500000 |
|	201 | 400000 |
|	301 | 600000 |
---

### Task

Write a query that outputs each employee id and whether they hit the quota or not ('yes' or 'no'). Order the results by employee id in ascending order.

---

## 🧪 Example

**Output**


  
**Explanation:**

INNER JOIN
CASE statement
Group by employee_id

---

## 💡 Approach

- Use a simple WHERE clause

---

## 💻 SQL Solution

```sql
SELECT 
  deals.employee_id,
  CASE 
    WHEN SUM(deals.deal_size) > quotas.quota THEN 'yes' 
    ELSE 'no' 
  END AS made_quota
FROM deals
INNER JOIN sales_quotas AS quotas
  ON deals.employee_id = quotas.employee_id
GROUP BY deals.employee_id
ORDER BY deals.employee_id;
