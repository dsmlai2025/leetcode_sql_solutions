# Problem 15 - Meeting Heavy Employees


## 📄 Problem Statement
Write a solution to find employees who are meeting-heavy - employees who spend more than 50% of their working time in meetings during any given week.
Assume a standard work week is 40 hours
Calculate total meeting hours per employee per week (Monday to Sunday)
An employee is meeting-heavy if their weekly meeting hours > 20 hours (50% of 40 hours)
Count how many weeks each employee was meeting-heavy
Only include employees who were meeting-heavy for at least 2 weeks
Return the result table ordered by the number of meeting-heavy weeks in descending order, then by employee name in ascending order. 

**Table:** 

employees table:
| employee_id | employee_name  | department  |
|---------|----------------|-------------|
| 1           | Alice Johnson  | Engineering |
| 2           | Bob Smith      | Marketing   |
| 3           | Carol Davis    | Sales       |
| 4           | David Wilson   | Engineering |
| 5           | Emma Brown     | HR          |

meetings table:

| meeting_id | employee_id | meeting_date | meeting_type | duration_hours |
|---------|-------------|--------------|--------------|----------------|
| 1          | 1           | 2023-06-05   | Team         | 8.0            |
| 2          | 1           | 2023-06-06   | Client       | 6.0            |
| 3          | 1           | 2023-06-07   | Training     | 7.0            |
| 4          | 1           | 2023-06-12   | Team         | 12.0           |
| 5          | 1           | 2023-06-13   | Client       | 9.0            |
| 6          | 2           | 2023-06-05   | Team         | 15.0           |
| 7          | 2           | 2023-06-06   | Client       | 8.0            |
| 8          | 2           | 2023-06-12   | Training     | 10.0           |
| 9          | 3           | 2023-06-05   | Team         | 4.0            |
| 10         | 3           | 2023-06-06   | Client       | 3.0            |
| 11         | 4           | 2023-06-05   | Team         | 25.0           |
| 12         | 4           | 2023-06-19   | Client       | 22.0           |
| 13         | 5           | 2023-06-05   | Training     | 2.0            |
## 🧪 Example

**Output**
| employee_id | employee_name  | department  | meeting_heavy_weeks |
|---------|----------------|-------------|---------------------|
| 1           | Alice Johnson  | Engineering | 2   |                 
| 4           | David Wilson   | Engineering | 2   |              

## 💡 Approach


## 💻 SQL Solution

```sql
WITH
    week_meeting_hours AS (
        SELECT
            employee_id,
            YEAR(meeting_date) AS year,
            WEEK(meeting_date, 1) AS week,
            SUM(duration_hours) hours
        FROM meetings
        GROUP BY 1, 2, 3
    ),
    intensive_weeks AS (
        SELECT
            employee_id,
            employee_name,
            department,
            count(1) AS meeting_heavy_weeks
        FROM
            week_meeting_hours
            JOIN employees USING (employee_id)
        WHERE hours >= 20
        GROUP BY 1
    )
SELECT employee_id, employee_name, department, meeting_heavy_weeks
FROM intensive_weeks
WHERE meeting_heavy_weeks >= 2
ORDER BY 4 DESC, 2;
