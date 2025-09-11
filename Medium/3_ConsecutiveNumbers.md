# Problem 03 - Consecutive Numbers (Leet Code)

---

## 📄 Problem Statement
Find all numbers that appear at least three times consecutively.
Return the result table in any order.

**Table:** Logs
| id | num |
|----|-----|
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |


## 🧪 Example

**Output**
| ConsecutiveNums |
|-----------------|
| 1               |
  
**Explanation:**



---

## 💡 Approach

---

## 💻 SQL Solution

```sql
SELECT distinct cur_num AS ConsecutiveNums FROM (
    SELECT
    LAG(num) OVER(ORDER BY id) AS prev_num,
    num as cur_num,
    LEAD(num) OVER(ORDER BY id) AS next_num
    FROM Logs
) t
WHERE t.prev_num = cur_num AND cur_num = next_num
ORDER BY cur_num
