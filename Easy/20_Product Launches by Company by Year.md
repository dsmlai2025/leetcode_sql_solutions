# Problem 20 - Product Launches by Company by Year

---

## 📄 Problem Statement
You are given a table of product launches by company by year. 

**Table:** car_launches

CREATE TABLE car_launches(year int, company_name varchar(15), product_name varchar(30)); 

INSERT INTO car_launches VALUES(2019,’Toyota','Avalon'),(2019,'Toyota','Camry'),(2020,'Toyota','Corolla'),(2019,'Honda','Accord'),(2019,'Honda','Passport'),(2019,'Honda','CR-V'),(2020,'Honda','Pilot'),(2019,'Honda','Civic'),(2020,'Chevrolet','Trailblazer'),(2020,'Chevrolet','Trax'),(2019,'Chevrolet','Traverse'),(2020,'Chevrolet','Blazer'),(2019,'Ford','Figo'),(2020,'Ford','Aspire'),(2019,'Ford','Endeavour'),(2020,'Jeep','Wrangler')

---

### Task
Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. 
Output the name of the companies and a net difference of net products released for 2020 compared to the previous year. 

---

## 🧪 Example

**Output**
FILL

  
**Explanation:**
Counting Products per Year: Using SUM with CASE statements, we count the number of products launched in 2020 and 2019 separately for each company. 
Calculating Net Difference: We calculate the difference between 2020 and 2019 product counts to get the net change. 
Ordering: The results are ordered by net_difference in descending order to show companies with the highest increase first.

---

## 💡 Approach

- FILL

---

## 💻 SQL Solution

```sql
SELECT 
    company_name,
    COUNT(CASE WHEN year = 2020 THEN product_name END) 
      - COUNT(CASE WHEN year = 2019 THEN product_name END) AS net_difference
FROM car_launches
WHERE year IN (2019, 2020)
GROUP BY company_name;
