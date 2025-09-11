# Problem 05 - Fraction of players logged in consecutive after first login

---

## 📄 Problem Statement
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.


**Table:** Activity
| player_id | device_id | event_date | games_played |
|-----------|-----------|------------|--------------|
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |


## 🧪 Example

**Output**
| fraction  |
|-----------|
| 0.33      |
  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
WITH firstLogin AS (
    SELECT 
    player_id,
    MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
NextDayLogin AS (
    SELECT
    distinct a.player_id
    FROM Activity a
    JOIN firstLogin f
    ON a.player_id = f.player_id
    WHERE a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
)
SELECT
ROUND(COUNT(distinct n.player_id)*1.00 / COUNT(distinct f.player_id), 2) AS fraction
FROM firstLogin f LEFT JOIN NextDayLogin n
ON f.player_id = n.player_id
