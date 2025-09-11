# Problem 06 - FB MAU

---

## 📄 Problem Statement
Assume you're given a table containing information on Facebook user actions.

**Table:** user_actions

| user_id | event_id | event_type |	event_date |
|--------------|---------|---------|---------|
|	445 |	7765	|	sign-in	|	05/31/2022 12:00:00 |
|	742 |	6458	|	sign-in	|	06/03/2022 12:00:00 |
|	445 |	3634	|	like	|	06/05/2022 12:00:00 |
|	742 |	1374	|	comment |	06/05/2022 12:00:00 |
|	648 |	3124	|	like	|	06/18/2022 12:00:00 |


---

### Task
Write a query to obtain number of monthly active users (MAUs) in July 2022, including the month in numerical format "1, 2, 3".

---

## 🧪 Example

**Output**


  
**Explanation:**

Count Distinct
Group By


---

## 💡 Approach

- Group By

---

## 💻 SQL Solution

```sql
SELECT 
  EXTRACT(MONTH FROM event_date) AS mth,
  COUNT(DISTINCT user_id) AS monthly_active_users
FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) = 7
  AND EXTRACT(YEAR FROM event_date) = 2022
GROUP BY mth;
