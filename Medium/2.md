# Problem 02 - Rank Scores

---

## 📄 Problem Statement
Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
 Return the result table ordered by score in descending order.

**Table:** Scores

| id | score |
|----|-------|
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |

## 🧪 Example

**Output**
| score | rank |
|-------|------|
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |  

**Explanation:**



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT score, d_rnk AS 'rank' FROM (
    SELECT 
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS d_rnk
    FROM Scores
) t
