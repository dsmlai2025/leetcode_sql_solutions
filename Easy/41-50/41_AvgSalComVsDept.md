# Problem 41 - Company Avg Salary vs Dept Avg Salary

## 📄 Problem Statement
You work as a data analyst for a FAANG company that tracks employee salaries over time. The company wants to understand how the average salary in each department compares to the company's overall average salary each month.
Write a query to compare the average salary of employees in each department to the company's average salary for March 2024. Return the comparison result as 'higher', 'lower', or 'same' for each department.  Display the department ID, payment month (in MM-YYYY format), and the comparison result. 

**Table:**
employee_id	name			salary	department_id	manager_id
	1	Emma Thompson	3800		1		6
	2	Daniel Rodriguez	2230		1		7
	3	Olivia Smith		7000		1		8
	5	Sophia Martinez	1750		1		11

salary_id	employee_id	amount	payment_date
	1		1	3800		01/31/2024 00:00:00
	2		2	2230		01/31/2024 00:00:00
	3		3	7000		01/31/2024 00:00:00
	4		4	6800		01/31/2024 00:00:00
	5		5	1750		01/31/2024 00:00:00


## 💡 Approach
Calculate company’s average salary
Calculate department’s average salary
Output the table 

## 💻 SQL Solution

```sql
WITH company_avg AS ( -- Company Avg Salary
  SELECT 
    payment_date,
    AVG(amount) AS co_avg_salary
  FROM salary
  WHERE payment_date = '03/31/2024 00:00:00'
  GROUP BY payment_date
)
, dept_avg AS ( — - Dept Avg Salary
  SELECT
    e.department_id,
    s.payment_date,
    AVG(s.amount) AS dept_avg_salary
  FROM salary AS s
  INNER JOIN employee AS e
    ON s.employee_id = e.employee_id
  WHERE s.payment_date = '03/31/2024 00:00:00'
  GROUP BY e.department_id, s.payment_date
)

SELECT
  d.department_id,
  TO_CHAR(d.payment_date, 'MM-YYYY') AS payment_date,
  CASE  
    WHEN d.dept_avg_salary > c.co_avg_salary THEN 'higher'
    WHEN d.dept_avg_salary < c.co_avg_salary THEN 'lower'
    ELSE 'same'
  END AS comparison
FROM dept_avg AS d
INNER JOIN company_avg AS c
  ON d.payment_date = c.payment_date;
