# Problem 23 - Seat Swap

## 📄 Problem Statement
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order. 
**Table:** 

Seat table:
| id | student |
|----|---------|
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |

## 🧪 Example

**Output**
| id | student |
|----|---------|
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |

## 💡 Approach


## 💻 SQL Solution

```sql
SELECT 
id,
CASE
    WHEN (id%2 = 1 AND id < (SELECT COUNT(id) AS rw FROM Seat)) THEN (LEAD(student) OVER(ORDER BY id))
    WHEN (id%2 = 0) THEN (LAG(student) OVER(ORDER BY id))
    ELSE student
END AS student
FROM Seat
ORDER BY id
