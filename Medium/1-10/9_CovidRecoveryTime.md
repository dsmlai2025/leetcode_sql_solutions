# Problem 9 - Covide Recovery Time

## 📄 Problem Statement
Write a solution to find patients who have recovered from COVID - patients who tested positive but later tested negative.
A patient is considered recovered if they have at least one Positive test followed by at least one Negative test on a later date
Calculate the recovery time in days as the difference between the first positive test and the first negative test after that positive test
Only include patients who have both positive and negative test results
Return the result table ordered by recovery_time in ascending order, then by patient_name in ascending order. 

**Table:** 

patients table:
+------------+--------------+-----+
| patient_id | patient_name | age |
+------------+--------------+-----+
| 1          | Alice Smith  | 28  |
| 2          | Bob Johnson  | 35  |
| 3          | Carol Davis  | 42  |
| 4          | David Wilson | 31  |
| 5          | Emma Brown   | 29  |
+------------+--------------+-----+
covid_tests table:
+---------+------------+------------+--------------+
| test_id | patient_id | test_date  | result       |
+---------+------------+------------+--------------+
| 1       | 1          | 2023-01-15 | Positive     |
| 2       | 1          | 2023-01-25 | Negative     |
| 3       | 2          | 2023-02-01 | Positive     |
| 4       | 2          | 2023-02-05 | Inconclusive |
| 5       | 2          | 2023-02-12 | Negative     |
| 6       | 3          | 2023-01-20 | Negative     |
| 7       | 3          | 2023-02-10 | Positive     |
| 8       | 3          | 2023-02-20 | Negative     |
| 9       | 4          | 2023-01-10 | Positive     |
| 10      | 4          | 2023-01-18 | Positive     |
| 11      | 5          | 2023-02-15 | Negative     |
| 12      | 5          | 2023-02-20 | Negative     |
+---------+------------+------------+--------------+


## 🧪 Example

**Output**
+------------+--------------+-----+---------------+
| patient_id | patient_name | age | recovery_time |
+------------+--------------+-----+---------------+
| 1          | Alice Smith  | 28  | 10            |
| 3          | Carol Davis  | 42  | 10            |
| 2          | Bob Johnson  | 35  | 11            |
+------------+--------------+-----+---------------+

---

## 💡 Approach


## 💻 SQL Solution

```sql
WITH first_positive AS (
    SELECT
        patient_id,
        MIN(test_date) AS first_pos_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),
first_negative_after_positive AS (
    SELECT
        f.patient_id,
        MIN(c.test_date) AS first_neg_date
    FROM first_positive f
    JOIN covid_tests c
      ON f.patient_id = c.patient_id
      AND c.result = 'Negative'
      AND c.test_date > f.first_pos_date
    GROUP BY f.patient_id, f.first_pos_date
)
SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(fn.first_neg_date, fp.first_pos_date) AS recovery_time
FROM first_positive fp
JOIN first_negative_after_positive fn
  ON fp.patient_id = fn.patient_id
JOIN patients p
  ON p.patient_id = fp.patient_id
ORDER BY recovery_time ASC, p.patient_name ASC;
