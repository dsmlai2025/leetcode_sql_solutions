# Problem 15 - Uber Rides

---

## 📄 Problem Statement
You’re given a table of Uber rides that contains the mileage and the purpose for the business expense. 
You’re asked to find business purposes that generate the most miles driven for passengers that use Uber for their business transportation. 
Find the top 3 business purpose categories by total mileage.

**Table:** my_uber_drives


𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭: 

CREATE TABLE my_uber_drives (start_date DATETIME,end_date DATETIME,category VARCHAR(50),start VARCHAR(50),stop VARCHAR(50),miles FLOAT,purpose VARCHAR(50)); 
INSERT INTO my_uber_drives (start_date, end_date, category, start, stop, miles, purpose) 
VALUES('2016-01-01 21:11', '2016-01-01 21:17', 'Business', 'Fort Pierce', 'Fort Pierce', 5.1, 'Meal/Entertain'),('2016-01-02 01:25', '2016-01-02 01:37', 'Business', 'Fort Pierce', 'Fort Pierce', 5, NULL),('2016-01-02 20:25', '2016-01-02 20:38', 'Business', 'Fort Pierce', 'Fort Pierce', 4.8, 'Errand/Supplies'),('2016-01-05 17:31', '2016-01-05 17:45', 'Business', 'Fort Pierce', 'Fort Pierce', 4.7, 'Meeting'),('2016-01-06 14:42', '2016-01-06 15:49', 'Business', 'Fort Pierce', 'West Palm Beach', 63.7, 'Customer Visit'),('2016-01-06 17:15', '2016-01-06 17:19', 'Business', 'West Palm Beach', 'West Palm Beach', 4.3, 'Meal/Entertain'),('2016-01-06 17:30', '2016-01-06 17:35', 'Business', 'West Palm Beach', 'Palm Beach', 7.1, ‘Meeting');

### Task
FILL

---

## 🧪 Example

**Output**
FILL

**Explanation:**

FILL


---

## 💡 Approach

- Filter on category: We include only records where category is 'Business'. 
- Group by purpose: We calculate the total mileage for each purpose category. 
- Order by total_miles DESC: We rank purposes in descending order by total mileage. 
- TOP 3: We retrieve the top 3 business purpose categories based on total mileage driven

---

## 💻 SQL Solution

```sql
SELECT 
    purpose,
    SUM(miles) AS total_miles
FROM my_uber_drives
WHERE category = 'Business'
  AND purpose IS NOT NULL
GROUP BY purpose
ORDER BY total_miles DESC
LIMIT 3;
