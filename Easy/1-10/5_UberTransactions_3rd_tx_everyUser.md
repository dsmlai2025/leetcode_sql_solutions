# Problem 05 - Uber Transactions on 3rd transaction of every user


---

## 📄 Problem Statement
Assume you are given the table below on Uber transactions made by users. 

**Table:** transactions

| user_id      | spend	|	transaction_date |
|--------------|---------|---------|
|	111 |	100.50	|	01/08/2022 12:00:00 |
|	111 |	55.00	|	01/10/2022 12:00:00 |
|	121 |	36.00	|	01/18/2022 12:00:00 |
|	145 |	24.99	|	01/26/2022 12:00:00 |
|	111 |	89.60 |		02/05/2022 12:00:00 |


---

### Task
FILL

---

## 🧪 Example

**Output**


  
**Explanation:**

Windows Function



---

## 💡 Approach

- Use Windows Function

---

## 💻 SQL Solution

```sql
SELECT 
  user_id,
  spend,
  transaction_date
FROM (
  SELECT 
    user_id, spend, transaction_date, 
    ROW_NUMBER() OVER (
      PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions) AS trans_num 
WHERE row_num = 3;
