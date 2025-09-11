# Problem 38 - 2nd Highest Salary

## 📄 Problem Statement
Identify the second-highest salary in each department. 
Your output should include the department, the second highest salary, and the employee ID. 
Do not remove duplicate salaries when ordering salaries, and apply the rankings without a gap in the rank. 
For example, if multiple employees share the same highest salary, the second-highest salary will be the next salary that is lower than the highest salaries. 

**Table:** employee_data

INSERT INTO employee_data (department, employee_id, hire_date, rank, salary) VALUES ('HR', 101, '2022-01-15', 5.0, 60000), ('HR', 102, '2021-03-10', 4.5, 75000), ('HR', 103, '2020-05-20', 4.2, 75000), ('HR', 104, '2023-06-01', 4.0, 50000), ('Finance', 201, '2020-07-15', 3.8, 85000), ('Finance', 202, '2021-09-25', 4.1, 95000), ('Finance', 203, '2023-03-30', 4.3, 95000), ('Finance', 204, '2022-11-12', 4.0, 70000), ('IT', 301, '2021-12-11', 5.0, 120000), ('IT', 302, '2023-01-15', 4.5, 110000), ('IT', 303, '2020-08-19', 4.8, 105000), ('IT', 304, '2021-06-30', 4.1, 100000), ('Sales', 401, '2019-11-20', 4.7, 65000), ('Sales', 402, '2022-02-10', 4.5, 55000), ('Sales', 403, '2020-01-25', 4.3, 75000), ('Sales', 404, '2023-07-18', 4.0, 72000);



## 💡 Approach
RANK() Function: Assigns a rank to each employee’s salary within their department. The ranking is based on the salary column in descending order (ORDER BY salary DESC). The PARTITION BY department ensures the ranking is reset for each department. 
WITH RankedSalaries: This Common Table Expression (CTE) creates a temporary result set with the ranks assigned to each employee in their department. salary_rank = 2: The query filters the rows where the rank is 2, which corresponds to the second-highest salary for each department.

## 💻 SQL Solution

```sql
WITH salary_rankings AS (
  SELECT
    department,
    employee_id,
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
  FROM employee_data
)
SELECT
  department,
  salary AS second_highest_salary,
  employee_id
FROM salary_rankings
WHERE salary_rank = 2
ORDER BY department, employee_id;
