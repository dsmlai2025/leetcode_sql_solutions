# Problem 14 - Score Improvement


## 📄 Problem Statement
Write a solution to find the students who have shown improvement. A student is considered to have shown improvement if they meet both of these conditions:
Have taken exams in the same subject on at least two different dates
Their latest score in that subject is higher than their first score
Return the result table ordered by student_id, subject in ascending order. 

**Table:** 

Scores table:
| student_id | subject  | score | exam_date  |
|------------|----------|-------|------------|
| 101        | Math     | 70    | 2023-01-15 |
| 101        | Math     | 85    | 2023-02-15 |
| 101        | Physics  | 65    | 2023-01-15 |
| 101        | Physics  | 60    | 2023-02-15 |
| 102        | Math     | 80    | 2023-01-15 |
| 102        | Math     | 85    | 2023-02-15 |
| 103        | Math     | 90    | 2023-01-15 |
| 104        | Physics  | 75    | 2023-01-15 |
| 104        | Physics  | 85    | 2023-02-15 |
## 🧪 Example

**Output**
| student_id | subject  | first_score | latest_score |
|------------|----------|-------------|--------------|
| 101        | Math     | 70          | 85           |
| 102        | Math     | 80          | 85           |
| 104        | Physics  | 75          | 85           |


## 💡 Approach


## 💻 SQL Solution

```sql
select student_id, subject, min_scr as first_score, max_scr as latest_score from
(select student_id, subject, score, exam_date,
FIRST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date asc) as min_scr,
LAST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date asc) as max_scr,
ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date desc) as rn
from Scores) as t
where rn =1 and min_scr < max_scr
