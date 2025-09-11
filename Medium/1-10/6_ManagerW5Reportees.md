# Problem 06 - Manager with 5 reportees (Leet Code)

---

## 📄 Problem Statement
Write a solution to find the second highest distinct salary from the Employee table. 
If there is no second highest salary, return null (return None in Pandas).
The result format is in the following example.

**Table:** Employee

| id  | name  | department | managerId |
|-----|-------|------------|-----------|
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |


## 🧪 Example

**Output**
| name |
|------|
| John |
  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT
e.name AS name
FROM Employee e
JOIN Employee m
ON e.id = m.managerId
GROUP BY m.managerId
HAVING COUNT(m.managerId) >= 5
