# Problem 37 - Duplicate Job Listings

## 📄 Problem Statement
Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.
**Table:** employee_detail

job_id	company_id	title				description
248	827	Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
149	845	Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
945	345	Data Analyst		Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.
164	345	Data Analyst		Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.
172	244	Data Engineer		Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.


## 💡 Approach

## 💻 SQL Solution

```sql
SELECT COUNT(DISTINCT company_id) AS duplicate_companies_count
FROM (
  SELECT company_id, title, description, COUNT(*) AS postings_count
  FROM job_postings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1
) AS duplicates;
