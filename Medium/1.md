# Problem 01 - SecondHighest Salary

---

## 📄 Problem Statement
Write a solution to find the second highest distinct salary from the Employee table. 
If there is no second highest salary, return null (return None in Pandas).
The result format is in the following example.

**Table:** Employee
| id | salary |
|----|--------|
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |


## 🧪 Example

**Output**
| SecondHighestSalary |
|---------------------|
| 200                 |
  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT COALESCE (
    (SELECT salary FROM (
    SELECT
    *, DENSE_RANK() OVER(ORDER BY salary DESC) AS d_rnk
    FROM Employee
) t
WHERE t.d_rnk = 2) 
, null) AS SecondHighestSalary
