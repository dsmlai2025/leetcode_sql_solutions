# Problem 07 - Report sum of all total investments

---

## 📄 Problem Statement
Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

**Table:** Insurance
| pid | tiv_2015 | tiv_2016 | lat | lon |
|-----|----------|----------|-----|-----|
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |


## 🧪 Example

**Output**
| tiv_2016 |
|----------|
| 45.00    |
  
**Explanation:**

FILL



---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT 
ROUND(SUM(tiv_2016),2) AS tiv_2016 FROM Insurance 
WHERE pid IN (
    SELECT
    I1.pid
    FROM Insurance I1
    JOIN Insurance I2
    ON I1.tiv_2015 = I2.tiv_2015 AND I1.pid != I2.pid
)
AND CONCAT(lat,lon) NOT IN 
            (select concat(LAT, LON) from insurance
            group by LAT, LON
            having count(concat(LAT, LON)) >1)
