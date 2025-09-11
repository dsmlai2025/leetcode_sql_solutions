# Problem 30 - Driver Efficiency

## 📄 Problem Statement
Write a solution to find drivers whose fuel efficiency has improved by comparing their average fuel efficiency in the first half of the year with the second half of the year.
Calculate fuel efficiency as distance_km / fuel_consumed for each trip
First half: January to June, Second half: July to December
Only include drivers who have trips in both halves of the year

Calculate the efficiency improvement as (second_half_avg - first_half_avg)
Round all results to 2 decimal places
Return the result table ordered by efficiency improvement in descending order, then by driver name in ascending order.

**Table:** 

Input: drivers
| driver_id | driver_name   |
|-----------|---------------|
| 1         | Alice Johnson |
| 2         | Bob Smith     |
| 3         | Carol Davis   |
| 4         | David Wilson  |
| 5         | Emma Brown    |

trips table:
| trip_id | driver_id | trip_date  | distance_km | fuel_consumed |
|-----------|---------------|-----------|---------------|-----------|
| 1       | 1         | 2023-02-15 | 120.5       | 10.2          |
| 2       | 1         | 2023-03-20 | 200.0       | 16.5          |
| 3       | 1         | 2023-08-10 | 150.0       | 11.0          |
| 4       | 1         | 2023-09-25 | 180.0       | 12.5          |
| 5       | 2         | 2023-01-10 | 100.0       | 9.0           |
| 6       | 2         | 2023-04-15 | 250.0       | 22.0          |
| 7       | 2         | 2023-10-05 | 200.0       | 15.0          |
| 8       | 3         | 2023-03-12 | 80.0        | 8.5           |
| 9       | 3         | 2023-05-18 | 90.0        | 9.2           |
| 10      | 4         | 2023-07-22 | 160.0       | 12.8          |
| 11      | 4         | 2023-11-30 | 140.0       | 11.0          |
| 12      | 5         | 2023-02-28 | 110.0       | 11.5          |

## 
| driver_id | driver_name   | first_half_avg   | second_half_avg   | efficiency_improvement |
|-----------|---------------|-----------|---------------|----------|
| 2         | Bob Smith     | 11.24            | 13.33             | 2.10                   |
| 1         | Alice Johnson | 11.97            | 14.02             | 2.05                   |
## 💡 Approach
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.

## 💻 SQL Solution

```sql
WITH
    T AS (
        SELECT
            driver_id,
            AVG(distance_km / fuel_consumed) half_avg,
            CASE
                WHEN MONTH(trip_date) <= 6 THEN 1
                ELSE 2
            END half
        FROM trips
        GROUP BY driver_id, half
    )
SELECT
    t1.driver_id,
    d.driver_name,
    ROUND(t1.half_avg, 2) first_half_avg,
    ROUND(t2.half_avg, 2) second_half_avg,
    ROUND(t2.half_avg - t1.half_avg, 2) efficiency_improvement
FROM
    T t1
    JOIN T t2 ON t1.driver_id = t2.driver_id AND t1.half < t2.half AND t1.half_avg < t2.half_avg
    JOIN drivers d ON t1.driver_id = d.driver_id
ORDER BY efficiency_improvement DESC, d.driver_name;
