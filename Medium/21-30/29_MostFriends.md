# Problem 29 - Most Friends

## 📄 Problem Statement
Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.
Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.
**Table:** 

Input: RequestAccepted table:
| requester_id | accepter_id | accept_date |
|---------|------------|--------------|
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |

## 🧪 Example

**Output**
| id | num |
|---|---|
| 3  | 3   |


## 💡 Approach
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.

## 💻 SQL Solution

```sql
WITH friends AS (
    SELECT accepter_id AS friend
    FROM RequestAccepted
    UNION ALL
    SELECT requester_id AS friend
    FROM RequestAccepted
)
SELECT friend AS id, count(friend) AS num
FROM friends
GROUP BY friend
ORDER BY num DESC
LIMIT 1;
